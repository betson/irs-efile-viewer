<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleFStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040ScheduleFData" select="$RtnDoc/IRS1040ScheduleF"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040ScheduleFData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040ScheduleF"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 1040ScheduleF CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS1040ScheduleFStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1040ScheduleF">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<!-- put comment here -->
					<div class="styBB" style="width:187mm;height:20mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;">
							<div style="padding-top:1mm;">
								<span class="styFormNumber" style="font-size:9pt;">SCHEDULE F</span>
								<br/>
								<span class="styFormNumber" style="font-size:9pt;padding-top:2mm;">(Form 1040)</span>
							</div>
							<div style="padding-top:4mm;">
								<span class="styAgency">Department of the Treasury</span>
								<!--  puch pen -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData"/>
								</xsl:call-template>
								<br/>
								<span class="styAgency">Internal Revenue Service <span style="width:3mm"/> (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:20mm; padding-top:2mm;">
							<div class="styMainTitle" style="height:6mm;">Profit or Loss From Farming</div>
							<br/>
							<div class="styFBT" style="height:5mm;padding-top:2mm;">
								<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/> Attach to Form 1040, Form 1040NR, Form 1041, Form 1065, or Form 1065-B.
																<br/>
								<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/> See Instructions for Schedule F (Form 1040).<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
							<div class="styTaxYear">
          20<span class="styTYColor">11</span>
							</div>
							<div style="margin-left:3mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">14</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Start Name and ID number  -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
        Name of proprietor<br/>
							<xsl:choose>
								<xsl:when test="$Form1040ScheduleFData/NameOfFarmProprietor/BusinessNameLine1!='' ">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/NameOfFarmProprietor/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/NameOfFarmProprietor/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/ReturnType='1040'">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
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
						</div>
						<div class="styEINBox" style="width:45mm;height:8mm;font-size:7pt;padding-left:2mm;font-weight:normal; text-align:center;">
							<b>Social security number (SSN)</b>
							<br/>
							<br/>
							<xsl:choose>
								<xsl:when test="$Form1040ScheduleFData/SSN!='' ">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/ReturnType='1040'">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--    ****************************************************    -->
					<table class="styBB" style="width:187mm;">
						<tr style="vertical-align:top;border-right-width:0;">
							<th>
								<td class="styNameBox" style="width:40mm;font-size:7pt;border-right-width: 0px;">
									<span class="styLNLeftNumBox" style="width:3mm;padding-left: 0px">A</span>
									<span style="width:4px;"/>Principal crop or activity<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/PrincipalProduct"/>
									</xsl:call-template>
								</td>
								<td style="vertical-align:top;padding-top:0;">
									<span class="styForm1040ScheduleFEINFullBox" style="width:47mm;float:left;height:10mm;
						vertical-align:top;">
										<span class="styLNLeftNumBox" style="width:4mm;">B</span>
										<span style="width:2px;"/>
										<span style="padding-top:2.5mm;">Enter code from Part IV</span>
										<br/>
										<span style="padding-left:4mm;">
											<img src="{$ImagePath}/1040SchF_Bullet_Lg.gif" alt="Bullet Image"/>
										</span>
										<span class="styEINFld" style="width:30mm;font-size:6pt; text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AgriculturalActivityCode"/>
											</xsl:call-template>
										</span>
									</span>
								</td>
								<td class="styNameBox" style="border-right-width:0;vertical-align:top;width:46mm;
						padding-left:2mm;font-size:7pt;">
									<span class="styLNLeftNumBox" style="width:4mm;padding-left:2mm;">C</span>
						Accounting method:<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodCash"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodCash</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodCash"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodCash</xsl:with-param>
										</xsl:call-template>
          Cash
        </label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodAccrual"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodAccrual</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/AccountingMethodAccrual"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodAccrual</xsl:with-param>
										</xsl:call-template>
          Accrual
        </label>
								</td>
								<td style="border-left:1px solid black;vertical-align:top;">
									<span class="styEINBox" style="width:46mm;font-size:7pt;">
										<span class="styLNLeftNumBox" style="border-left-width:1px solid black;
							width:3mm;font-size:6pt;font-weight:bold;padding-left:1.5mm;">D</span>
										<span style="width:2px;"/>
										<span style="font-size:6pt;font-weight:bold;">Employer ID number (EIN), if any</span>
										<br/>
										<br/>
										<span class="styEINFld" style="width:45mm; text-align:center;font-weight:normal;">
											<xsl:choose>
												<xsl:when test="normalize-space($Form1040ScheduleFData/EIN) != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="normalize-space($Form1040ScheduleFData/MissingEINReason) != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MissingEINReason"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</span>
								</td>
							</th>
						</tr>
					</table>
					<!--    ****************************************************    -->
					<!-- stop here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:3mm;padding-top:1mm;padding-left: 0px">E</div>
						<div class="styLNDesc" style="width:152mm;height:4.5mm;padding-top:1.5mm;">
        Did you "materially participate" in the operation of this business during 2011? If "No," see instructions for limit on passive losses.          
      </div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<br/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
									<xsl:with-param name="BackupName">Materially Participate Indicator Yes Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
									<xsl:with-param name="BackupName">Materially Participate Indicator Yes Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         Yes
        </label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<span style="width:5mm;"/>
							<br/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
									<xsl:with-param name="BackupName">Materially Participate Indicator No Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/MateriallyParticipateIndicator"/>
									<xsl:with-param name="BackupName">Materially Participate Indicator No Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         No
        </label>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:3mm;padding-top:1mm;padding-left: 0px">F</div>
						<div class="styLNDesc" style="width:152mm;height:4.5mm;padding-top:1.5mm;">
Did you make any payments in 2011 that would require you to file Form(s) 1099 (see page F-3 of the instructions) 

      </div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind Yes Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind Yes Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         Yes
        </label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<span style="width:5mm;"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind No Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind No Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         No
        </label>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:3mm;padding-top:1mm;padding-left: 0px">G</div>
						<div class="styLNDesc" style="width:152mm;height:4.5mm;padding-top:1.5mm;">
If "Yes," did you or will you file all required Forms 1099?  						
						
					
    </div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind Yes Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind Yes Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         Yes
        </label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<span style="width:5mm;"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind No Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind No Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         No
        </label>
						</div>
					</div>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Farm Income&#8212;Cash Method.
							<span style="font-weight:normal;font-size:7pt;">Complete Parts I and II (Accrual method. Complete Parts II and III, and Part I, line 9.)</span>
						</div>
					</div>
					<!-- END Part I Title -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">1a</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left;">
         Specified sales of livestock and other resale items (see page F-3)    
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1a</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/SalesOfLivestockBghtForResale"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left">
        Sales of livestock and other resale items not reported on line 1a   
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/SalesOfLivestockNotReportedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left">
        Total.  
         <!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1c</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/TotSlsOfLvstckBghtForResaleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left">
        Cost or other basis of livestock or other items reported on line 1c  
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1d</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CostOfLivestockBoughtForResale"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						Subtract line 1d from line 1c
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1e</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/PurchasedProfit"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">2a</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						Specified sales of products you raised (see page F-3)

						</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">2a</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/SalesOfProductsRaised"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
Sales of products you raised not reported on line 2a
        <!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">2b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/SalesOfProductsRaisedNotRptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">3a</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
            Cooperative distributions (Form(s) 1099-PATR)</div>
						<div class="styLNRightNumBox" style="height:4mm;">3a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CooperativeDistributions"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 3b</span>
							<span style="width:8px;"/>
         Taxable amount
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">3b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CooperativeDistriTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">4a</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">Agricultural program payments (see page F-3)</div>
						<div class="styLNRightNumBox" style="height:4mm;">4a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/AgriculturalProgramPayments"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 4b</span>
							<span style="width:8px;"/>
         Taxable amount
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">4b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/AgriculturalProgramPymtTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">5a</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						Commodity Credit Corporation (CCC) loans reported under election
        <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansReportedUnderElection"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5a</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansReportedUnderElection"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
						CCC loans forfeited
						</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5b</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansForfeited"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText">5c</span>
							<span style="width:8px;"/>
         Taxable amount
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">5c</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CCCLoansForfeitedTaxableAmount"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
						<div class="styLNDesc" style="width:139mm;height:4;">Crop insurance proceeds and federal crop disaster payments (see page F-3):        
      </div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
						Amount received in 2011
						</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">6a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CropInsProceedsAndDisasterPymt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 6b</span>
							<span style="width:8px;"/>
         Taxable amount
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">6b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CropInsProcAndDsstrPymtTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:80mm;height:4mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/ElectionToDeferCropInsProc"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFElectionToDeferCropInsProc</xsl:with-param>
								</xsl:call-template>
          If election to defer to 2012 is attached, check here
          <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/ElectionToDeferCropInsProc"/>
								</xsl:call-template>
								<span style="width:5px;"/>
							</label>
							<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
							<span style="width:2px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/ElectionToDeferCropInsProc"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFElectionToDeferCropInsProc</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc" style="width:59mm;height:4mm;">
							<span style="width:35px;"/>
							<span class="styBoldText"> 6d</span>
							<span style="width:8px;"/>
							<!--<span style="float:left">-->
         Amount deferred from 2010
         <!--Dotted Line-->
							<!--		</span>
<span class="styDotLn" style="float:right;padding-right:1mm;">.</span> -->
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">6d</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CropInsProcDeferredFromPrevTY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">7a</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						Specified custom hire (machine work) income (see page F-3)
        <!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">7a</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CustomHireIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						Custom hire income not reported on line 7a
        <!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">7b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/CustomHireIncomeNotReportedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">8a</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						Specified other income (see page F-3)
        <!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8a</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/SpecifiedOtherFarmIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						Other income not reported on line 8a (see page F-3)
        <!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/OtherFarmIncomeNotReportedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span class="styBoldText">Gross income. </span>
							Add amounts in the right column (lines 1e, 2a, 2b, 3b, 4b, 5a, 5c, 6b, 6d, 7a, 7b, 8a, and
							 <span style="float:left">
							8b).  If you use the accrual method, enter the amount from Part III, line 50
</span>
							<span style="float:right;padding-right:0mm;">
								<span class="styDotLn" style="padding-right:1mm;">.........</span>
								<!--								<span style="padding-right:0mm;">
									<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
								</span>-->
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;">
							<br/>
     9
      </div>
						<div class="styLNAmountBoxNBB" style="height:8mm;">            
            &#160;<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeCashMethod/GrossIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Part II Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Farm Expenses&#8212;Cash and Accrual Method.
							<span style="font-weight:normal;"> Do not include personal or living expenses (see page F-4).</span>
						</div>
					</div>
					<!-- END Part II Title -->
					<!-- BEGIN Part II Line Items -->
					<div class="styBB" style="width:187mm;clear:both;">
						<!-- BEGIN Left Side Table of Part II-->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styLNLeftNumBox" style="width:4mm;vertical-align:top;">10</td>
									<td class="styGenericDiv" style="width:52mm;vertical-align:top;" colspan="2">
              Car and truck expenses (see page F-5). Also attach
										<!--<span style="float:left">-->
										<span class="styBoldText" style="float:left">
											<b>Form</b> 4562</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="styLNRightNumBox">
              10
            </td>
									<td class="styLNAmountBox" style="border-right-width:1px;vertical-align:bottom;">
            &#160;
                <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/CarAndTruckExpenses"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="width:4mm;">11</td>
									<td class="styGenericDiv" style="width:52mm" colspan="2">
										<span style="float:left">
									Chemicals
              <!--Dotted Line-->
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="styLNRightNumBox">
              11
            </td>
									<td class="styLNAmountBox" style="border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/ChemicalsExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="vertical-align:top;width:4mm;">12</td>
									<td class="styGenericDiv" style="width:52mm" colspan="2">
              Conservation expenses (see 
              <span style="float:left">
              page F-5)
              <!--Dotted Line-->
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="styLNRightNumBox">
              12
            </td>
									<td class="styLNAmountBox" style="border-right-width:1px;vertical-align:bottom;">
            &#160;
            <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/ConservationExpenses"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">13</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Custom hire (machine work)
									</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              13
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/CustomHireExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="vertical-align:top;width:4mm;">14</td>
									<td class="styGenericDiv" style="width:52mm;" colspan="2">
									Depreciation and section 179
									<span style="float:left">
									 expense (see page F-5)
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox">
              14
            </td>
									<td class="styLNAmountBox" style="border-right-width:1px;">
            &#160;<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/DeprecAndSect179ExpnsDeduction"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;">15</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Employee benefit programs 
<span style="float:left">
									other than on line 23
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              15
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
            &#160;<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/EmployeeBenefitProgramExpenses"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">16</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Feed
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              16
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/FeedPurchasedExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">17</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Fertilizers and lime
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              17
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/FertilizerAndLimeExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">18</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span style="float:left">									
									Freight and trucking
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              18
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/FreightAndTruckingExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">19</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Gasoline, fuel, and oil
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              19
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/GasolineFuelAndOilExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">20</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Insurance (other than health)
              </span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              20
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/InsuranceExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">21</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Interest:              
            </td>
									<td class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNRightNumBoxNBB" style="width=8mm;height:4.5mm;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;padding-left:4mm;width:4mm;">a</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Mortgage (paid to banks, 
									<span style="float:left">
									etc.)
            <span style="width:1px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/MortgageInterestExpenses"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              21a
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px; vertical-align: bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/MortgageInterestExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;width:4mm;">b</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Other
              <span style="width:1px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherInterestExpenses"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">
              21b
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherInterestExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:8.5mm;vertical-align:top;width:4mm;">22</td>
									<td class="styGenericDiv" style="width:52mm;height:8.5mm" colspan="2">Labor hired (less employment 
									<span style="float:left">
									credits)
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:8.5mm;border-bottom-width:0px;">
              22
            </td>
									<td class="styLNAmountBox" style="vertical-align:bottom;height:8.5mm;border-right-width:1px;border-bottom-width:0px;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/LaborHiredExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side table of Part II-->
						<!-- BEGIN Right Side table of Part II-->
						<table class="styTable" style="width:92.25mm;float:right;clear:none;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;">23</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
            Pension and profit-sharing
<span style="float:left">            
            plans 
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
            23
          </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/PensionAndPrftSharingExpenses"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">24</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Rent or lease (see page F-6):              
            </td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;padding-left:4mm;width:4mm;">a</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Vehicles, machinery, equipment
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              24a
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/VehMachAndEquipRentLeaseExpnss"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="height:4.5mm;width:4mm;padding-left:4mm;">b</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Other (land, animals, etc.)
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              24b
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherRentOrLeaseExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">25</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Repairs and maintenance
	</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              25
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/RepairsAndMaintenanceExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">26</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Seeds and plants
	</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              26
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SeedsAndPlantsExpnss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">27</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Storage and warehousing
	</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              27
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/StorageAndWarehousingExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">28</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Supplies
              </span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              28
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SuppliesExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">29</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Taxes
              </span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              29
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/TaxesExpense"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">30</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<span style="float:left">
									Utilities
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              30
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/UtilitiesExpenses"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;">31</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
									Veterinary, breeding, and 
									<span style="float:left">
									medicine
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
              31
            </td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/VtrnryBreedingMedicineExpenses"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 32-->
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">32</td>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">Other expenses (specify):              
            </td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<xsl:if test="($Print != $Separated) or (count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &lt;= 5) ">
									<xsl:for-each select="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense">
										<tr>
											<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;">
												<xsl:call-template name="AddPositionNumber"/>
												<xsl:if test="position() = 6 and 
not($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss)">
                  f
                  </xsl:if>
											</td>
											<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
												<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;">
													<xsl:if test="position() = last() and 
													count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense)&gt; 5">
														<xsl:attribute name="class">styGenericDiv</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Description"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
												<xsl:if test="position() = last() and 
												count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt;5">
													<xsl:attribute name="class">styLNRightNumBoxNBB</xsl:attribute>
												</xsl:if>
												<xsl:if test="position() &lt;= 5">
                  32
                  <xsl:call-template name="AddPositionNumber"/>
												</xsl:if>
												<xsl:if test="position() = 6 and not($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss)">
												32f
                   <span style="background-color:yellow;">32f</span>
												</xsl:if>
												<span style="width:1px;"/>
											</td>
											<td class="styLNAmountBox" style="height:5.2mm;width:31.5mm;vertical-align:bottom;">
												<xsl:if test="position() = last() and count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense)&gt; 5">
													<xsl:attribute name="class">styLNAmountBoxNBB</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amount"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
										</tr>
										<xsl:if test="position() = 5 and $Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss">
                        </xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!--Filler rows when there are no elements or the element does not exist-->
								<!-- Other Filler rows-->
								<xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &lt; 1 or ((count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">a</td>
										<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                32a
              </td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &lt; 2 or ((count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">b</td>
										<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                32b
              </td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &lt; 3 or ((count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">c</td>
										<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                32c
              </td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &lt; 4 or ((count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">d</td>
										<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                32d
              </td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &lt; 5 or ((count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">e</td>
										<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">
                32e
              </td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &lt;5">
                       </xsl:if>
								<xsl:if test="((count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">f</td>
										<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
											<span style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;border-bottom-width:0px">
                32f
              </td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width:0px;vertical-align:bottom;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($Print != $Separated)">
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">
              f
            </td>
										<td class="styGenericDiv" style="width:50mm;height:4.5mm;vertical-align:top;" colspan="2">
											<span class="styGenericDiv" style="width: 37mm;float:none;text-align:left;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss/@section263AIndicator"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styLNRightNumBoxNBB" style="vertical-align:top;height:4.5mm;width:7.25mm;border-top-width: 0px">
              32f
            </td>
										<td class="styLNAmountBoxNBB" style="vertical-align:top;height:6.5mm;width:31.5mm;border-top-width: 0px;">
											<xsl:if test="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss"/>
											</xsl:call-template>
											<xsl:if test="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss"/>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<!-- END Right Side Table of Part II-->
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">33</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">
								<span class="styBoldText">Total expenses. </span>
        Add lines 10 through 32f. If line 32f is negative, see instructions     
</span>
							<span style="float:right;padding-right:0mm;">
								<span class="styDotLn" style="padding-right:2.2mm;">.......</span>
								<span style="padding-right:0mm;">
									<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">      
        33
      </div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/TotalExpenses"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">34</div>
						<div class="styLNDesc" style="width: 139mm; height:8mm;">
							<span class="styBoldText">Net farm profit or(loss). </span>
              Subtract line 33 from line 9.  If a profit, stop here and see instructions for where 
              <span style="float:left">
              to report.  If a loss, complete lines lines 35 and 36.
              <xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part II Line 34 - Passive activity loss literal code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/PassiveActivityLossLiteralCd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">      
        34
      </div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/NetFarmProfitOrLoss"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">35</div>
						<div class="styLNDesc" style="height:4.5mm;">
Did you receive a subsidy in 2011? (see page F-7) 
							<span style="width:10px"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         Yes
        </label>
							<span style="width:5mm;"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
         No
        </label>
						</div>
					</div>
					<!--  ************************************End of line 35 ********************************* -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc" style="width:145mm;">
Check the box that describes your investment in this activity and see page F-7 for where to report your loss.
						<div class="styLNDesc" style="width:70mm;height:4mm;">
								<span class="styBoldText">36a</span>
								<span style="width:4px"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/AllInvestmentIsAtRisk"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFAllInvestmentIsAtRisk</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/AllInvestmentIsAtRisk"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFAllInvestmentIsAtRisk</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<span style="font-family: Arial Narrow; font-size: 8pt;">All investment is at risk. </span>
								</label>
							</div>
							<div class="styLNDesc" style="width:70mm;height:4mm;">
								<span style="width:20mm;"/>
								<span class="styBoldText">36b</span>
								<span style="width:4px"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SomeInvestmentIsNotAtRisk"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFSomeInvestmentIsNotAtRisk</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/SomeInvestmentIsNotAtRisk"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFSomeInvestmentIsNotAtRisk</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<span style="font-family: Arial Narrow; font-size: 8pt;">Some investment is not at risk.</span>
								</label>
							</div>
						</div>
					</div>
					<!-- Page Break-->
					<!-- Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions. </span>
							<span style="width:80px;"/>                        
        Cat. No. 11346H 
      </div>
						<div style="float:right;">
							<span style="width:20px;"/>
							<span class="styBoldText">Schedule F (Form 1040) 2011 </span>
						</div>
					</div>
					<!--Begin Page 2 -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Schedule F (Form 1040) 2011 <span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span>
						</div>
					</div>
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Farm Income&#8212;Accrual Method <span class="styNormalText">(see page F-7). </span>
						</div>
					</div>
					<!-- END Part III Title -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">37a</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">        
         Specified sales of livestock, produce, grains, and other products (see page F-4) 
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">      
       37a
      </div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/SalesOfProducts"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">       
         Sales of livestock, produce, grains, and other products not reported on line 37a  
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">      
       b
      </div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/SalesOfProductsNotReportedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">38a</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">Cooperative distributions (Form(s) 1099-PATR)
  
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">38a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CooperativeDistributions"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 38b</span>
							<span style="width:8px;"/>
         Taxable amount
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">38b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CooperativeDistriTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm;"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">39a</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
						Agricultural program payments
	     	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">39a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/AgriculturalProgramPayments"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 39b</span>
							<span style="width:8px;"/>
         Taxable amount
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">39b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/AgriculturalProgramPymtTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">40</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">Commodity Credit Corporation (CCC) loans:        
      </div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">a</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
						CCC loans reported under election
        <span style="width:1px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansReportedUnderElection"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5.25mm;">40a</div>
						<div class="styLNAmountBox" style="height:5.25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansReportedUnderElection"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
CCC loans forfeited
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">40b</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansForfeited"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText">40c</span>
							<span style="width:8px;"/>
         Taxable amount
      </div>
						<div class="styLNRightNumBox" style="height:4mm;">40c</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CCCLoansForfeitedTaxableAmount"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">41</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">
         Crop insurance proceeds        
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">      
        41
      </div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CropInsuranceProceeds"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height8mm;">42a</div>
						<div class="styLNDesc" style="width: 139mm; height:8mm;">        
         Specified custom hire (machine work) income from merchant card or third party payments (see page
         
<span style="float:left">
          F-4)
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;">
							<br/>42a</div>
						<div class="styLNAmountBox" style="height:8mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CustomHireIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">     
Other custom hire income not reported on line 42a
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox">b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CustomHireIncomeNotReportedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">43a</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">          
Specified other income (see page F-4)
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">      
       43a
      </div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/SpecifiedOtherFarmIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">        
Other income not reported on line 43a
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/OtherFarmIncomeNotReportedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">44</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">        
        Add amounts in the right column for lines 37a through 43b (lines 37a, 37b, 38b, 39b, 40a, 40c, 41,
        <span style="float:left">
          42a, 42b, 43a, and 43b) 
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;">
							<br/>44</div>
						<div class="styLNAmountBox" style="height:8mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/TotalIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">45</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
        Inventory of livestock, produce, grains, and other products at beginning of 
        <span style="float:left">
        the year.  Do not include sales reported on Form 4797.  
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;">
							<br/>45</div>
						<div class="styLNAmountBox" style="height:8mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/InventoryOfProductsAtBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">46</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
        Cost of livestock, produce, grains, and other products purchased during
        <span style="float:left">
         the year
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;">
							<br/>46</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;">
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CostOfProductsPrchsDuringYear"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">
						47</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left">
        Add lines 45 and 46    
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
							47</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/InventoryAtBOYPlusCostOfPrchs"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">
						48</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left">
        Inventory of livestock, produce, grains, and other products at end of year 
        	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
							48</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/InventoryOfProductsAtEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">49</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">        
        Cost of livestock, produce, grains, and other products sold. Subtract line 48 from line 47*      
	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">      
       49
      </div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/CostOfProductsSold"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">50</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">
								<span class="styBoldText">Gross income. </span>Subtract line 49 from line 44. Enter the result here and on Part 1, line 9          
 </span>
							<span style="float:right;padding-right:0mm;">
								<span class="styDotLn" style="padding-right:2.2mm;">.....</span>
								<span style="padding-right:0mm;">
									<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;">      
        50
      </div>
						<div class="styLNAmountBoxNBB" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmIncomeAccrualMethod/GrossIncome"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNDesc" style="width: 187mm; height:4mm;">  
        *If you use the unit-livestock-price method or the farm-price method of valuing inventory and the amount on line 48 is larger than the amount on
        line 47, subtract line 47 from line 48. Enter the result on line 49. Add lines 44 and 49. Enter the total on line 50 and on Part I, line 9.      
      </div>
					</div>
					<!--Footer -->
					<div style="width:187mm;">
						<div class="stySmallText" style="width:141mm;text-align:center;padding-top:1mm;">
							<span style="width:156px"/>
						</div>
						<div class="stySmallText" style="width:46mm;text-align:right;">
							<span class="styBoldText" style="font-weight:bold;">Schedule F (Form 1040) 2011</span>
						</div>
					</div>
					<br/>
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
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II Line 34 - Passive activity loss literal code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/PassiveActivityLossLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Begin separated repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense) &gt; 5)">
						<xsl:variable name="CountExpenses" select="count($Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense)"/>
						<span class="styRepeatingDataTitle">Form 1040 Schedule F, Part II, Line 32 - Other expenses (specify):</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:130mm;" colspan="2">(a) Description</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;" colspan="2">(b) Amount</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/OtherExpense">
									<tr>
										<xsl:if test="position() &gt; 5">
											<xsl:choose>
												<xsl:when test="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss">
													<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="position() &lt;=5">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										</xsl:if>
										<td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid 0px;font-weight:bold;">
											<xsl:call-template name="AddPositionNumber"/>
											<xsl:if test="position() &gt; 5">
												<xsl:choose>
													<xsl:when test="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss">
														<xsl:number value="position() + 1" format="a"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:number value="position()" format="a"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="width:122mm;height:4.5mm;text-align:left;border-left:1 solid 0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Description"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid 0px;font-weight:bold;text-align:center;">
                  32<xsl:call-template name="AddPositionNumber"/>
											<xsl:if test="position() &gt; 5">
												<xsl:choose>
													<xsl:when test="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss">
														<xsl:number value="position() + 1" format="a"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:number value="position()" format="a"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="height:4.5mm;width:50mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Line f will be displayed if the element  "TotalPreproductivePeriodExpnss" exists.  If not then the regular iteration would continue and line f would be displayed with description and amount-->
									<xsl:if test="position() = 5 and $Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss">
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid   0px;font-weight:bold;">
                    f
                  </td>
											<td class="styDepTblCell" style="width:122mm;height:4.5mm;text-align:left;border-left:1 solid   0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss/@section263AIndicator"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid   0px;font-weight:bold;">
                    32f
                  </td>
											<td class="styDepTblCell" style="height:4.5mm;width:50mm;text-align:right;">
												<span style="width:1px;"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1040ScheduleFData/FarmExpenses/OtherFarmExpenses/TotalPreproductivePeriodExpnss"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="AddPositionNumber">
		<xsl:if test="position()=1">a</xsl:if>
		<xsl:if test="position()=2">b</xsl:if>
		<xsl:if test="position()=3">c</xsl:if>
		<xsl:if test="position()=4">d</xsl:if>
		<xsl:if test="position()=5">e</xsl:if>
	</xsl:template>
</xsl:stylesheet>
