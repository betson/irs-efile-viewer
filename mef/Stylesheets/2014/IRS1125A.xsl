<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1125AStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1125AData" select="$RtnDoc/IRS1125A"/>
	<!--	<xsl:param name="Form1125A" select="$RtnDoc/IRS1125A/IRS1125AScheduleA"/>
-->
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1125AData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1125A"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1125AStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS1125A">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;">
                    Form <span class="styFormNumber" style="font-size:14pt;">1125-A</span>
							<br/>
							<br/>
							<span class="styAgency">(December 2012)</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:18mm;">
							<div class="styMainTitle" style="height:8mm;font-size:13pt;">
                  Cost of Goods Sold
              </div>
							<div class="styFST" style="height:4mm;font-size:7pt;padding-top:1mm">
								<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
								Attach to Form 1120, 1120-C, 1120-F, 1120S, 1065, and 1065-B.<br/>
								<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
								Information about Form 1125-A and its instructions is at <i><a href="http://www.irs.gov/form1125a">www.irs.gov/form1125a</a></i>.
								</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="border-bottom-width:0px;padding-top:8mm;">
            OMB No. 1545-2225
          </div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- BEGIN TAXPAYER INFO -->
					<!--  Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name
              <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style=" padding-left:1mm;font-size:7pt;">
							<span class="BoldText">Employer Identification Number</span>
							<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- END TAXPAYER INFO -->
					<!-- Schedule A, line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							<span style="float:left;">Inventory at beginning of year
			    <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1125AData/BeginningOfYearInventoryAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/BeginningOfYearInventoryAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							<span style="float:left;">Purchases </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..............................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/PurchasesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							<span style="float:left;">Cost of labor </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">3</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/CostOfLaborAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							<span style="float:left;">Additional section 263A costs (attach schedule)
			    <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1125AData/AdditionalSection263ACostsAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/AdditionalSection263ACostsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							<span style="float:left;">Other costs (attach schedule)
			    <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1125AData/OtherCostsAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/OtherCostsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							<span style="float:left;">
								<span class="styBoldText">Total.</span> Add lines 1 through 5 </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/TotalCostsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							<span style="float:left;">Inventory at end of year </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">7</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/EndOfYearInventoryAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							<span class="styBoldText">Cost of goods sold.</span> Subtract line 7 from line 6.
			      Enter here and on Form 1120, page 1, line 2 or the
			      <span style="float:left">
			       appropriate line of your tax return (see instructions)
			  </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1125AData/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 9a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:1.5mm;">9a</div>
						<div class="styLNDesc" style="width:178mm;height:4.5mm;padding-top:1.5mm;">
						Check all methods used for valuing closing inventory:
						 </div>
					</div>
					<!-- Schedule A, line 9a(i) -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="height:4mm; text-align:right; width:5mm; padding-top:1.8mm;">
							<i>(i)</i>
						</div>
						<div class="styLNDesc" style="width:170mm;height:4.5mm;vertical-align:baseline;">
							<input type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1125AData/Section14713CostInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleACostAsDescribedInSection14713</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1125AData/Section14713CostInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleACostAsDescribedInSection14713</xsl:with-param>
								</xsl:call-template>
         Cost
       </label>
						</div>
					</div>
					<!-- Schedule A, line 9a(ii) -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="height:4mm; text-align:right; width:5mm; padding-top:1.8mm;">
							<i>(ii)</i>
						</div>
						<div class="styLNDesc" style="width:170mm;height:4.5mm;vertical-align:baseline;">
							<input type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1125AData/LowerCostOrMarketInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleALowerOfCostOrMrktAsInSect14714</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1125AData/LowerCostOrMarketInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleALowerOfCostOrMrktAsInSect14714</xsl:with-param>
								</xsl:call-template>
				Lower of cost or market
			  </label>
						</div>
					</div>
					<!-- Schedule A, line 9a(iii) -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="height:4mm; text-align:right; width:5mm; padding-top:1.8mm;">
							<i>(iii)</i>
						</div>
						<div class="styLNDesc" style="width:86mm;height:4.5mm;vertical-align:baseline;">
							<input type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1125AData/OtherMethodUsedInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleAOtherMethodUsedBox</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1125AData/OtherMethodUsedInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleAOtherMethodUsedBox</xsl:with-param>
								</xsl:call-template>
				Other (Specify method used and attach explanation.)
			  </label>
							<span style="width:2px;"/>
							<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
							<span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1125AData/OtherMethodUsedInd"/>
							</xsl:call-template>
						</div>
						<div class="styBB" style="width:87mm;height:4.5mm;clear:none">
							<span style="width:3px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1125AData/OtherMethodUsedInd/@otherMethodUsedDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule A, line 9b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:172mm;height:4.5mm;padding-top:1mm;">
							<span style="float:left;">Check if there was a writedown of subnormal goods </span>
							<label for="SubnormalGoodsCheck">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1125AData/SubnormalGoodsInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleASubnormalGoods</xsl:with-param>
								</xsl:call-template>
							</label>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
						</div>
						<div style="float:right;padding-top:1.5mm;">
								<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
							<span style="width:7px"/>
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1125AData/SubnormalGoodsInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleASubnormalGoods</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Schedule A, line 9c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:172mm;height:4.5mm;padding-top:1mm;">
							<span style="float:left;">Check if the LIFO inventory method was adopted this tax year for any goods (if checked, attach Form 970)
                <label for="LIFOCheck">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1125AData/LIFOAdoptedInd"/>
										<xsl:with-param name="BackupName">IRS1125AScheduleALIFOAdopted</xsl:with-param>
									</xsl:call-template>
								</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1125AData/LIFOAdoptedInd"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
						</div>
						<div style="float:right;padding-top:1.5mm;">
							<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
							<span style="width:7px"/>
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1125AData/LIFOAdoptedInd"/>
									<xsl:with-param name="BackupName">IRS1125AScheduleALIFOAdopted</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Schedule A, line 9d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:7mm;">
			  If the LIFO inventory method was used for this tax year, enter amount of closing inventory computed
			  <span style="float:left;">under LIFO </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;">..............................</div>
						</div>
						<div class="styGenericDiv" style="width:35mm;height:3mm;"/>
						<div style="float:right;">
							<div class="styLNRightNumBox">9d</div>
							<div class="styLNAmountBox">
								<xsl:choose>
									<xsl:when test="$Form1125AData/LIFOClosingInventoryPercent">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form1125AData/LIFOClosingInventoryPercent"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form1125AData/LIFOClosingInventoryAmt">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1125AData/LIFOClosingInventoryAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 9e -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.5mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="width:153mm;height:4.5mm;padding-top:1.5mm;">
							<span style="float:left;">If property is produced or acquired for resale, do the rules of section 263A apply to the entity (see instructions)? </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
						</div>
						<div style="float:right;">
							<div class="styLNDesc" style="width:9mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1125AData/Section263ARulesApplyInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1125AData/Section263ARulesApplyInd"/>
											<xsl:with-param name="BackupName">IRS1125AScheduleASection263ARulesApply</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1125AData/Section263ARulesApplyInd"/>
										<xsl:with-param name="BackupName">IRS1125AScheduleASection263ARulesApply</xsl:with-param>
									</xsl:call-template>
				  Yes
			  </label>
							</div>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1125AData/Section263ARulesApplyInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1125AData/Section263ARulesApplyInd"/>
											<xsl:with-param name="BackupName">IRS1125AScheduleASection263ARulesApply</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form1125AData/Section263ARulesApplyInd"/>
										<xsl:with-param name="BackupName">IRS1125AScheduleASection263ARulesApply</xsl:with-param>
									</xsl:call-template>
				  No
			  </label>
							</div>
						</div>
					</div>
					<!-- Schedule A, line 9f -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;padding-top:1.5mm;padding-left:4mm;">f</div>
						<div class="styLNDesc" style="width:153mm;height:7mm;padding-top:1.5mm;">
			  Was there any change in determining quantities, cost, or valuations between opening and closing inventory?
			  <span style="float:left;">If "Yes," attach explanation
			  <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1125AData/InventoryDeterminationChgInd"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
						</div>
						<div style="float:right;">
							<div class="styLNDesc" style="width:9mm;height:7mm;padding-top:4.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1125AData/InventoryDeterminationChgInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1125AData/InventoryDeterminationChgInd"/>
											<xsl:with-param name="BackupName">IRS1125AScheduleAInventoryDeterminationChange</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1125AData/InventoryDeterminationChgInd"/>
										<xsl:with-param name="BackupName">IRS1125AScheduleAInventoryDeterminationChange</xsl:with-param>
									</xsl:call-template>
				  Yes
			  </label>
							</div>
							<div class="styLNDesc" style="width:15mm;height:7mm;padding-top:4.5mm;text-align:right;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form1125AData/InventoryDeterminationChgInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1125AData/InventoryDeterminationChgInd"/>
											<xsl:with-param name="BackupName">IRS1125AScheduleAInventoryDeterminationChange</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form1125AData/InventoryDeterminationChgInd"/>
										<xsl:with-param name="BackupName">IRS1125AScheduleAInventoryDeterminationChange</xsl:with-param>
									</xsl:call-template>
				No
			  </label>
							</div>
						</div>
					</div>
					<!-- END Schedule A Line Items -->
					<!--br class="pageEnd"/-->
					<!-- BEGIN PAGE I FOOTER -->
					<div class="pageEnd" style="width:187mm;padding-bottom:3mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:20mm;"/>                        
       Cat. No. 55988R 
    </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">1125-A</span>(12-2012)
    </div>
					</div>
					<!-- END PAGE I FOOTER -->
					<!-- Page Break and Footer-->
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$Form1125AData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>