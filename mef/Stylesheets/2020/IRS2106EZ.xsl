<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 05/08/2019 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2106EZStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS2106EZ"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<META http-equiv="Content-Type" content="text/html"/>
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
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 2106EZ"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				    <xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2106EZStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2106EZ">
				<div style="width: 187mm; height: 5mm; clear:left; float:left;">
					<xsl:call-template name="DocumentHeader"/>
				</div>
					<div class="styTBB" style="width:187mm; height:21mm; clear: left; float: left;">
						<div class="styFNBox" style="width:42mm; height:21mm;border-right-width:2px;">
							<div style="padding-top:1mm;">
                                Form <span class="styFormNumber"> 2106-EZ<br/>
								</span>
							</div>
							<div style="padding-top:4.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:108mm; height:21mm;">
							<div style="height:8mm; padding-top:2mm;" class="styMainTitle">Unreimbursed Employee Business Expenses</div>
							<div class="styFBT" style="height:4mm;">
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Attach to Form 1040 or Form 1040NR.<br/>
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Go to <a href="http://www.irs.gov/Form2106EZ"><i>www.irs.gov/Form2106EZ</i></a>  for the latest information. 
							</div>
						</div>
						<div class="styTYBox" style="width:36mm; height:21mm;border-left-width:2px;">
							<div class="styOMB" style="height: 5mm; padding-top: 1mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height: 9mm; font-size: 22pt;">20<span class="styTYColor">19</span></div>
							<div class="stySequence" style="height: 7mm; padding-left: 4mm; border-bottom-width: 0px; border-left-width: 0px;">
								Attachment<br/>
								Sequence No. <span class="styBoldText">129A</span>
							</div>
						</div>
					</div>
					<!--Name Line -->
					<div class="styBB" style="width:187mm; height: 9mm;">
						<div class="styNameBox" style="width:80mm; height:9mm; font-size:7pt; font-weight:normal;">
                                Your name<br/>
                                <!-- Name from Form level -->
                                <xsl:choose>
									<xsl:when test="normalize-space($FormData/PersonNm)!=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
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
						<div class="styNameBox" style="width:59mm; height:9mm; font-size:7pt; font-weight:normal; padding-left:1mm;">
						    Occupation in which you incurred expenses<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/OccupationTxt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;height:9mm;padding-left:1mm;font-size:7pt;font-weight:bold;">
                           Social security number<br/>
							<span style="width: 40mm; text-align: center;font-weight:normal;">
								<xsl:choose>
									<xsl:when test="normalize-space($FormData/SSN)!=''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
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
					<!--Note Line -->
					<div class="styBB" style="padding: 1mm 0mm; width: 187mm; height: 32mm; clear: left; float: left;">
						<span style="width: 187mm; height: 5mm; font-weight: bold;">You Can Use This Form Only if All of the Following Apply.</span>
							<li><img src="{$ImagePath}/8911_Bullet_Round.gif" width="5" height="5" alt="Bullet"/> You are an employee deducting ordinary and necessary expenses attributable to your job. An ordinary expense is one that is common and accepted in your field of trade, business, or profession. A necessary expense is one that is helpful and appropriate for your business. An expense does not have to be required to be considered necessary.</li>								
							<li><img src="{$ImagePath}/8911_Bullet_Round.gif" width="5" height="5" alt="Bullet"/> You <span style="font-weight:bold">don't</span> get reimbursed by your employer for any expenses (amounts your employer included in box 1 of your Form W-2 are not considered reimbursements for this purpose).</li>
							<li><img src="{$ImagePath}/8911_Bullet_Round.gif" width="5" height="5" alt="Bullet"/> If you are claiming vehicle expense, you are using the standard mileage rate for 2017.</li>
							<span style="font-weight:bold">Caution:</span> <i>
									You can use the standard mileage rate for 2017 <span style="font-weight:bold">only if: (a)</span> you owned the vehicle and used the standard mileage rate for the first year you placed the vehicle in service, <span style="font-weight:bold">or (b)</span> you leased the vehicle and used the standard mileage rate for the portion of the lease period after 1997.</i>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="padding: 1mm 0mm; width: 187mm; height: 6mm; clear: left; float: left;border-top-width:0px;">
						<div class="styPartName" style="font-family:sans-serif; padding-top: 0.3mm;padding-bottom:1mm">Part I</div>
						<div class="styPartDesc" style="padding-bottom: 0.4mm;">Figure Your Expenses</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- 1.1 - Spacer Row -->
					<div style="width:187mm; height:4.5mm; clear: left; float: left;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<!-- 1.1 - Content Description -->
					<div style="width:187mm; height:6mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding: 2.75mm 0mm 0mm 1mm; width: 5mm; height: 6mm;">1</div>
						<div class="styLNDesc" style="padding: 2.75mm 2mm 0mm 0mm; width: 132mm; height: 6mm;">
							Complete Part II. Multiply line 8a by 53.5₵ (0.535). Enter the result here
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="width: 8mm; height: 6mm; padding-top: 2.75mm;">1</div>
						<div class="styLNAmountBox" style="height:6mm; width:41mm; position:relative; text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/VehicleExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- END 1 -->
					<!-- 2.1 - Spacer Row -->
					<div style="width:187mm; height:4.5mm; clear: left; float: left;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<!-- 2.1  - Content Description -->
					<div style="width:187mm; height:8mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding: 2.75mm 0mm 0mm 1mm; width: 5mm; height: 8mm;">2</div>
						<div class="styLNDesc" style="padding: 2.75mm 2mm 0mm 0mm; width: 132mm; height: 8mm;">
							Parking fees, tolls, and transportation, including train, bus, etc., that <span style="font-weight:bold">didn't</span> involve overnight travel or commuting to and from work
							<span  class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="width: 8mm; height: 8mm; padding-top: 4.75mm;">2</div>
						<div class="styLNAmountBox" style="height:8mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ParkingFeesTollsLocalTransAmt"/>
							</xsl:call-template></div>
						</div>
					</div>
					<!-- 3.1 - Spacer Row -->
					<div style="width:187mm; height:4.5mm; clear: left; float: left;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<!-- 3.1  - Content Description -->
					<div style="width:187mm; height:8mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding: 2.75mm 0mm 0mm 1mm; width: 5mm; height: 6mm;">3</div>
						<div class="styLNDesc" style="padding: 2.75mm 2mm 0mm 0mm; width: 132mm; height: 8mm;">
							Travel expense while away from home overnight, including lodging, airplane, car rental, etc. 
							<span style="font-weight:bold">Don't</span> include meals and entertainment
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="width: 8mm; height: 8mm; padding-top: 4.75mm;">3</div>
						<div class="styLNAmountBox" style="height:8mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TravExpnsLessMealsEntrmtAmt"/>
							</xsl:call-template></div>
						</div>
					</div>
					<!-- 4.1 - Spacer Row -->
					<div style="width:187mm; height:4.5mm; clear: left; float: left;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<!-- 4.1  - Content Description -->
					<div style="width:187mm; height:8mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding: 2.75mm 0mm 0mm 1mm; width: 5mm; height: 6mm;">4</div>
						<div class="styLNDesc" style="padding: 2.75mm 2mm 0mm 0mm; width: 132mm; height: 8mm;">
						     Business expenses not included on lines 1 through 3. <span style="font-weight:bold;">Don't</span> include meals and entertainment
						     <span  class="styDotLn" style="float:right;padding-right:1mm;">..</span></div>
						<div class="styLNRightNumBox" style="width: 8mm; height: 8mm; padding-top: 4.75mm;">4</div>
						<div class="styLNAmountBox" style="height:8mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusExpnssLessMealsEntrmtAmt"/>
							</xsl:call-template></div>
						</div>
					</div>
					<!-- 5.1 - Spacer Row -->
					<div style="width:187mm; height:4.5mm; clear: left; float: left;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					<!-- 5.1  - Content Description -->
					</div>
					<div style="width:187mm; height:12mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding: 2.75mm 0mm 0mm 1mm; width: 5mm; height: 12mm;">5</div>
						<div class="styLNDesc" style="padding: 2.75mm 2mm 0mm 0mm; width: 132mm; height: 12mm;">
						    Meals and entertainment expenses: $
							<span style="padding-left:1mm;padding-right:1mm;width:25mm;border-bottom:1px solid black;text-align:right"> 
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntertainmentAmt"/>
								</xsl:call-template>
							</span> × 50% (0.50). (Employees subject to Department of Transportation (DOT) hours of service limits: Multiply meal expenses incurred
						    while away from home on business by 80% (0.80) instead of 50%. For details, see instructions.) 
						<span  class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="width: 8mm; height: 12mm; padding-top: 8.6mm;border-bottom-width:1px;">5</div>
						<div class="styLNAmountBox" style="height:12mm;width:41mm;position:relative;text-align:left;border-bottom-width:1px;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntrmtExpnssAllwblAmt"/>
							</xsl:call-template></div>
						</div>
					</div>
					<!-- 6.1 - Spacer Row -->
					<div style="width:187mm; height:4.5mm; clear: left; float: left;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<!-- 6.1  - Content Description -->
					<div style="width:187mm; height:15.5mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding: 2.75mm 0mm 0mm 1mm; width: 5mm; height: 15.5mm;">6</div>
						<div class="styLNDesc" style="padding: 2.75mm 2mm 0mm 0mm; width: 132mm; height: 15.5mm;">
						<span style="font-weight:bold">Total expenses.</span> Add lines 1 through 5. Enter here and on 
						<span style="font-weight:bold">Schedule A (Form 1040), line 21</span> (or on <span style="font-weight:bold">Schedule A (Form 1040NR), line 7)</span>. 
						(Armed Forces reservists, fee-basis state or local government officials, qualified performing artists, and individuals with disabilities: See the instructions for special rules on where to enter this amount.)
						<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="width: 8mm; height: 15.5mm; padding-top: 12.25mm; border-bottom:none;">6</div>
						<div class="styLNAmountBox" style="height:15.5mm; width:41mm; position:relative; text-align:left; border-bottom:none;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt"/>
							</xsl:call-template></div>
						</div>
					</div>
					<!-- END PART 1 SECTION-->
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm; padding:1mm 0mm;border-top:1px solid black; clear: left; float: left;">
						<div class="styPartName" style="font-family:sans-serif; padding-top: 0.75mm;">Part II</div>
						<div class="styPartDesc" style="padding-top: 0.5mm;">
							Information on Your Vehicle. <span style="font-weight:normal">Complete this part</span> only 
							<span style="font-weight:normal">if you are claiming vehicle expense on line 1.</span>
						</div>
					</div>
					<!-- END PART II TITLE -->
					<xsl:for-each select="$FormData/VehicleUseInformationGrp">
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($FormData/VehicleUseInformationGrp) &lt; 1">
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="$FormData/VehicleUseInformationGrp[1]"/>
						</xsl:call-template>
					</xsl:if>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; border-top:2px solid black; padding-top:0.5mm; clear: left; float: left;">
						<div style="float:left; font-size:7pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No.20604Q
						<span style="width:15mm"/>
						Form <b style="font-size:9pt">2106-EZ</b> (2019)
						</div>
						<p style="width: 187mm; page-break-before: always;"></p>
					</div> 
					<p style="width: 187mm; clear: all; page-break-before: always;"></p>
					<!--END Page Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="border-color: none; width: 187mm; height: auto; clear: all; float: left;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer" style="float:right;">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
						</div>
						<!-- Additional Data Table -->
						<table class="styLeftOverTbl" style="clear: left; float: left;">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="makeRow">
		<xsl:param name="TargetNode"/>
		<div style="width:187mm; height:4mm; clear: left; float: left;"/>
					<div style="width:187mm;height:4.5mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">7</div>
						<div class="styLNDesc" style="height:4.5mm;width:132mm;">When did you place your vehicle in service for business use? (month, day, year) <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/>
						<span style="width:17.5mm; padding-left:1.5mm; border-bottom-color: black; border-bottom-width: 1px; border-bottom-style: dashed;">
							<xsl:call-template name="PopulateMonth">
								<xsl:with-param name="TargetNode" select="$TargetNode/VehiclePlacedInServiceDt"/>
							</xsl:call-template>/<xsl:call-template name="PopulateDay">
								<xsl:with-param name="TargetNode" select="$TargetNode/VehiclePlacedInServiceDt"/>
							</xsl:call-template>/<xsl:call-template name="PopulateYear">
								<xsl:with-param name="TargetNode" select="$TargetNode/VehiclePlacedInServiceDt"/>
							</xsl:call-template>
						</span>
						</div>
					</div>
					<div style="width:187mm;height:2mm; clear: left; float: left;"/>
					<div style="width: 187mm; height: 4.5mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">8</div>
						<div class="styLNDesc" style="height:4.5mm;width:180mm;">
						     Of the total number of miles you drove your vehicle during 2017, enter the number of miles you used your vehicle for:
						</div>
					</div>
					<div style="width:187mm;height:2mm; clear: left; float: left;"/>
					<div style="width:191mm;height:5mm; clear: left; float: left; padding-left: 3mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:5mm;text-align:right;padding-right:1.5mm;">a</div>
						<div class="styLNDesc" style="height:5mm;width:180mm;">Business
						<span style="width: 25mm; height: 4mm; padding-left:2mm;padding-right:2mm;border-bottom-color: black; border-bottom-width: 1px; border-bottom-style: dashed;"> 
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/BusinessMilesCnt"/>
							</xsl:call-template>
						</span>
						<span style="width:3mm;"/>
						<span style="font-weight:bold;"> b</span> Commuting (see instructions) 
						<span style="width: 25mm; height: 4mm; padding-left:2mm;padding-right:2mm;border-bottom-color: black; border-bottom-width: 1px; border-bottom-style: dashed;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/CommutingMilesCnt"/>
							</xsl:call-template>
						</span>
						<span style="width:3mm;"/>
						<span style="font-weight:bold;"> c</span> Other 
						<span style="width: 25mm; height: 4mm; padding-left:2mm;border-bottom-color: black; border-bottom-width: 1px; border-bottom-style: dashed;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/OtherMilesCnt"/>
							</xsl:call-template>
						</span>
						</div>
					</div>
					<div style="width:187mm;height:4mm; clear: left; float: left;"/>
					<div style="width:187mm;height:5mm; clear: left; float: left;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:5mm;margin-top:1mm;">9</div>
							<div class="styLNDesc" style="width:156mm;height:5mm;margin-top:1mm;">
								Was your vehicle available for personal use during off-duty hours?
								<span  class="styDotLn" style="float:right;padding-right:1mm;">................</span>
							</div>
							<div class="styLNDesc" style="width:23.5mm;height:5mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$TargetNode/VehicleAvailableOffDutyHrsInd"/>
								</xsl:call-template>
								<input type="checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$TargetNode/VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-right:2mm;height:4.5mm;padding-bottom:1.2mm;">Yes</span>
								</label>
								<input type="checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$TargetNode/VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
									<span style="height:4.5mm;padding-bottom:1.2mm;">No</span>
								</label>
							</div>
					</div>
					<div style="width:187mm;height:1.2mm; clear: left; float: left;"/>
					<div style="width:187mm;height:5mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:5mm;margin-top:1mm;">10</div>
							<div class="styLNDesc" style="width:156mm;height:5mm;margin-top:1mm">
								Do you (or your spouse) have another vehicle available for personal use?
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
							<div class="styLNDesc" style="width:23.5mm;height:5mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleForPrsnlUseInd"/>
								</xsl:call-template>
								<input type="checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-right:2mm;height:4.5mm;padding-bottom:1.2mm;">Yes</span>
								</label>
								<input type="checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
									<span style="height:4.5mm;padding-bottom:1.2mm;">No</span>
								</label>
							</div>
					</div>
					<div style="width:187mm;height:2mm; clear: left; float: left;"/>
					<div style="width:187mm;height:5mm; clear: left; float: left;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:5mm;margin-top:1mm;">11a</div>
							<div class="styLNDesc" style="width:156mm;height:5mm;margin-top:1mm;">
							     Do you have evidence to support your deduction?
							     <span  class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
							</div>
							<div class="styLNDesc" style="width:23.5mm;height:5mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
								</xsl:call-template>
								<input type="checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceToSupportDeductionInd</xsl:with-param>
								</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceToSupportDeductionInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-right:2mm;height:4.5mm;padding-bottom:1.2mm;">Yes</span>
								</label>
								<input type="checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceToSupportDeductionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceToSupportDeductionInd</xsl:with-param>
									</xsl:call-template>
									<span style="height:4.5mm;padding-bottom:1.2mm;">No</span>
								</label>
							</div>
					</div>
					<div style="width:187mm;height:2mm; clear: left; float: left;"/>
					<div style="width:187mm;height:6mm; clear: left; float: left;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:5mm;text-align:right;padding-right:1.5mm;margin-top:1mm;">b</div>
							<div class="styLNDesc" style="width:156mm;height:5mm;margin-top:1mm;">
							    If &#8220;Yes,&#8221; is the evidence written?
							    <span  class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
							</div>
							<div class="styLNDesc" style="width:23.5mm;height:5mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
								</xsl:call-template>
								<input type="checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
									<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceWrittenInd</xsl:with-param>
								</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceWrittenInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-right:2mm;height:4.5mm;padding-bottom:1.2mm;">Yes</span>
								</label>
								<input type="checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceWrittenInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]EvidenceWrittenInd</xsl:with-param>
									</xsl:call-template>
									<span style="height:4.5mm;padding-bottom:1.2mm;">No</span>
								</label>
							</div>
					</div>
	</xsl:template>
</xsl:stylesheet>