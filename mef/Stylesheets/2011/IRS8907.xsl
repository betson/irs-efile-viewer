<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8907Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8907"/>
	<xsl:template match="/">
		<html>
		<!-- Updated 10/14/2010 (RLW) -->
			<head>
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
				<meta name="Author" content="Lisa Lane -Lisa.T.Lane@irs.gov"/>
				<meta name="Description" content="Form IRS 8907"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				 <!-- Remove This-->
				  <!--Print statement -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8907Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8907">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 20mm;">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm;">
     					 Form <span class="styFormNumber">8907</span>
						 <br/>
					     <span>
					     <!-- General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</span>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="height: 22mm;width:125mm;padding-top:4mm;">
							<div class="styMainTitle" style="height: 8mm">Nonconventional Source Fuel Credit</div>
							<div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;"><br/>
							<img src="{$ImagePath}/8907_Bullet.gif" alt="MediumBullet"/>  
        							Attach to your tax return. 
								<!--<br/>
								<img src="{$ImagePath}/8907_Bullet.gif" alt="MediumBullet"/>  
        							See Instructions.
        							<br/>-->
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-2008</div>
							<div class="styTaxYear" style="height:10mm">20<span class="styTYColor">11</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No.<span style="font-weight:bold;font-size:7.95pt;">146</span>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
     							 Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="padding-left:2mm;font-size:7pt;">
							<span class="BoldText">Identifying number</span>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- Line A   -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:15mm;padding-top:12mm;">1</div>
						<div class="styLNDesc" style="width:84mm;height:15mm;padding-top:12mm;">
						Date the facility was placed in service
<span style="font-weight:normal; border-style: solid; border-color: black;width:27mm;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/DateFacilityPlacedInService"/>
								</xsl:call-template>
							</span>
							<span style="width:5mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/DateFacilityPlacedInService"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="width:47mm;border-right-width:0px;height:16.1mm;">
							<div class="styLNLeftNumBox" style="width:47mm;font-weight:bold;">(a)</div>
							<div class="styLNDesc" style="font-weight:normal;width:47mm;">Qualified coke and coke gas sold after 12/31/2010 and before 1/1/2012</div>
						</div>
						<div class="styLNRightNumBox" style="width:47mm;border-right-width:0px;height:16.1mm;">
							<div class="styLNLeftNumBox" style="width:47mm;font-weight:bold;">(b)</div>
							<div class="styLNDesc" style="font-weight:normal;width:47mm;">Qualified coke and 
				                 coke gas sold after 12/31/2011</div>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styGenericDiv" style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:3mm;">2</div>
					<div class="styLNDesc" style="width:84mm;height:5mm;padding-top:3mm;">
					<span style="float:left;">Barrel-of-oil equivalents</span>
                    <!-- Dotted Line -->
                    <span  class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
					</div>
				<div class="styLNRightNumBox" style="width:47.3mm;font-weight:normal;border-right-width:0px;height:8mm;padding-top:4mm;text-align:right;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYQlfyCokeAndCokeGasSoldType1"/>
							</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="width:47mm;font-weight:normal;border-right-width:0px;height:8mm;padding-top:4mm;text-align:right;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/NYQlfyCokeAndCokeGasSoldType1"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
				<div class="styGenericDiv" style="width:187mm;">
				<div class="styLNLeftNumBoxSD" style="height:5mm;">3</div>
                <div class="styLNDesc" style="width:84mm;height:5mm;">
                Enter the product of $3 multiplied by the inflation adjustment<span style="float:left;"> factor (see  instructions)</span> 
                 <!-- Dotted Line -->
                <span  class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
				</div>
				<div class="styLNRightNumBox" style="width:47.3mm;font-weight:normal;border-right-width:0px;height:8mm;padding-top:4mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYQlfyCokeAndCokeGasSoldType2"/>
							</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="width:47mm;font-weight:normal;border-right-width:0px;height:8mm;padding-top:4mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NYQlfyCokeAndCokeGasSoldType2"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styGenericDiv" style="width:187mm;">
					<div class="styLNLeftNumBoxSD" style="height:5mm; padding-top:4mm;">4</div>
					<div class="styLNDesc" style="width:84mm;height:5mm; padding-top:4mm;">
					<span style="float:left;">Multiply line 2 by line 3</span>  
                    <!-- Dotted Line -->
                    <span  class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
					</div>
				<div class="styLNRightNumBox" style="width:47.3mm;font-weight:normal;border-right-width:0px;height:8mm;padding-top:4mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYQlfyCokeAndCokeGasSoldType3"/>
							</xsl:call-template>
						</div>
				<div class="styLNRightNumBox" style="width:47mm;font-weight:normal;border-right-width:0px;height:8mm;padding-top:4mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NYQlfyCokeAndCokeGasSoldType3"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line A  -->
					<!--  Line 5 -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" >5</div>
							<div class="styLNDesc" style="width:139mm;">
    							<span style="float:left;">Add columns (a) and (b) on line 4 </span>
    							<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" >5</div>
							<div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalFuelsSold"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 5 -->
					<!--  Line 6 -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:3mm;">6a</div>
							<div class="styLNDesc" style="width:99mm;">
					    		Reduction due to government monies and subsidized financing. Enter
					         	the total of government grants, proceeds of tax-exempt government
					          	obligations, and subsidized energy financing for the project for this and
          						all <span style="float:left;">prior tax years</span> 
          					  <!-- Dotted Line -->
                              <span  class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:14.5mm;padding-top:10mm;">6a</div>
							<div class="styLNAmountBox" style="height:14.5mm;padding-top:10mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ReductionDueToGovernment"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCellBox" style="height:14.5mm;"/>
							<div class="styShadingCell" style="height:14.5mm;background-color:white;"/>
						</div>
					</div>
					<!--  Line 6a -->
					<!--  Line 6b -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:99mm; ">
           						Enter the total of additions to the capital account for the project for this
           						<span style="float:left;">and all prior tax years</span>
           					    <!-- Dotted Line -->
                                <span  class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">6b</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionsCapitalAccount"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCellBox" style="height:8mm;"/>
							<div class="styShadingCell" style="height:8mm;background-color:white;"/>
						</div>
					</div>
					<!--  Line 6b -->
					<!--  Line 6c -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:99mm; ">
           						<span style="float:left;">Divide line 6a by line 6b.  Show as a decimal to at least 4 places</span>
           						<!-- Dotted Line -->
                                <span  class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">6c</div>
							<div class="styLNAmountBox" style="height:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DivideLine6aByLine6b"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCellBox" style="height:4.5mm;"/>
							<div class="styShadingCell" style="height:4.5mm;background-color:white;"/>
						</div>
					</div>
					<!--  Line 6c -->
					<!--  Line 6d -->
					<div style="width: 187mm">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
							<div class="styLNDesc" style="width:139mm;">
	   						<span style="float:left;">Multiply line 5 by line 6c</span>    
	   					    <!-- Dotted Line -->
                            <span  class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">6d</div>
							<div class="styLNAmountBox" style="height:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MultiplyLine5ByLine6c"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 6d -->
					<!--  Line 7 -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:3mm;">7</div>
							<div class="styLNDesc" style="width:139mm;">
     							<span style="float:left;">Subtract line 6d from line 5 </span>   
     								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">7</div>
							<div class="styLNAmountBox" style="height:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SubtractLine6dFromLine5"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 7 -->
					<!--  Line 8a  -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:3mm;">8a</div>
							<div class="styLNDesc" style="width:99mm;">
							Reduction due to energy credit. Enter the total amount allowed under
							section 38 for this and all prior tax years by reason of the energy
							<span style="float:left;">percentage with respect to the property used in the project </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">8a</div>
							<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ReductionDueToEnergyCredit"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCellBox" style="height:11mm;"/>
							<div class="styShadingCell" style="height:11mm;background-color:white;"/>
						</div>
					</div>
					<!--  Line 8a End  -->
					<!--  Line 8b -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:99mm;">
         						Enter the total amount recaptured with respect to the amount entered
         						on line 8a under section 49(b) or 50(a) for this and any prior tax year,
        						and <span style="float:left;">under section 38 for any prior tax year </span> 
        							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:9mm;padding-top:7mm;">8b</div>
							<div class="styLNAmountBox" style="height:9mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAmountRecaptured"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCellBox" style="height:11mm;"/>
							<div class="styShadingCell" style="height:11mm;background-color:white;"/>
						</div>
					</div>
					<!--  Line 8b End -->
					<!--  Line 8c -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:139mm;">
							<!--Subtract line 8b from line 8a. If zero or less, enter amount from line 7 on line 9 and go to line 10a-->
							<span style="float:left;">Subtract line 8b from line 8a. If zero or less, enter -0-</span>
							<!-- Dotted Line -->
                            <span  class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">8c</div>
							<div class="styLNAmountBox" style="height:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SubtractLine8bFromLine8a"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  End Line 8c -->
					<!--  Line 9 -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styLNDesc" style="width:139mm;">
    							<span style="float:left;">Subtract line 8c from line 7 </span>
    								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">9</div>
							<div class="styLNAmountBox" style="height:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SubtractLine8cFromLine7"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 9 -->
					<!--  Line 10a -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">10a</div>
							<div class="styLNDesc" style="width:99mm;">
          						 Reduction due to enhanced oil recovery credit (Form 8830). Enter the
          						 total amount allowed for this and all prior tax years by reason of any
          						enhanced <span style="float:left;">oil recovery credit with respect to such project </span> 
          							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">10a</div>
							<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ReductionEnhanceOilRecoveryCr"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCellBox" style="height:11mm;"/>
							<div class="styShadingCell" style="height:11mm;background-color:white;"/>
						</div>
					</div>
					<!-- End Line 10a -->
					<!-- Line 10b -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
							<div class="styLNDesc" style="width:99mm;">
           						Enter the total amount of enhanced oil recovery credit recapture with
           						<span style="float:left;">respect to the amount on line 10a for any prior tax year </span>
           							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:4mm;">10b</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotAmountEnhancedOilRecoveryCr"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCellBox" style="height:8mm;"/>
							<div class="styShadingCell" style="height:8mm;background-color:white;"/>
						</div>
					</div>
					<!-- End 10b -->
					<!--  Line 10c-->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
							<div class="styLNDesc" style="width:139mm;">
          				    <!--Subtract line 10b from line 10a. If zero or less, enter the amount from line 9 on line 11 and go to line 12--> 
          				    <!--Dotted Line-->
          					<span style="float:left;">Subtract line 10b from line 10a. If zero or less, enter -0-</span>
          					<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
           					</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">10c</div>
							<div class="styLNAmountBox" style="height:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SubtractLine10bFromLine10a"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 10c -->
					<!--  Line 11 -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">11</div>
							<div class="styLNDesc" style="width:139mm;">
      							<span style="float:left;">Subtract line 10c from line 9  </span>
      								<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">11</div>
							<div class="styLNAmountBox" style="height:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SubtractLine10cFromLine9"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 11 -->
					<!--  Line 12  -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styIRS8907LNLeftNumBox" style="padding-top:1mm;">12</div>
							<div class="styLNDesc" style="width:139mm;">
    							<span style="float:left;">Nonconventional source fuel credit from partnerships, S corporations, estates, and trusts </span>
    								<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:5mm;">12</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NonconventionalSourceFuelCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 12  -->
					<!--  Line 13 -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">13</div>
							<div class="styLNDesc" style="width:139mm;">
       						Add lines 11 and 12. Estates and trusts, go to line 14. Partnerships and S corporations, report this<br/>
          						 <span style="float:left;">amount on Schedule K. All others, report this amount on Form 3800, line 1o </span>
          						 	<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">13</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AddLines11And12"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 13 -->
					<!--  Line 14 -->
					<div style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Amount allocated to beneficiaries of the estate or trust (see instructions) </span>
     	 							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:2mm;">14</div>
							<div class="styLNAmountBox" style="height:2mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AmountAllocatedToBeneficiaries"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 14 -->
					<!--  Line 15 -->
					<div class="StyTBB" style="width: 187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDesc">
     	 						<span style="float:left;">Estates and trusts, subtract line 14 from line 13. Report this amount on Form 3800, line 1o </span>
     	 							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:2mm;">15</div>
							<div class="styLNAmountBoxNBB" style="height:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 16 -->
					<!--  FOOTER-->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:122px;"/>                      
          Cat. No. 37716X
          <span style="width:125px;"/>  
          Form <span class="styBoldText">8907</span> (2011)
        </div>
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4a - Phase out adjustments - CY
                  qualified coke and coke gas sold type
                  </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CYQlfyCokeAndCokeGasSoldType4"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4C - Phase out adjustments - Next year qualified coke and coke gas sold type</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NYQlfyCokeAndCokeGasSoldType4"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
