<?xml version="1.0" encoding="UTF-8"?>
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
		<html>
			<head>
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
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:23mm;">
						<div class="styFNBox" style="width:42mm;height:23mm;">
							<div style="padding-top:1mm;">
            Form<span class="styFormNumber"> 2106-EZ<br/>
								</span>
							</div>
							<div style="padding-top:3.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:108mm;height:23mm;">
							<div style="height:8mm;padding-top:2mm;" class="styMainTitle">Unreimbursed Employee Business Expenses</div>
							<div class="styFBT" style="height:4mm;">
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" /> Attach to Form 1040 or Form 1040NR.<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:36mm;height:23mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:7mm;font-size:22pt;">2012</div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">
								Attachment<br/>
								Sequence No. <span class="styBoldText">129A</span>
							</div>
						</div>
					</div>
					<!--Name Line -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:80mm;height:8mm;font-size:7pt;font-weight:normal;">
          Your Name<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Name"/>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:59mm;height:8mm;font-size:7pt;font-weight:normal;padding-left:1mm">
						Occupation in which you incurred expenses<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Occupation"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;height:8mm;padding-left:1mm;font-size:7pt;font-weight:bold;">
          Social security number<br/>
							<span style="width: 40mm; text-align: center;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Note Line -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<span style="font-weight:bold;line-height:5mm;">You Can Use This Form Only if All of the Following Apply.</span>
<li>You are an employee deducting ordinary and necessary expenses attributable to your job. An ordinary expense is one that is
common and accepted in your field of trade, business, or profession. A necessary expense is one that is helpful and appropriate for
your business. An expense does not have to be required to be considered necessary.</li>
<li>You <span style="font-weight:bold">do not</span> get reimbursed by your employer for any expenses (amounts your employer included in box 1 of your Form W-2 are not
considered reimbursements for this purpose).</li>
<li>If you are claiming vehicle expense, you are using the standard mileage rate for 2012.</li><br/>
<span style="font-weight:bold">Caution:</span> <span style="font-style:italic;">You can use the standard mileage rate for 2012 <span style="font-weight:bold">only if: (a)</span> you owned the vehicle and used the standard mileage rate for the first year
you placed the vehicle in service, <span style="font-weight:bold">or (b)</span> you leased the vehicle and used the standard mileage rate for the portion of the lease period after 1997.</span>
					</div>
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part I</div>
						<div class="styPartDesc">Figure Your Expenses</div>
					</div>
					<!-- END PART I TITLE -->
					<!-- spacer row -->
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<div style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBox" style="height:6mm;padding-left:1mm;width:5mm;">1</div>
						<div class="styLNDesc" style="height:6mm;width:132mm;padding-right:2mm;">Complete Part II. Multiply line 8a by 55.5¢ (.555). Enter the result here
<span style="letter-spacing:3mm;">.........</span></div>
						<div class="styLNRightNumBox" style="width:8mm;height:6mm;position:relative;"><span style="position:absolute;bottom:0;">1</span></div>
						<div class="styLNAmountBox" style="height:6mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/VehicleExpenseAmt" />
							</xsl:call-template></div>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<div style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;">2</div>
						<div class="styLNDesc" style="height:8mm;width:132mm;padding-right:2mm;">Parking fees, tolls, and transportation, including train, bus, etc., that <span style="font-weight:bold">did not</span> involve overnight travel or commuting to and from work<span style="letter-spacing:3mm;">......................</span></div>
						<div class="styLNRightNumBox" style="width:8mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">2</span></div>
						<div class="styLNAmountBox" style="height:8mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ParkingFeesTollsLocalTransAmt" />
							</xsl:call-template></div>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<div style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;">3</div>
						<div class="styLNDesc" style="height:8mm;width:132mm;padding-right:2mm;">Travel expense while away from home overnight, including lodging, airplane, car rental, etc. <span style="font-weight:bold">Do not</span> include meals and entertainment<span style="letter-spacing:3mm;">.......................</span></div>
						<div class="styLNRightNumBox" style="width:8mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">3</span></div>
						<div class="styLNAmountBox" style="height:8mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TravExpnsLessMealsEntrmtAmt" />
							</xsl:call-template></div>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<div style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;">4</div>
						<div class="styLNDesc" style="height:8mm;width:132mm;padding-right:2mm;">Business expenses not included on lines 1 through 3. <span style="font-weight:bold;">Do not</span> include meals and
entertainment<span style="letter-spacing:3mm;">............................</span></div>
						<div class="styLNRightNumBox" style="width:8mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">4</span></div>
						<div class="styLNAmountBox" style="height:8mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusExpnssLessMealsEntrmtAmt" />
							</xsl:call-template></div>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<div style="width:187mm;height:12mm;">
						<div class="styLNLeftNumBox" style="height:12mm;padding-left:1mm;width:5mm;">5</div>
						<div class="styLNDesc" style="height:12mm;width:132mm;padding-right:2mm;">Meals and entertainment expenses: $
							<span style="padding-left:1mm;padding-right:1mm;width:6mm;border-bottom:1px solid black;text-align:right"> 
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntrmtExpnssAmt"/>
								</xsl:call-template>
							</span>
						 × 50% (.50). (Employees subject to
						Department of Transportation (DOT) hours of service limits: Multiply meal expenses incurred
						while away from home on business by 80% (.80) instead of 50%. For details, see instructions.)
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:12mm;position:relative;"><span style="position:absolute;bottom:0;">5</span></div>
						<div class="styLNAmountBox" style="height:12mm;width:41mm;position:relative;text-align:left;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MealsAndEntrmtExpnssAllwblAmt" />
							</xsl:call-template></div>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNDesc" style="width:137mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:42mm;height:4.5mm;border-bottom:none;"/>
					</div>
					<div style="width:187mm;height:15mm;">
						<div class="styLNLeftNumBox" style="height:15mm;padding-left:1mm;width:5mm;">6</div>
						<div class="styLNDesc" style="height:15mm;width:132mm;padding-right:2mm;"><span style="font-weight:bold">Total expenses.</span> Add lines 1 through 5. Enter here and on <span style="font-weight:bold">Schedule A (Form 1040), line 21</span> (or
on <span style="font-weight:bold">Schedule A (Form 1040NR), line 9)</span>. (Armed Forces reservists, fee-basis state or local
government officials, qualified performing artists, and individuals with disabilities: See the
instructions for special rules on where to enter this amount.)<span style="letter-spacing:3mm;">....................</span></div>
						<div class="styLNRightNumBox" style="width:8mm;height:15mm;border-bottom:none;position:relative;"><span style="position:absolute;bottom:0;">6</span></div>
						<div class="styLNAmountBox" style="height:15mm;width:41mm;position:relative;text-align:left;border-bottom:none;">
							<div style="position:absolute;width:41mm;bottom:0;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt" />
							</xsl:call-template></div>
						</div>
					</div>
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;border-top:1px solid black;">
						<div class="styPartName" style="font-family:sans-serif;">Part II</div>
						<div class="styPartDesc">Information on Your Vehicle. <span style="font-weight:normal">Complete this part</span> only <span style="font-weight:normal">if you are claiming vehicle expense on line 1.</span></div>
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
					<div class="pageEnd" style="width:187mm; font-size:7pt;border-top:2px solid black; padding-top:0.5mm">
						<div style="float:left; font-size:7pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No.20604Q
						<span style="width:15mm"/>
						Form <b style="font-size:9pt">2106-EZ</b> (2012)
						</div>
					</div>
					<!--END Page Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Additional Data Table -->
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="makeRow">
		<xsl:param name="TargetNode"/>
		<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">7</div>
						<div class="styLNDesc" style="height:4.5mm;width:132mm;">When did you place your vehicle in service for business use? (month, day, year) <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" />
						<span style="padding-left:2mm;text-decoration:underline">
							<xsl:call-template name="PopulateMonth">
								<xsl:with-param name="TargetNode" select="$TargetNode/VehiclePlacedInServiceDt" />
							</xsl:call-template>/<xsl:call-template name="PopulateDay">
								<xsl:with-param name="TargetNode" select="$TargetNode/VehiclePlacedInServiceDt" />
							</xsl:call-template>/<xsl:call-template name="PopulateYear">
								<xsl:with-param name="TargetNode" select="$TargetNode/VehiclePlacedInServiceDt" />
							</xsl:call-template>
						</span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">8</div>
						<div class="styLNDesc" style="height:4.5mm;width:180mm;">Of the total number of miles you drove your vehicle during 2012, enter the number of miles you used your vehicle for:</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;text-align:right;padding-right:1.5mm;">a</div>
						<div class="styLNDesc" style="height:4.5mm;width:180mm;">Business
						<span style="padding-left:2mm;padding-right:2mm;text-decoration:underline"> 
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/BusinessMilesCnt" />
							</xsl:call-template>
						</span>
						<span style="font-weight:bold;"> b</span> Commuting (see instructions) 
						<span style="padding-left:2mm;padding-right:2mm;text-decoration:underline">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/CommutingMilesCnt" />
							</xsl:call-template>
						</span>
						<span style="font-weight:bold;"> c</span> Other 
						<span style="padding-left:2mm;text-decoration:underline">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode/OtherMilesCnt" />
							</xsl:call-template>
						</span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;margin-top:1mm;">9</div>
							<div class="styLNDesc" style="width:157.5mm;height:4.5mm;margin-top:1mm;">
							Was your vehicle available for personal use during off-duty hours?
							<span style="letter-spacing:3mm;">...................</span>
							</div>
							<div class="styLNDesc" style="width:22.5mm;height:4.5mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
								</xsl:call-template>
								<input type="checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-right:2mm;height:4.5mm;padding-bottom:1.2mm;">Yes</span>
								</label>
								<input type="checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
									<span style="height:4.5mm;padding-bottom:1.2mm;">No</span>
								</label>
							</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;margin-top:1mm;">10</div>
							<div class="styLNDesc" style="width:157.5mm;height:4.5mm;margin-top:1mm">
								Do you (or your spouse) have another vehicle available for personal use?
								<span style="letter-spacing:3mm;">.................</span>
							</div>
							<div class="styLNDesc" style="width:22.5mm;height:4.5mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
								</xsl:call-template>
								<input type="checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
									<span style="padding-right:2mm;height:4.5mm;padding-bottom:1.2mm;">Yes</span>
								</label>
								<input type="checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
										<xsl:with-param name="BackupName">IRS2106EZVehicle[<xsl:number value="position()"/>]AnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
									<span style="height:4.5mm;padding-bottom:1.2mm;">No</span>
								</label>
							</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;margin-top:1mm;">11a</div>
							<div class="styLNDesc" style="width:157.5mm;height:4.5mm;margin-top:1mm;">Do you have evidence to support your deduction?
							<span style="letter-spacing:3mm;">.........................</span>
							</div>
							<div class="styLNDesc" style="width:22.5mm;height:4.5mm">
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
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;text-align:right;padding-right:1.5mm;margin-top:1mm;">b</div>
							<div class="styLNDesc" style="width:157.5mm;height:4.5mm;margin-top:1mm;">If “Yes,” is the evidence written?
							<span style="letter-spacing:3mm;">..............................</span>
							</div>
							<div class="styLNDesc" style="width:22.5mm;height:4.5mm;">
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
