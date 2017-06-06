<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5695Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5695Data" select="$RtnDoc/IRS5695"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5695Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 5695"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5695Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS5695">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:20mm;border-right-width:2px;">
							<div style="">
								Form<span class="styFormNumber">  5695</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:123.5mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Residential Energy Credits
							</div>
							<div class="styGenericDiv" style="height:5mm;font-size:7pt;margin-left:0mm;text-align:center;">
								<span style="text-align:center;">
									<div style="width:100%;height:5mm;font-weight:bold;">
										<br/>
										<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 5695 and its instructions is at <i>www.irs.gov/form5695</i>.
											<br/>
										<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040 or Form 1040NR.
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;float:right">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTaxYear">20<span class="styTYColor">13</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:8pt;">158</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:choose>
								<xsl:when test="$Form5695Data/Name">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5695Data/Name"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:choose>
									<xsl:when test="$Form5695Data/SSN">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5695Data/SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Residential Energy Efficient Property Credit <span style="font-weight:normal;">(See instructions before completing this part.)</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styIRS5695LineItem" style="border-bottom:1px solid black;">
						<div class="styIRS5695LNDesc" style="width:100%;height:auto;padding-left:0px;">
							<b>Note.</b>
							<span class="styItalicText"> Skip lines 1 through 11 if you only have a <b>credit carryforward from 2012.</b>
							</span>
						</div>
					</div>
					<!-- (1) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">1</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified solar electric property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/SolarElecPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (2) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">2</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified solar water heating property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">...................</span>
						</div>
						<div class="styLNRightNumBox" style="">2</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/SolarWaterHtPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (3) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">3</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified small wind energy property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">...................</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/SmallWindPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (4) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">4</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified geothermal heat pump property costs</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">..................</span>
						</div>
						<div class="styLNRightNumBox" style="">4</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/GeothrmlHtPumpPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (5) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">5</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Add lines 1 through 4</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="">5</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/TotalEnergyCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (6) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">6</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Multiply line 5 by 30% (.30)</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">........................</span>
						</div>
						<div class="styLNRightNumBox" style="">6</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/GeothrmlHtPumpPropStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (7a) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD" style="">7a</div>
						<div class="styLNDesc" style="">
								Qualified fuel cell property. Was qualified fuel cell property installed on or in connection with your
								<span style="float:left;">main home located in the United States? (See instructions)</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots" style="padding-right:7px;">.............<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/>
							</span>
						</div>
						<div class="styLNRightNumBox" style="">
							<br/>7a</div>
						<div class="styLNAmountBox" style="text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
							</xsl:call-template>
							<br/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlHomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:6px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlHomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
							<span style="width:16px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlHomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:6px;"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlHomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</div>
					</div>
					<!-- Caution -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="">
							<b>Caution. </b>
							<i> If you checked the "No" box, you cannot take a credit for qualified fuel cell property. Skip <br/>lines 7b through 11.</i>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:8mm;"/>
					</div>
					<!-- (7b) /////////////////////////////////////////////////// -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="">
								Print the complete address of the main home where you installed the fuel cell property.
							</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
					<!-- Address////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:22mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="padding-left:10mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress/AddressLine2 !=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
							<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:.5mm;height:8.5mm;">
									Number and street<span style="width:65mm"/>Unit No. <br/>
								<br/>
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress"/>
								</xsl:call-template>
							</div>
							<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:1mm">
									City, State, ZIP code
								</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:26mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:26mm"/>
					</div>
					<!-- (8) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Qualified fuel cell property costs</span>
							<span class="styIRS5695Dots">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">8</div>
						<div class="styLNAmountBox" style="padding-right:2px;height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- (9) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:98.05mm;"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style=""/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Multiply line 8 by 30% (.30)</span>
							<span class="styIRS5695Dots">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">9</div>
						<div class="styLNAmountBox" style="padding-right:2px;height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropStdPctCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- (10) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:98.05mm;"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style=""/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:98.05mm;">
								Kilowatt capacity of property on line 8 above <img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:25mm;border-bottom:1px solid black;text-align:center;font-family:Arial;font-size:6pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropKWCapNum"/>
								</xsl:call-template>
							</span>
							<span style="font-family:Arial;padding-left:4px;">x $1,000</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropKWCapAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- (11) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox" style="">11</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Enter the smaller of line 9 or line 10</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">......................</span>
						</div>
						<div class="styLNRightNumBox" style="">11</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropAllwblCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (12) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox" style="">12</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Credit carryforward from 2012. Enter the amount, if any, from your 2012 Form 5695, line 18</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">...</span>
						</div>
						<div class="styLNRightNumBox" style="">12</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/PYCarryfwdEnergyEffPropertyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (13) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox" style="">13</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Add lines 6, 11, and 12</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="">13</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/TotalOfEnergyCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (14) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox" style="">14</div>
						<div class="styLNDesc" style="">
								Limitation based on tax liability. Enter the amount from the Residential Energy Efficient Property Credit<br/>
							<span style="float:left;">Limit Worksheet (see instructions)</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">......................</span>
						</div>
						<div class="styLNRightNumBox" style="">
							<br/>14</div>
						<div class="styLNAmountBox" style="">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (15) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox" style="">15</div>
						<div class="styLNDesc" style="">
							<b>Residential energy efficient property credit. </b> Enter the smaller of line 13 or line 14. Also include <br/>
							<span style="float:left;">this amount on Form 1040, line 52, or Form 1040NR, line 49</span>
							<!--Dotted Line-->
							<span class="styIRS5695Dots">.............</span>
						</div>
						<div class="styLNRightNumBox" style="">
							<br/>15</div>
						<div class="styLNAmountBox" style="">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/ResidentialEgyEffPropCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- (16) ////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="border-bottom:1px solid black">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:98.05mm;">
								Credit carryforward to 2014. If line 15 is less than line 13, subtract <br/>
							<span style="float:left;">line 15 from line 13</span>
							<span class="styIRS5695Dots">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="margin-top:3.5mm;">16</div>
						<div class="styLNAmountBoxNBB" style="margin-top:3.5mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/CarryfwdEnergyEffPropertyCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;"/>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1px;">
						<span style="float:left;">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
							<span style="width:100px;"/>
							Cat. No. 13540P
						</span>
						<span style="float:right;">Form<span class="styBoldText" style="font-size:7pt;"> 5695 </span>(2013)</span>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Form 5695 (2013)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Nonbusiness Energy Property Credit</div>
					</div>
					<!-- Body -->
					<div style="width:187mm;height:3mm;font-size:4pt;">
						<div class="styLNLeftNumBox" style="height:3mm;font-size:4pt;"/>
						<div class="styLNDesc" style="height:3mm;font-size:4pt;"/>
						<div class="styLNRightNumBoxNBB" style="height:3mm;font-size:4pt;"/>
						<div class="styLNAmountBoxNBB" style="height:3mm;font-size:4pt;"/>
					</div>
					<!-- 17a -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">17a</div>
						<div class="styLNDesc">
							Were the qualified energy efficiency improvements or residential energy property costs for your <br/>
							<span style="float:left;">main home located in the United States? (see instructions)</span>
						</div>
						<div class="styLNRightNumBox">
							<br/>17a</div>
						<div class="styLNAmountBox" style="text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
							</xsl:call-template>
							<br/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
									<xsl:with-param name="BackupName">IRS5695HomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:6px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
									<xsl:with-param name="BackupName">IRS5695HomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
							<span style="width:16px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
									<xsl:with-param name="BackupName">IRS5695HomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:6px;"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
									<xsl:with-param name="BackupName">IRS5695HomeLocatedInUSAInd</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</div>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="font-family:Arial;">
							<span style="font-weight:bold;font-family:Verdana;">Caution: </span>
							<i>If you checked the "No" box, you cannot claim the nonbusiness energy property credit. Do not complete Part II.</i>
						</div>
						<div class="styShadingCell" style="width:40mm;height:4.4mm;"/>
					</div>
					<!-- 17b -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="">
							Print the complete address of the main home where you made the qualifying improvements. <br/>
							<b>Caution: </b>
							<i>You can only have one main home at a time.</i>
						</div>
						<div class="styShadingCell" style="width:40mm;height:8mm;"/>
					</div>
					<!-- Address////////////////////////////////////////////////////-->
					<div class="styIRS5695LineItem" style="height:22mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="padding-left:10mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress/AddressLine2 !=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
							<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:.5mm;height:8.5mm;">
								Number and street<span style="width:65mm"/>Unit No. <br/>
								<br/>
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress"/>
								</xsl:call-template>
							</div>
							<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:1mm">
								City, State, ZIP code
							</div>
						</div>
						<div class="styShadingCell" style="width:40mm;height:24mm;"/>
					</div>
					<!-- 17c -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc">
							<span style="float:left;">Were any of these improvements related to the construction of this main home?</span>
						</div>
						<div class="styLNRightNumBox">17c</div>
						<div class="styLNAmountBox" style="text-align:center;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695ImprvRltdToConstMainHomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:6px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695ImprvRltdToConstMainHomeInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
							<span style="width:16px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695ImprvRltdToConstMainHomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:6px;"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
									<xsl:with-param name="BackupName">IRS5695ImprvRltdToConstMainHomeInd</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</div>
					</div>
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="font-family:Arial;">
							<span style="font-weight:bold;font-family:Verdana;">Caution: </span>
							<i>If you checked the "Yes" box, you can only claim the nonbusiness energy property credit for qualifying <br/>
							improvements that were not related to the construction of the home. Do not include expenses related to the <br/>
							construction of your main home, even if the improvements were made after you moved into the home.</i>
						</div>
						<div class="styShadingCell" style="width:40mm;height:10.8mm;"/>
					</div>
					<!-- 18 -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Lifetime limitation. Enter the amount from the Lifetime Limitation Worksheet (see instructions)</span>
							<span class="styIRS5695Dots">...</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/TotNonBusinessEgyPropCrPYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 19 -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="">
							Qualified energy efficiency improvements (original use must begin with you and the component must <br/>
							reasonably be expected to last for at least 5 years; do not include labor costs) (see instructions).
						</div>
						<div class="styShadingCell" style="width:40mm;height:8mm;"/>
					</div>
					<!-- 19a -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc">
							Insulation material or system specifically and primarily designed to reduce heat loss or gain of <br/>
							<span style="float:left;">your home that meets the prescriptive criteria established by the 2009 IECC</span>
							<span class="styIRS5695Dots">.......</span>
						</div>
						<div class="styLNRightNumBox">
							<br/>19a</div>
						<div class="styLNAmountBox">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/InsulationOrSysHtGnLossCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 19b -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Exterior doors that meet or exceed the Energy Star program requirements</span>
							<span class="styIRS5695Dots">........</span>
						</div>
						<div class="styLNRightNumBox">19b</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ExteriorDoorsCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 19c -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc">
							Metal or asphalt roof that meets or exceeds the Energy Star program requirements and has <br/>
							appropriate pigmented coatings or cooling granules which are specifically and primarily designed <br/>
							<span style="float:left;">to reduce the heat gain of your home</span>
							<span class="styIRS5695Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox">
							<br/>
							<br/>19c</div>
						<div class="styLNAmountBox">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MetalOrAsphaltRoofCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 19d -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc" style="width:98.05mm;">
							Exterior windows and skylights that meet or exceed the Energy Star <br/>
							<span style="float:left;">program requirements</span>
							<span class="styIRS5695Dots">................</span>
						</div>
						<div class="styLNRightNumBox" style="margin-top:3.5mm;height:4.4mm;">19d</div>
						<div class="styLNAmountBox" style="margin-top:3.5mm;padding-right:2px;height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ExteriorWndwOrSkylightCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:40mm;height:8mm;"/>
					</div>
					<!-- 19e -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">e</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Maximum amount of cost on which the credit can be figured</span>
							<span class="styIRS5695Dots">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">19e</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ExtWndwOrSkylightCostLimitAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:40mm;height:4.4mm;"/>
					</div>
					<!-- 19f -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">f</div>
						<div class="styLNDesc" style="width:98.05mm;">
							If you claimed window expenses on your Form 5695 for 2006, 2007, <br/>
							2009, 2010, 2011, or 2012, enter the amount from the Window Expense <br/>
							<span style="float:left;">Worksheet (see instructions); otherwise enter -0-</span>
							<span class="styIRS5695Dots">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.8mm;">
							<br/>
							<br/>19f</div>
						<div class="styLNAmountBox" style="height:10.8mm;padding-right:2px;">
							<br/>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/PriorYearWindowExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:40mm;height:10.8mm;"/>
					</div>
					<!-- 19g-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">g</div>
						<div class="styLNDesc" style="width:98.05mm;">
							<span style="float:left;">Subtract line 19f from line 19e. If zero or less, enter -0-</span>
							<span class="styIRS5695Dots">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">19g</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaxEgyCrLessPYWindowExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- 19h-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">h</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Enter the smaller of line 19d or line 19g</span>
							<span class="styIRS5695Dots">....................</span>
						</div>
						<div class="styLNRightNumBox" style="">19h</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/CrAfterAppWndwExpnsLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 20-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Add lines 19a, 19b, 19c, and 19h</span>
							<span class="styIRS5695Dots">......................</span>
						</div>
						<div class="styLNRightNumBox" style="">20</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/PartialEnergyImprvCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 21-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Multiply line 20 by 10% (.10)</span>
							<span class="styIRS5695Dots">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="">21</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EnergyEffcntImprvStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 22 -->
					<div class="styIRS5695LineItem">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="">
							Residential energy property costs (must be placed in service by you; include labor costs for onsite <br/>
							preparation, assembly, and original installation) (see instructions).
						</div>
						<div class="styShadingCell" style="width:40mm;height:8mm;"/>
					</div>
					<!-- 22a -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Energy-efficient building property. Do not enter more than <b>$300</b>
							</span>
							<span class="styIRS5695Dots">............</span>
						</div>
						<div class="styLNRightNumBox" style="">22a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EnergyEffcntBldgPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 22b -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Qualified natural gas, propane, or oil furnace or hot water boiler. Do not enter more than <b>$150</b>
							</span>
							<span class="styIRS5695Dots">...</span>
						</div>
						<div class="styLNRightNumBox" style="">22b</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/QualifiedNaturalGasCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 22c -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc" style="padding-bottom:0px;">
							<span style="float:left;font-family:Arial;font-size:8pt;">Advanced main air circulating fan used in a natural gas, propane, or oil furnace. Do not enter more than <b>$50</b>
							</span>
							<!--<span class="styIRS5695Dots">.</span>-->
						</div>
						<div class="styLNRightNumBox" style="">22c</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/AdvncMainAirCirctngFanCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 23-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Add lines 22a or line 22c</span>
							<span class="styIRS5695Dots">........................</span>
						</div>
						<div class="styLNRightNumBox" style="">23</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/InternalEnergyImprvCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 24-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Add lines 21 and 23</span>
							<span class="styIRS5695Dots">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="">24</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/TotalEnergyImprovementsCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 25-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Maximum credit amount. (If you jointly occupied the home, see instructions) 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form5695Data/MarriedTPWMoreThanOneHomeCd"/>
									<xsl:with-param name="Desc">Part II - Line 25 - Married Tax Period More Than One Home Code</xsl:with-param>
								</xsl:call-template>
							</span>
							<span class="styIRS5695Dots">.......</span>
						</div>
						<div class="styLNRightNumBox" style="">25</div>
						<div class="styLNAmountBox" style="">
							<xsl:choose>
								<xsl:when test="$Form5695Data/MaximumResidentialEnergyCrAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5695Data/MaximumResidentialEnergyCrAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									$500
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- 26-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Enter the amount, if any, from line 18</span>
							<span class="styIRS5695Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="">26</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EnergyEffcntImprvAllwblCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 27-->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="padding-bottom:0px;">
							<span style="float:left;font-family:Arial;font-size:8pt;">Subtract line 26 from line 25. If zero or less, <b>stop</b>; you cannot take the nonbusiness energy property credit</span>
							<!--<span class="styIRS5695Dots">.</span>-->
						</div>
						<div class="styLNRightNumBox" style="">27</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/AdjustedCreditLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 28 -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="">
							<span style="float:left;">Enter the smaller of line 24 or line 27</span>
							<span class="styIRS5695Dots">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="">28</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/LesserOfActCrOrAdjCrLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 29 -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="">
							Limitation based on tax liability. Enter the amount from the Nonbusiness Energy Property Credit Limit<br/>
							<span style="float:left;">Worksheet (see instructions)</span>
							<span class="styIRS5695Dots">........................</span>
						</div>
						<div class="styLNRightNumBox" style="">
							<br/>29</div>
						<div class="styLNAmountBox" style="">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/TaxesLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 30 -->
					<div class="styIRS5695LineItem" style="">
						<div class="styLNLeftNumBox">30</div>
						<div class="styLNDesc" style="">
							<b>Nonbusiness energy property credit. </b> Enter the smaller of line 28 or line 29. Also include this <br/>
							<span style="float:left;">amount on Form 1040, line 52, or Form 1040NR, line 49</span>
							<span class="styIRS5695Dots">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="">
							<br/>30</div>
						<div class="styLNAmountBoxNBB" style="">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/NonBusinessEnergyCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1px;border-top:1px solid black;">
						<div style="float:right;">
							<span style="width:20px;"/>
							Form<span class="styBoldText" style="font-size:7pt;"> 5695 </span>(2013)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II - Line 25 - Married Tax Period More Than One Home Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MarriedTPWMoreThanOneHomeCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
