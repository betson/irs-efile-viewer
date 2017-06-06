<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 04/02/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate_ETEC.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8849Schedule8Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8849Schedule8"/>
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
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="IRS8849Schedule8"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
         <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''"> 
          <xsl:call-template name="IRS8849Schedule8Style"/>
          <xsl:call-template name="AddOnStyle"/>
          </xsl:if> 
        </style>
         <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS8849Schedule8">
          <xsl:call-template name="DocumentHeader"/>

          <!--Title of Form -->
          	<table cellspacing="0" cellpadding="0">
				<tr>
					<td class="styFNBox" style="width:38mm;float:none;clear:none;/">
						<div style="font-size:7pt;">
							<span style="font-size:10pt;font-weight:bold;">Schedule 8</span>
							<br/>
							<span style="font-size:10pt;font-weight:bold;">(Form 8849)</span>
							<br/>
							(October 2006)
							<br/>
							Department of the Treasury
							Internal Revenue Service
						</div>
					</td>
					<td class="styFTBox" style="width:118mm;float:none;clear:none;">
						<div style="font-size:12pt;font-weight:bold;">Registered Credit Card Issuers</div>
						<div style="font-size:8pt;font-weight:normal;padding-top:3mm;">
							<img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/> Attach to Form 8849. <b>Do not </b> file with any other schedule.
						</div>
					</td>
					<td class="styTYBox" style="width:31mm;float:none;clear:none;">
						<div style="font-size:7pt">OMB No. 1545-1420</div>
					</td>
				</tr>
		</table>
	  <!--  End title of Form  -->
          
	<!-- Begin Name / Employer identification number / Total Refund  -->
	<div class="styIRS8849TTB" style="width:187mm;border-top-width:1px;">
	<table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;">
		<tbody>
			<tr>
				<th scope="col" class="styNameBox" style="font-weight:normal;font-size:7pt;text-align:left;width:107mm;height:9mm;">
				Name as shown on Form 8849<br/>
					<xsl:choose>
						<xsl:when test="normalize-space($FormData/NameOfEmployer) != ''">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($FormData/NameOfEmployer/BusinessNameLine2)!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</th>
				<th scope="col" class="styNameBox" style="font-weight:normal;font-size:7pt;text-align:left;padding-left:2mm;width:33mm;height:9mm;">
					EIN<br/><br/>
					<xsl:choose>
						<xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
						</xsl:call-template>
						</xsl:when>
						<xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						<xsl:if test="($RtnHdrData/Filer/EIN)">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							</xsl:call-template>		
						</xsl:if>
						<xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							</xsl:call-template>		
						</xsl:if>                 
						</xsl:otherwise>
					</xsl:choose>
				</th>
				<th scope="col" style="height:9mm;width:47mm;padding-left:2mm;font-size:7pt;font-weight:normal;text-align:right;">
					<span style="float:left;">Total refund (see instructions)</span><br/><br/>
					<span style="float:left;">$</span>
					<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalRefundAmt"/>
					</xsl:call-template>
				</th>
			</tr>
		</tbody>
	</table>	
	</div>
	<!-- End Name / Employer identification number / Total Refund  -->
		
		<!--  Begin period of claim -->
		<div style="width:187mm;">
		<table class="styTable" cellspacing="0">
			<tbody style="font-size: 8pt">
				<tr>
					<th scope="col" style="width:7mm;border-style: solid; padding-top:1mm; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;"><span style="width:1px"/></th>
					<th scope="col" style="width:28mm;vertical-align: top; text-align:left; padding-top:1mm; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>Period of claim: </b></th>
					<th scope="col" style="width: 55mm; text-align: left; border-style: solid; padding-top:1mm; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;font-weight:normal"><i>Enter month, day, and year<br/>in MMDDYYYY format.</i></th>
					<th scope="col" style="width: 48mm; vertical-align: bottom; text-align: left; padding-top:1mm; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>From  </b> <img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/>
						<span style="font-weight:normal;padding-left:1mm"><xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodBeginDt"/>
						</xsl:call-template></span>
					</th>
					<th scope="col" style="width: 49mm;vertical-align: bottom; padding-top:1mm; text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>To  </b> <img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/>
						<span style="font-weight:normal;padding-left:1mm"><xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodEndDt"/>
						</xsl:call-template></span>
					</th>
				</tr>
			</tbody>
		</table>
		</div>
		<!--  End Period of claim -->

		<!-- Begin Claimant's reg no. -->	
		<table class="stylIRS8849S8TableBorderless" style="display:table-header-group;font-size: 7pt;text-align: left" cellspacing="0">
		<tbody>
		<tr>
          		<td style="width:7mm"><span style="width:1px"/></td>
          		<td style="width:60mm;font-size: 8pt">
				<br/>
				<b>Claimant's registration no.</b><span style="width:1px"/>
				<img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/>
          			<span style="padding-left:5mm"/>
          			<b>CC</b>
          		</td>
          		<td class="styUnderlineAmount" style="width: 60mm; padding-top: 4mm;text-align:left">
				<span style="padding-left:0mm; padding-right: 2mm"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/UVClaimantRegistrationNum"/>
						</xsl:call-template>
			</td>
			<td style="width: 60mm;padding-left:5mm;">
				<i>You must enter your registration number<br/> to make a claim on Schedule 8.</i> 
			</td>
		</tr>
		</tbody>
		</table>
		<!-- End Claimant's reg no. -->
		<!--Begin Note-->
		<table class="stylIRS8849S8TableBorderless" style="text-align: justify; width: 187mm">
			<tbody style="font: 9pt sans-serif">
				<tr>
					<td><p>
					<b>Note. </b><span style="width:1px"/> For lines 1 through 5, claimant (a) has not collected the amount of tax from the ultimate purchaser or has obtained the written consent of the ultimate purchaser to make the claim, (b) has repaid or agreed to repay the amount of tax to the ultimate vendor, has obtained the written consent of the ultimate vendor to make the claim, or has made arrangements that directly or indirectly provide the ultimate vendor with repayment of the tax, and (c) has obtained the required certificate from the ultimate purchaser and has no reason to believe any of the information in the certificate is false.
					</p></td>
				</tr>
			</tbody>
		</table>
		<!--End Note-->
		
		<!--Begin Table 1 -->
		<div style="width:187mm; border-top: 1 solid black">
		<table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;">
			<tbody>
				<tr style="font-size:8pt;height:8mm">
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;">
						<span class="styTableCellPad" style="text-align: left">1</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;">
						<b>Sales of Undyed Diesel Fuel</b>
					</th>
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
				</tr>
				<tr style="font-size:7pt">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"/></td>
					<td style="width:60mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"/></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr style="font-size:7pt;height:8mm">
					<td style="border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><span style="width:1px"/></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedDieselFuel/FuelUsedByStateLocalGovt/Rt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedDieselFuel/FuelUsedByStateLocalGovt/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="text-align: right;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedDieselFuel/FuelUsedByStateLocalGovt/Amt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedDieselFuel/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<!--End Table 1-->		
		<!-- Begin Table 2 -->
		<div style="width:187mm">
		<table cellspacing="0">
			<tbody>
				<tr style="font-size:8pt;height:8mm">
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<span class="styTableCellPad" style="text-align: left">2</span>
					</th>
					<th scope="col" colspan="4" class="styTableCellHeader" style="width:172mm; text-align:left;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<b>Sales of Undyed Kerosene (Other Than Kerosene For Use in Aviation)</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-width=0"><span style="width: 1px"></span></th>
					<th class="styTableCellHeader" style="width:40mm;border-width=0"><span style="width: 1px"></span></th>
					<th class="styTableCellHeader" style="width:55mm;border-width=0"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
				</tr>
				<tr style="font-size:7pt">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"/></td>
					<td style="width:60mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"/></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="width:40mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="width:55mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr style="font-size:7pt;height:8mm">
					<td style="border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><span style="width:1px"/></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/Rt"/>
						</xsl:call-template>
					</td>
					<td style="width:40mm;border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="width:55mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/Amt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<!-- End Table 2  -->
		
		<!--Begin Table 3-->
		<div style="width:187mm; border-top: 1 solid black">
		<table cellspacing="0">
			<tbody>
				<tr style="font-size:8pt;height:8mm">
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<span class="styTableCellPad" style="text-align: left">3</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<b>Sales of Kerosene for Use in Aviation</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-width=0"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
				</tr>
				<tr style="font-size:7pt;vertical-align:top;padding-top:4px">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"/></td>
					<td style="width:60mm; border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"/></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>a</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government<br/>(kerosene taxed at $ .244)</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt244/Rt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt244/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt244/Amt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt244/CreditReferenceNum"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>b</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government<br/>(kerosene taxed at $ .219)<br/></td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt219/Rt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt219/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt219/Amt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesKeroseneUseAviationFuel/OtherNontaxableUsesTaxedAt219/CreditReferenceNum"/>
						</xsl:call-template>
					</td>
				</tr>
				  

			</tbody>
		</table>
		</div>
		<!--End Table 3-->
		
		<!--Begin Table 4-->
		<div style="width:187mm">
		<table cellspacing="0">
			<tbody>
				<tr style="font-size:8pt;height:8mm">
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<span class="styTableCellPad" style="text-align: left">4</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<b>Sales of Gasoline</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
				</tr>
				<tr style="font-size:7pt;vertical-align:top;padding-top:4px">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"/></td>
					<td style="width:60mm; border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"/></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="width:15mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>a</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a nonprofit educational<br/>organization</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/Rt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/Amt"/>
						</xsl:call-template>
					</td>
					<td rowspan="2" style="width:15mm;border-color: black;padding-bottom:6mm;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/CreditReferenceNum"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:bottom;padding-top:4px"><b>b</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;vertical-align:bottom">Use by a state or local government</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUsedByStateLocalGovt/Rt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUsedByStateLocalGovt/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUsedByStateLocalGovt/Amt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
					<span style="width:1px"/>
					</td>
				</tr>

			</tbody>
		</table>
		</div>
		<!--End Table 4-->
		<!--Begin Table 5-->
		<div style="width:187mm">
		<table cellspacing="0">
			<tbody>
				<tr style="font-size:8pt;height:8mm">
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<span class="styTableCellPad" style="text-align: left">5</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;">
						<b>Sales of Aviation Gasoline</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><span style="width: 1px"/></th>
				</tr>
				<tr style="font-size:7pt;vertical-align:top;padding-top:4px">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"/></td>
					<td style="width:60mm; border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"/></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="width:15mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>a</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a nonprofit educational<br/>organization</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/Rt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/Amt"/>
						</xsl:call-template>
					</td>
					<td rowspan="2" style="width:15mm;border-color: black;padding-bottom:6mm;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/CreditReferenceNum"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4mm"><b>b</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;vertical-align:bottom">Use by a state or local government<br/></td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUsedByStateLocalGovt/Rt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUsedByStateLocalGovt/GallonsQty"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUsedByStateLocalGovt/Amt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
					<span style="width:1px"/>
					</td>
				</tr>

			</tbody>
		</table>
		</div>
		<!--End Table 5-->
		
		
		<!-- Begin Footer -->
		<div style="width:187mm; padding-top:0.5mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">
				<div style="width:114mm;font-weight:bold;" class="styGenericDiv">For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.</div>
				<div style="width:23mm;padding-left:2mm;font-size:6pt;padding-top:2px;" class="styGenericDiv">Cat. No. 47991M</div>
				<div style="float:right;width:50mm;" class="styGenericDiv"><span style="width:1.5mm;"/><span class="styBoldText">Schedule 8 (Form 8849)</span> (10-2006)</div>
		</div>     
		<div class="pageEnd"/><br/>
	
		<!-- End Footer -->  
		
		<!-- BEGIN Left Over Table -->  
        	<!-- Additonal Data Title Bar and Button -->
        	<div class="styLeftOverTitleLine" id="LeftoverData">
          		<div class="styLeftOverTitle">
          			Additional Data
          		</div>
          		<div class="styLeftOverButtonContainer" style="float:left">
            			<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          		</div>      
        	</div>
    		<!-- Additional Data Table -->
    		<table class="styLeftOverTbl">
      			<xsl:call-template name="PopulateCommonLeftover">
        			<xsl:with-param name="TargetNode" select="$FormData"/>
        			<xsl:with-param name="DescWidth" select="100"/>
      			</xsl:call-template>
    		</table>  

				
		</form>    		
   	</body>
	</html>
  </xsl:template>
</xsl:stylesheet>