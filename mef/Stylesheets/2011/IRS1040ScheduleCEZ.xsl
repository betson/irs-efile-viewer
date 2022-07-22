<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY bull "&#8226;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleCEZStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleCEZ"/>
	<xsl:template match="/">
		<html lang="EN-US">
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
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 2210"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040ScheduleCEZStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2210">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:35mm;height:20mm;padding:bottom:0mm;">
							<span class="styFormNumber" style="font-size:11pt;">
                            SCHEDULE C-EZ<br/>
                            (Form 1040)
                            </span>
							<div class="styAgency" style="padding-top:2mm;">Department of the Treasury<br/>
						Internal Revenue Service (99)
                            </div>
						</div>
						<div class="styFTBox" style="width:121mm;height:20mm;">
							<div class="styMainTitle" style="height:5mm;">Net Profit From Business<br/>
								<span style="font-size:8pt;">(Sole Proprietorship)</span>
							</div>
							<div class="styFBT" stype="font-size:7pt;height:5mm;padding-top:1mm;">
								<img src="{$ImagePath}/1040CEZ_Bullet.gif" alt="MediumBullet"/>  Partnerships, joint ventures, etc., generally must file Form 1065 or 1065-B.<br/>
								<img src="{$ImagePath}/1040CEZ_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040, 1040NR, or 1041.
								<img src="{$ImagePath}/1040CEZ_Bullet.gif" alt="MediumBullet"/> See instructions on page 2.</div>
						</div>
						<div class="styTYBox" style="width:31mm; height:20mm">
							<div style="padding-top:0mm;border-bottom:1 solid black;font:6pt;">OMB No. 1545-0074</div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">11</span></span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">09A</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm; height:8mm">
                    Name of proprietor<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/NameOfProprietor"/>
							</xsl:call-template>
							<br/>
							<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
						</div>
						<b>Social security number (SSN)</b>
						<br/>
						<span style="width:100%;text-align:center;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part I</div>
						<div class="styPartDesc">General Information</div>
					</div>
					<div style="width:187mm;border-bottom:1px solid black;padding:2mm 0px;">
						<img alt="You May Use Schedule C-EZ Instead of Schedule C Only If You:" src="{$ImagePath}/1040CEZ_flowchart_l.gif" width="134" height="158" style="float:left;clear:none;padding-left:1px;"/>
						<div class="styGenericDiv" style="border:1px solid black;padding:4px 4px 6px 8px;width:209px;height:196px;font-family:Arial;font-weight:bold;">
							<span style="font-size:10pt;">&bull;</span> Had business expenses of $5,000 or <br/>
							<span style="width:8px;"/>less.<br/>
							<span style="font-size:10pt;">&bull;</span> Use the cash method of accounting.<br/>
							<span style="font-size:10pt;">&bull;</span> Did not have an inventory at any time <br/>
							<span style="width:8px;"/>during the year.<br/>
							<span style="font-size:10pt;">&bull;</span> Did not have a net loss from your <br/>
							<span style="width:8px;"/>business.<br/>
							<span style="font-size:10pt;">&bull;</span> Had only one business as either a sole <br/>
							<span style="width:8px;"/>proprietor, qualified joint venture, or <br/>
							<span style="width:8px;"/>statutory employee.<br/>
							<span style="font-size:10pt;">&bull;</span> Did not receive any credit card or <br/>
							<span style="width:8px;"/>similar payments that included amounts <br/>
							<span style="width:8px;"/>that are not includible in your income <br/>
							<span style="width:8px;"/>(see instructions for line 1a).
						</div>
						<img alt="And You:" src="{$ImagePath}/1040CEZ_flowchart_r.gif" width="120" height="160" style="float:left;clear:none;margin-top:37px;"/>
						<div class="styGenericDiv" style="border:1px solid black;padding:4px 4px 6px 8px;width:209px;font-family:Arial;font-weight:bold;margin-top:37px;">
							<span style="font-size:10pt;">&bull;</span> Had no employees during the year. <br/>
							<span style="font-size:10pt;">&bull;</span> Are not required to file <span style="font-size:9pt;">Form 4562</span>, <br/>
							<span style="width:8px;"/>Depreciation and Amortization, for <br/>
							<span style="width:8px;"/>this business. See the instructions for <br/>
							<span style="width:8px;"/>Schedule C, line 13, to find out if you <br/>
							<span style="width:8px;"/>must file.<br/>
							<span style="font-size:10pt;">&bull;</span> Do not deduct expenses for business <br/>
							<span style="width:8px;"/>use of your home.<br/>
							<span style="font-size:10pt;">&bull;</span> Do not have prior year unallowed <br/>
							<span style="width:8px;"/>passive activity losses from this <br/>
							<span style="width:8px;"/>business. <br/>
						</div>
					</div>
					<!-- A, B -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
							<div class="styGenericDiv" style="font-weight:bold;width:7mm;text-align:right;margin-right:2mm;">A</div>
							<div class="styGenericDiv" style="width:121.8mm;">
								Principal business or profession, including product or service<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PrincipalBusinessActivity"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="width:56mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;border:2px solid black;">
							<div>
								<span style="width:4mm;text-align:right;margin-right:2mm;">B</span>Enter business code (see page 2)</div>
							<span style="width:100%;text-align:center;font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$FormData/BusinessActivityCode">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessActivityCode"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormData/UnclassifiedBusinessActivityCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/UnclassifiedBusinessActivityCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- C, D -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
							<div class="styGenericDiv" style="font-weight:bold;width:7mm;text-align:right;margin-right:2mm;">C</div>
							<div class="styGenericDiv" style="width:121.8mm;">
								Business name. If no separate business name, leave blank.<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessName"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="width:55mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>
								<span style="width:4mm;text-align:right;margin-right:2mm;">D</span>Enter your EIN (see page 2)
							</div>
							<span style="width:100%;text-align:center;font-weight:normal;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- E -->
					<div style="width:187mm;height:8mm;font-size:7pt;">
						<div style="height:8mm;font-weight:bold;width:7mm;text-align:right;margin-right:2mm;float:left;">E</div>
						<div class="styGenericDiv" style="width:177mm;border-bottom:1px solid black;height:8mm;">
							<div>Business address (including suite or room no.). Address not required if same as on page 1 of your tax return.</div>
							<span>
								<xsl:choose>
									<xsl:when test="$FormData/BusinessUSAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessUSAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="$FormData/BusinessUSAddress/AddressLine2">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/BusinessUSAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:when test="$FormData/BusinessForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessForeignAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="$FormData/BusinessForeignAddress/AddressLine2">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/BusinessForeignAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:8mm;font-size:7pt;">
						<div style="padding-left:10mm;">City, town or post office, state, and ZIP code</div>
						<div style="padding-left:10mm;">
							<xsl:call-template name="PopulateCityStateInfo">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessUSAddress"/>
								<xsl:with-param name="ForeignAddressTargetNode" select="$FormData/BusinessForeignAddress"/>
							</xsl:call-template>
							<xsl:if test="$FormData/BusinessForeignAddress/Country">
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessForeignAddress/Country"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;text-align:right;margin-right:2mm;">F</div>
							<div class="styLNDesc" style="width:145mm;border-bottom:1px solid black;">
								Did you make any payments in 2011 that would require you to file Form(s) 1099 (see the Schedule C <br/>
								<span style="float:left;clear:none;">instructions)</span>
								<span style="letter-spacing:3mm;float:right;clear:none;">..................................</span>
							</div>
							<div class="styLNAmountBox" style="font-weight:bold;text-align:center;border-left:none;"><br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZPaymentRqrFilingForm1099Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:6px;"/>
								<label class="styLbl">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZPaymentRqrFilingForm1099Ind</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:12px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZPaymentRqrFilingForm1099Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:6px;"/>
								<label class="styLbl">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/PaymentRqrFilingForm1099Ind"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZPaymentRqrFilingForm1099Ind</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="width:7mm;text-align:right;margin-right:2mm;">G</div>
							<div class="styLNDesc" style="width:145mm;">
								<span style="float:left;clear:none;">If "Yes," did you or will you file all required Forms 1099?</span>
								<span style="letter-spacing:3mm;float:right;clear:none;">...................</span>
							</div>
							<div class="styLNAmountBox" style="font-weight:bold;text-align:center;border:none;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/RequiredForm1099FiledInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZRequiredForm1099FiledInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:6px;"/>
								<label class="styLbl">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/RequiredForm1099FiledInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZRequiredForm1099FiledInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:12px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/RequiredForm1099FiledInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZRequiredForm1099FiledInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:6px;"/>
								<label class="styLbl">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/RequiredForm1099FiledInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleCEZRequiredForm1099FiledInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>
					<!-- Part II Header -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part II</div>
						<div class="styPartDesc">Figure Your Net Profit</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;">1a</div>
						<div class="styLNDesc" style="width:100.9mm;">
							Merchant card and third party payments. For 2011, enter -0- 
							<span style="margin-left:1mm;letter-spacing:3mm;">.....</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GroMerchantCardThrdPrtyPymtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 1b -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">b</div>
						<div class="styLNDesc" style="width:100.9mm;">
							<span style="float:left;">
								Gross receipts or sales not entered on line 1a (see instructions)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/NotRprtGrossReceiptsOrSalesAmt"/>
								</xsl:call-template>
							</span>
							<span style="letter-spacing:3mm;float:right;clear:none;padding-right:1.5mm;">...</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NotRprtGrossReceiptsOrSalesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- Line 1c -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">c</div>
						<div class="styLNDesc" style="width:100.9mm;">
							Income reported to you on Form W-2 if the "Statutory Employee" <br/>
							box on that form was checked. <b>Caution</b>. See Schedule C instructions <br/>
							<span class="styGenericDiv">before completing this line</span>
							<span style="letter-spacing:3mm;float:right;clear:none;padding-right:1.5mm;">.................</span>
						</div>
						<div class="styLNRightNumBox"><br/><br/>1c</div>
						<div class="styLNAmountBox" style="padding-right:2px;">
							<br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StatuatoryEmployeeW2IncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;"/>
						<div class="styLNAmountBoxNBB" style="height:11mm;"/>
					</div>
					<!-- Line 1d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">d</div>
						<div class="styLNDesc" style="width:140.8mm;">
							Total of lines 1a, 1b, and 1c. If any adjustments to line 1a, you <b>must</b> use Schedule C (see instructions)
						</div>
						<div class="styLNRightNumBox">1d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">2</div>
						<div class="styLNDesc" style="height:4.5mm;width:142mm;">
							<span style="font-weight:bold;">Total expenses</span> (see page 2). If more than $5,000, you <span style="font-weight:bold;">must</span> use Schedule C<span style="letter-spacing:3mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:4.5mm;position:relative;">
							<span style="position:absolute;bottom:0;">2</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm;position:relative;text-align:left;">
							<div style="position:absolute;width:32mm;bottom:0;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherExpensesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;height:14mm;border-bottom:1px black solid;">
						<div class="styLNLeftNumBox" style="height:14mm;padding-left:1mm;width:5mm;">3</div>
						<div class="styLNDesc" style="height:14mm;width:142mm;padding-right:1mm;">
							<span style="font-weight:bold">Net profit.</span> Subtract line 2 from line 1d. If less than zero, you 
							<span style="font-weight:bold">must</span> use Schedule C. Enter on both 
							<span style="font-weight:bold">Form 1040, line 12,</span> and 
							<span style="font-weight:bold">Schedule SE, line 2,</span> or on 
							<span style="font-weight:bold">Form 1040NR, line 13.</span> and 
							<span style="font-weight:bold">Schedule SE, line 2</span> (see instructions).
							(If you entered an amount on line 1c, <span style="font-weight:bold">do not</span> 
							report the amount from line 1c on Schedule SE, line 2.) Estates and trusts, enter on 
							<span style="font-weight:bold">Form 1041, line 3 </span>
							<span style="letter-spacing:3mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="width:7.8mm;height:14mm;border-bottom:none;position:relative;">
							<span style="position:absolute;bottom:0;">3</span>
						</div>
						<div class="styLNAmountBox" style="height:14mm;width:32mm;position:relative;text-align:left;border-bottom:none;">
							<div style="position:absolute;width:32mm;bottom:0;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetProfitAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part III Header -->
					<div class="styBB" style="width:187mm;padding:1mm 0mm;">
						<div class="styPartName" style="font-family:sans-serif;">Part III</div>
						<div class="styPartDesc">Information on Your Vehicle. <span style="font-weight:normal">Complete this part</span> only <span style="font-weight:normal">if you are claiming car or truck expenses on line 2.</span></div>
					</div>
					<xsl:for-each select="$FormData/AdditionalVehicleInfoGrp">
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($FormData/AdditionalVehicleInfoGrp) = 0">
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="$FormData/AdditionalVehicleInfoGrp[1]"/>
						</xsl:call-template>
					</xsl:if>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; font-size:7pt;border-top:1 solid black; padding-top:0.5mm">
						<div style="float:left; font-size:7pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
						Cat. No.14374D
						<span style="width:15mm"/>
						<b style="font-size:7pt">Schedule C-EZ (Form 1040) 2011</b>
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
					<!-- Begin Separated Repeating data table for DependentInformations -->
					<!--xsl:if test="count($FormData/AdditionalVehicleInfoGrp) &gt; 1">
						<span class="styRepeatingDataTitle">Form 1040 Schedule C-EZ Lines 4 - 8b</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col">
									<span style="font-weight:bold;">(4)</span>
										<span class="styNormalText">
										   Date Vehicle Place in Service
									   </span>
									</th>
									<th class="styDepTblCell" scope="col">
										<span style="font-weight:bold;">(5a)</span>
										<span class="styNormalText">
										   Business Miles
									   </span>
									</th>
									<th class="styDepTblCell" scope="col">
										<span style="font-weight:bold;">(5b)</span>
										<span class="styNormalText">
											Commuting Miles
									   </span>
									</th>
									<th class="styDepTblCell" scope="col">
										<span style="font-weight:bold;">(5c)</span>
										<span class="styNormalText">
											Other Miles
										  </span>
									</th>
									<th class="styDepTblCell" scope="col">
										<span style="font-weight:bold;">(6)</span>
										<span class="styNormalText">
											Available for Off Duty Hours
										  </span>
									</th>
									<th class="styDepTblCell" scope="col">
										<span style="font-weight:bold;">(7)</span>
										<span class="styNormalText">
											Another Vehicle
										  </span>
									</th>
									<th class="styDepTblCell" scope="col">
										<span style="font-weight:bold;">(8a)</span>
										<span class="styNormalText">
											Evidence to Support Deduction
										  </span>
									</th>
									<th class="styDepTblCell" scope="col">
										<span style="font-weight:bold;">(8b)</span>
										<span class="styNormalText">
											Evidence Written
										  </span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each  select="$FormData/AdditionalVehicleInfoGrp[position() &gt; 1]">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText">
											<div style="float:left;clear:none;width:5mm;">
												<span style="text-align:right;float:left;width:4.25mm;font-weight:bold;" class="styGenericDiv">
													<xsl:number value="position()" format="1"/>
												</span>
											</div>
											<div style="padding-left:1mm;float:left;clear:none;">
												<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="DateVehiclePlacedInService" />
						</xsl:call-template>-<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="DateVehiclePlacedInService" />
						</xsl:call-template>-<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="DateVehiclePlacedInService" />
						</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText">
											<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BusinessMilesCnt" />
												</xsl:call-template>
										</td>
										<td class="styTableCellText">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CommutingMilesCnt" />
											</xsl:call-template>
										</td>
										<td class="styTableCellText">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherMilesCnt" />												
											</xsl:call-template>	
										</td>
										<td class="styTableCellText">
											<xsl:choose>
												<xsl:when test="AvailableForOffDutyHoursInd='1' or AvailableForOffDutyHoursInd='true'">
											<input type="checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd"/>
												</xsl:call-template>
											</input>
											<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd"/>
											</xsl:call-template>
											Yes</label>
											</xsl:when>
											<xsl:otherwise>
											<input type="checkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd"/>
											</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="AvailableForOffDutyHoursInd"/>
												</xsl:call-template>
												No</label>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText">
										<xsl:choose>
												<xsl:when test="AnotherVehicleInd='1' or AnotherVehicleInd='true'">
											<input type="checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="AnotherVehicleInd"/>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="AnotherVehicleInd"/>
							</xsl:call-template>
							Yes</label>
							</xsl:when>
							<xsl:otherwise>
							<input type="checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="AnotherVehicleInd"/>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="AnotherVehicleInd"/>
							</xsl:call-template>
							No</label></xsl:otherwise></xsl:choose>
										</td>
										<td class="styTableCellText">
										<xsl:choose>
												<xsl:when test="EvidenceToSupportDeductionInd='1' or EvidenceToSupportDeductionInd='true'">
											<input type="checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							</xsl:call-template>
							Yes</label>
							</xsl:when>
							<xsl:otherwise>
							<input type="checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							</xsl:call-template>
							No</label>
							</xsl:otherwise>
							</xsl:choose>
										</td>
										<td class="styTableCellText">
										<xsl:choose>
												<xsl:when test="EvidenceWrittenInd='1' or EvidenceWrittenInd='true'">
											<input type="checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
												</xsl:call-template>
											</input>
											<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
											</xsl:call-template>
											Yes</label>
											</xsl:when>
											<xsl:otherwise>
											<input type="checkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
											</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
												</xsl:call-template>
												No</label></xsl:otherwise></xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if-->
					<!-- End Separated Repeating Dependent data table -->
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="makeRow">
		<xsl:param name="TargetNode"/>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;padding-top:1.75mm;height:4.5mm">4</div>
						<div class="styGenericDiv" style="padding-bottom:3mm;height:4.5mm;width:179mm;">
							<span>When did you place your vehicle in service for business purposes? (month, day, year)</span>
							<span style="width:1mm"></span>
							<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" />
							<span style="width:2mm"></span>
							<span style="border-bottom: 1px solid black;padding-left:1mm;width:30mm;height:4.5mm;padding-top:1.5mm;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$TargetNode/DateVehiclePlacedInService" />
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$TargetNode/DateVehiclePlacedInService" />
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$TargetNode/DateVehiclePlacedInService" />
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">5</div>
						<div class="styLNDesc" style="height:4.5mm;width:180mm;">Of the total number of miles you drove your vehicle during 2011, enter the number of miles you used your vehicle for:</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;width:7mm;height:4.5mm;text-align:right;padding-right:2.5mm;">a</div>
						<div class="styLNDesc" style="height:4.5mm;width:180mm;">
							Business
							<span style="width:1mm"></span>
							<span style="border-bottom:1px solid black;width:20mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$TargetNode/BusinessMilesCnt" />
								</xsl:call-template>
							</span>
							<span style="width:1mm"></span>
							<span style="font-weight:bold;width:4mm;padding-left:1.5mm;padding-right:1.5mm;"> b</span> 
							Commuting (see page 2)
							<span style="width:1mm"></span> 
							<span style="border-bottom:1px solid black;width:20mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$TargetNode/CommutingMilesCnt" />
								</xsl:call-template>
							</span>
							<span style="width:1mm"></span>
							<span style="font-weight:bold;width:4mm;padding-left:1.5mm;padding-right:1.5mm;"> c</span> 
							Other
							<span style="width:1mm"></span>
							<span style="border-bottom:1px solid black;width:20mm"> 
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$TargetNode/OtherMilesCnt" />
								</xsl:call-template>
							</span>
							<span style="width:1mm"></span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">6</div>
						<div class="styLNDesc" style="height:4.5mm;width:179mm;">
						<span style="float:right">
							<input type="checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
							</xsl:call-template>
							Yes</label>
							<input type="checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$TargetNode/AvailableForOffDutyHoursInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
							</xsl:call-template>
							No</label>
						</span>Was your vehicle available for personal use during off-duty hours?<span style="letter-spacing:3mm;">...................</span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">7</div>
						<div class="styLNDesc" style="height:4.5mm;width:179mm;"><span style="float:right">
							<input type="checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AnotherVehicleInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AnotherVehicleInd</xsl:with-param>
							</xsl:call-template>
							Yes</label>
							<input type="checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AnotherVehicleInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$TargetNode/AnotherVehicleInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>AnotherVehicleInd</xsl:with-param>
							</xsl:call-template>
							No</label>
						</span>Do you (or your spouse) have another vehicle available for personal use?<span style="letter-spacing:3mm;">................</span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm">8a</div>
						<div class="styLNDesc" style="height:4.5mm;width:179mm;">
						<span style="float:right">
							<input type="checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
							</xsl:call-template>
							Yes</label>
							<input type="checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceToSupportDeductionInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
							</xsl:call-template>
							No</label>
						</span>Do you have evidence to support your deduction?<span style="letter-spacing:3mm;">.........................</span>
						</div>
					</div>
					<div style="width:187mm;height:4.5mm;"/>
					<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:7mm;height:4.5mm;text-align:right;padding-right:2mm;">b</div>
						<div class="styLNDesc" style="height:4.5mm;width:179mm;">
						<span style="float:right">
							<input type="checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceWrittenInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceWrittenInd</xsl:with-param>
							</xsl:call-template>
							Yes</label>
							<input type="checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceWrittenInd</xsl:with-param>
							</xsl:call-template>
							</input>
							<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$TargetNode/EvidenceWrittenInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCEZVehicle<xsl:value-of select="position()"/>EvidenceWrittenInd</xsl:with-param>
							</xsl:call-template>
							No</label>
						</span>If "Yes," is the evidence written?<span style="letter-spacing:3mm;">...............................</span>
						</div>
					</div>
	</xsl:template>
</xsl:stylesheet>
