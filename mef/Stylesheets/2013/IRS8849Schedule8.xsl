<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 05/20/2014 - Modified per UWR #107611 - Jeremy Nichols -->
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
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
          <xsl:call-template name="IRS8849Schedule8Style"></xsl:call-template>
          <xsl:call-template name="AddOnStyle"/>
          </xsl:if> 
        </style>
         <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS8849Schedule8">
          <xsl:call-template name="DocumentHeader"/>

          <!--Title of Form -->
          <div style="width:187mm;border-bottom-width:0px;">
          	<table cellspacing="0" style=";border-bottom-width:0px;">
			<tbody>
				<tr>
					<td class="styFNBox" style="width:31mm;border-bottom-width:0px;">
						<span class="styMainTitle">Schedule 8</span>
						<br/>
						<span class="styMainTitle" style="font-size:10pt">(Form 8849)</span>
						<br/>
						<span class="styAgency">(October 2006)</span>
						<br/>
						<span class="styAgency">Department of the Treasury</span>
						<br/>
						<span class="styAgency">Internal Revenue Service</span>
					</td>
					<td class="styFTBox" style="width:125mm;border-bottom-width:0px;">
						<div class="styMainTitle"><br/>Registered Credit Card Issuers</div>
						<div class="styFBT" style="font-size:8pt;font-weight:normal">
							<img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/> Attach to Form 8849. <b>Do not </b> file with any other schedule.
						</div>
					</td>
					<td class="styTYBox" style="width:31mm;height:19mm;">
						<br/>
						<div style="font-size:7pt">OMB No. 1545-1420</div>
					</td>
				</tr>
			</tbody>
		</table>
	  </div>
	  <!--  End title of Form  -->
          
	<!-- Begin Name / Employer identification number / Total Refund  -->
	<div class="styIRS8849TTB" style="width:187mm;border-top-width:1px;">
	<table cellspacing="0">
		<tbody>
			<tr>
				<th scope="col"  class="styNameBox" style="font-weight:normal;font-size:7pt;text-align:left;width:107mm">
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
				<th scope="col"  class="styNameBox" style="font-weight:normal;font-size:7pt;text-align:left;width:33mm;padding-left:2mm">
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
				<th scope="col" style="padding-left:2mm;font-size:7pt;font-weight:normal;text-align:left;">
					Total refund (see instructions)
					<br/>
					<div style="text-align:right"><br/>
					<span style="float:left;padding-bottom:2px;font-size:8pt">$</span>
					<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalRefund"/>
					</xsl:call-template>
					</div>
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
					<th scope="col" style="width:7mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;"><span style="width:1px"></span></th>
					<th scope="col" style="width:28mm;vertical-align: top; text-align:left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>Period of claim: </b></th>
					<th scope="col" style="width: 55mm; text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;font-weight:normal"><i>Enter month, day, and year<br/>in MMDDYYYY format.</i></th>
					<th scope="col" style="width: 48mm; vertical-align: bottom; text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>From  </b> <img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/>
						<span style="font-weight:normal;padding-left:1mm"><xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/PeriodOfClaimFromDate"/>
						</xsl:call-template></span>
					</th>
					<th scope="col" style="width: 49mm;vertical-align: bottom; text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>To  </b> <img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/>
						<span style="font-weight:normal;padding-left:1mm"><xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$FormData/PeriodOfClaimToDate"/>
						</xsl:call-template></span>
					</th>
				</tr>
			</tbody>
		</table>
		</div>
		<!--  End Period of claim -->

		<!-- Begin Claimant's reg no. -->	
		<div style="width:187mm;">
		<table class="stylIRS8849S8TableBorderless" style="display:table-header-group;font-size: 7pt;text-align: left" cellspacing="0">
		<tbody>
		<tr>
          		<td style="width:7mm"><span style="width:1px"></span></td>
          		<td style="font-size: 8pt">
				<br />
				<b>Claimant's registration no.</b><span style="width:1px"/>
				<img src="{$ImagePath}/8849Sch8_Bullet.gif" alt="MediumBullet"/>
          			<span style="padding-left:5mm"></span>
          			<b>CC</b>
          		</td>
          		<td class="styUnderlineAmount" style="width: 45mm; padding-top: 4mm;text-align:left">
				<span style="padding-left:0mm; padding-right: 2mm"></span>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/RegNbrUV"/>
						</xsl:call-template>
			</td>
			<td>
			<span style="padding-left:5mm"></span><i>You must enter your registration number to make a</i><br/><span style="padding-left:5mm"></span><i>claim on Schedule 8.</i> 
			</td>
		</tr>
		</tbody>
		</table>
		</div>
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
		<div style="width:187mm; border-top: 1px solid black">
		<table cellspacing="0">
			<tbody>
				<tr style="font-size:8pt;height:8mm">
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-width:0">
						<span class="styTableCellPad" style="text-align: left">1</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-width:0">
						<b>Sales of Undyed Diesel Fuel</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-width:0"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-width:0"><span style="width: 1px"></span></th>
				</tr>
				<tr  style="font-size:7pt">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"></span></td>
					<td style="width:60mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"></span></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr  style="font-size:7pt;height:8mm">
					<td style="border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><span style="width:1px"></span></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/Rate"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="text-align: right;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/Amount"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedDieselFuel/UsedByStateLocalGov/CRN"/>
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
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-width:0">
						<span class="styTableCellPad" style="text-align: left">2</span>
					</th>
					<th scope="col" colspan="4" class="styTableCellHeader" style="width:172mm; text-align:left;border-width:0">
						<b>Sales of Undyed Kerosene (Other Than Kerosene For Use in Aviation)</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-width:0"><span style="width: 1px"></span></th>
					<th class="styTableCellHeader" style="width:40mm;border-width:0"><span style="width: 1px"></span></th>
					<th class="styTableCellHeader" style="width:55mm;border-width:0"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-width:0"><span style="width: 1px"></span></th>
				</tr>
				<tr  style="font-size:7pt">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"></span></td>
					<td style="width:60mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"></span></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="width:40mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="width:55mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr  style="font-size:7pt;height:8mm">
					<td style="border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width:1px"></span></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/Rate"/>
						</xsl:call-template>
					</td>
					<td style="width:40mm;border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="width:55mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/Amount"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/UsedByStateLocalGov/CRN"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<!-- End Table 2  -->
		
		<!--Begin Table 3-->
		<div style="width:187mm; border-top: 1px solid black">
		<table cellspacing="0">
			<tbody>
				<tr style="font-size:8pt;height:8mm">
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-width:0">
						<span class="styTableCellPad" style="text-align: left">3</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-width:0">
						<b>Sales of Kerosene for Use in Aviation</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-width:0"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-width:0"><span style="width: 1px"></span></th>
				</tr>
				<tr  style="font-size:7pt;vertical-align:top;padding-top:4px">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"></span></td>
					<td style="width:60mm; border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"></span></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr  style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>a</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government<br/>(kerosene taxed at $ .244)</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed244/Rate"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed244/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed244/Amount"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed244/CRN"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr  style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>b</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a state or local government<br/>(kerosene taxed at $ .219)<br/></td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed219/Rate"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed219/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed219/Amount"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/KeroseneSoldForUseInAviation/UsedByStateLocalGovTaxed219/CRN"/>
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
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-width:0">
						<span class="styTableCellPad" style="text-align: left">4</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-width:0">
						<b>Sales of Gasoline</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-width:0"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-width:0"><span style="width: 1px"></span></th>
				</tr>
				<tr  style="font-size:7pt;vertical-align:top;padding-top:4px">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"></span></td>
					<td style="width:60mm; border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"></span></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="width:15mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr  style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>a</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a nonprofit educational<br/>organization</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/Rate"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/Amount"/>
						</xsl:call-template>
					</td>
					<td rowspan="2" style="width:15mm;border-color: black;padding-bottom:6mm;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/Gasoline/UsedByNonprofitEducationalOrg/CRN"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr  style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:bottom;padding-top:4px"><b>b</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;vertical-align:bottom">Use by a state or local government</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/Gasoline/UseByStateLocalGov/Rate"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Gasoline/UseByStateLocalGov/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Gasoline/UseByStateLocalGov/Amount"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
					<span style="width:1px"></span>
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
					<th scope="col" class="styTableCellHeader" style="width:7mm;border-width:0">
						<span class="styTableCellPad" style="text-align: left">5</span>
					</th>
					<th scope="col" colspan="2" class="styTableCellHeader" style="width:83mm; text-align:left;border-width:0">
						<b>Sales of Aviation Gasoline</b>
					</th>
					<!--<th class="styTableCellHeader" style="width:23mm;border-width:0"><span style="width: 1px"></span></th>-->
					<th scope="col" class="styTableCellHeader" style="width:40mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:55mm;border-width:0"><span style="width: 1px"></span></th>
					<th scope="col" class="styTableCellHeader" style="width:15mm;border-width:0"><span style="width: 1px"></span></th>
				</tr>
				<tr  style="font-size:7pt;vertical-align:top;padding-top:4px">
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px"><span style="width: 1px"></span></td>
					<td style="width:60mm; border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px"><span style="width: 1px"></span></td>
					<td style="width:23mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(a) Rate</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(b) Gallons</b></td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px"><b>(c) Amount of refund</b>
					<br/><span style="font-size: 7p"><i>Multiply col. <b>(a)</b> by col. <b>(b)</b></i></span></td>
					<td style="width:15mm;border-color: black;text-align: center;border-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px"><b>(d)<br/>CRN</b></td>
				</tr>
				<tr  style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4px"><b>a</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Use by a nonprofit educational<br/>organization</td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: center">$
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/Rate"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px"><span style="padding-left:4px;float:left">$</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/Amount"/>
						</xsl:call-template>
					</td>
					<td rowspan="2" style="width:15mm;border-color: black;padding-bottom:6mm;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UsedByNonprofitEducationalOrg/CRN"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr  style="font-size:7pt;height:8mm;vertical-align:bottom;padding-bottom:4px">
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-right: 6px;vertical-align:top;padding-top:4mm"><b>b</b></td>
					<td style="width:60mm;border-color: black;text-align: left;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;vertical-align:bottom">Use by a state or local government<br/></td>
					<td style="width:23mm;border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;text-align: center">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UseStateLocalGov/Rate"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: right;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UseStateLocalGov/Gallons"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;text-align: right;padding-right:4px">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AviationGasoline/UseStateLocalGov/Amount"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black;text-align: center;border-style: solid; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
					<span style="width:1px"></span>
					</td>
				</tr>

			</tbody>
		</table>
		</div>
		<!--End Table 5-->
		
		
		<!-- Begin Footer -->
		<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
			<div style="clear:both;padding-top:4px">
				<div style="width:114mm;font-weight:bold;" class="styGenericDiv">For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.</div>
				<div style="width:23mm;padding-left:2mm;font-size:6pt;padding-top:2px;" class="styGenericDiv">Cat. No. 47991M</div>
				<div style="float:right;width:48mm;" class="styGenericDiv"><span class="styBoldText">Schedule 8 (Form 8849)</span> (10-2006)</div>
			</div>     
		</div>     
		<p class="pageEnd" style="display:block;"></p>
	
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
        			<xsl:with-param name="TargetNode" select="$FormData" />
        			<xsl:with-param name="DescWidth" select="100"/>
      			</xsl:call-template>
    		</table>  

				
		</form>    		
   	</body>
	</html>
  </xsl:template>
</xsl:stylesheet>
