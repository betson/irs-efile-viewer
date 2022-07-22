<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 7/19/2010 -->
<!-- Last Modified by Eugenia McDonald on 10/18/2017 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040Schedule8812Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form8812Data" select="$RtnDoc/IRS1040Schedule8812"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8812Data)">
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
				<meta name="Description" content="IRS Form 8812"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Schedule8812Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1040Schedule8812" style="font-size:7pt;">
					<!-- BEGIN WARNING LINE -->
					<div style="width: 187mm; clear: left; float: left;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width: 187mm; height: 23mm; clear:left; float: left;">
						<div class="styFNBox" style="width:34mm;height:23mm;padding-top:1mm;">
							<div style="height:13mm;">
								<span style="font-weight:bold;font-size:10pt;">SCHEDULE 8812<br/></span>
								<span style="font-weight:bold;font-size:9pt;">(Form 1040A or<br/>
								<span style="width:7px;"/>1040)</span>
							</div>
							<div style="height:8mm;padding-top:.75mm;">
								<span class="styAgency">Department of the Treasury</span><br/>
								<span class="styAgency">Internal Revenue Service</span>
								<span style="padding-left:3mm">(99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:120mm;height:23mm;">
							<div class="styMainTitle" style="width: 115mm; height: 11mm; text-align: left; padding-left: 27mm; font-size: 17pt;">
								Child Tax Credit
								<div style="width: 35mm; height: 12mm; padding-top: 0.5mm; padding-left: 16mm;">
									<img src="{$ImagePath}/8812_1040_Top_Forms.gif" alt="TopFormImage" height="69" width="93"/>
								</div>
							</div>
							<div class="styFBT" style="width: 120mm; height: 10mm; padding-right: 15mm; padding-bottom: 2px; font-family: Arial; font-size: 8pt;">
									<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
									Attach to Form 1040, Form 1040A, or Form 1040NR.<br/>
								<div style="width: 100mm; height: 5mm;">
									<div style="width: 86mm; height: 8mm; padding-left: 3px; font-family: Arial; font-size: 7pt;">
										<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="9" width="9"/>
										 Information about Schedule 8812 and its separate instructions is at <i>www.irs.gov/schedule8812</i>
									</div>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:33mm;height:23mm;">
							<div class="styOMB" style="width:33mm; height:4mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTaxYear" style="height:9mm;padding-top:1mm;padding-bottom:0;">
								20<span class="styTYColor">16</span>
							</div>
							<div style="text-align:left;padding-left:3mm;">
								Attachment<br/>Sequence No.<span class="styBoldText">47</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width: 187mm; height: 7mm; clear:left; float: left;">
						<div class="styNameBox" style="width:140mm;height:7mm;font-size:7pt;font-weight:normal;">
							Name(s) shown on return<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
								</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:45mm;height:7mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							Your social security number <br/>
								<span style="width:40mm;text-align:center;font-weight:normal;">
									<xsl:call-template name="PopulateReturnHeaderFilerTIN"></xsl:call-template>
								</span>
						</div>
					</div>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; border-top-width: 1px; clear:left; float: left;">
						<div class="styPartName" style="font-family:Arial;font-size:10pt;">
							Part I
						</div>
						<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">
							Filers Who Have Certain Child Dependent(s) with an ITIN (Individual Taxpayer Identification Number)
						</div>
					</div>
					<!-- END Part I  Title -->
					<!-- Caution line -->
					<div class="styBB" style="width:187mm; height: 15mm; padding-top:1mm;clear:left; float: left;">
						<img alt="Caution" src="{$ImagePath}/1040Sch8812_Caution.gif" width="50" height="50"/>
							<div style="width: 170mm; height: 14mm; padding-top: 4mm; font-style: italic; float: right;">
								Complete this part only for each dependent who has an ITIN and for whom you are claiming the child tax credit. <br/>
								If your dependent is not a qualifying child for the credit, you cannot include that dependent in the calculation of this credit.
							</div>
					</div>
					<div style="width:187mm;padding-top:2mm;font-family:Arial;font-size:8pt; clear:left; float: left;">
						Answer the following questions for each dependent listed on Form 1040, line 6c; Form 1040A, line 6c; or Form 1040NR, line 7c, who has an ITIN <br/>
						(Individual Taxpayer Identification Number) and that you indicated is a qualifying child for the child tax credit by checking column (4) for that dependent. 
						<div style="float:right;clear:none;margin-right:1px;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8812Data/QualifiedChildDepdWithITINGrp"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'pt1ContainerId' "/>
								</xsl:call-template>
						</div>
					</div>
					<!--BEGIN-->
					<!--IF SEPARATED and ELEMENT NODE is GREATER than 4 -->
					<!--Generates - SEE ADDITIONAL TABLE - MESSAGE -->
						<xsl:if test="($Print = $Separated) and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &gt; 4)">
								<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
									 overflow:visible; height:auto; display:block; clear:left; float: left; border-width:0px;
								</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;" summary="Table displaying Qualified Child with ITIN information " name="SepQualChildtable" id="SepQualChildtable">
									<thead/>
									<tfoot/>
									<tbody>
											<tr style="height:14mm;">
												<td>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8812Data/QualifiedChildDepdWithITINGrp"/>
												</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									</div>
							</xsl:if>
							<!--LESS THAN 4 DATA NODES-->
							<xsl:if test="($Print='inline' or 'separated' or '') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt;= 4)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;" summary="Table displaying Qualified Child with ITIN information " name="InlineSepQualChildtable" id="InlineQualChildtable">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										
									</tbody>
								</table>
							</div>
							</xsl:if>
							<!--PRINT IS BLANK-->
							<!--PRINT IS BLANK-->
							<!--PRINT IS BLANK-->
							<xsl:if test="($Print='') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 5)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:13.75mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
							<xsl:if test="($Print='') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &gt; 5) and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt;= 9)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
							</xsl:if>
							
							<xsl:if test="($Print='') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 10)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:18mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<xsl:if test="($Print='') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 11)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:17mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<xsl:if test="($Print='') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 12)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:15.5mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<xsl:if test="($Print='') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 13)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<xsl:if test="($Print='') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &gt; 13)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:auto; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
								<div style="width: 187mm; height:5mm;"/>
							</div>
						</xsl:if>
							<!--INLINE-->
							<!--INLINE-->
							<!--INLINE-->
														<xsl:if test="($Print='inline') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 5)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:visible; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:13.75mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
							<xsl:if test="($Print='inline') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &gt; 5) and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt;= 9)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:visible; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
							</xsl:if>
							
							<xsl:if test="($Print='inline') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 10)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:visible; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:18mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
								
							</div>
						</xsl:if>
						<xsl:if test="($Print='inline') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 11)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:visible; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:17mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
								
							</div>
						</xsl:if>
						<xsl:if test="($Print='inline') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 12)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:visible; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:15.5mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<xsl:if test="($Print='inline') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) = 13)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:visible; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
								<div style="width: 187mm; height:5mm;"/>
							</div>
						</xsl:if>
						<xsl:if test="($Print='inline') and (count($Form8812Data/QualifiedChildDepdWithITINGrp) &gt; 13)">
							<div class="styTableContainer" id="pt1ContainerId">
								<xsl:attribute name="style">
						width:187mm; overflow-y:visible; height:auto; clear:left; float: left; border-width:0px;
					</xsl:attribute>
								<table border="0" class="styTable" style="font-size:7pt;width:182mm;">
									<thead/>
									<tfoot/>
									<tbody>
										<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm;">
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:if>
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$Form8812Data/QualifiedChildDepdWithITINGrp"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'pt1ContainerId' "/>
								</xsl:call-template> 
								<!--CHOOSE, WHEN SEPARATED and ELEMENT NODE is GREATER than 4 -->
								<!--Generates - SEE ADDITIONAL TABLE - MESSAGE -->
								<!--END-->					
							    <!-- BEGIN -->
							    <!-- PART 1 NOTE -->
								<div style="width:187mm;padding-top:4mm;padding-bottom:4mm;">
									<div class="styGenericDiv" style="width:9mm;font-weight:bold;">Note:</div>
									<div class="styGenericDiv" style="width:178mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8812Data/OverLmtQlfyChldDepdWithITINInd"/>
												<xsl:with-param name="BackupName">IRSSch8812OverLmtQlfyChld</xsl:with-param>
											</xsl:call-template>
							If you have more than four dependents identified with an ITIN and listed as a qualifying child for the child tax credit,
							see seperate instructions and check here. 
						</label>
										<span class="styDotLn" style="padding-right: 2mm; padding-left: 2mm; float: none;">....................................</span>
										<img src="{$ImagePath}/8812_Bullet_Md.gif" alt="MediumBullet" height="8" width="8"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8812Data/OverLmtQlfyChldDepdWithITINInd"/>
												<xsl:with-param name="BackupName">IRSSch8812OverLmtQlfyChld</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
								</div>
								<!-- END - PART 1 NOTE -->
								<!-- ####### START of PART II ####### -->
								<!-- BEGIN -->
								<!-- Part II Title -->
								<div class="styBB" style="width: 187mm; height: 4.5mm; clear:left; float: left; border-top-width: 1px;">
									<div class="styPartName" style="font-family:Arial;font-size:10pt;">Part II</div>
									<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">Additional Child Tax Credit Filers</div>
								</div>
								<!-- END Part II Title -->
								<!-- BEGIN -->
								<!-- Line 1-->
								<div style="width: 187mm; height: 38mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 46mm; padding-top: 1mm; padding-left: 3mm;">1</div>
									<div style="width: 141mm; clear: none; float: left; height:46mm">
									    <div class="styLNDesc" style="width: 138mm; height: 46mm;">						
									        <div class="styLNDesc" style="width: 138mm; height: 5mm;">							
									            If you file Form 2555 or 2555-EZ <b>stop</b> here; you cannot claim the additional child tax credit.						
									        </div>																								
									        <div class="styLNDesc" style="width: 138mm; height: 8mm;">
									            If you are required to use the worksheet in <b>Pub. 972</b>, enter the amount from line 8 of the Child Tax Credit
									            Worksheet in the publication. Otherwise:
									        </div>																													
								      		<div class="styLNDesc" style="width: 24mm; height: 8mm;">
												<b>1040 filers:</b>
											</div>
											<div class="styLNDesc" style="width: 105mm; height: 8mm;">
											    Enter the amount from line 6 of your Child Tax Credit Worksheet (see the<br/>
												Instructions for Form 1040, line 52).
											</div>
											<div class="styLNDesc" style="width: 24mm; height: 8mm;">
												<b>1040A filers:</b>
											</div>
											<div class="styLNDesc" style="width: 105mm; height: 8mm;"> 
												Enter the amount from line 6 of your Child Tax Credit Worksheet (see the<br/>
												Instructions for Form 1040A, line 35).
											</div>
											<br/>
											<div class="styLNDesc" style="width: 24mm; height: 8mm;">
												<b>1040NR filers:</b>
											</div>
											<div class="styLNDesc" style="width: 105mm; height: 8mm;">
												Enter the amount from line 6 of your Child Tax Credit Worksheet (see the
												Instructions for Form 1040NR, line 49).
											</div>
										</div>
										<div class="styLNDesc" style="width: 2.8mm; height: 36mm; float: right;">
											<img style="height: 36mm;" src="{$ImagePath}/8812_Bracket_X_Lg.gif" alt="Curly Bracket Image"/>
										</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 16mm; padding-top: 12mm;">1</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 16mm; padding-top: 12mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/ChildTaxCreditWrkshtAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 32mm; height: 22mm; padding-top: 12mm; border-bottom-width: 0px; float: right;"/>
									<div class="styLNAmountBox" style="width: 6mm; height: 22mm; padding-top: 12mm; border-bottom-width: 0px; float: right;"/>
								</div>
								<!--END Line 1-->
								<!-- BEGIN -->
								<!-- Line 2 -->
								<div style="width: 187mm; height: 6mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 6mm; padding-top: 2mm; padding-left: 3mm;">2</div>
									<div class="styLNDesc" style="width: 141mm; padding-top: 2mm; height: 6mm;">
										<span style="float:left;clear:none;">  
					Enter the amount from Form 1040, line 52; Form 1040A, line 35; or Form 1040NR, line 49
				</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; padding-top: 2mm;">2</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6mm; padding-top: 2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/ChildTaxCreditAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Line 2 -->
								<!-- BEGIN -->
								<!-- Line 3 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 4mm; padding-top: 1mm; padding-left: 3mm;">3</div>
									<div class="styLNDesc" style="width:141mm; height:4mm;">
										<span style="float:left;clear:none;">    
					Subtract line 2 from line 1. If zero, <b>stop</b> here; you cannot claim this credit
                </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm;">3</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetFromWorksheetAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- END Line 3 -->
								<!-- BEGIN -->
								<!-- Line 4a -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 3mm; padding-top: 1mm;">4a </div>
									<div class="styLNDesc" style="width:103mm; height:5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">
					Earned income (see separate instructions)
				</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">4a </div>
									<div class="styLNAmountBox" style="width: 32mm; height: 5mm; padding-top: 1mm; padding-right: 0.5mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 5mm; padding-top: 1.3mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- BEGIN -->
								<!-- Line 4b1 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 4mm; padding-left: 5mm;">b</div>
									<div class="styLNDesc" style="width: 64.8mm; height: 4mm;">Nontaxable combat pay (see separate</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm; border-bottom-width: 0mm;"/>
									<div class="styLNRightNumBox" style="width: 32.2mm; height: 4mm; border-bottom-width: 0mm;"/>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4mm; border-bottom-width: 0mm; background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="width: 32mm; height: 4mm; border-bottom-width: 0px;">
										<!--  <xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form1120ScheduleJ/ForeignTaxCredit" />
      </xsl:call-template> -->
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 4mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- BEGIN -->
								<!-- Line 4b2 -->
								<div style="width: 187mm; height: 5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm; padding-left: 3mm;"/>
									<div style="width: 103mm; height: 5mm; clear: none; float: left;">
										<div class="styLNDesc" style="width: 64.8mm; height: 5mm;">
											<span style="float:left;clear:none;">
					instructions)
				</span>
											<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
										</div>
										<div class="styLNRightNumBox" style="width: 6mm; height: 4mm; border-bottom-width: 1px;">4b</div>
										<div class="styLNAmountBox" style="width: 32.2mm; height: 4mm; padding-right: 0.5mm; border-bottom-width: 1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8812Data/NontaxableCombatPayAmt"/>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; border-bottom-width: 0px; background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="height: 5mm; border-bottom-width: 0px;"/>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 5mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- END Line 4 -->
								<!--BEGIN-->
								<!-- Line 5 -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 4mm; padding-left: 3mm;">5</div>
									<div class="styLNDesc" style="width: 62.25mm; height: 4mm;">Is the amount on line 4a more than $3,000?</div>
									<div class="styDotLn" style="width: 40.75mm; padding-right: 0mm; float: left;">..........</div>
									<div class="styLNRightNumBox" style="border-width: 0px 1px; width: 6.25mm; height: 4mm; background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="border-width: 0px; width: 31.75mm; height: 4mm;">
										<!--<xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd" />
      </xsl:call-template>  -->
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 4mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--END line 5 -->
								<!--BEGIN-->
								<!--Line 5 NO CHECK BOX -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 4.5mm;"/>
									<div class="styLNDesc" style="width: 103mm; height: 4.5mm;">
										<div class="styLNDesc" style="width: 16mm; height: 5mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
												<b>No.</b>
											</label>
										</div>
										<div style="width: 62mm; height: 5mm; padding-top: 1.5mm;"> Leave line 5 blank and enter -0- on line 6.</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; border-top-width: 0px; border-bottom-width: 0px; background-color: lightgrey;"/>
									<div class="styLNAmountBox" style="height: 7mm; border-bottom-width: 0px;">
										<!--  <xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form1120ScheduleJ/ForeignTaxCredit" />
      </xsl:call-template> -->
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 7mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--END line 5  NO CHECKBOX-->
								<!--BEGIN-->
								<!-- Line 5 Yes  CHECKBOX-->
								<div style="width: 187mm; height: 6mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBox" style="width: 8mm; height: 5mm;"/>
									<div class="styLNDesc" style="width: 103mm; height: 6mm;">
										<div class="styLNDesc" style="width: 16mm; height: 5mm; padding-top: 0.75mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
													<xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
												</xsl:call-template>
												<b>Yes. </b>
											</label>
										</div>
										<div style="width: 87mm; height: 5mm; padding-top: 2mm;"> Subtract $3,000 from the amount on line 4a. Enter the result</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 6mm; padding-top: 2mm; padding-bottom: 0mm; border-bottom-width: 1px;">5</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 6mm; padding-top: 2mm; padding-right: 0.5mm; padding-bottom: 0mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetTotalEarnedIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 6mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--END of line 5 yes -->
								<!--Line 6 -->
								<div style="width: 187mm; height: 4.5mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="width: 8mm; height: 5mm; padding-left: 3mm;">6</div>
									<div class="styLNDesc" style="width: 141mm; height: 4.5mm;">
										<span style="float:left;clear:none;">  
					Multiply the amount on line 5 by 15% (0.15) and enter the result
				</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 4.5mm;">6</div>
									<div class="styLNAmountBox" style="width: 32mm; height: 4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--End of line 6 -->
								<!--Line 6A -->
								<div style="width: 187mm; height: 4mm; clear: left; font-size: 7.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="height:4mm;"/>
									<div class="styLNDesc" style="width: 141mm; height: 4mm;">
										<b>Next. </b> Do you have three or more qualifying children?
          </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 4mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 6A -->
								<!--Line 6A  no1 -->
								<div style="width: 187mm; height: 8mm; clear: left; font-size: 6.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="height:8mm;"/>
									<div class="styLNDesc" style="width:141mm; height:8mm;">
										<div class="styLNDesc" style="width: 16mm; height: 8mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
												<b>No.  </b>
											</label>
										</div>
						If line 6 is zero, <b>stop</b> here; you cannot claim this credit. Otherwise, skip Part III and enter the
						<b>smaller</b> of line 3 or line 6 on line 13.
              </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 8mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 6A  no1 -->
								<!--Line 6A  yes1 -->
								<div style="width: 187mm; height: 6.5mm; clear: left; font-size: 6.5pt; float: left;">
									<div class="styLNLeftNumBoxSD" style="height: 6.5mm;"/>
									<div class="styLNDesc" style="width: 141mm; height: 6.5mm; padding-right: 2mm;">
										<div class="styLNDesc" style="width: 16mm; height: 6.5mm;">
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px"/>
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
													<xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
												</xsl:call-template>
												<b>Yes. </b>
											</label>
										</div>
						 If line 6 is equal to or more than line 3, skip Part III and enter the amount 
						 from line 3 on line 13. Otherwise, go to line 7.
          </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 6.5mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 6A  yes1 -->
								<!-- Page Break -->
								<div class="pageEnd" style="width: 187mm; height: 4mm; clear: both; font-family: Arial; font-size: 7pt; border-top-color: black; border-top-width: 2px; border-top-style: solid; float: none;">
									<span style="float:left;clear:none;">
										<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
										<span style="width:15mm;"/>Cat. No. 59761M</span>
									<span style="float:right;clear:none;font-weight:bold;">Schedule 8812 (Form 1040A or 1040) 2016</span>
								</div>
								<p style="clear: none; float: none; page-break-after: always;"/>
								<div class="styTBB" style="width:187mm; clear: left; float: left; border-bottom-width: 1px;">
									<span style="float:left;clear:none;">Schedule 8812 (Form 1040A or Form 1040) 2016</span>
									<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span>
									</span>
								</div>
								<!-- BEGIN Part III Title -->
								<div class="styBB" style="width:187mm; border-top-width:1px; clear: left; float: left;">
									<div class="styPartName" style="font-family:Arial;font-size:10pt;">Part III</div>
									<div class="styPartDesc" style="font-family:Arial;font-size:10pt;">Certain Filers Who Have Three or More Qualifying Children</div>
								</div>
								<!-- END Part II  Title -->
								<!-- Line 7 -->
								<div style="width: 187mm; height: 15mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 15mm; padding-top: 2.5mm; padding-left: 3mm;">7</div>
									<div class="styLNDesc" style="width: 103mm; height: 15mm; padding-top: 2.5mm;">
						Withheld social security, Medicare, and Additional Medicare taxes from <br/>Form(s) W-2, boxes 4 and 6. 
						If married filing jointly, include your spouse’s amounts with yours. If your employer withheld or you paid 
						Additional Medicare Tax or tier 1 RRTA taxes, see separate instructions
			   <span class="styDotLn" style="float:none;padding-left:2mm;">.........</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 15mm; padding-top: 11.7mm;">7 </div>
									<div class="styLNAmountBox" style="height: 15mm; padding-top: 11.7mm; border-bottom-width: 1px; padding-right:0.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/FromW2Amt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 15mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 8 -->
								<div style="width: 187mm; height: 27mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 35mm; padding-left: 3mm;">8</div>
									<div style="width: 103mm; height: 35mm; clear: none; float: left;">
										<div class="styLNDesc" style="width: 100mm; height: 35mm;">
											<div class="styLNDesc" style="width: 22mm; height: 11mm;">
												<b>1040 filers:</b>
											</div>
											<div class="styLNDesc" style="width: 75mm; height: 11mm;">
					Enter the total of the amounts from Form 1040, lines<br/>
					27 and 58, plus any taxes that you identified using code<br/>
					"UT" and entered on line 62.
				</div>
											<div class="styLNDesc" style="width: 22mm; height: 6mm;">
												<b>1040A filers:</b>
											</div>
											<div class="styLNDesc" style="width: 75mm; height: 6mm;"> Enter -0-.
				 </div>
											<br/>
											<div class="styLNDesc" style="width: 22mm; height: 11mm;">
												<b>1040NR filers:</b>
											</div>
											<div class="styLNDesc" style="width: 75mm; height: 11mm;">
					Enter the total of the amounts from Form 1040NR, lines<br/>
					27 and 56, plus any taxes that you identified using code<br/>
					 "UT" and entered on line 60.
			  </div>
										</div>
										<div class="styLNDesc" style="width: 2.8mm; height: 27mm;">
											<img src="{$ImagePath}/8812_Bracket_Lger.gif" alt="Curly Bracket Image"/>
										</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 27mm; border-bottom-width: 0px;">
										<span style="border-width: 0px 0px 1px; border-style: solid; border-color: black; width: 5.7mm; height: 16mm; padding-top: 12.5mm;">8</span>
									</div>
									<div class="styLNAmountBox" style="height: 27mm; border-bottom-width: 0px;">
										<span style="border-width: 0px 0px 1px; border-style: solid; border-color: black; width: 31.7mm; height: 16mm; padding-top: 12.5mm; padding-right:0.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8812Data/FromTaxReturnAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 48mm; padding-top: 12mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 9 -->
								<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 7mm; padding-top: 1.5mm; padding-left: 3mm;">9</div>
									<div class="styLNDesc" style="width: 103mm; height: 5mm; padding-top: 1.5mm;">
										<span style="float:left;clear:none;">      
					  Add lines 7 and 8
				 </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1.5mm;">9</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1.5mm; padding-right:0.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/CalcFromW2AndReturnAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 5mm; border-right-width: 1px; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!-- Line 10 -->
								<div style="width: 187mm; height: 28mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 27mm;">10</div>
									<div style="width: 103mm; height: 35mm; clear: none; float: left;">
										<div class="styLNDesc" style="width:100mm;">
											<div class="styLNDesc" style="width: 22mm; height: 8mm;">
												<b>1040 filers:</b>
											</div>
											<div class="styLNDesc" style="width: 77mm; height: 8mm;">Enter the total of the amounts from Form 1040, lines<br/>
					66a and 71.
				 </div>
											<br/>
											<div class="styLNDesc" style="width: 22mm; height: 14mm;">
												<b>1040A filers:</b>
											</div>
											<div class="styLNDesc" style="width: 77mm; height: 14mm;">Enter the total of the amount from Form 1040A, line<br/>
						42a, plus any excess social security and tier 1 RRTA<br/>
						taxes withheld that you entered to the left of line 46<br/>
						(see separate instructions).
      </div>
											<div class="styLNDesc" style="width: 22mm; height: 9mm;">
												<b>1040NR filers:</b>
											</div>
											<div class="styLNDesc" style="width: 77mm; height: 9mm; font-size: 7.5pt;">Enter the amount from Form 1040NR, line 67.</div>
										</div>
										<div class="styLNDesc" style="width: 2.8mm; height: 27mm;">
											<img src="{$ImagePath}/8812_Bracket_Lger_1.gif" alt="Curly Bracket Image" width="6" height="90"/>
										</div>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 16mm; padding-top: 12mm;">10</div>
									<div class="styLNAmountBox" style="height: 16mm; padding-top: 12mm; border-bottom-width: 1px; padding-right:0.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/CalcAmtFromRetPlusTaxWhldAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="width: 6.3mm; height: 28mm; padding-top: 0mm; border-right-width: 1px; border-bottom-width: 0px;">
									</div>
								</div>
								<!--Line 11 -->
								<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1mm;">11</div>
									<div class="styLNDesc" style="width: 141mm; height: 5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">  
					 Subtract line 10 from line 9. If zero or less, enter -0-
            </span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">11</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/CalculatedDifferenceAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--End of line 11 -->
								<!--Line 12 -->
								<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 5mm;">12</div>
									<div class="styLNDesc" style="width: 141mm; height: 5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">    
					Enter the <b>larger </b> of line 6 or line 11
			    </span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm;">12</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/LargerCalcIncomeOrDiffAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!--End of line 12 -->
								<!--Line 12A -->
								<div style="width: 187mm; height: 4mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 4mm; padding-top: 0mm;"/>
									<div class="styLNDesc" style="width: 141mm; height: 4mm; padding-top: 0mm;">
										<b>Next, </b>
       enter the <b>smaller</b> of line 3 or line 12 on line 13.
          </div>
									<div class="styLNRightNumBox" style="width: 38mm; height: 4mm; padding-top: 0mm; border-bottom-width: 0px; background-color: lightgrey;"/>
								</div>
								<!--End of line 12A -->
								<!-- BEGIN Part IV Title -->
								<div style="width: 187mm; height: 4.5mm; clear: left; border-top-color: black; border-bottom-color: black; border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; float: left;">
									<div class="styPartName" style="font-family: Arial; font-size: 10pt;">Part IV</div>
									<div class="styPartDesc" style="font-family: Arial; font-size: 10pt;">Additional Child Tax Credit</div>
								</div>
								<!-- END Part IV Title -->
								<!--Line 13 -->
								<div style="width: 187mm; height: 5mm; clear: left; float: left;">
									<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1mm;">13</div>
									<div class="styLNDesc" style="width: 141mm; height: 5mm; padding-top: 1mm;">
										<span style="float:left;clear:none;">
											<b>This is your additional child tax credit</b>
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
									</div>
									<div class="styLNRightNumBox" style="width: 6mm; height: 5mm; padding-top: 1mm; border-bottom-width: 1px;">13</div>
									<div class="styLNAmountBox" style="height: 5mm; padding-top: 1mm; border-bottom-width: 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8812Data/AdditionalChildTaxCreditAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="width: 187mm; height: 16mm; text-align: right; padding-top: 0mm; clear: left; float: left;">
									<img src="{$ImagePath}/8812_1040_Bottom_Forms.gif" alt="1040 Forms"/>
									<div class="styLNDesc" style="border-width: 2px; border-style: none dotted dotted none; border-color: black; width: 35mm; height: 12mm; text-align: left; padding-top: 0.5mm; padding-left: 3.5mm; clear: left; font-size: 6pt; float: right;">
										<span style="width: 28.3mm;">Enter this amount on</span>
										<br/>
										<span style="width: 28.3mm;">Form 1040, line 67,</span>
										<br/>
										<span style="width: 28.3mm;">Form 1040A, line 43, or</span>
										<br/>
										<span style="width: 28.3mm;">Form 1040NR, line 64.</span>
									</div>
								</div>
								<div style="width: 187mm; height: 1mm; clear: left; float: left;"/>
								<!--End of line 13 -->
								<!-- capturing the page bottom info -->
								<!--  FOOTER-->
								<div class="pageEnd" style="width: 187mm; height: 8mm; clear: left; border-top-color: black; border-top-width: 2px; border-top-style: solid; float: left;">
									<div style="width:100mm;float:right;font-weight:bold;text-align:right;">Schedule 8812 (Form 1040A or Form 1040) 2016</div>
								</div>
								<!-- Adding page break -->
								<p style="page-break-before: always;"/>
								<div class="styLeftOverTitleLine" id="LeftoverData" style="clear:left; float: left;">
									<div class="styLeftOverTitle">
										Additional Data        
									</div>
									<div class="styLeftOverButtonContainer">
										<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
									</div>
								</div>
								<table class="styLeftOverTbl" style="clear:left; float: left;">
									<xsl:call-template name="PopulateCommonLeftover">
										<xsl:with-param name="TargetNode" select="$Form8812Data"/>
										<xsl:with-param name="DescWidth" select="100"/>
									</xsl:call-template>
								</table>
								<!-- END Additional Data Left Over Table -->
					<!-- END Additional Data Left Over Table -->
					<!-- END Additional Data Left Over Table -->
					
					
					<!--Separated Data  Part I - Filers with Certain Child Dependent(s) with an ITIN Table -->
					<!--Separated Data  Part I - Filers with Certain Child Dependent(s) with an ITIN Table -->
					<!--Separated Data  Part I - Filers with Certain Child Dependent(s) with an ITIN Table -->
					
					<xsl:if test="($Print = $Separated and count($Form8812Data/QualifiedChildDepdWithITINGrp) &gt; 4)">
					<div class="styTableContainer" id="pt1ContainerId">
					<xsl:attribute name="style">
						width:187mm; height:auto; display:block;
						</xsl:attribute>
						<br/>
						<span class="styRepeatingDataTitle">Form Schedule 8812 - Part I - Filers with Certain Child Dependent(s) with an ITIN Table, Line 1:</span>
						<br/>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0" summary="Table displaying Qualified Child with ITIN information " name="SepQualChildtable" id="SepQualChildtable">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="1" style="width:187mm;font-weight:normal;text-align: left;">
										<span style="padding:2mm;"> Answer the following questions for each dependent listed on Form 1040, line 6c; Form 1040A, line 6c; or Form 1040NR, line 7c, who has an ITIN
																							  (Individual Taxpayer Identification Number) and that you indicated is a qualifying child for the child tax credit by checking column (4) for that dependent. 
										</span> <br/>
                                    </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
							<xsl:for-each select="$Form8812Data/QualifiedChildDepdWithITINGrp">
											<tr style="height:14mm; border-color:black;">
											<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--position 1-->
												<td class="styDepTblCell" style="padding-left:2mm; text-align: left;">
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">
															<xsl:number value="position()" format="A"/>
														</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber"/> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">QlfyChildDepdWithITINYesInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">QualifiedChildDepdWithITINNoInd<xsl:number value="position()"/>
																	</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 1">
											<tr style="height:14mm; border-color:black;">
											<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--position 1-->
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">A</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="1"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN1</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 2">
											<tr style="height:14mm; border-color:black;">
											<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--position 1-->
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">B</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="2"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN2</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 3">
											<tr style="height:14mm; border-color:black;">
											<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--position 1-->
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">C</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="3"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN3</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="count($Form8812Data/QualifiedChildDepdWithITINGrp) &lt; 4">
											<tr style="height:14mm; border-color:black;">
											<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--position 1-->
												<td>
													<div style="width:180mm;float:none;clear:both;">
														<div class="styGenericDiv" style="width:8mm;font-weight:bold;">D</div>
														<div class="styGenericDiv" style="width:172mm;">
												For the <xsl:call-template name="OrdinalNumber">
																<xsl:with-param name="number" select="4"/>
															</xsl:call-template> dependent identified with an ITIN and listed as a qualifying child for the child tax credit, did this child meet the substantial<br/>
												 presence test? See separate instructions.
											</div>
													</div>
													<div style="width:90mm;padding-left:20mm;float:none;clear:both;">
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
															</xsl:call-template>
															<input type="checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINYesInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													Yes
												</label>
															<span style="width:6mm;"/>
															<input type="checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
															</input>
															<label style="padding-left:1px;">
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="QlfyChildDepdWithITINNoInd"/>
																	<xsl:with-param name="BackupName">IRSSch8812QualWithITIN4</xsl:with-param>
																</xsl:call-template>
													No
												</label>
														</span>
													</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
						</table>
							</div>
							</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="OrdinalNumber">
		<xsl:param name="number" select="position()"/>
		<xsl:choose>
			<xsl:when test="$number = 1">first</xsl:when>
			<xsl:when test="$number = 2">second</xsl:when>
			<xsl:when test="$number = 3">third</xsl:when>
			<xsl:when test="$number = 4">fourth</xsl:when>
			<xsl:when test="$number mod 10 = 1 and $number != 11">
				<xsl:value-of select="$number"/>st</xsl:when>
			<xsl:when test="$number mod 10 = 2 and $number != 12">
				<xsl:value-of select="$number"/>nd</xsl:when>
			<xsl:when test="$number mod 10 = 3 and $number != 13">
				<xsl:value-of select="$number"/>rd</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$number"/>th</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="PopulateInlineAdditionalDataTableMessage">
    <xsl:param name="TargetNode"/>
    <xsl:param name="ShortMessage">false</xsl:param>

    <!-- If the Print parameter is set to 'inline' and the element > 4 nodes, the message will be displayed-->
    <xsl:if test="($Print = 'inline') and (count($TargetNode) &gt; 4)">
      <xsl:choose>
        <xsl:when test="$ShortMessage= 'true' ">See Add'l Data</xsl:when>
        <xsl:otherwise>See Additional Data Table Below</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>
