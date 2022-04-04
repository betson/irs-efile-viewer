<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 07/02/2020 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2106Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form2106Data" select="$RtnDoc/IRS2106"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2106Data)"/>
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
				<meta name="Description" content="IRS Form 2106"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2106Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				   <xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="padding-top: 3mm;">
				<form name="Form2106">
				    <div style="width: 187mm; height: 5mm; clear: all; float: left;">
					<xsl:call-template name="DocumentHeader"/>
					</div>
					<!--Begin Form 2106 Header TITLE-->
					<div class="styBB" style="width: 187mm; height: 26mm; padding-bottom: 0mm; clear: all; float: left;border-bottom-width:2px;">
						<div class="styFNBox" style="width: 31mm; height: 26mm; padding-top: 0.5mm;border-right-width:2px;">
							<div style="width: 31mm; height: 8mm; padding-top: 1mm; font-size: 8pt;">
								Form<span style="width:0.5mm;"></span><span class="styFormNumber">  2106</span>
							</div>
							<div style="width: 31mm; height: 14mm; padding: 10mm 0mm 0mm 0mm; font-size: 8pt;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
								<span style="width:1px"/>
								<span class="styAgency">(99)</span>							
							</div>
						</div>
						<div class="styFTBox" style="width: 125mm; height: 26mm;">
							<div class="styMainTitle" style="width: 125mm; height: 1.5mm; padding-top: .5mm;">
							   Employee Business Expenses
						    </div>
							<div class="styFBT" style="width: 125mm; height: 2mm; font-size: 6.5pt; margin-top: 6mm;">
								<img src="{$ImagePath}/2106_Bullet.gif" alt="Bullet"/> Attach to Form 1040 or Form 1040NR.
							 </div>
							 <div class="styFBT" style="width: 125mm; height: 2mm; font-size: 6.5pt; margin-top: 3mm;">
								<img src="{$ImagePath}/2106_Bullet.gif" alt="Bullet"/> For use only by Armed Forces reservists, 
									qualified performing artists, fee-basis state or local <br/>government officials, and employees with 
									impairment-related work expenses.
							 </div>
							 <div class="styFBT" style="width: 125mm; height: 8mm; padding-top: 0mm; font-size: 6.5pt; margin-top: 6mm;">
								<img src="{$ImagePath}/2106_Bullet.gif" alt="Bullet"/> Go to <i> www.irs.gov/Form2106</i> for instructions 
									and the latest information.
							 </div>
						</div>
						<div class="styTYBox" style="width: 30mm; height: 26mm;border-left-width:2px;">
							<div class="styOMB" style="width: 30mm; height: 8mm; font-size: 7pt;">
							     OMB No. 1545-0074
						    </div>
							<div class="styTY">
							     20<span class="styTYColor">18</span>
							</div>
							<div style="text-align: left; padding-bottom: 0.5mm; font-size: 7pt; margin-left: 3mm;">
							     Attachment<br/>
							     Sequence No. <span class="styBoldText" style="font-size:9pt;">129</span>
							</div>
						</div>
					</div>
					<!-- END Form 2106 Header TITLE-->
					<!-- BEGIN Occupation TITLE -->
					<div class="styBB" style="width: 187mm; height: 7mm; clear: all; float: left;">
						<div class="styNameBox" style="width: 90mm; height:7mm; padding-top: 0mm; padding-bottom: 0mm; font-size: 9px; font-weight: normal;">
						Your name
							<!--Input Name per schema-->  						
                            <br/>		
								 <!-- Name from Form level -->
                                <xsl:choose>
									<xsl:when test="normalize-space($Form2106Data/PersonNm)!=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form2106Data/PersonNm"/>
										</xsl:call-template>		
							    	</xsl:when>
									<xsl:otherwise>	
								<!-- Name from 1040 Return Header--> 						
									<xsl:call-template name="PopulateReturnHeaderFiler">
										 <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
									</xsl:call-template>		
									</xsl:otherwise>
								</xsl:choose>	                                                                                           
						</div>
						<div class="styIRS2106LnDescOcc" style="width: 60mm; height: 7mm; padding-top: 0mm; padding-bottom: 0mm;">
					    Occupation in which you incurred expenses
					    <br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2106Data/OccupationTxt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106SSNBox" style="width: 37mm; height: 7mm; font-weight: bold;">
					    Social security number
						<br/>
								<xsl:choose>
									<xsl:when test="normalize-space($Form2106Data/SSN)!=''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form2106Data/SSN"/>
										</xsl:call-template>	
								    </xsl:when>
						           <xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>							   										
									</xsl:otherwise>
								</xsl:choose>
						</div>
					</div>
					<!-- END Occupation TITLE -->
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="padding: 1mm 0mm; width: 187mm; height: 7.5mm; clear: all; clear: all; float: left;border-top-width:0mm;">
						<div class="styPartName" style="height: 5mm; width: 14mm; font-size: 9pt;">
					  Part I
					</div>
						<div class="styPartDesc" style="height: 5mm; font-size:9pt; padding-bottom:2mm; padding-left:3mm; float:left; clear:none;">
                       Employee Business Expenses and Reimbursements
                    </div>
					</div>
					<!-- END PART I TITLE -->
					<!-- BEGIN STEP I TITLE -->
					<div class="styBB" style="width: 187mm; height: 15mm; clear: all; float: left;">
						<div class="styPartDesc" style="width:111mm; height: 15mm; font-size:9pt; padding-left:0mm; padding-bottom:4.6mm; padding-top:5mm; border-right-width:0px; border-left-width:0px; border-top-width:0px; border-bottom-width:0px; text-align:left; clear:none;">
    	               Step 1  <span style="width:3mm;"/>Enter Your Expenses
    	            </div>
						<!-- END STEP I TITLE -->
						<!-- BEGIN Column A HEADER -->
						<div class="styPartDesc" style="width:38mm; height: 15mm; font-size:9pt; padding-top:1mm; padding-right:4mm; border-style:solid;border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:0px; border-color:black; float:left; clear:none;">
							<div style="width: 34mm; height:5.5mm; font-weight:bold;text-align:center;">
						   Column A
						</div>
							<div style="width: 34mm; height:7.5mm; text-align:center;font-size:8.5pt;font-weight:normal;">
						   Other Than Meals
						</div>
						</div>
						<!-- END Column A HEADER-->
						<!-- BEGIN Column B  HEADER-->
						<div class="styPartDesc" style="width: 38mm; height: 15mm; padding-top: 1mm; padding-left: 3mm; clear: none; float: left;">
							<div style="height: 5.5mm; width: 38mm; text-align: center; font-size: 9pt; font-weight: bold;">
							   Column B
							</div>
							<div style="width: 38mm; height:7.5mm; text-align: center; font-size: 8.5pt; font-weight: normal;">
							   Meals
							</div>
						</div>
					</div>
					<!-- END Column B HEADER -->
					<!-- BEGIN Step 1.1 -->
					<div style="width:187mm; height: 14mm; font-size:8pt; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:6mm;">
					   1
					</div>
						<div class="styLNDesc" style="width:103mm;height:4.5mm;padding-top:6mm;">
						   Vehicle expense from line 22 or line 29.  (Rural mail carriers:  See instructions.)
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm; width:6mm; padding-top:9.5mm; text-align:center; border-style:solid;   border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:1px; border-color:black;">
						    1
						</div>
						<div class="styIRS2106ColBox" style="height:14mm; border-left:0px; padding-top:10mm; padding-right: 0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="height:14mm; width:5.2mm; border-bottom-width:0px; border-left-width:0px;"/>
						<div class="styIRS2106ColBoxGrey" style="height:14mm; width: 32.5mm; border-left-width:0px;border-right:0px; border-bottom:0px;"/>
					</div>
					<!-- END Step 1.1 -->
					<!-- BEGIN Step 1.2 -->
					<div style="width:187mm; font-size:8pt; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;">
					   2
					</div>
						<div class="styLNDesc" style="width:103mm;height:2mm;font-size:7.1pt;padding-top:1mm;">
					        Parking fees, tolls, and transportation, including train, bus, etc., that <br/>
							<span style="font-weight:bold;">didn't</span> involve overnight travel or commuting to and from work
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:8.5mm;width:6mm;padding-top:4.3mm;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
					    2
					</div>
						<div class="styIRS2106ColBox" style="height:8.5mm;;padding-top:4.5mm; padding-right: 0.5mm;border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/ParkingFeesTollsLocalTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="height:8.5mm;width:5.2mm;border-bottom-width:0px;border-left-width:0px;"/>
						<div class="styIRS2106ColBoxGrey" style="height:8.5mm; width: 32.5mm; border-left-width:0px;border-right-width:0px;   border-bottom-width:0px;background-color: lightgrey;"/>
					</div>
					<!-- END Step 1.2 -->
					<!-- BEGIN Step 1.3 -->
					<div style="width:187mm; font-size:8pt; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;">3</div>
						<div class="styLNDesc" style="width:103mm;height:2mm;padding-top:1mm;">
							Travel expense while away from home overnight, including lodging, airplane, car rental, etc. 
							<span style="font-weight:bold;">Don't</span> include meals
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
					    </div>
						<div class="styLNRightNumBox" style="height:8.5mm;width:6mm;padding-top:4.5mm;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">
						3
					</div>
						<div class="styIRS2106ColBox" style="height:8.5mm;padding-top:4.5mm;border-left-width:0px; padding-right: 0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/TravExpnsLessMealsEntrmtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="height:8.5mm;width:5.2mm;border-bottom-width:0px;border-left-width:0px;"/>
						<div class="styIRS2106ColBoxGrey" style="height:8.5mm; width: 32.5mm;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;"/>
					</div>
					<!-- END Step 1.3 -->
					<!-- BEGIN Step 1.4 -->
					<div style="width:187mm; font-size:8pt; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;">4</div>
						<div class="styLNDesc" style="width:103mm;height:2mm;padding-top:1mm;">
							Business expenses not included on lines 1 through 3.
							<span style="font-weight:bold;">Don't</span> include meals
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8.5mm;width:6mm;padding-top:4.5mm;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">4</div>
						<div class="styIRS2106ColBox" style="height:8.5mm;;padding-top:4.5mm;border-left-width:0px; padding-right: 0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/BusExpnssLessMealsEntrmtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="height:8.5mm;width:5.2mm;border-left-width:0px;"/>
						<div class="styIRS2106ColBoxGrey" style="height:8.5mm; width: 32.5mm; border-left-width:0px;border-right-width:0px;"/>
					</div>
					<!-- END Step 1.4 -->
					<!-- BEGIN of Step 1.5 -->
					<div style="width:187mm; font-size:8pt; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:5mm;">
						     5
					    </div>
						<div class="styLNDesc" style="width:103mm;height:2mm;padding-top:5mm;">
						    Meals expenses (see instructions)
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;width:6mm;padding-top:4.8mm;text-align:center;border-style:solid; border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:1px; border-color:black;">
						5
					</div>
						<div class="styIRS2106ColBoxGrey" style="height:9mm;border-left-width:0px;border-right-width:1px;padding-top:0px;"/>
						<div class="styIRS2106ColBoxGrey" style="height:9mm; width:5.2mm; border-bottom-width:1px; border-left-width:0px; border-top-width:0px;"/>
						<div class="styIRS2106ColBox" style="height:9mm; padding-top:5.5mm;border-left-width:0px;border-right-width:0px; border-bottom-width:1px;border-top-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/MealsAndEntertainmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END STEP 1.5 -->
					<!-- BEGIN STEP 1.6 -->
					<div style="width:187mm; font-size:8pt; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;">
							6
						</div>
						<div class="styLNDesc" style="width:103mm;height:2mm;padding-top:1mm;">
							<span style="font-weight:bold;">Total expenses.</span> In Column A, add lines 1 through 4 and enter the result. In Column B, enter the amount from line 5 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8.5mm; width:6mm; padding-top:4.3mm; text-align:center; border-style:solid; border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:1px; border-color:black;">
							6
						</div>
						<div class="styIRS2106ColBox" style="height:8.5mm;;padding-top:4.5mm; padding-right: 0.5mm; border-left-width:0px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/TotExpnssLessMealsEntrmtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="height:8.5mm;width:5.2mm;border-bottom-width:1px;border-left-width:0px;"/>
						<div class="styIRS2106ColBox" style="height:8.5mm; padding-top:4.5mm; border-left-width:0px; border-right-width:0px; border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/TotalMealsAndEntrmtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Step 1.6 -->
					<!-- BEGIN Step 1 Note -->
					<div class="styBB" style="width:187mm; font-size:8.5pt; clear: all; float: left;">
						<div class="styLNDesc" style="width:187mm; height:2mm; font-size:8pt; padding-left:8mm; padding-top:5mm; padding-bottom:4mm;">
							<b>Note: </b>
							If you were not reimbursed for any expenses in Step 1, skip line 7 and enter the amount from line 6 on line 8.
						</div>
					</div>
					<!-- END Step 1 Note -->
					<!-- BEGIN STEP 2 TITLE -->
					<div class="styBB" style="width:187mm; font-size:8pt; clear: all; float: left;border-top-width:0mm;">
						<div class="styPartDesc" style="font-size:9pt; padding-left:0mm; padding-bottom:5mm; padding-top:1mm; border-right-width:0px; border-left-width:0px; border-top-width:0px; border-bottom-width:0px; text-align:left; clear:none;">
						Step 2  <span style="width:3mm"/>Enter Reimbursements Received From Your Employer for Expenses Listed in Step 1
					</div>
					</div>
					<!-- END STEP 2 TITLE -->
					<!-- BEGIN Step 2. 7 -->
					<div class="styBB" style="width:187mm; font-size:8pt; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;">
						     7
					    </div>
						<div class="styLNDesc" style="width:103mm;height:2mm;padding-top:1mm;">
						Enter reimbursements received from your employer that <span style="font-weight:bold;">weren't</span> reported to you in box 1 of Form W-2.  Include any reimbursements reported under<span style="width:2mm"/>code <span style="width:2mm"/> "L" <span style="width:2mm"/> in<span style="width:2mm"/>box<span style="width:2mm"/>12<span style="width:2mm"/> of<span style="width:2mm"/>your<span style="width:2mm"/>Form<span style="width:2mm"/> W-2 (see instructions)
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:16mm;width:6mm;padding-top:12.5mm;text-align:center;border-style:solid;   border-right-width:1px; border-left-width:1px; border-top-width:0px; border-bottom-width:0px; border-color:black;">
						7
					</div>
						<div class="styIRS2106ColBox" style="height:16mm;padding-right: 0.5mm; padding-top:12.5mm;border-left-width:0px;border-bottom-width:0px;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/OtherReimbNotRptOnW2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="height:16mm;width:5.5mm;border-bottom-width:0px;border-left-width:0px;"/>
						<div class="styIRS2106ColBox" style="height:16mm;padding-top:12.5mm;mm;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/MealsEntrmtReimbNotRptW2Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END STEP 2.7 -->
					<!-- BEGIN STEP 3 TITLE -->
					<div class="styBB" style="width:187mm; font-size:8pt; clear: all; float: left;border-top-width:0mm;">
						<div class="styPartDesc" style="font-size:9pt;padding-left:0mm;padding-bottom:5mm;padding-top:1mm; border-right- width:0px; border-left-width:0px; border-top-width:0px; border-bottom-width:0px; text-align:left;clear:none;">
						Step 3  <span style="width:3mm"/>Figure Expenses To Deduct 
					</div>
					</div>
					<!-- END STEP 3 TITLE -->
					<!-- BEGIN Step 3.8 -->
					<div style="width: 187mm; height: 11mm; clear: all; font-size: 8pt; float: left;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
						     8
					    </div>
						<div class="styLNDesc" style="width: 103mm; height:4.5mm; ">
						Subtract<span style="width:1mm"/> line<span style="width:1mm"/> 7<span style="width:1mm"/> from<span style="width:1mm"/> line<span style="width:1mm"/> 6.  If zero or less, enter -0-.  However, <br/> if line 7 is greater than line 6 in Column A, report the excess as<br/>income on Form 1040, line 1 (or on Form 1040NR, line 8) 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 6mm; text-align: center; padding-top: 7.2mm; height: 11mm; width: 6mm;">
						     8
					    </div>
						<div class="styIRS2106ColBox" style="padding-top: 7.4mm; height: 11mm; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 0px; padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/UnreimbursedBusinessExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="height 12mm; width: 5.2mm; padding-top: 9.8mm; border-bottom-width: 1px; border-left-width: 0px;"/>
						<div class="styIRS2106ColBox" style="padding-top: 7.4mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; height: 11mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/UnreimbursedMealsExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Step 3.8 -->
					<!-- BEGIN Step 3.9 -->
					<div style="width: 187mm; height: 12mm; clear: all; font-size: 8pt; float: left;">
						<div class="styLNDesc" style="width: 111mm; height: 14mm; padding-top: 2mm; padding-left: 8mm;">
							<b>Note:</b> If <span style="font-weight:bold;"> both columns </span> of line 8  are zero, you cannot deduct<br/>employee business expenses. Stop here and attach Form 2106 to<br/>your return.
					</div>
						<div class="styIRS2106ColBoxGrey" style="border-width: 0px 1px; border-style: solid; border-color: black; width: 6mm; padding-top: 3mm; background-color: lightgrey;"/>
						<div class="styIRS2106ColBox" style="border-right-width: 1px; border-bottom-width: 0px; border-left-width: 0px;"/>
						<div class="styIRS2106ColBoxGrey" style="width: 5.2mm; padding-top: 3mm; border-bottom-width: 0px; border-left-width: 0px;"/>
						<div class="styIRS2106ColBox" style="padding-top: 3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
					</div>
					<div style="width: 187mm; height: 20mm; clear: all; font-size: 8pt; float: left;">
						<div class="styLNLeftNumBox" style="width: 8mm; height: 20mm; padding-top: 2mm;">9</div>
						<div class="styLNDesc" style="width: 103mm; height: 20mm; padding-top: 2mm;">
					In Column A, enter the amount from line 8.  In Column B, multiply<br/>line <span style="width:1mm"/>8 <span style="width:1mm"/>by<span style="width:1mm"/>50%<span style="width:1mm"/>(0.50). <span style="width:1mm"/> (Employees <span style="width:1mm"/>subject<span style="width:1mm"/>to <span style="width:1mm"/>Department <span style="width:1mm"/>of Transportation<span style="width:1mm"/>  (DOT)<span style="width:1mm"/>  hours <span style="width:1mm"/> of<span style="width:1mm"/>service<span style="width:1mm"/>  limits:<span style="width:1mm"/> Multiply meal expenses incurred while away from home on business by 80% (0.80) instead of 50%.  For details, see instructions.) 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styIRS2106ColBoxGrey" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 6mm; text-align: center; padding-top: 16.1mm; height: 20mm;">
							<span style="width: 5.5mm; height: 3.5mm; font-weight: bold; background-color: white;">
							9
						</span>
						</div>
						<div class="styIRS2106ColBox" style="padding-top: 16.5mm; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 0px; height: 20mm; padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/AllowableBusinessDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS2106ColBoxGrey" style="width: 5.2mm; padding-top: 16.5mm; border-bottom-width: 1px; border-left-width: 0px; height: 20mm;"/>
						<div class="styIRS2106ColBox" style="padding-top: 16.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; height: 20mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/AllowableMealsDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Step 3.9 -->
					<!-- BEGIN Step 3.10 -->
					<div class="styBB" style="width: 187mm; height: 11mm; clear: all; float: left;">
						<div class="styLNLeftNumBox" style="height: 11mm; padding-top: 1mm; font-size: 8pt;">
						10
					</div>
						<div class="styLNDesc" style="width: 140.8mm; height: 11mm; padding-top: 1mm; font-size: 7.5pt;">
						 Add the amounts on line 9 of both columns and enter the total here. Also, enter the total on Schedule 1<br/>
						 (Form 1040), line 24 (or Form 1040NR, line 34). Employees with impairment-related work  expenses,<br/>
						 see the instructions for rules on where to enter the total on your return.
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........
							<!--Arrow Image-->
							<img src="{$ImagePath}/2106_Bullet.gif" alt="Bullet"/></span>
						</div>
						<div class="styLNRightNumBox" style="border-width: 0px 1px; border-style: solid; border-color: black; width: 5.5mm; text-align: center; padding-top: 7mm; height: 11mm;">
						10
					</div>
						<div class="styIRS2106ColBox" style="padding-top: 7mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; height: 11mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/UnreimEmployeeBusExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Step 3.10 -->
					<!-- BEGIN Page 1 Footer -->
					<div class="styStdDiv pageEnd" style="border-top:0.3mm solid black;">
						<div style="width:110mm;font-weight:bold;float:left;clear:none;">
						     For Paperwork Reduction Act Notice, see your tax return instructions.
					    </div>
						<div style="width:25mm;float:left;clear:none;">
						     Cat. No. 11700N
					    </div>
						<div style="width:45mm;text-align:right;font-size:8px;float:right;clear:none;">
						     Form <span class="styBoldText" style="font-size:8pt;">2106  </span>	(2018)
					    </div>
					</div>
					<!-- END Page 1 Footer -->
		           <!--<div class="pageEnd" style="width:187mm; clear: all; float: left;page-break-before: always;"/>-->
					<p style="page-break-before: always"/>
					<!-- **START OF PAGE 2** -->
					<div class="styBB" style="width: 187mm; height:4.5mm; font-size: 7pt; border-bottom:2px solid black;">
						<div class="styLNDesc" style="width:90mm;padding-top:0.5mm;float:left;">
						     Form 2106 (2018)
					    </div>
					    <div class="styLNDesc" style="width:90mm;text-align:right;float:right;clear:none;padding-top:0.1mm;">
						     Page <span style="font-size:8pt;font-weight:bold;">2 </span>
						</div>
					</div>
					<!-- BEGIN PART II TITLE -->
					<div class="styNBB" style="width:187mm; padding-bottom:0mm; clear: all; float: left;border-top-width:.3mm;">
						<div class="styPartName" style="height:4mm;font-size:9pt;">
						     Part II
					   </div>
						<div class="styPartDesc" style="font-size:9.5pt;padding-left:3mm;float:left;clear:none;">
						     Vehicle Expenses
					   </div>
					</div>
					<!-- END PART II TITLE -->
					<!-- BEGIN PART II SECTION A TITLE -->
					<xsl:if test="($Print != $Separated) or (count($Form2106Data/VehicleExpensesGrp) &gt;0)">
					<xsl:for-each select="$Form2106Data/VehicleExpensesGrp">
						<xsl:variable name="pos" select="position()"/>
						<xsl:if test="(position() mod 2)=1">
							<div class="styIRS2106TableContainer" style="clear: all; float: left;" id="Spcctn">
								<xsl:call-template name="SetInitialState"/>
								<th scope="col" style="width:187mm;">
									<div class="styIRS2106TB" style="height:7.8mm; width:122.5mm; font-size:8.5pt; padding-left:0mm; border-bottom-width:1px;">
										<span class="styBoldText">Section A-General Information</span> (You must complete this section if you<br/>are claiming vehicle expenses.)
					        </div>
									<!-- END PART II SECTION A TITLE -->
									<!-- BEGIN PART II - SECTION A - Vehicle 1 TITLE  -->
									<div class="styPartDesc" style="height:7.8mm;width:32.5mm;padding-left:2mm;padding-right:2mm;padding-top:1.5mm;:padding-bottom:2mm;text-align:center;border-style:solid;border-left-width:1px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;border-color:black;float:left;clear:none;">
						(<xsl:number value="($pos)" format="a"/>) <span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/>
										</span>
									</div>
									<!-- END PART II - SECTION A - Vehicle 1 TITLE -->
									<!-- BEGIN PART II - SECTION A - Vehicle 2 TITLE -->
									<div class="styPartDesc" style="height:7.8mm;width:31.5mm;padding-left:2mm;padding-right:2mm;padding-top:1.5mm;:padding-bottom:2mm;text-align:center;border-style:solid;border-left-width:1px;border-right-width:0px;border-top-width:1px;border-bottom-width:1px;border-color:black;float:left;clear:none;">
						(<xsl:number value="($pos+1)" format="a"/>) <span style="font-weight:normal;">Vehicle <xsl:number value="($pos+1)" format="1"/>
										</span>
									</div>
								</th>
							</div>
							<!-- END PART II - SECTION A - Vehicle 2 TITLE-->
							<!-- BEGIN PART II - SECTION A.11 Data -->
							<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
								<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">11</div>
								<div class="styLNDesc" style="width: 107.5mm; padding-top: 1.5mm; height: 5mm;">
						            Enter the date the vehicle was placed in service 
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">11</div>
								<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; text-align: center; padding-top: 1.5mm; padding-right: 1mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:choose>
										<xsl:when test="normalize-space($Form2106Data/VehicleExpensesGrp[$pos]/VehiclePlacedInServiceDt)!=''">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/VehiclePlacedInServiceDt"/>
											</xsl:call-template>
										 </xsl:when>
						           <xsl:otherwise>
						            /<span style="width=10mm"/>/<span style="width=5mm"/>
						           </xsl:otherwise>
								</xsl:choose>
								</div>
								<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; text-align: center; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END PART II - SECTION A.11 Data -->
							<!-- BEGIN PART II - SECTION A.12 Data -->
							<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
								<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">12</div>
								<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
						            Total miles the vehicle was driven during 2018 
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">12</div>
								<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/TotalMilesCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
								</div>
								<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data    /VehicleExpensesGrp[$pos + 1]/TotalMilesCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
								</div>
							</div>
							<!-- END PART II - SECTION A.12 Data -->
							<!-- BEGIN PART II - SECTION A.13 Data -->
							<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
								<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">13</div>
								<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
					            	Business miles included on line 12 
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</div>
								<div class="styLNRightNumBox" style="height: 5mm; border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; text-align: center; padding-top: 1.5mm;">13</div>
								<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/BusinessMilesCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
								</div>
								<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/BusinessMilesCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
								</div>
							</div>
							<!-- END PART II - SECTION A.13 Data -->
							<!-- BEGIN PART II - SECTION A.14 Data -->
							<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
								<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">14</div>
								<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
					            	Percent of business use. Divide line 13 by line 12 
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
								</div>
								<div class="styLNRightNumBox" style="height: 5mm; border-width: 0px 0px 1px 1.3px; border-style: solid; border-color: black; width: 7mm; text-align: center; padding-top: 1.5mm;">14</div>
								<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; padding-right: 1mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/VehBusInvestmentUsePct"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/VehBusInvestmentUsePct"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END PART II - SECTION A.14 Data -->
							<!-- BEGIN PART II - SECTION A.15 Data -->
							<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
								<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">15</div>
								<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
						            Average daily roundtrip commuting distance 
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">
						15
					</div>
								<div class="styIRS2106ColBox" style="border-width: 0px 0px 1px 1px; width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/AverageDistanceCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
								</div>
								<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/AverageDistanceCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
								</div>
							</div>
							<!-- END PART II - SECTION A.15 Data -->
							<!-- BEGIN PART II - SECTION A.16 Data -->
							<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
								<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">16</div>
								<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
						            Commuting miles included on line 12 
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">16</div>
								<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/MilesCommutingCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
								</div>
								<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/MilesCommutingCnt"/>
									</xsl:call-template>
									<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
								</div>
							</div>
							<!-- END PART II - SECTION A.16 Data -->
							<!-- BEGIN PART II - SECTION A.17 Data -->
							<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
								<div class="styLNLeftNumBox" style="border: 0px solid black; height: 5mm; padding-top: 1.5mm;">17</div>
								<div class="styLNDesc" style="border: 0px solid black; width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
						            Other miles. Add lines 13 and 16 and subtract the total from line 12 
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</div>
								<xsl:choose>
									<xsl:when test="$pos = count($Form2106Data/VehicleExpensesGrp) or $pos = count($Form2106Data/VehicleExpensesGrp)-1">
										<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid solid solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">17</div>
										<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-bottom-color: currentColor; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/OtherPersonalMilesCnt"/>
											</xsl:call-template>
											<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
										</div>
										<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-bottom-color: currentColor; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/OtherPersonalMilesCnt"/>
											</xsl:call-template>
											<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="styLNRightNumBox" style="border-width: 0px 0px 0px 1px; border-style: solid solid solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">17</div>
										<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-bottom-color: currentColor; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-bottom-style: solid;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/OtherPersonalMilesCnt"/>
											</xsl:call-template>
											<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
										</div>
										<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-bottom-color: currentColor; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-bottom-style: solid;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/OtherPersonalMilesCnt"/>
											</xsl:call-template>
											<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:if>
					</xsl:for-each>
					</xsl:if>
					<!-- END Part II 17 -->
					<!--Start Printing Blank Section for Vehicle Expenses Group-->
					<xsl:if test="(count($Form2106Data/VehicleExpensesGrp) &lt; 1)">
						<xsl:variable name="pos" select="position()"/>
						<div class="styNBB" style="width:187mm;">
							<th scope="col" style="width:187mm;">
								<div class="styIRS2106TB" style="height:7.8mm;width:122.5mm;font-size:8.5pt;padding-left:0mm;           border-bottom-width:1px;">
									<span class="styBoldText">Section A-General Information</span>
										 (You must complete this section if you<br/>are claiming vehicle expenses.)
											</div>
								<!-- END SECTION A TITLE -->
								<!-- BEGIN Vehicle 1 Title  -->
								<div class="styPartDesc" style="height:7.8mm;width:32.5mm;padding-left:2mm;padding-right:2mm;            padding-top:1.5mm;:padding-bottom:2mm;text-align:center;border-style:solid;border-left-width:1px;            border-right-width:0px;border-top-width:1px;border-bottom-width:1px;border-color:black;float:left;            clear:none;">(<xsl:number value="($pos)" format="a"/>) <span style="font-weight:normal;">
											Vehicle <xsl:number value="($pos)" format="1"/>
									</span>
								</div>
								<!-- END Vechicle 1Title -->
								<!-- BEGIN Vecicle 2 Title -->
								<div class="styPartDesc" style="height:7.8mm;width:31.5mm;padding-left:2mm;padding-right:2mm;            padding-top:1.5mm;:padding-bottom:2mm;text-align:center;border-style:solid;border-left-width:1px;            border-right-width:0px;border-top-width:1px;border-bottom-width:1px;border-color:black;float:left;            clear:none;">(<xsl:number value="($pos+1)" format="a"/>) <span style="font-weight:normal;">
											Vehicle <xsl:number value="($pos+1)" format="1"/>
									</span>
								</div>
							</th>
						</div>
						<!-- END Vechicle 2 Tile-->
						<!-- Beginning of SECTION A Data -->
						<!-- Beginning of Part II 11 -->
						<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">11</div>
							<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
							       Enter the date the vehicle was placed in service 				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">11</div>
							<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form2106Data/VehicleExpensesGrp[$pos]/VehiclePlacedInServiceDt)!=''">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/VehiclePlacedInServiceDt"/>
									</xsl:call-template>
								</xsl:when>
						        <xsl:otherwise>
						        /<span style="width:15mm"/>/<span style="width:5mm"/>
						        </xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
							    <xsl:choose>
								<xsl:when test="normalize-space($Form2106Data/VehicleExpensesGrp[$pos + 1]/VehiclePlacedInServiceDt)!=''">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
									</xsl:call-template>
								</xsl:when>
						        <xsl:otherwise>
						             /<span style="width:15mm"/>/<span style="width:5mm"/>
						        </xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- End of Part II 11 -->
						<!-- Beginning of Part II 12 -->
						<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">12</div>
							<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
							        Total miles the vehicle was driven during 2018				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">12</div>
							<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data    /VehicleExpensesGrp[$pos]/TotalMilesCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
							</div>
							<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/TotalMilesCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
							</div>
						</div>
						<!-- End of Part II 12 -->
						<!-- Beginning of Part II 13 -->
						<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">13</div>
							<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
							        Business miles included on line 12 				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">13</div>
							<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/BusinessMilesCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
							</div>
							<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/BusinessMilesCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
							</div>
						</div>
						<!-- End of Part ii 13 -->
						<!-- Beginning of Part II 14 -->
						<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">14</div>
							<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
							    Percent of business use. Divide line 13 by line 12 				
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height: 5mm; border-width: 0px 0px 1px 1.3px; border-style: solid; border-color: black; width: 7mm; text-align: center; padding-top: 1.5mm;">14</div>
							<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; padding-right: 1mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/VehBusInvestmentUsePct"/>
								</xsl:call-template>%
							</div>
							<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/VehBusInvestmentUsePct"/>
								</xsl:call-template>%
							</div>
						</div>
						<!-- End of Part ii 14 -->
						<!-- Beginning of Part II 15 -->
						<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">15</div>
							<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
							     Average daily roundtrip commuting distance				
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height: 5mm; border-width: 0px 0px 1px 1.3px; border-style: solid; border-color: black; width: 7mm; text-align: center; padding-top: 1.5mm;">15</div>
							<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/AverageDistanceCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
							</div>
							<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/AverageDistanceCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
							</div>
						</div>
						<!-- End of Part ii 15 -->
						<!-- Beginning of Part II 16 -->
						<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1.5mm;">16</div>
							<div class="styLNDesc" style="width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
							    Commuting miles included on line 12 				
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height: 5mm; border-width: 0px 0px 1px 1.3px; border-style: solid; border-color: black; width: 7mm; text-align: center; padding-top: 1.5mm;">16</div>
							<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/MilesCommutingCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
							</div>
							<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1.3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/MilesCommutingCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
							</div>
						</div>
						<!-- End of Part II 16 -->
						<!-- Beginning of Part II 17 -->
						<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
							<div class="styLNLeftNumBox" style="border: 0px solid black; height: 5mm; padding-top: 1.5mm;">
						         17
					        </div>
							<div class="styLNDesc" style="border: 0px solid black; width: 107.5mm; height: 5mm; padding-top: 1.5mm;">
						        Other miles. Add lines 13 and 16 and subtract the total from line 12 
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid solid solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.5mm;">17</div>
							<div class="styIRS2106ColBox" style="width: 32.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-bottom-color: currentColor; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos]/OtherPersonalMilesCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;padding-right:1mm;">miles</span>
							</div>
							<div class="styIRS2106ColBox" style="width: 31.5mm; height: 5mm; padding-top: 1.5mm; font-size: 6pt; border-bottom-color: currentColor; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: solid;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleExpensesGrp[$pos + 1]/OtherPersonalMilesCnt"/>
								</xsl:call-template>
								<span style="font-weight:normal;font-size:8pt;padding-left:1mm;">miles</span>
							</div>
						</div>
					</xsl:if>
					<!--</xsl:for-each>
						</xsl:if>-->
					<!-- END Part II 17 -->
					<!--End Blank Printing Section for Vehicle Expenses Group-->
					<!-- Beginning of Part II 18 -->
					<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1.5mm;">18</div>
						<div class="styLNDesc" style="width:150.5mm; height:4.5mm; padding-top:1.5mm;">
						     Was your vehicle available for personal use during off-duty hours? 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNDesc" style="width:13mm; height:4.5mm; padding-top:1.5mm; text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleAvailableOffDutyHrsInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Vehicle Available Off Duty Hrs Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">$Form2106DataVehicleAvailableOffDutyHrsInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleAvailableOffDutyHrsInd"/>
									<xsl:with-param name="BackupName">$Form2106DataVehicleAvailableOffDutyHrsInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleAvailableOffDutyHrsInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Vehicle Available Off Duty Hrs Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">$Form2106DataVehicleAvailableOffDutyHrsInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form2106Data/VehicleAvailableOffDutyHrsInd"/>
									<xsl:with-param name="BackupName">$Form2106DataVehicleAvailableOffDutyHrsInd</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</div>
					</div>
					<!-- End of Part II 18 -->
					<!-- Beginning of Part II 19 -->
					<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1.5mm;">19</div>
						<div class="styLNDesc" style="width:150.5mm; height:4.5mm; padding-top:1.5mm;">
						    Do you (or your spouse) have another vehicle available for personal use? 					
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNDesc" style="width:13mm; height:4.5mm; padding-top:1.5mm; text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/AnotherVehicleForPrsnlUseInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Another Vehicle For Prsnl Use Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">$Form2106DataAnotherVehicleForPrsnlUseInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form2106Data/AnotherVehicleForPrsnlUseInd"/>
									<xsl:with-param name="BackupName">$Form2106DataAnotherVehicleForPrsnlUseInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
						</div>
						<div class="styLNDesc" style="width:15mm; height:4.5mm; padding-top:1.5mm; text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/AnotherVehicleForPrsnlUseInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Another Vehicle For Prsnl Use Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">$Form2106DataAnotherVehicleForPrsnlUseInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form2106Data/AnotherVehicleForPrsnlUseInd"/>
									<xsl:with-param name="BackupName">$Form2106DataAnotherVehicleForPrsnlUseInd</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</div>
					</div>
					<!-- End of Part II 19 -->
					<!-- Beginning of Part II 20 -->
					<div style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 5mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1.5mm;">20</div>
						<div class="styLNDesc" style="width:150.5mm; height:5mm; padding-top:1.5mm;">
						    Do you have evidence to support your deduction? 					
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNDesc" style="width:13mm; height:4.5mm; padding-top:1.5mm; text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceToSupportDeductionInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Evidence To Support Deduction Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceToSupportDeductionInd"/>
										<xsl:with-param name="BackupName">$Form2106DataEvidenceSupportDeductionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">$Form2106DataEvidenceSupportDeductionInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
						</div>
						<div class="styLNDesc" style="width:15mm; height:4.5mm; padding-top:1.5mm; text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceToSupportDeductionInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Evidence To Support Deduction Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceToSupportDeductionInd"/>
										<xsl:with-param name="BackupName">$Form2106DataEvidenceSupportDeductionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">$Form2106DataEvidenceSupportDeductionInd</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</div>
					</div>
					<!-- End of Part II 20 -->
					<!-- Beginning of Part II 21 -->
					<div class="styBB" style="width: 187mm; padding-bottom: 0mm; clear: all; font-size: 8pt; float: left; height: 6.5mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1.5mm;">21</div>
						<div class="styLNDesc" style="width:150.5mm; height:5mm; padding-top:1.5mm;">
						    If "Yes,"  is the evidence written? 						
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>
						<div class="styLNDesc" style="width:13mm; height:5mm; padding-top:1.5mm; text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceWrittenInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Evidence Written Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceWrittenInd"/>
										<xsl:with-param name="BackupName">$Form2106DataIsEvidenceWrittenInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceWrittenInd"/>
									<xsl:with-param name="BackupName">$Form2106DataIsEvidenceWrittenInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
						</div>
						<div class="styLNDesc" style="width:15mm; height:4.5mm; padding-top:1.5mm; text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceWrittenInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Evidence Written Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceWrittenInd"/>
										<xsl:with-param name="BackupName">$Form2106DataIsEvidenceWrittenInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form2106Data/EvidenceWrittenInd"/>
									<xsl:with-param name="BackupName">$Form2106DataIsEvidenceWrittenInd</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</div>
					</div>
					<!-- End of Part II 21 -->
					<!-- Ending of SECTION A Data -->
					<!-- BEGIN SECTION B TITLE -->
					<div class="styBB" style="width:187mm; clear: all; float: left;border-top-width:0.3mm;">
						<div class="styPartDesc" style="width:187mm;font-size:8pt;padding-left:0mm;font-weight:bold;">
                         Section B-Standard Mileage Rate <span style="font-weight:normal;">(See the instructions for Part II to find out whether to complete this section or Section C.)	</span>
						</div>
					</div>
					<!--END SECTION B TITLE -->
					<!-- Beginning of Part II Section B. 22 -->
					<div class="styBB" style="width: 187mm; height: 4.5mm; font-size: 8pt;border-bottom-width:2px;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width: 139mm;">
						    Multiply line 13 by 54.5¢ (0.545). Enter the result here and on line 1 
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="border-width: 0px 1px; border-style: solid; border-color: black; width: 6.5mm; height: 4.5mm; text-align: center;">
						    22
						</div>
						<div class="styIRS2106ColBox" style="height: 4.5mm; padding-top: 0.8mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2106Data/StandardMileageDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Part II Section B. 22 -->
					<!-- BEGIN SECTION C TITLE -->
					<xsl:if test="($Print != $Separated) or (count($Form2106Data/ActualExpensesGrp) &gt;0)">
					<xsl:for-each select="$Form2106Data/ActualExpensesGrp">
						<xsl:variable name="pos" select="position()"/>
						<xsl:if test="(position() mod 2)=1">
							<div class="styIRS2106TableContainer" style="clear:all; float: left;" id="Spcctn">
								<xsl:call-template name="SetInitialState"/>
								<th scope="col" style="width:187mm;">
									<div class="styPartDesc" style="width:58.8mm;font-size:8pt;padding-left:0mm;border-style:solid;border-right-width:0px;       border-left-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black;">Section C-Actual Expenses</div>
									<!-- BEGIN Vehicle 1 Title  -->
									<div class="styPartDesc" style="width:64.3mm;font-size:8pt;padding-left:2mm;padding-right:2mm;text-align:center;         border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left;clear:none;">(<xsl:number value="($pos)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/>
										</span>
									</div>
									<!-- END Vehicle 1Title -->
									<!-- BEGIN Vehicle 2 Title -->
									<div class="styPartDesc" style="width:63.8mm;padding-left:2mm;padding-right:2mm;text-align:center;       border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left;clear:none;">(<xsl:number value="($pos+1)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos+1)" format="1"/>
										</span>
									</div>
								</th>
							</div>
							<!-- END Vehicle 2 Tile-->
							<!-- BEGIN Section C 23 -->
							<div style="width: 187mm; height: 8mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1mm; font-size: 8pt;">23</div>
								<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1mm; font-size: 7.5pt;">
								   Gasoline, oil, repairs, vehicle insurance, etc.
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.5mm; font-size: 8pt;">23</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5.3mm; border-right-width: 0px; border-left-width: 0px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/VehicleGasRepairsInsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; border-right-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/VehicleGasRepairsInsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END Section C 23 -->
							<!-- BEGIN Section C 24a -->
							<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 4mm; font-size: 7.5pt;">24a</div>
								<div class="styLNDesc" style="width:44mm; height: 4mm; font-size:7.5pt;">
								    Vehicle rentals				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.5mm; font-size: 7.5pt;">24a</div>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:0.8mm; border-right-width: 0px; border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/VehicleRentalsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:0.8mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/VehicleRentalsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm;border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							</div>
							<!-- END Section C 24a -->
							<!-- BEGIN Section C 24b -->
							<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 4mm; text-align: right; padding-top: 1mm; padding-right: 1.5mm; padding-bottom: 0mm; font-size: 7pt;">b</div>
								<div class="styLNDesc" style="width: 44mm; height: 4mm; padding-bottom: 0mm; font-size: 7.5pt;">Inclusion amount <span style="font-size: 6pt;">(see instructions)</span></div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.3mm; font-size: 8pt;">24b</div>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 0.8mm; border-right-width: 0px; border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/InclusionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm;border-left-width:1px; border-right-width:0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:0.8mm; border-left-width:1px; border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/InclusionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm; border-left-width:1px; border-right-width:0px;"/>
							</div>
							<!-- END Section C 24b -->
							<!-- BEGIN Section C 24c -->
							<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 4mm; text-align: right; padding-top: 0.6mm; padding-right: 1.5mm; padding-bottom: 0mm; font-size: 7.5pt;">c</div>
								<div class="styLNDesc" style="width: 44mm; height: 4mm; padding-top: 0.6mm; padding-bottom: 0mm; font-size: 7.5pt;">Subtract line 24b from line 24a</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.3mm; font-size: 8pt;">24c
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm; border-left-width:0px; border-right-width:0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:0.8mm; border-left-width:1px; border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/RentalMinusInclusionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm; border-left-width:1px; border-right-width:0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:0.8mm; border-left-width:1px; border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/RentalMinusInclusionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END Section C 24c -->
							<!-- BEGIN Section C 25 -->
							<div style="width: 187mm; height: 14mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height:14mm; padding-top:1mm; font-size:8pt;">25</div>
							<div class="styLNDesc" style="width:44mm; height:14mm; font-size:7.5pt; padding-top:1mm;">Value<span style="width:1mm"/>of<span style="width:1mm"/> employer-provided vehicle (applies only if 100% 	of annual lease value was included <br/>
			on Form W-2-see instructions)</div>
							<div class="styLNRightNumBox" style="height:14mm;width:7mm;padding-top:10.3mm;font-size:8pt;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">25</div>
							<div class="styIRS2106ColBoxGrey" style="height:14mm; padding-top:11.5mm; border-left-width:0px; border-right-width:0px; border-bottom-width:0px;"/>
							<div class="styIRS2106ColBox" style="height:14mm; padding-top:10.5mm; border-left-width:1px; border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/ValueEmplrProvidedVehicleAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height:14mm; padding-top:11.5mm; border-left-width:1px; border-right-width:0px; border-bottom-width:0px;"/>
							<div class="styIRS2106ColBox" style="height:14mm; padding-top:10.5mm; border-left-width:1px; border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/ValueEmplrProvidedVehicleAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END Section C 25 -->
							<!-- BEGIN Section C 26 -->
							<div style="width:187mm; height:4.5mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:.5mm;font-size:8pt;">26</div>
								<div class="styLNDesc" style="width:44mm;height:4.5mm;font-size:7.5pt;padding-top:.5mm;">
								    Add lines 23, 24c, and 25
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;padding-top:.8mm;font-size:8pt;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">26</div>
								<div class="styIRS2106ColBoxGrey" style="height:4.5mm;padding-top:1.5mm;border-left-width:0px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:4.5mm;padding-top:1.3mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/ActualVehicleExpenseAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height:4.5mm;padding-top:1.5mm;border-left-width:1px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:4.5mm;padding-top:1.3mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/ActualVehicleExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END Section C 26 -->
							<!-- BEGIN Section C 27 -->
							<div style="width:187mm; height:9mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height:9mm; padding-top:1.5mm;font-size:8pt;">27</div>
								<div class="styLNDesc" style="width:44mm; height:9mm; font-size:7.5pt;padding-top:1.5mm;">Multiply<span style="width:2mm"/>line<span style="width:2mm"/>26<span style="width:2mm"/>by<span style="width:2mm"/> the percentage on line 14
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
								</div>
								<div class="styLNRightNumBox" style="height:9mm; width:7mm;padding-top:5.2mm;font-size:8pt;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">27</div>
								<div class="styIRS2106ColBoxGrey" style="height:9mm;border-left-width:0px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:9mm; padding-top:5.3mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/CalculatedBusinessExpenseAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height:9mm; border-left-width:1px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:9mm; padding-top:5.3mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/CalculatedBusinessExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END Section C 27 -->
							<!-- BEGIN Section C 28 -->
							<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height:4mm; padding-top:.5mm; font-size:8pt;">28</div>
								<div class="styLNDesc" style="width: 44mm; height: 4mm; padding-top: 0.5mm; font-size: 7.5pt;">Depreciation (see instructions) .</div>
								<!--Dotted Line-->
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.4mm; font-size: 8pt;">28</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top: 1.3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 0.6mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/DepreciationAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm;  border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 0.6mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/DepreciationAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END Section C 28 -->
							<!-- BEGIN Section C 29 -->
							<div style="border-width: 0px 0px 1px ; border-style: solid; border-color: black; width: 187mm; height: 9mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height:9mm; padding-top:0.5mm; padding-bottom:0mm; font-size:8pt;">29</div>
							<div class="styLNDesc" style="width: 44mm; height: 9mm; padding-top: 0.5mm; padding-bottom: 0mm; font-size: 7.5pt;">
							        Add lines 27 and 28. <span style="width:2mm"/>Enter total here and on line 1
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px; border-style: solid; border-color: black; width: 7mm; height: 9mm; text-align: center; padding-top: 5.4mm; font-size: 8pt;">29</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9mm; padding-top: 4.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 9mm; padding-top: 5.4mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/TotalActualExpenseAmt"/>
									</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 9mm; padding-top: 5.4mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/TotalActualExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					</xsl:if><br/>
					<!-- END Section C 29 -->
					<!--Start Blank Printing for Section for Actual Expenses Group-->
					<xsl:if test="count($Form2106Data/ActualExpensesGrp) &lt; 1 ">
						<xsl:variable name="pos" select="position()"/>
						<div class="styNBB" style="width:187mm;">
							<th scope="col" style="width:187mm;">
								<div class="styPartDesc" style="width:58.7mm;font-size:8pt;padding-left:0mm;border-style:solid;border-right-width:0px;       border-left-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black;">Section C-Actual Expenses</div>
								<!-- BEGIN Vehicle 1 Title  -->
								<div class="styPartDesc" style="width:64.3mm;font-size:8pt;padding-left:2mm;padding-right:2mm;text-align:center;         border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left;         clear:none;">(<xsl:number value="($pos)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/>
									</span>
								</div>
								<!-- END Vehicle 1Title -->
								<!-- BEGIN Vehicle 2 Title -->
								<div class="styPartDesc" style="width:64.0mm;padding-left:2mm;padding-right:2mm;text-align:center;       border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left;       clear:none;">(<xsl:number value="($pos+1)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos+1)" format="1"/>
									</span>
								</div>
							</th>
						</div>
						<!-- END Vehicle 2 Tile-->
						<!-- BEGIN Section C 23 -->
						<div style="width: 187mm; height: 8mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1mm; font-size: 8pt;">23</div>
								<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1mm; font-size: 7.5pt;">
								    Gasoline, oil, repairs, vehicle insurance, etc.
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.5mm; font-size: 8pt;">23</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5.3mm; border-right-width: 0px; border-left-width: 0px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/VehicleGasRepairsInsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5.3mm; border-right-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/VehicleGasRepairsInsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section C 23 -->
						<!-- BEGIN Section C 24a -->
						<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 4mm; font-size: 8pt;">24a</div>
								<div class="styLNDesc" style="width:44mm; height: 4mm; font-size:7.5pt;">
								    Vehicle rentals				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.5mm; font-size: 7.5pt;">24a</div>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 0.8mm; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/VehicleRentalsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 0.8mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/VehicleRentalsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top: 1.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
						</div>
						<!-- END Section C 24a -->
						<!-- BEGIN Section C 24b -->
						<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 4mm; text-align: right; padding-top: 1mm; padding-right: 1.5mm; padding-bottom: 0mm; font-size: 7pt;">b</div>
								<div class="styLNDesc" style="width: 44mm; height: 4mm; padding-top: 1mm; padding-bottom: 0mm; font-size: 7.5pt;">Inclusion amount <span style="font-size: 6pt;">(see instructions)</span></div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.3mm; font-size: 8pt;">24b</div>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 1mm; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/InclusionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top:1mm; border-left-width:1px; border-right-width:0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:1mm; border-left-width:1px; border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/InclusionAmt"/>
								</xsl:call-template>
							</div>
									<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top:1mm; border-left-width:1px; border-right-width:0px;"/>
						</div>
						<!-- END Section C 24b -->
						<!-- BEGIN Section C 24c -->
						<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 4mm; text-align: right; padding-top: 1mm; padding-right: 1.5mm; padding-bottom: 0mm; font-size: 7.5pt;">c</div>
								<div class="styLNDesc" style="width: 44mm; height: 4mm; padding-top: 1mm; padding-bottom: 0mm; font-size: 7.5pt;">Subtract line 24b from line 24a</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.3mm; font-size: 8pt;">24c</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top:1mm; border-left-width:0px; border-right-width:0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:1mm; border-left-width:1px; border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/RentalMinusInclusionAmt"/>
								</xsl:call-template>
							</div>
						<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top:1mm; border-left-width:1px; border-right-width:0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top:1mm; border-left-width:1px; border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/RentalMinusInclusionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section C 24c -->
						<!-- BEGIN Section C 25 -->
						<div style="width: 187mm; height: 14mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height:14mm; padding-top:1mm; font-size:8pt;">25</div>
							<div class="styLNDesc" style="width:44mm; height:14mm; font-size:7.5pt; padding-top:1mm;">Value<span style="width:1mm"/>of<span style="width:1mm"/> employer-provided vehicle (applies only if 100% 	of annual lease value was included <br/>
			on Form W-2-see instructions)</div>
							<div class="styLNRightNumBox" style="height:14mm;width:7mm;padding-top:10.5mm;font-size:8pt;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">25</div>
							<div class="styIRS2106ColBoxGrey" style="height:14mm; padding-top:11.5mm; border-left-width:0px; border-right-width:0px; border-bottom-width:0px;"/>
							<div class="styIRS2106ColBox" style="height:14mm; padding-top:10.5mm; border-left-width:1px; border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/ValueEmplrProvidedVehicleAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height:14mm; padding-top:11.5mm; border-left-width:1px; border-right-width:0px; border-bottom-width:0px;"/>
							<div class="styIRS2106ColBox" style="height:14mm; padding-top:10.5mm; border-left-width:1px; border-right-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/ValueEmplrProvidedVehicleAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section C 25 -->
						<!-- BEGIN Section C 26 -->
						<div style="width:187mm; height:4.5mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:.5mm;font-size:8pt;">26</div>
								<div class="styLNDesc" style="width:44mm;height:4.5mm;font-size:7.5pt;padding-top:.5mm;">
								    Add lines 23, 24c, and 25
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>							
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;padding-top:.5mm;font-size:8pt;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">26</div>
								<div class="styIRS2106ColBoxGrey" style="height:4.5mm;padding-top:1.5mm;border-left-width:0px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:4.5mm;padding-top:1.3mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/ActualVehicleExpenseAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height:4.5mm;padding-top:1.5mm;border-left-width:1px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:4.5mm;padding-top:1.3mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/ActualVehicleExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						<!-- END Section C 26 -->
						<!-- BEGIN Section C 27 -->
						<div style="width:187mm; height:9.5mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height:9.5mm; padding-top:2mm;font-size:8pt;">27</div>
								<div class="styLNDesc" style="width:44mm; height:9.5mm; font-size:7.5pt;padding-top:2mm;">Multiply<span style="width:2mm"/>line<span style="width:2mm"/>26<span style="width:2mm"/>by<span style="width:2mm"/> the percentage on line 14
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>		
								</div>
								<div class="styLNRightNumBox" style="height:9.5mm; width:7mm;padding-top:5.5mm;font-size:8pt;text-align:center;border-style:solid;   border-right-width:1px;border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;">27</div>
								<div class="styIRS2106ColBoxGrey" style="height:9.5mm; padding-top:5.5mm;border-left-width:0px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:9.5mm; padding-top:6mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/CalculatedBusinessExpenseAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height:9.5mm; padding-top:5.5mm;border-left-width:1px;border-right-width:0px;    border-bottom-width:0px;"/>
								<div class="styIRS2106ColBox" style="height:9.5mm; padding-top:6mm;border-left-width:1px;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/CalculatedBusinessExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						<!-- END Section C 27 -->
						<!-- BEGIN Section C 28 -->
						<div style="width: 187mm; height: 4mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height:4mm; padding-top:.5mm; font-size:8pt;">28</div>
								<div class="styLNDesc" style="width: 44mm; height: 4mm; padding-top: 0.5mm; font-size: 7.5pt;">Depreciation (see instructions) .</div>
								<!--Dotted Line-->
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 4mm; text-align: center; padding-top: 0.3mm; font-size: 8pt;">28</div>
								<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top: 1.3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 0.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/DepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 4mm; padding-top: 1.3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 4mm; padding-top: 0.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/DepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section C 28 -->
						<!-- BEGIN Section C 29 -->
						<div style="border-width: 0px; width: 187mm; height: 6.5mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 9.5mm; padding-top: 0.5mm; padding-bottom: 0mm; font-size: 8pt;">29</div>
							<div class="styLNDesc" style="width: 44mm; height: 9.5mm; padding-top: 0.5mm; padding-bottom: 0mm; font-size: 7.5pt;">Add lines 27 and 28. <span style="width:2mm"/>Enter total here and on line 1
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>		
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px; border-style: solid; border-color: black; width: 7mm; height: 9.5mm; text-align: center; padding-top: 5.6mm; font-size: 8pt;">29</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9.5mm; padding-top: 4.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 9.5mm; padding-top: 4.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos]/TotalActualExpenseAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9.5mm; padding-top: 4.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 9.5mm; padding-top: 4.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/ActualExpensesGrp[$pos + 1]/TotalActualExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<!--End Blank Printing for Section for Actual Expenses Group-->
					<!-- BEGIN SECTION D TITLE -->
					<div style="width:187mm;">
					<xsl:if test="($Print != $Separated) or (count($Form2106Data/DepreciationOfVehiclesGrp) &gt;0)">
					<xsl:for-each select="$Form2106Data/DepreciationOfVehiclesGrp">
						<xsl:variable name="pos" select="position()"/>
						<xsl:if test="(position() mod 2)=1">
							<div class="styIRS2106TableContainer" style="clear: all; float: left;" id="Spcctn">
								<xsl:call-template name="SetInitialState"/>
								<th scope="col" style="width:187mm;">
									<!-- BEGIN SECTION D TITLE -->
									<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
										<div class="styPartDesc" style="width:187mm;height:auto; padding-top:2mm;font-weight:normal;font-size:8pt;padding-left:0mm;font-weight:bold;">Section D-Depreciation of Vehicles <span style="font-weight:normal;font-size:7pt;">(Use this section only if you owned the vehicle and are completing Section C for the vehicle.)</span>
										</div>
									</div>
									<!--END SECTION D TITLE -->
									<div class="styPartDesc" style="width:52mm;font-size:8pt;padding-left:0mm;border-style:solid;border-right-width:0px;       border-left-width:0px;border-top-width:0px;border-bottom-width:0px;       border-color:black"/>
									<!-- BEGIN Vehicle 1 Title  -->
									<div class="styPartDesc" style="width:71.1mm;padding-left:2mm;padding-right:2mm;text-align:center;       border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left;       clear:none;">(<xsl:number value="($pos)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/>
										</span>
									</div>
									<!-- END Vehicle 1Title -->
									<!-- BEGIN Vehicle 2 Title -->
									<div class="styPartDesc" style="width:63.8mm;padding-left:2mm;padding-right:2mm;text-align:center;       border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left;       clear:none;">(<xsl:number value="($pos+1)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos+1)" format="1"/>
										</span>
									</div>
								</th>
							</div>
							<!-- END Vehicle 2 Tile-->
							<!-- BEGIN Section D  -->
							<!-- BEGIN Section D 30 -->
							<div style="width: 187mm; height: 8mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1mm; font-size: 8pt;">30</div>
								<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1mm; font-size: 7.5pt;">
								    Enter cost or other basis (see instructions)				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>		
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.3mm; font-size: 8pt;">30</div>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/VehicleBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5mm; border-right-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/VehicleBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5mm; border-right-width: 0px; border-left-width: 1px;"/>
							</div>
							<!-- END Section D 30 -->
							<!-- BEGIN Section D 31 -->
							<div style="width: 187mm; height: 8mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1.5mm; font-size: 8pt;">31</div>
								<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1.5mm; font-size: 6.85pt;">Enter section 179 deduction and<br/>special allowance (see instructions)
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.3mm; font-size: 8pt;">31</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; font-size: 7.5pt; border-right-width: 0px; border-left-width: 0px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 1mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/Section179DeductionAmt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/Section179DeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; font-size: 7.5pt; border-right-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 1mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/Section179DeductionAmt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/Section179DeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- END Section D 31 -->
							<!-- BEGIN Section D 32 -->
							<div style="width: 187mm; height: 12mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 12mm; padding-top: 0.25mm; font-size: 8pt;">32</div>
							<div class="styLNDesc" style="width: 44mm; height: 12mm; padding-top: 0.25mm; font-size: 6.85pt;">
							         Multiply line 30 by line 14 (see instructions if you claimed the section 179 deduction or special allowance)				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 12mm; text-align: center; padding-top: 8.4mm; font-size: 8pt;">32</div>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationRecoveryAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationRecoveryAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px; background-color: lightgrey;"/>
						</div>
							<!-- END Section D 32 -->
							<!-- BEGIN Section D 33 -->
							<div style="width: 187mm; height: 9mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 9mm; padding-top: 1.5mm; font-size: 8pt;">33</div>
							<div class="styLNDesc" style="width: 44mm; height: 9mm; padding-top: 1.5mm; font-size: 7.5pt;">Enter depreciation method and percentage
		 (see instructions)				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:0.8mm;">.</span>
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 9mm; text-align: center; padding-top: 5.4mm; font-size: 8pt;">33</div>
							<div class="styIRS2106ColBox" style="height: 9mm; text-align: left; color: darkblue; padding-top: 0mm; font-size: 6.5pt; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationMethodTypeTxt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/Pct"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9mm; padding-top: 6.3mm; border-right-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 9mm; text-align: left; color: darkblue; padding-top: 0mm; font-size: 6.5pt; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationMethodTypeTxt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/Pct"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9mm; padding-top: 6.3mm; border-right-width: 0px; border-left-width: 1px;"/>
						</div>
							<!-- END Section D 33 -->
							<!-- BEGIN Section D 34 -->
							<div style="width: 187mm; height: 12mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 12mm; padding-top: 2mm; font-size: 8pt;">34</div>
							<div class="styLNDesc" style="width: 44mm; height: 12mm; padding-top: 2mm; font-size: 7.5pt;">
							        Multiply line 32 by the percentage on line 33 <br/>(see instructions)				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 12mm; text-align: center; padding-top: 8.4mm; font-size: 8pt;">34</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; padding-top: 3.3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/CalculatedDepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; padding-top: 3.3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/CalculatedDepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
							<!-- END Section D 34 -->
							<!-- BEGIN Section D 35 -->
							<div style="width: 187mm; height: 5mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1mm; font-size: 8pt;">35</div>
							<div class="styLNDesc" style="width: 44mm; height: 5mm; padding-top: 1mm; font-size: 7.5pt;">
							        Add lines 31 and 34				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.3mm; font-size: 8pt;">35</div>
							<div class="styIRS2106ColBoxGrey" style="height: 5mm; padding-top: 1.6mm; border-right-width: 0px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationSubtotalAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 5mm;border-right-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationSubtotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
							<!-- END Section D 35 -->
							<!-- BEGIN Section D 36 -->
							<div style="width: 187mm; height: 12mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 12mm; padding-top: 1.5mm; font-size: 8pt;">36</div>
							<div class="styLNDesc" style="width: 44mm; height: 12mm; padding-top: 1.5mm; font-size: 7.5pt;">
							        Enter the applicable limit explained in the line 36 instructions
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 12mm; text-align: center; padding-top: 8.4mm; font-size: 8pt;">36</div>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/LimitationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm;border-right-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/LimitationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; padding-top: 3.8mm; border-right-width: 0px; border-left-width: 1px;"/>
						</div>
							<!-- END Section D 36 -->
							<!-- BEGIN Section D 37 -->
							<div style="width: 187mm; height: 8mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1mm; font-size: 8pt;">37</div>
							<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1mm; font-size: 7.5pt;">Multiply<span style="width:1mm"/> line
		                         <span style="width:1mm"/> 36<span style="width:1mm"/> by<span style="width:1mm"/> the percentage on line 14				
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.3mm; font-size: 8pt;">37</div>
							<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/LimitationMultipliedByUseAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/LimitationMultipliedByUseAmt"/>
								</xsl:call-template>
							</div>
						</div>
							<!-- END Section D 37 -->
							<!-- BEGIN Section D 38 -->
							<div style="border-width: 0px 0px 1px; border-style: solid; border-color: black; width: 187mm; height: 20mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 20mm; padding-top: 2.5mm; font-size: 8pt;">38</div>
							<div class="styLNDesc" style="width: 44mm; height: 20mm; padding-top: 2.5mm; font-size: 7.5pt;">Enter the <span class="styBoldText">smaller</span> of line 35 <br/>or line 37. 
		                         <span style="width:1mm"/> If you skipped lines<br/> 36 and 37,  enter the amount <br/>from line 35.<span style="width:1mm"/>Also enter this amount on line	28 above
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 20mm; text-align: center; padding-top: 16.3mm; font-size: 8pt;">38</div>
							<div class="styIRS2106ColBoxGrey" style="width: 32mm; height: 20mm; padding-top: 14.3mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="width: 32mm; height: 20mm; padding-top: 16.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationOfVehicleAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="width: 32mm; height: 20mm; padding-top: 14.3mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="width: 32mm; height: 20mm; padding-top: 16.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationOfVehicleAmt"/>
								</xsl:call-template>
							</div>
						</div>
							<!-- END Section D 38 -->
							<!-- END Section D  -->
						</xsl:if>
					</xsl:for-each>
					</xsl:if>
					</div>
					<!--Start Blank Printing of Section for Depreciation Of Vehicles Group-->
					<xsl:if test="count($Form2106Data/DepreciationOfVehiclesGrp) &lt; 1">
						<xsl:variable name="pos" select="position()"/>
						<div class="styNBB" style="width: 187mm; border-top-color: currentColor; border-top-width: 1px; border-top-style: solid;">
							<th scope="col" style="width:187mm;">
								<!-- BEGIN SECTION D TITLE -->
								<div style="width:187mm;border-style:solid;border-color:black;border-width:0.3mm 0px 1px 0px;">
									<div class="styPartDesc" style="width:187mm; height:auto; font-weight:normal;font-size:8pt;padding-left:0mm;font-weight:bold;">Section D-Depreciation of Vehicles <span style="font-weight:normal;font-size:7pt;">(Use this section only if you owned the vehicle and are completing Section C for the vehicle.)</span>
									</div>
								</div>
								<!--END SECTION D TITLE -->
								<div class="styPartDesc" style="width:52mm;font-size:8pt;padding-left:0mm;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;border-color:black"/>
								<!-- BEGIN Vehicle 1 Title  -->
								<div class="styPartDesc" style="width:71.1mm;padding-left:2mm;padding-right:2mm;text-align:center;border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left; clear:none;">(<xsl:number value="($pos)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/>
									</span>
								</div>
								<!-- END Vehicle 1Title -->
								<!-- BEGIN Vehicle 2 Title -->
								<div class="styPartDesc" style="width:63.8mm;padding-left:2mm;padding-right:2mm;text-align:center; border-style:solid;border-left-width:1px;border-right-width:0mm;border-top-width:0mm;border-bottom-width:1px;border-color:black;float:left; clear:none;">(<xsl:number value="($pos+1)" format="a"/>)  <span style="font-weight:normal;">Vehicle <xsl:number value="($pos+1)" format="1"/>
									</span>
								</div>
							</th>
						</div>
						<!-- END Vehicle 2 Tile-->
						<!-- BEGIN Section D  -->
						<!-- BEGIN Section D 30 -->
						<div style="width: 187mm; height: 8mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1mm; font-size: 8pt;">30</div>
								<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1mm; font-size: 7.5pt;">
								    Enter cost or other basis (see instructions)
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>	
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.3mm; font-size: 8pt;">30</div>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/VehicleBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5mm; border-right-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 4.5mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/VehicleBasisAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5mm; border-right-width: 0px; border-left-width: 1px;"/>
							</div>
						<!-- END Section D 30 -->
						<!-- BEGIN Section D 31 -->
						<div style="width: 187mm; height: 8mm; clear: all; float: left;">
								<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1.5mm; font-size: 8pt;">31</div>
								<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1.5mm; font-size: 6.85pt;">Enter section 179 deduction and<br/>special allowance (see instructions)
								</div>
								<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.3mm; font-size: 8pt;">31</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; font-size: 7.5pt; border-right-width: 0px; border-left-width: 0px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 1mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/Section179DeductionAmt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/Section179DeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styIRS2106ColBoxGrey" style="height: 8mm; font-size: 7.5pt; border-right-width: 0px; border-left-width: 1px;"/>
								<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 1mm; border-right-width: 0px; border-left-width: 1px;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/Section179DeductionAmt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/Section179DeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						<!-- END Section D 31 -->
						<!-- BEGIN Section D 32 -->
						<div style="width: 187mm; height: 12mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 12mm; padding-top: 0.25mm; font-size: 8pt;">32</div>
							<div class="styLNDesc" style="width: 44mm; height: 12mm; padding-top: 0.25mm; font-size: 6.85pt;">
							       Multiply line 30 by line 14 (see instructions if you claimed the section 179 deduction or special allowance)
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 12mm; text-align: center; padding-top: 8mm; font-size: 8pt;">32</div>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationRecoveryAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationRecoveryAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px; background-color: lightgrey;"/>
						</div>
						<!-- END Section D 32 -->
						<!-- BEGIN Section D 33 -->
						<div style="width: 187mm; height: 9mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 9mm; padding-top: 1.5mm; font-size: 8pt;">33</div>
							<div class="styLNDesc" style="width: 44mm; height: 9mm; padding-top: 1.5mm; font-size: 7.5pt;">Enter depreciation method and percentage
		 (see instructions)
		                    <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:6px"/>.
								</span>
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 9mm; text-align: center; padding-top: 4.5mm; font-size: 8pt;">33</div>
							<div class="styIRS2106ColBox" style="height: 9mm; text-align: left; color: darkblue; padding-top: 0mm; font-size: 6.5pt; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationMethodTypeTxt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/Pct"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9mm; padding-top: 6.3mm; border-right-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 9mm; text-align: left; color: darkblue; padding-top: 0mm; font-size: 6.5pt; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationMethodTypeTxt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/Pct"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 9mm; padding-top: 6.3mm; border-right-width: 0px; border-left-width: 1px;"/>
						</div>
						<!-- END Section D 33 -->
						<!-- BEGIN Section D 34 -->
						<div style="width: 187mm; height: 10mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 10mm; font-size: 8pt;">34</div>
							<div class="styLNDesc" style="width: 44mm; height: 10mm; font-size: 7.5pt;">
							    Multiply line 32 by the percentage on line 33 <br/>(see instructions)				
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 10mm; text-align: center; padding-top: 6.5mm; font-size: 8pt;">34</div>
							<div class="styIRS2106ColBoxGrey" style="height: 10mm; padding-top: 1.3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 10mm; padding-top: 6.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/CalculatedDepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 10mm; padding-top: 1.3mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 10mm; padding-top: 6.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/CalculatedDepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section D 34 -->
						<!-- BEGIN Section D 35 -->
						<div style="width: 187mm; height: 5mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 5mm; padding-top: 1mm; font-size: 8pt;">35</div>
							<div class="styLNDesc" style="width: 44mm; height: 5mm; padding-top: 1mm; font-size: 7.5pt;">
							    Add lines 31 and 34				
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 5mm; text-align: center; padding-top: 1.4mm; font-size: 8pt;">35</div>
							<div class="styIRS2106ColBoxGrey" style="height: 5mm; padding-top: 1.6mm; border-right-width: 0px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationSubtotalAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 5mm; padding-top: 1.6mm; border-right-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 5mm; padding-top: 1.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationSubtotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section D 35 -->
						<!-- BEGIN Section D 36 -->
						<div style="width: 187mm; height: 12mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 12mm; padding-top: 1.5mm; font-size: 8pt;">36</div>
							<div class="styLNDesc" style="width: 44mm; height: 12mm; padding-top: 1.5mm; font-size: 7.5pt;">
							    Enter the applicable limit explained in the line 36 instructions
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 12mm; text-align: center; padding-top: 8.5mm; font-size: 8pt;">36</div>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/LimitationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; padding-top: 3.8mm; border-right-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 12mm; padding-top: 8.5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/LimitationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 12mm; padding-top: 8mm; border-right-width: 0px; border-left-width: 1px;"/>
						</div>
						<!-- END Section D 36 -->
						<!-- BEGIN Section D 37 -->
						<div style="width: 187mm; height: 8mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 8mm; padding-top: 1mm; font-size: 8pt;">37</div>
							<div class="styLNDesc" style="width: 44mm; height: 8mm; padding-top: 1mm; font-size: 7.5pt;">Multiply<span style="width:1mm"/> line
	             	            <span style="width:1mm"/> 36<span style="width:1mm"/> by<span style="width:1mm"/> the percentage on line 14
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 8mm; text-align: center; padding-top: 4.5mm; font-size: 8pt;">37</div>
							<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/LimitationMultipliedByUseAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="height: 8mm; padding-top: 5.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="height: 8mm; padding-top: 5mm; border-right-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/LimitationMultipliedByUseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section D 37 -->
						<!-- BEGIN Section D 38 -->
						<div style="border-width: 0px 0px 1px; border-style: solid; border-color: black; width: 187mm; height: 20mm; clear: all; float: left;">
							<div class="styLNLeftNumBox" style="height: 20mm; padding-top: 2.5mm; font-size: 8pt;">38</div>
							<div class="styLNDesc" style="width: 44mm; height: 20mm; padding-top: 2.5mm; font-size: 7.5pt;">Enter the <span class="styBoldText">smaller</span> of line 35 <br/>or line 37. 
		                    <span style="width:1mm"/> If you skipped lines<br/> 36 and 37,  enter the amount <br/>from line 35.<span style="width:1mm"/>Also enter this amount on line	28 above
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>	
							</div>
							<div class="styLNRightNumBox" style="border-width: 0px 1px 1px; border-style: solid; border-color: black; width: 7mm; height: 20mm; text-align: center; padding-top: 16.2mm; font-size: 8pt;">38</div>
							<div class="styIRS2106ColBoxGrey" style="width: 32mm; height: 20mm; padding-top: 14.3mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px;"/>
							<div class="styIRS2106ColBox" style="width: 32mm; height: 20mm; padding-top: 16.5mm; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos]/DepreciationOfVehicleAmt"/>
								</xsl:call-template>
							</div>
							<div class="styIRS2106ColBoxGrey" style="width: 32mm; height: 20mm; padding-top: 14.3mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;"/>
							<div class="styIRS2106ColBox" style="width: 32mm; height: 20mm; padding-top: 16.5mm; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2106Data/DepreciationOfVehiclesGrp[$pos + 1]/DepreciationOfVehicleAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END Section D 38 -->
						<!-- END Section D  -->
					</xsl:if>
					<!--End Blank Printing of Section for Depreciation Of Vehicles Group-->
					<!-- End signature part -->
					<div  class="styStdDiv pageEnd" style="border-top:2px solid black;text-align:right;">Form <span class="styBoldText" style="font-size:8pt;">2106  </span> (2018)
					</div>
					<br></br>
					<!-- END of Page 2 -->
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine"  id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form2106Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
