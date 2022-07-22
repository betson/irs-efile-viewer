<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS6252Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form6252Data" select="$RtnDoc/IRS6252"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form6252Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching   -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 6252"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- HINTS: Form does not have repeating data for separated format print-->
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 6252 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS6252Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form6252">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:23.5mm;">
						<!-- Left Title box -->
						<div class="styFNBox" style="width:31mm;height:23.5mm;">
              Form<span class="styFormNumber">6252</span>
							<br/>
							<div class="styAgency" style="width:22mm;"/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<!-- Close left title box -->
						<div class="styFTBox" style="width:125mm;height:23.5mm;">
							<div class="styMainTitle" style="padding-top:1mm;">Installment Sale Income</div>
							<br/>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/6252_Bullet.gif" alt="Bullet Image"/> Attach to your tax return.
              </div><br/>
							<div class="styFST" style="font-size:6.2pt;padding-top:2mm;">
								<img src="{$ImagePath}/6252_Bullet.gif" alt="Bullet Image"/> Use a separate form for each sale or other disposition of 
                
                  property on the installment method.
              
							</div>
						<div class="styFST" style="font-size:6.2pt;">
								<img src="{$ImagePath}/6252_Bullet.gif" alt="Bullet Image"/>
				  Instructions and more are at 
				  <a href="http://www.irs.gov/form6252" title="Link to IRS.gov">
                <i>www.IRS.gov/form6252.</i>
            </a>
									</div>	
						</div>
						<!-- Close middle box -->
						<!--Right Title box -->
						<div class="styTYBox" style="width:30mm;height:23.5mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0228</div>
							<div class="styTY" style="height:11mm">
                20<span class="styTyColor">12</span>
							</div>
							<div class="styOMB" style="height:3mm;border-bottom-width:0px;text-align:left;padding-left: 1mm;">
                Attachment<br/>Sequence No. <span class="styBoldText">79</span>
							</div>
						</div>
						<!-- Close Rigth title box -->
					</div>
					<!-- End Form Number and Name -->
					<!-- Begin Names shown on return line -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
              Name(s) shown on return
              <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN-->
						<div class="styForm6252INBox" style="width:45mm;height:8mm;font-size:7pt;padding-left:2mm;">
              Identifying number
              <br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- L1 -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:35mm;">Description of property 
                <img src="{$ImagePath}/6252_Bullet.gif" alt="Bullet Image"/>
								<br/>
							</div>
							<div class="styForm6252UnderlineText" style="width:144mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form6252Data/PropertyDescription"/>
								</xsl:call-template>
							</div>
						</div>
						<!--L2a-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">2a</div>
							<div class="styLNDesc" style="width:52mm;">            
                Date acquired (mm, dd, yyyy)
                <img src="{$ImagePath}/6252_Bullet.gif" alt="Bullet Image"/>
								<br/>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-right-width:0px;text-align:center;border-left-width:0px">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form6252Data/DateAcquired"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:62.75mm;padding-left:14mm;">
								<span class="styBoldText">b</span> Date sold (mm, dd, yyyy) 
                  <img src="{$ImagePath}/6252_Bullet.gif" alt="Bullet Image"/>
								<br/>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px; border-right-width:0px;text-align:center;border-left-width:0px">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form6252Data/DateSold"/>
								</xsl:call-template>
							</div>
						</div>
						<!--L3-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:148mm;">
								<span style="float:left;">Was the property sold to a related party (see instructions) after May 14, 1980? If "No," skip line 4 </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
							</div>
							<div class="styLNDesc" style="width:15mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldToRelatedParty"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldToRelatedParty"/>
										<xsl:with-param name="BackupName"> Yes Property Sold To Related Party </xsl:with-param>	
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldToRelatedParty"/>
										<xsl:with-param name="BackupName"> Yes Property Sold To Related Party </xsl:with-param>
									</xsl:call-template>          
                    Yes           
                </label>
							</div>
							<div class="styLNDesc" style="width:15mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldToRelatedParty"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldToRelatedParty"/>
										<xsl:with-param name="BackupName"> No Property Sold To Related Party </xsl:with-param>	
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldToRelatedParty"/>
										<xsl:with-param name="BackupName"> No Property Sold To Related Party </xsl:with-param>			
									</xsl:call-template>            
                    No            
                </label>
							</div>
						</div>
						<!--L4-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:148mm;">
                Was the property you sold to a related party a marketable security? If "Yes", complete Part III.  If "No,"  
                <span style="float:left;">complete Part III for the year of sale and the 2 years after the year of sale </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.            
                </span>
							</div>
							<div class="styLNDesc" style="width:15mm;text-align:right; padding-top:3.5mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropSoldRltdPartyMarketableSec"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form6252Data/PropSoldRltdPartyMarketableSec"/>
		<xsl:with-param name="BackupName"> Yes Prop Sold Rltd Party Marketable Sec</xsl:with-param>		
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropSoldRltdPartyMarketableSec"/>
		<xsl:with-param name="BackupName"> Yes Prop Sold Rltd Party Marketable Sec</xsl:with-param>	
	</xsl:call-template>            
                    Yes            
                </label>
							</div>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;padding-top:3.5mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropSoldRltdPartyMarketableSec"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form6252Data/PropSoldRltdPartyMarketableSec"/>
		<xsl:with-param name="BackupName"> No Prop Sold Rltd Party Marketable Sec</xsl:with-param>	
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropSoldRltdPartyMarketableSec"/>
		<xsl:with-param name="BackupName"> No Prop Sold Rltd Party Marketable Sec</xsl:with-param>			
									</xsl:call-template>            
                    No            
                </label>
							</div>
						</div>
					</div>
					<!-- Close L1 -->
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Gross Profit and Contract Price.
              <span class="styNormalText"> Complete this part for the year of sale only.</span>
						</div>
					</div>
					<!-- END Part I Title -->
					<!--Blank Line-->
					<div class="styBB" style="width:187mm;">
						<!--L5-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:139mm;">
                Selling price including mortgages and other debts. 
                <span class="styBoldText">Do not</span> include interest whether stated or unstated
                <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SellingPriceIncludingMortgage "/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SellingPriceIncludingMortgage "/>
								</xsl:call-template>
							</div>
						</div>
						<!--Close L5 -->
						<!--L6-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">6</div>
								<div class="styLNDesc" style="width:98mm;height:7mm;">
                  Mortgages, debts, and other liabilities the buyer assumed or took the 
                  <span style="float:left;">property subject to (see instructions) </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.  
                </span>
								</div>
							</div>
							<div style="float:right;clea:none;">
								<div class="styLNRightNumBox" style="padding-top:4mm;height:8.5mm;">6</div>
								<div class="styLNAmountBox" style="padding-top:4mm;height:8.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/MortgageIndebtedness"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;padding-top:4mm;height:8.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;"/>
							</div>
						</div>
						<!--L7-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="styLNDesc" style="width:98mm;">
									<span style="float:left;">Subtract line 6 from line 5 </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/SellingPriceLessMortgageIndbt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!--L8-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">8</div>
								<div class="styLNDesc" style="width:98mm;">
									<span style="float:left;">Cost or other basis of property sold </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/CostOrOtherBasisofPropertySold"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!--L9-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="styLNDesc" style="width:98mm;">
									<span style="float:left;">Depreciation allowed or allowable </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/DepreciationAllowedOrAllowable"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!--L10-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">10</div>
								<div class="styLNDesc" style="width:98mm;">
									<span style="float:left;">Adjusted basis. Subtract line 9 from line 8 </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/AdjustedBasis"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!--L11-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">11</div>
								<div class="styLNDesc" style="width:98mm;">
									<span style="float:left;">Commissions and other expenses of sale </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/CommissionsOtherExpensesOfSale"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!--L12-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">12</div>
								<div class="styLNDesc" style="width:98mm;">
									<span style="float:left;">Income recapture from Form 4797, Part III (see instructions) </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.            
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
								<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/IncomeRecaptureFromForm4797"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!--L13-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">13</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">Add lines 10, 11, and 12 </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">13</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/SumOfAdjBasisCommIncomeRcptr"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L14-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">14</div>
								<div class="styLNDesc" style="width:139mm;">Subtract line 13 from line 5. If zero or less, 
                <span class="styBoldText">do not</span> complete the rest of this form (see instructions)
                <!--Dotted Line-->
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">14</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/SumLessAdjBasisCommIncmRcptr"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L15-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">15</div>
								<div class="styLNDesc" style="width:139mm;">
                If the property described on line 1 above was your main home, enter the amount of your excluded gain 
                <span style="float:left;">(see instructions).  Otherwise, enter -0- </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">15</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/ExcludedGainAmount"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L16-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">16</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">
										<span class="styBoldText">Gross profit.</span> Subtract line 15 from line 14
              </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                   <span style="width:16px;"/>.
                 </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">16</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/GrossProfit"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L17-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">17</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">Subtract line 13 from line 6. If zero or less, enter -0- </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">17</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/MortgLessAdjBasisCommIncmRcptr"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L18-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">18</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">
										<span class="styBoldText">Contract price.</span> Add line 7 and line 17
                </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBoxNBB">18</div>
								<div class="styLNAmountBoxNBB">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/ContractPrice"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Close L18-->
					</div>
					<!--Close blank line -->
					<!-- BEGIN Part II Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Installment Sale Income.
              <span class="styNormalText"> Complete this part for the year of sale  <span class="styBoldText">and</span> 
                any year you receive a payment or have certain debts you must treat as a payment on installment obligations. 
              </span>
						</div>
					</div>
					<!-- END Part II Title -->
					<!--Blank line-->
					<div class="styBB" style="width:187mm;">
						<!--L19-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">19</div>
								<div class="styLNDesc" style="width:139mm;"> 
                Gross profit percentage (expressed as a decimal amount). Divide line 16 by line 18.  For years after the 
                <span style="float:left;">year of sale, see instructions </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">19</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form6252Data/GrossProfitPercentage"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L20-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">20</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">If this is the year of sale, enter the amount from line 17. Otherwise, enter -0- </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">20</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/IfYearOfSaleAmount"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L21-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">21</div>
								<div class="styLNDesc" style="width:139mm;"> Payments received during year (see instructions). 
                <span class="styBoldText">Do not</span> include interest, whether stated or unstated
                <!--Dotted Line-->
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">21</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PaymentsReceivedDuringYear"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L22-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">22</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">Add lines 20 and 21 </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">22</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/YearOfSaleAmountPaymentsRcvd"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L23-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">23</div>
								<div class="styLNDesc" style="width:98mm;">Payments received in prior years (see instructions).  
                <span class="styBoldText">Do not</span> include 
                <span style="float:left;">interest, whether stated or unstated </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">23</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PaymentsReceivedPriorYear"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:8mm;padding-top:4mm;"/>
								<div class="styLNAmountBoxNBB" style="height:8mm;"/>
							</div>
						</div>
						<!--L24-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">24</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">
										<span class="styBoldText">Installment sale income.</span> Multiply line 22 by line 19    
                </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">24</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/InstallmentSaleIncome"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L25-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">25</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">Enter the part of line 24 that is ordinary income under the recapture rules (see instructions) </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">25</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/OrdinaryIncomePart"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--L26-->
						<div style="width:187mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">26</div>
								<div class="styLNDesc" style="width:139mm;">
									<span style="float:left;">Subtract line 25 from line 24. Enter here and on Schedule D or Form 4797 (see instructions) </span>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;padding-right:2mm;">
										<span style="width:16px;"/>.
                  <span style="width:16px;"/>.  
                </span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBoxNBB">26</div>
								<div class="styLNAmountBoxNBB">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form6252Data/InstalSaleIncmLessOrdnryIncm"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Close L26 -->
					</div>
					<!--Close blank line -->
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Related Party Installment Sale Income. Do not<span class="styNormalText"> complete if you received the final payment this tax year. </span>
						</div>
					</div>
					<!-- END Part III Title -->
					<!--L27-->
					<!-- HINTS: New for 2008 this line no longer repeat-->
					<!-- If statement -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:8mm;">27</div>
						<div class="styLNDesc" style="width:179mm;">
							<span style="float:left;clear:none;">Name, address, and taxpayer identifying number of related party</span>
							<span style="width:93mm;float:right;clear:none;border-bottom:1px solid black;"/>
						</div>
						<!-- Begin L27 Name and Address Data Line-->
						<div style="width:187mm;">
							<div class="GenericDiv" id="STPctn" style="padding-left: 8mm;">
								<!-- Repeat -->
								<xsl:choose>
                                 <xsl:when test="(count($Form6252Data/RelatedPartyName) &gt;1)">
                                     Please see attachment
                                 </xsl:when>
                                 <xsl:otherwise>
								
								<div class="styForm6252UnderlineText" style="width:179mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form6252Data/RelatedPartyName/BusinessNameLine1"/>
									</xsl:call-template>
									<span style="width:16px;"/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form6252Data/RelatedPartyName/BusinessNameLine2"/>
									</xsl:call-template>
									<span style="width:8px;"/>
									<br/>
									<!-- Choice of US and Foreign Address -->
									<xsl:choose>
										<xsl:when test="$Form6252Data/RelatedPartyUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$Form6252Data/RelatedPartyUSAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$Form6252Data/RelatedPartyForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<!--Choice of SSN, EIN or Missing EIN Reason -->
									<xsl:if test="$Form6252Data/RelatedPartySSN != ''">
										<!--<span style="width:8px;">,</span> -->
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form6252Data/RelatedPartySSN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$Form6252Data/RelatedPartyEIN != ''">
										<!--<span style="width:8px;">,</span>-->
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form6252Data/RelatedPartyEIN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$Form6252Data/MissingEINReason !=' '">
										<span style="font-weight:normal;">
											<!-- <span style="width:8px;">,</span> -->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form6252Data/MissingEINReason"/>
											</xsl:call-template>
										</span>
									</xsl:if>
									<!--End of choice -->
								</div>
								</xsl:otherwise>
									</xsl:choose>
								<!-- End of line -->
							</div>
						</div>
					</div>
					<!--L28-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1.5mm;">28</div>
						<div class="styLNDesc" style="width:148mm;padding-top:1.5mm;">
							<span style="float:left;">Did the related party resell or dispose of the property ("second disposition") during this tax year? </span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:2mm;">
								<span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
						</div>
						<div class="styLNDesc" style="width:15mm;text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldOrDisposed"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldOrDisposed"/>
			<xsl:with-param name="BackupName">Yes Property Sold Or Disposed</xsl:with-param>		
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8px"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldOrDisposed"/>
			<xsl:with-param name="BackupName">Yes Property Sold Or Disposed</xsl:with-param>				
								</xsl:call-template>            
                  Yes            
              </label>
						</div>
						<div class="styLNDesc" style="width:15mm;text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldOrDisposed"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldOrDisposed"/>
					<xsl:with-param name="BackupName">No Property Sold Or Disposed</xsl:with-param>						
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8px"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form6252Data/PropertySoldOrDisposed"/>
					<xsl:with-param name="BackupName">No Property Sold Or Disposed</xsl:with-param>		
								</xsl:call-template>            
                  No            
              </label>
						</div>
					</div>
					<!--L29-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="width:178mm;">
							<span class="styBoldText"> 
                If the answer to question 28 is "Yes," complete lines 30 through 37 below unless one of the following conditions is met. Check the box that applies.
              </span>
						</div>
					</div>
					<!--L29a-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:146mm;">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SecondDisposMore2YrsThanFirst"/>
									<xsl:with-param name="BackupName">Second Dispos More 2Yrs Than First</xsl:with-param>	
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SecondDisposMore2YrsThanFirst"/>
								<xsl:with-param name="BackupName">Second Dispos More 2Yrs Than First</xsl:with-param>	
								</xsl:call-template>            
                  The second disposition was more than 2 years after the first disposition (other than dispositions of
                <span style="float:left;width:12px;"/>marketable securities).  If this box is checked, enter the date of disposition (mm, dd, yyyy)  
                <span class="styBoldText" style="padding-right:1mm;">
				<span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                </span>  
                <img src="{$ImagePath}/6252_Bullet.gif" alt="Bullet Image"/>
							</label>
						</div>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px; border-right-width:0px;padding-top:4mm;text-align:center;border-left-width:0px">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$Form6252Data/DateOfDisposition"/>
							</xsl:call-template>
						</div>
					</div>
					<!--L29b-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:158mm;">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6252Data/FirstDisposSaleExchange"/>
	<xsl:with-param name="BackupName">First Dispos Sale Exchange</xsl:with-param>								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6252Data/FirstDisposSaleExchange"/>
								<xsl:with-param name="BackupName">First Dispos Sale Exchange</xsl:with-param>	
								</xsl:call-template> 
                  The first disposition was a sale or exchange of stock to the issuing corporation.
              </label>
						</div>
					</div>
					<!--L29c-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:178mm;">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SecondDisposInvoluntaryCnvrt"/>
									<xsl:with-param name="BackupName">Second Dispos Involuntary Cnvrt</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SecondDisposInvoluntaryCnvrt"/>
							<xsl:with-param name="BackupName">Second Dispos Involuntary Cnvrt</xsl:with-param>		
								</xsl:call-template>             
                  The second disposition was an involuntary conversion and the threat of conversion occurred after the first disposition.  
              </label>
						</div>
					</div>
					<!--L29d-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:158mm;">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SecondDisposAfterDeathSeller"/>
								<xsl:with-param name="BackupName">Second Dispos After Death Seller</xsl:with-param>	
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SecondDisposAfterDeathSeller"/>
					<xsl:with-param name="BackupName">Second Dispos After Death Seller</xsl:with-param>					
								</xsl:call-template>           
                 The second disposition occurred after the death of the original seller or buyer.  
              </label>
						</div>
					</div>
					<!--L29e-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">e</div>
						<div class="styLNDesc" style="width:178mm;">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form6252Data/DispositionNotToAvoidTax"/>
								<xsl:with-param name="BackupName">Disposition Not To Avoid Tax</xsl:with-param>		
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6252Data/DispositionNotToAvoidTax"/>
										<xsl:with-param name="BackupName">Disposition Not To Avoid Tax</xsl:with-param>
								</xsl:call-template>  
                  It can be established to the satisfaction of the IRS that tax avoidance was not a principal purpose for either of
                <span style="float:left;width:12px;"/> the dispositions.  If this box is checked, attach an explanation (see instructions).                
              </label>
							<span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form6252Data/DispositionNotToAvoidTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Blank Row-->
					<div class="styBB" style="width:187mm;">
						<!--L30-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">30</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Selling price of property sold by related party (see instructions) </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
							</div>
							<div class="styLNRightNumBox">30</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SellingPriceByRelatedParty"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Close L30 -->
						<!--L31-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">31</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Enter contract price from line 18 for year of first sale </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
							</div>
							<div class="styLNRightNumBox">31</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/ContractPriceYearOfFirstSale"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Close L31-->
						<!--L32-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">32</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">
                Enter the <span class="styBoldText">smaller</span> of line 30 or line 31      
              </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
							</div>
							<div class="styLNRightNumBox">32</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/SmallerSellPriceContractPrice"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Close L32-->
						<!--L33-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">33</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Total payments received by the end of your 2012 tax year (see instructions) </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                </span>
							</div>
							<div class="styLNRightNumBox">33</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/TotalPaymentsReceived"/>
								</xsl:call-template>
							</div>
						</div>
						<!--L34-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">34</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Subtract line 33 from line 32. If zero or less, enter -0- </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                  </span>
							</div>
							<div class="styLNRightNumBox">34</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/TotalPaymentsReceivedLessPrice"/>
								</xsl:call-template>
							</div>
						</div>
						<!--L35-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">35</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">Multiply line 34 by the gross profit percentage on line 19 for year of first sale </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                  </span>
							</div>
							<div class="styLNRightNumBox">35</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/TotPymtPrcMultipliedGroPrftPct"/>
								</xsl:call-template>
							</div>
						</div>
						<!--L36-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">36</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">
                  Enter the part of line 35 that is ordinary income under the recapture rules (see instructions)  
                </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                    <span style="width:16px;"/>.        
                  </span>
							</div>
							<div class="styLNRightNumBox">36</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/OrdinaryIncmUnderRecaptureRls"/>
								</xsl:call-template>
							</div>
						</div>
						<!--L37-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">37</div>
							<div class="styLNDesc" style="width:139mm;">
								<span style="float:left;">
                  Subtract line 36 from line 35. Enter here and on Schedule D or Form 4797 (see instructions)  
                  </span>
								<!--Dotted Line-->
								<span class="styBoldText" style="float:right;padding-right:2mm;">
									<span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                  </span>
							</div>
							<div class="styLNRightNumBoxNBB">37</div>
							<div class="styLNAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6252Data/PaymentPriceLessOrdinaryIncome"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Close blank line -->
					<!--Page footer-->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see page 4. </span>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>    
                Cat. No. 13601R 
              <span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
						<span style="width:16px;"/>
                Form <span class="styBoldText">6252</span> (2012)
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
							<xsl:with-param name="TargetNode" select="$Form6252Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<xsl:if test="($Print = $Separated) or (count($Form6252Data/RelatedParty) &gt;1)">
						<br/>
						<span class="styRepeatingDataTitle">Form 6252 Line 27 - Name, address, and taxpayer identifying number of related party </span>
						<table class="styDepTbl" style="font-size: 7pt">
							<xsl:for-each select="$Form6252Data/RelatedParty">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align: left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelatedPartyName/BusinessNameLine1"/>
										</xsl:call-template>
										<span style="width:16px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelatedPartyName/BusinessNameLine2"/>
										</xsl:call-template>
										<span style="width:8px;"/>
										<!-- Choice of US and Foreign Address -->
										<xsl:choose>
											<xsl:when test="RelatedPartyUSAddress">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="RelatedPartyUSAddress"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="RelatedPartyForeignAddress"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
										<!-- Choice of SSN and EIN -->
										<xsl:if test="RelatedPartySSN != ''">
											<span style="width:8px;">,</span>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="RelatedPartySSN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="RelatedPartyEIN != ''">
											<span style="width:8px;">,</span>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="RelatedPartyEIN"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
