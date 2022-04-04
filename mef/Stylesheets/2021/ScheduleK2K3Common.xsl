<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="SchK2PageEntity">
		<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
			<div class="styNameBox" style="width:209.2mm;">
				Name of partnership <br />
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
				</xsl:call-template>
			</div>
			<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
				<strong>EIN</strong> <br />
				<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="SchK3PageEntity">
		<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
			<div class="styNameBox" style="width:107mm;height:8.5mm;">
				Name of partnership <br />
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
				</xsl:call-template>
			</div>
			<div class="styEINBox" style="width:21mm;height:8.5mm;padding-left:1mm;font-weight:normal;border-right:1px solid black;">
				<strong>EIN</strong> <br />
				<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
			</div>
			<div class="styNameBox" style="width:107mm;height:8.5mm;padding-left:3px;">
				Name of partner <br />
				<xsl:choose>
					<xsl:when test="PartnerPersonNm">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/PartnerPersonNm"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$FormData/PartnerName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styEINBox" style="width:21mm;padding-left:1mm;font-weight:normal;">
				<strong>SSN or TIN</strong> <br />
				<xsl:choose>
					<xsl:when test="PartnerSSN">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$FormData/PartnerSSN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$FormData/PartnerEIN"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template name="UnitLineIncDedSource">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:if test="not($Sep)">
		<xsl:for-each select="$TargetNode">
			<tr style="vertical-align:bottom;">
				<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
					<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
				</td>
				<td class="styTableCellTextInherit" style="">
					<xsl:choose>
						<xsl:when test="OtherCategoryDescriptionCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignUSCountryCd"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="USSourceIncomeAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="ForeignBranchIncomeAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="PassiveCategoryIncomeAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GeneralCategoryIncomeAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<!-- Col (e) stuff --> 
					<xsl:for-each select="SeparateCategoryGrp">
						<span style="float:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
							</xsl:call-template>
						</span>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
						</xsl:call-template>
						<xsl:if test="position() != last()"><br /></xsl:if>
					</xsl:for-each>
					<xsl:if test="count(SeparateCategoryGrp) = 0">&nbsp;</xsl:if>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="SourcedAtPartnerLvlIncmAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="border-right-width:0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalAmt"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 1)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
			<td class="styTableCellTextInherit" style="">
				<xsl:if test="$Sep">See Add'l Data</xsl:if>&nbsp;
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 2)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
			<td class="styTableCellTextInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 3)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
			<td class="styTableCellTextInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	</xsl:template>
	<xsl:template name="UnitLineIncDedSourceSingle">
		<xsl:param name="TargetNode"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/USSourceIncomeAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/ForeignBranchIncomeAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/PassiveCategoryIncomeAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/GeneralCategoryIncomeAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<!-- Col (e) stuff --> 
			<xsl:for-each select="$TargetNode/SeparateCategoryGrp">
				<span style="float:left;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
					</xsl:call-template>
				</span>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
				</xsl:call-template>
				<xsl:if test="position() != last()"><br /></xsl:if>
			</xsl:for-each>
			<xsl:if test="count($TargetNode/SeparateCategoryGrp) = 0">&nbsp;</xsl:if>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/SourcedAtPartnerLvlIncmAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalAmt"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="FTCLSect2Table">
		<xsl:param name="sep2-32"/>
		<div class="styTableContainerLandscapeNBB" id="Page4Table">
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
				<thead class="styTableThead">
					<tr style="border-top:1px solid black;">
						<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
						<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
							Description
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
							<strong>(a)</strong> U.S. source
						</th>
						<th class="styTableCellHeader" scope="col" style="" colspan="4">
							Foreign Source
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
							<strong>(f)</strong> Sourced by partner
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
							<strong>(g)</strong> Total
						</th>
					</tr>
					<tr>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
							<strong>(b)</strong> Foreign branch category income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
							<strong>(c)</strong> Passive <br /> category income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
							<strong>(d)</strong> General <br /> category income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
							<strong>(e)</strong> Other <br /> (category code ___)
						</th>
					</tr>
				</thead>
				<tbody>
					<!-- Line 25 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">25</td>
						<td class="styTableCellTextInherit" style="">
							Expenses allocable to sales income
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/ExpnsAllcblToSalesIncmGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 26 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">26</td>
						<td class="styTableCellTextInherit" style="">
							Expenses allocable to gross income from performances of services
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/ExpnssAllcblGroIncmPerfSrvcGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 27 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">27</td>
						<td class="styTableCellTextInherit" style="">
							Net short-term capital loss
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetShortTermCapLossGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 28 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">28</td>
						<td class="styTableCellTextInherit" style="">
							Net long-term capital loss
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetLongTermCapLossGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 29 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">29</td>
						<td class="styTableCellTextInherit" style="">
							Collectibles loss
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/CollectablesLossGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 30 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">30</td>
						<td class="styTableCellTextInherit" style="">
							Net section 1231 loss
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetSection1231LossGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 31 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">31</td>
						<td class="styTableCellTextInherit" style="">
							Other losses
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OtherLossesGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 32 -->
					<tr>
						<td class="sty1065K2RowIDCell" style="vertical-align:top;">32</td>
						<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
							Research &amp; experimental (R&amp;E) expenses
						</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
					</tr>
					<xsl:if test="not($sep2-32)">
						<xsl:for-each select="$FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp">
							<tr style="vertical-align:bottom;">
								<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
									<xsl:number format="A" value="position()"/>
								</td>
								<td class="styTableCellTextInherit" style="">
									SIC code 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SICCd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
								<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
								<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
								<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
								<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
								<td class="styTableCellAmtInherit" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="SourcedAtPartnerLvlIncmAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellAmtInherit" style="border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$sep2-32 or (count($FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp) &lt; 1)">
						<tr>
							<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
							<td class="styTableCellTextInherit" style="">
								SIC code
								<xsl:if test="$sep2-32">See Add'l Data</xsl:if>&nbsp;
							</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
						</tr>
					</xsl:if>
					<xsl:if test="$sep2-32 or (count($FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp) &lt; 2)">
						<tr>
							<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
							<td class="styTableCellTextInherit" style="">SIC code </td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
						</tr>
					</xsl:if>
					<xsl:if test="$sep2-32 or (count($FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp) &lt; 3)">
						<tr>
							<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
							<td class="styTableCellTextInherit" style="">SIC code </td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="">&nbsp;</td>
							<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
						</tr>
					</xsl:if>
					<!-- Line 33 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">33</td>
						<td class="styTableCellTextInherit" style="">
							Allocable rental expenses &mdash; <br /> depreciation, depletion, and amortization
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/AllocableRentalExpensesGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 34 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">34</td>
						<td class="styTableCellTextInherit" style="">
							Allocable rental expenses &mdash; other than <br /> depreciation, depletion, and amortization
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthAllocableRentalExpensesGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 35 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">35</td>
						<td class="styTableCellTextInherit" style="font-family:Arial;">
							Allocable royalty and licensing expenses &mdash; depreciation, depletion, and amortization
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/AllcblRyltyLicensingExpnsGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 36 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">36</td>
						<td class="styTableCellTextInherit" style="font-family:Arial;">
							Allocable royalty and licensing expenses &mdash; other than depreciation, depletion, and amortization
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthAllcblRyltyLcnsExpnsGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 37 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">37</td>
						<td class="styTableCellTextInherit" style="">
							Depreciation not included on line 33 or 35
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthAllocableDepreciationGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 38 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">38</td>
						<td class="styTableCellTextInherit" style="">
							Charitable contributions
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/SchK2K3CharitableContriGrp/USSourceIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/SchK2K3CharitableContriGrp/TotalAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 39 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">39</td>
						<td class="styTableCellTextInherit" style="">
							Interest epxense specifically allocable under Regulations section 1.861-10(e)
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/IntExpnsUnderSect186110eGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 40 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">40</td>
						<td class="styTableCellTextInherit" style="">
							Other interest epxense specifically allocable under Regulations <br /> section 1.861-10T
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthIntExpnsUnderSect186110TGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 41 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">41</td>
						<td class="styTableCellTextInherit" style="">
							Other interest expense&mdash;business
						</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/BusinessOthIntExpnsGrp/SourcedAtPartnerLvlIncmAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/BusinessOthIntExpnsGrp/TotalAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 42 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">42</td>
						<td class="styTableCellTextInherit" style="">
							Other interest expense&mdash;investment
						</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/InvestmentOthIntExpnsGrp/SourcedAtPartnerLvlIncmAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/InvestmentOthIntExpnsGrp/TotalAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 43 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">43</td>
						<td class="styTableCellTextInherit" style="">
							Other interest expense&mdash;passive activity
						</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/PassiveActivityOthIntExpnsGrp/SourcedAtPartnerLvlIncmAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/PassiveActivityOthIntExpnsGrp/TotalAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 44 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">44</td>
						<td class="styTableCellTextInherit" style="">
							Section 59(e)(2) expenditures, excluding R&amp;E expenses on line 32
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Sect59e2ExpendNoREExpnsGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 45 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">45</td>
						<td class="styTableCellTextInherit" style="">
							Foreign taxes not creditable but deductible
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/FrgnTxsNotCreditableDedGrp"/>
						</xsl:call-template>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="FTCLSect2Table2">
		<div class="styTableContainerLandscapeNBB" id="Page5Table1">
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
				<thead class="styTableThead">
					<tr style="border-top:1px solid black;">
						<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
						<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
							Description
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
							<strong>(a)</strong> U.S. source
						</th>
						<th class="styTableCellHeader" scope="col" style="" colspan="4">
							Foreign Source
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
							<strong>(f)</strong> Sourced by partner
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
							<strong>(g)</strong> Total
						</th>
					</tr>
					<tr>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
							<strong>(b)</strong> Foreign branch category income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
							<strong>(c)</strong> Passive <br /> category income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
							<strong>(d)</strong> General <br /> category income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
							<strong>(e)</strong> Other <br /> (category code ___)
						</th>
					</tr>
				</thead>
				<tbody>
					<!-- Line 46 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">46</td>
						<td class="styTableCellTextInherit" style="">
							Section 986(c) loss
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Section986cLossGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 47 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">47</td>
						<td class="styTableCellTextInherit" style="">
							Section 987 loss
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Section987LossGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 48 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">48</td>
						<td class="styTableCellTextInherit" style="">
							Section 988 loss
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Section988LossGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 49 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">49</td>
						<td class="styTableCellTextInherit" style="">
							Other allocable deductions (see instructions) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OtherAllocableDeductionsGrp"/>
							</xsl:call-template>
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OtherAllocableDeductionsGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 50 -->
					<tr style="vertical-align:bottom;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">50</td>
						<td class="styTableCellTextInherit" style="">
							Other apportioned share of deductions (see instructions) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthApportionedShrDedGrp"/>
							</xsl:call-template>
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthApportionedShrDedGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 51 -->
					<tr style="background-color:lightgrey;">
						<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">51</td>
						<td class="styTableCellTextInherit" style="background-color:white;">
							Reserved for future use
						</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
					</tr>
					<!-- Line 52 -->
					<tr style="background-color:lightgrey;">
						<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">52</td>
						<td class="styTableCellTextInherit" style="background-color:white;">
							Reserved for future use 
						</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
					</tr>
					<!-- Line 53 -->
					<tr style="background-color:lightgrey;">
						<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">53</td>
						<td class="styTableCellTextInherit" style="background-color:white;">
							Reserved for future use
						</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
					</tr>
					<!-- Line 54 -->
					<tr style="vertical-align:bottom;border-top:1px solid black;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">54</td>
						<td class="styTableCellTextInherit" style="">
							<strong>Total deductions </strong> (combine lines 25 through 53)
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/SchK2K3TotalDeductionsGrp"/>
						</xsl:call-template>
					</tr>
					<!-- Line 55 -->
					<tr style="vertical-align:bottom;border-top:1px solid black;">
						<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">55</td>
						<td class="styTableCellTextInherit" style="">
							<strong>Net income (loss) </strong> (subtract line 54 from line 24)
						</td>
						<xsl:call-template name="UnitLineIncDedSourceSingle">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetIncomeLossGrp"/>
						</xsl:call-template>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="LineIntExpnsApprtMain">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/USSourceIntExpnsApprtnFctrGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/FrgnBrIntExpnsApprtnFctrGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/PssvCatIntExpnsApprtnFctrGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/GenCatIntExpnsApprtnFctrGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/SrcePrtnrIntExpnsApprtnFctrGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/TotalIntExpnsApprtnFctrGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="LineIntExpnsApprtOther">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<xsl:param name="Pos"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[$Pos + 1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[$Pos + 2]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[$Pos + 3]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[$Pos + 4]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[$Pos + 5]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[$Pos + 6]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OthIntExpnsApprtnFctrGrp[$Pos + 7]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="LineFDIIApprtMain">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/USSourceFDIIDedApprtnFctrsGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/PssvCatFDIIDedApprtnFctrsGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/GenCatFDIIDedApprtnFctrsGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFDIIDedApprtnFctrsGrp[1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/SrcePrtnrFDIIDedApprtnGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/TotalFDIIDedApprtnFctrsGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="LineFDIIApprtOther">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<xsl:param name="Pos"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFDIIDedApprtnFctrsGrp[$Pos + 1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFDIIDedApprtnFctrsGrp[$Pos + 2]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFDIIDedApprtnFctrsGrp[$Pos + 3]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFDIIDedApprtnFctrsGrp[$Pos + 4]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFDIIDedApprtnFctrsGrp[$Pos + 5]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFDIIDedApprtnFctrsGrp[$Pos + 6]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="UnitLineIncDedSourceSep">
		<xsl:param name="TargetNode"/>
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
					<th class="styDepTblCell" scope="col" style="width:55mm;" rowspan="2">
						Description
					</th>
					<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
						<strong>(a)</strong> U.S. source
					</th>
					<th class="styDepTblCell" scope="colgroup" style="width:auto;" colspan="4">
						Foreign Source
					</th>
					<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
						<strong>(f)</strong> Sourced by partner
					</th>
					<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
						<strong>(g)</strong> Total
					</th>
				</tr>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
						<strong>(b)</strong> Foreign branch category income
					</th>
					<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
						<strong>(c)</strong> Passive <br /> category income
					</th>
					<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
						<strong>(d)</strong> General <br /> category income
					</th>
					<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
						<strong>(e)</strong> Other <br /> (category code ___)
					</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$TargetNode">
					<tr style="vertical-align:bottom;border-color:black;">
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
							<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
						</td>
						<td class="styTableCellTextInherit" style="">
							<xsl:choose>
								<xsl:when test="OtherCategoryDescriptionCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignUSCountryCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="USSourceIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ForeignBranchIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PassiveCategoryIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GeneralCategoryIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<!-- Col (e) stuff --> 
							<xsl:for-each select="SeparateCategoryGrp">
								<span style="float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
								</xsl:call-template>
								<xsl:if test="position() != last()"><br /></xsl:if>
							</xsl:for-each>
							<xsl:if test="count(SeparateCategoryGrp) = 0">&nbsp;</xsl:if>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SourcedAtPartnerLvlIncmAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellAmtInherit" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
  <xsl:template name="LineForeignTaxSingleP1">
		<xsl:param name="TargetNode"/>
		<td class="styTableCellTextInherit" style="">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/TaxTypeCd"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Sect951ACatIncmUSAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Sect951ACatIncmForeignAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/FrgnBranchCatIncmUSAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/FrgnBranchCatIncmForeignAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/FrgnBranchCatIncmPartnerAmt"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="LineForeignTaxP2">
		<xsl:param name="TargetNode"/>
		<xsl:param name="OtherNode"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:param name="SixLine" select="true()"/>
		<xsl:if test="not($Sep)">
		<xsl:for-each select="$TargetNode">
			<tr style="vertical-align:bottom;">
				<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
					<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="PassiveCategoryIncmUSAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="PassiveCategoryIncmFrgnAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="PassiveCategoryIncmPartnerAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GeneralCategoryIncmUSAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GeneralCategoryIncmFrgnAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GeneralCategoryIncmPartnerAmt"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<!-- Col (f) stuff -->
					<xsl:variable name="cnode" select="."/> 
					<xsl:choose>
						<xsl:when test="count($OtherNode[AlphaRowId = $cnode/AlphaRowId]) &gt; 0">See next page</xsl:when>
						<xsl:otherwise>&nbsp;</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styTableCellAmtInherit" style="border-right-width:0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalAmt"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 1)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
			<td class="styTableCellTextInherit" style="">
				<xsl:if test="$Sep">See Add'l Data</xsl:if>&nbsp;
			</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 2)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
			<td class="styTableCellTextInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 3)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
			<td class="styTableCellTextInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$SixLine">
		<xsl:if test="$Sep or (count($TargetNode) &lt; 4)">
			<tr>
				<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">D</td>
				<td class="styTableCellTextInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
			</tr>
		</xsl:if>
		<xsl:if test="$Sep or (count($TargetNode) &lt; 5)">
			<tr>
				<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">E</td>
				<td class="styTableCellTextInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
			</tr>
		</xsl:if>
		<xsl:if test="$Sep or (count($TargetNode) &lt; 6)">
			<tr>
				<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">F</td>
				<td class="styTableCellTextInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="">&nbsp;</td>
				<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
			</tr>
		</xsl:if>
	</xsl:if>
	</xsl:template>
	<xsl:template name="LineForeignTaxL2P1">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineCode"/>
		<xsl:param name="LineElement"/>
		<td class="styTableCellTextInherit" style="">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$SubGroup/TypeOfFrgnTaxReductionsGrp/*[local-name() = $LineCode]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/Sect951ACatUSIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/Sect951ACatForeignIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/FrgnBranchCatUSIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/FrgnBranchCatForeignIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/FrgnBranchCatPartnerIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="LineForeignTaxL2P2">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/PassiveCategoryUSIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/PassiveCategoryFrgnIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/PassiveCategoryPartnerIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/GeneralCategoryUSIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/GeneralCategoryFrgnIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/GeneralCategoryPartnerIncmGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFrgnTaxReductionsGrp[1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/TotalFrgnTaxReductionsGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="LineForeignTaxL2Other">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<xsl:param name="Pos"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFrgnTaxReductionsGrp[$Pos + 1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFrgnTaxReductionsGrp[$Pos + 2]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFrgnTaxReductionsGrp[$Pos + 3]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFrgnTaxReductionsGrp[$Pos + 4]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFrgnTaxReductionsGrp[$Pos + 5]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherFrgnTaxReductionsGrp[$Pos + 6]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="Line111OthMain">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/USSourceIncomeOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/Section951ACatIncmOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/FrgnBranchCatIncmOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/PassiveCatIncmOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/GeneralCatIncmOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherCatIncmOthTaxGrp[1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/SrceByPrtnrOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$SubGroup/TotalIncmOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
			<br />
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/TotalIncmOthTaxGrp/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="Line111OthOther">
		<xsl:param name="SubGroup"/>
		<xsl:param name="LineElement"/>
		<xsl:param name="Pos"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherCatIncmOthTaxGrp[$Pos + 1]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherCatIncmOthTaxGrp[$Pos + 2]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherCatIncmOthTaxGrp[$Pos + 3]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherCatIncmOthTaxGrp[$Pos + 4]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherCatIncmOthTaxGrp[$Pos + 5]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$SubGroup/OtherCatIncmOthTaxGrp[$Pos + 6]/*[local-name() = $LineElement]"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="Line8993DEI">
		<xsl:param name="TargetNode"/>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/DeductionEligibleIncomeAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="padding-right:0.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/FDDEIAmt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalAmt"/>
			</xsl:call-template>
		</div>
	</xsl:template>
	<xsl:template name="FillTable5Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="12"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable5Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable5Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable6Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="15"/>
		<xsl:param name="RowID" select="true()"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="not($RowID)">&nbsp;</xsl:when>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise><xsl:number value="$LineNumber" format="A"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable6Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable6Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="RowID" select="$RowID"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable7ColsR">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="12"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable7ColsR">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable7ColsR">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable8Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="11"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise><xsl:number value="$LineNumber" format="A"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable8Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable8Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable8ColsR">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="12"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable8ColsR">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable8ColsR">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable9ColsR">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="12"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable9ColsR">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable9ColsR">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillPart5Table2">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">A</xsl:when>
					<xsl:otherwise><xsl:number value="$LineNumber" format="A"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="padding-top:0.5mm;">
				<input type="checkbox" class="styCkboxNM" style="">
					<xsl:attribute name="alt">Row <xsl:number value="$LineNumber" format="A"/> Qualified Foreign Corporation Ind</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="/.."/>
						<xsl:with-param name="BackupName">SchK2K3FrgnCorpDistriPrtshpGrpQualifiedForeignCorporationInd<xsl:number value="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;background-color:lightgrey;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillPart5Table2">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillPart5Table2">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillPart7Table2">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="12"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellTextInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit" style="">
				<input type="checkbox" class="styCkboxNM" style="margin:2px;">
					<xsl:attribute name="alt">Row <xsl:value-of select="$LineNumber"/> Qualified Insurance Corporation Election Ind</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="QualifiedInsuranceCorpElectInd"/>
						<xsl:with-param name="BackupName">K2QualifiedInsuranceCorpElectInd<xsl:value-of select="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit" style="">
				<input type="checkbox" class="styCkboxNM" style="margin:2px;">
					<xsl:attribute name="alt">Row <xsl:value-of select="$LineNumber"/> PFIC election to mark Marketable Stock Ind</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="ElectionToMarkToMrktPFICStkInd"/>
						<xsl:with-param name="BackupName">K2ElectionToMarkToMrktPFICStkInd<xsl:value-of select="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit" style="">
				<input type="checkbox" class="styCkboxNM" style="margin:2px;">
					<xsl:attribute name="alt">Row <xsl:value-of select="$LineNumber"/> PFIC CFC under Section 957 Ind</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="PFICCFCUnderSect957Ind"/>
						<xsl:with-param name="BackupName">K2PFICCFCUnderSect957Ind<xsl:value-of select="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
			<td class="styTableCellCtrInherit" style="border-right-width:0px;">
				<input type="checkbox" class="styCkboxNM" style="margin:2px;">
					<xsl:attribute name="alt">Row <xsl:value-of select="$LineNumber"/> PFIC Income Asset Test Met Section 1297 A Ind</xsl:attribute>
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="PFICIncmAstTestMetSect1297aInd"/>
						<xsl:with-param name="BackupName">K2PFICIncmAstTestMetSect1297aInd<xsl:value-of select="$LineNumber"/></xsl:with-param>
					</xsl:call-template>
				</input>
			</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillPart7Table2">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillPart7Table2">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="UnitLineIntFCIncome">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Sep" select="false()"/>
		<xsl:if test="not($Sep)">
		<xsl:for-each select="$TargetNode">
			<tr style="vertical-align:bottom;">
				<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">&nbsp;</td>
				<td class="styTableCellTextInherit" style="vertical-align:top;">
					<strong>(<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="NumericRowId"/></xsl:call-template>)</strong> 
					Unit &nbsp;
					<span style="width:auto;vertical-align:top;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="QBUName/BusinessNameLine2Txt">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</td>
				<td class="styTableCellCtrInherit" style="">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ForeignUSCountryCd"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NetIncomeAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AverageAssetValueAmt"/>
						<xsl:with-param name="MaxSize" select="17"/>
					</xsl:call-template>
				</td>
				<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
			</tr>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 1)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">&nbsp;</td>
			<td class="styTableCellTextInherit" style="">
				<strong>(1)</strong> Unit &nbsp;
				<xsl:if test="$Sep">See Add'l Data</xsl:if>
			</td>
			<td class="styTableCellCtrInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	<xsl:if test="$Sep or (count($TargetNode) &lt; 2)">
		<tr>
			<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">&nbsp;</td>
			<td class="styTableCellTextInherit" style=""><strong>(2)</strong> Unit &nbsp;</td>
			<td class="styTableCellCtrInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
		</tr>
	</xsl:if>
	</xsl:template>
	<xsl:template name="TotCellsIntFCIncome">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Country" select="false()"/>
		<td class="styTableCellCtrInherit" style="">
			<xsl:choose>
				<xsl:when test="$Country">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$TargetNode/ForeignUSCountryCd"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
					&nbsp;
				</xsl:otherwise>
			</xsl:choose>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/NetIncomeAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/AverageAssetValueAmt"/>
				<xsl:with-param name="MaxSize" select="17"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellTextInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
	</xsl:template>
	<xsl:template name="S960Page1">
		<xsl:param name="K3-1065" select="false()"/>
		<xsl:variable name="Entity">
			<xsl:choose>
				<xsl:when test="$K3-1065">Partner's</xsl:when>
				<xsl:otherwise>Partnership's</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- Filer information section -->
		<xsl:choose>
			<xsl:when test="$K3-1065"><xsl:call-template name="SchK3PageEntity"/></xsl:when>
			<xsl:otherwise><xsl:call-template name="SchK2PageEntity"/></xsl:otherwise>
		</xsl:choose>
		
		<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
			<div class="styPartName" style="width:15mm;">Part VIII</div>
			<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
				<xsl:value-of select="$Entity"/> Interest in Foreign Corporation Income (Section 960)
			</div>
		</div>
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">A</div>
			<div class="styLNDesc" style="width:90mm;">
				Enter EIN or reference ID number of controlled foreign corporation
			</div>
			<div class="styLNAmountBox" style="text-align:center;border-left:none;word-break:break-all;height:auto;">
				<xsl:choose>
					<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Part VIII, Instance <xsl:value-of select="position()"/> - Foreign Entity Identification</xsl:with-param>
							<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="ForeignEntityIdentificationGrp">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="CFCEIN"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styLNLeftNumBoxSD" style="margin-left:6mm;">B</div>
			<div class="styLNDesc" style="width:80mm;">
				<xsl:choose>
					<xsl:when test="$K3-1065">
						Separate category. See instructions
						<span class="sty1065K2DotLn">........</span>
					</xsl:when>
					<xsl:otherwise>
						Separate category (enter code &mdash; see instructions)
						<span class="sty1065K2DotLn">....</span>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styLNAmountBox" style="border-left:none;text-align:center;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">C</div>
			<div class="styLNDesc" style="width:216mm;">
				If PAS was entered on line B, enter the applicable group under Regulations section 1.904-4(c). See instructions
				<span class="sty1065K2DotLn">..................</span>
			</div>
			<div class="styLNAmountBox" style="border-left:none;text-align:center;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PassiveCategoryIncomeGroupCd"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">D</div>
			<div class="styLNDesc" style="width:240mm;">
				<xsl:choose>
					<xsl:when test="$K3-1065">
						Box is checked if there is more than one source country for a line. See attachment and instructions
						<span class="sty1065K2DotLn" style="margin-right:-6px;">...........................&#9658;</span>
					</xsl:when>
					<xsl:otherwise>
						Check the box and attach a statement if there is more than one source country for a line. See instructions
						<span class="sty1065K2DotLn" style="margin-right:-6px;">.........................&#9658;</span>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styGenericDiv" style="width:8mm;text-align:center;padding-top:2px;">
				<input type="checkbox" class="styCkboxNM" style="" alt="Multiple Source Country Ind">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="MultipleSourceCountryInd"/>
						<xsl:with-param name="BackupName">SK2P8<xsl:value-of select="position()"/>MultipleSourceCountryInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
		</div>
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">E</div>
			<div class="styLNDesc" style="width:240mm;">
				<xsl:choose>
					<xsl:when test="$K3-1065">
						Box is checked if U.S. source income
						<span class="sty1065K2DotLn" style="margin-right:-6px;">...............................................&#9658;</span>
					</xsl:when>
					<xsl:otherwise>
						If U.S. source, check the box and complete a separate Part VIII
						<span class="sty1065K2DotLn" style="margin-right:-6px;">......................................&#9658;</span>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styGenericDiv" style="width:8mm;text-align:center;padding-top:2px;">
				<input type="checkbox" class="styCkboxNM" style="" alt="U S Source Income Ind">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="USSourceIncomeInd"/>
						<xsl:with-param name="BackupName">SK2P8<xsl:value-of select="position()"/>USSourceIncomeInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
		</div>
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">F</div>
			<div class="styLNDesc" style="width:240mm;">
				<xsl:choose>
					<xsl:when test="$K3-1065">
						Box is checked if FORI or FOGEI
						<span class="sty1065K2DotLn" style="margin-right:-6px;">................................................&#9658;</span>
					</xsl:when>
					<xsl:otherwise>
						If FORI or FOGEI, check the box and attach a separate Part VIII
						<span class="sty1065K2DotLn" style="margin-right:-6px;">......................................&#9658;</span>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styGenericDiv" style="width:8mm;text-align:center;padding-top:2px;">
				<input type="checkbox" class="styCkboxNM" style="" alt="FOGEI or FORI Ind">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="FOGEIOrFORIInd"/>
						<xsl:with-param name="BackupName">SK2P8<xsl:value-of select="position()"/>FOGEIOrFORIInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
		</div>
		<div class="styTableContainerLandscapeNBB" id="Page14Table">
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
				<thead class="styTableThead">
					<tr style="border-top:1px solid black;">
						<th class="styTableCellHeader" scope="col" style="width:8mm;border-right-width:0px;">&nbsp;</th>
						<th class="styTableCellHeader" scope="col" style="width:132mm;font-weight:normal;font-style:italic;text-align:left;padding-left:6px;">
							<xsl:choose>
								<xsl:when test="$K3-1065">Amounts are in functional currency unless otherwise noted. <br /> See instructions.</xsl:when>
								<xsl:otherwise>Enter amounts in functional currency of the foreign corporation (unless otherwise noted).</xsl:otherwise>
							</xsl:choose>
						</th>
						<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;">
							<strong>(i)</strong> Country Code
						</th>
						<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
							<strong>(ii) </strong> <xsl:value-of select="$Entity"/> share <br /> of net income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
							<strong>(iii) </strong> <xsl:value-of select="$Entity"/> share of average asset value
						</th>
						<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;border-right-width:0px;">
							<strong>(iv)</strong> Reserved for future use
						</th>
					</tr>
				</thead>
				<tbody>
					<!-- Line 1 -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;">1</td>
						<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
							Subpart F income groups
						</td>
						<td class="styTableCellTextInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
						<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;">&nbsp;</td>
					</tr>
					<!-- Line 1a total -->
					<tr style="vertical-align:top;">
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">a</td>
						<td class="styTableCellTextInherit" style="">
							Dividends, interest, rents, royalties, &amp; annuities (total)
							<span class="sty1065K2DotLn">...............</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotDivIntRntsRyltsAnntsGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3DivIntRntsRyltsAnntsGrp"/>
					</xsl:call-template>
					<!-- Line 1b total -->
					<tr style="vertical-align:top;">
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">b</td>
						<td class="styTableCellTextInherit" style="">
							Net gain from certain property transactions (total)
							<span class="sty1065K2DotLn">................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotNetGainCrtnPropTransGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3NetGainCrtnPropTransGrp"/>
					</xsl:call-template>
					<!-- Line 1c total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">c</td>
						<td class="styTableCellTextInherit" style="">
							Net gain from commodities transactions (total)
							<span class="sty1065K2DotLn">.................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotNetGainCommoditiesGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3NetGainCommoditiesGrp"/>
					</xsl:call-template>
					<!-- Line 1d total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">d</td>
						<td class="styTableCellTextInherit" style="">
							Net foreign currency gain (total)
							<span class="sty1065K2DotLn">......................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotNetFrgnCurrencyGainGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3NetFrgnCurrencyGainGrp"/>
					</xsl:call-template>
					<!-- Line 1e total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">e</td>
						<td class="styTableCellTextInherit" style="">
							Income equivalent to interest (total)
							<span class="sty1065K2DotLn">....................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotIncmEquivalentIntGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3IncmEquivalentIntGrp"/>
					</xsl:call-template>
					<!-- Line 1f total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">f</td>
						<td class="styTableCellTextInherit" style="">
							Foreign base company sales income (total)
							<span class="sty1065K2DotLn">...................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotFrgnBaseCoSalesIncmGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3FrgnBaseCoSalesIncmGrp"/>
					</xsl:call-template>
					<!-- Line 1g total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">g</td>
						<td class="styTableCellTextInherit" style="">
							Foreign base company services income (total)
							<span class="sty1065K2DotLn">..................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotFrgnBaseCoSrvcIncmGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3FrgnBaseCoSrvcIncmGrp"/>
					</xsl:call-template>
					<!-- Line 1h total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">h</td>
						<td class="styTableCellTextInherit" style="">
							Full inclusion foreign base company income (total)
							<span class="sty1065K2DotLn">................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotInclsnFrgnBaseCoIncmGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3InclsnFrgnBaseCoIncmGrp"/>
					</xsl:call-template>
					<!-- Line 1i total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">i</td>
						<td class="styTableCellTextInherit" style="">
							Insurance income (total)
							<span class="sty1065K2DotLn">........................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotalInsuranceIncomeGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3InsuranceIncomeGrp"/>
					</xsl:call-template>
					<!-- Line 1j total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">j</td>
						<td class="styTableCellTextInherit" style="">
							International boycott income (total)
							<span class="sty1065K2DotLn">.....................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotIntntlBoycottIncomeGrp"/>
							<xsl:with-param name="Country" select="true()"/>
						</xsl:call-template>
					</tr>
					<!-- Line 1k total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">k</td>
						<td class="styTableCellTextInherit" style="">
							Bribes, kickbacks, and other payments (total)
							<span class="sty1065K2DotLn">..................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotBribesKickbacksPymtGrp"/>
							<xsl:with-param name="Country" select="true()"/>
						</xsl:call-template>
					</tr>
					<!-- Line 1l total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border:none;text-align:right;padding-right:3px;">l</td>
						<td class="styTableCellTextInherit" style="">
							Section 901(j) (total)
							<span class="sty1065K2DotLn">.........................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotCFCSection901jIncomeGrp"/>
							<xsl:with-param name="Country" select="true()"/>
						</xsl:call-template>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="S960Page2">
		<xsl:param name="K3-1065" select="false()"/>
		<xsl:variable name="Entity">
			<xsl:choose>
				<xsl:when test="$K3-1065">Partner's</xsl:when>
				<xsl:otherwise>Partnership's</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="styTableContainerLandscapeNBB" id="Page15Table1">
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
				<thead class="styTableThead">
					<tr style="border-top:1px solid black;">
						<th class="styTableCellHeader" scope="col" style="width:8mm;border-right-width:0px;">&nbsp;</th>
						<th class="styTableCellHeader" scope="col" style="width:132mm;font-weight:normal;font-style:italic;text-align:left;padding-left:6px;">
							<xsl:choose>
								<xsl:when test="$K3-1065">Amounts are in functional currency unless otherwise noted. <br /> See instructions.</xsl:when>
								<xsl:otherwise>Enter amounts in functional currency of the foreign corporation (unless otherwise noted).</xsl:otherwise>
							</xsl:choose>
						</th>
						<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;">
							<strong>(i)</strong> Country Code
						</th>
						<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
							<strong>(ii) </strong> <xsl:value-of select="$Entity"/> share <br /> of net income
						</th>
						<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
							<strong>(iii) </strong> <xsl:value-of select="$Entity"/> share of average asset value
						</th>
						<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;border-right-width:0px;">
							<strong>(iv)</strong> Reserved for future use
						</th>
					</tr>
				</thead>
				<tbody>
					<!-- Line 2 total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border-width:1px 0px;">2</td>
						<td class="styTableCellTextInherit" style="">
							Recaptured subpart F income
							<span class="sty1065K2DotLn">.......................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3RecapturedSubpartFIncmGrp"/>
							<xsl:with-param name="Country" select="true()"/>
						</xsl:call-template>
					</tr>
					<!-- Line 3 total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border-width:1px 0px 0px 0px;">3</td>
						<td class="styTableCellTextInherit" style="">
							Tested income group (total)
							<span class="sty1065K2DotLn">.......................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotalTestedIncomeGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3TestedIncomeGrp"/>
					</xsl:call-template>
					<!-- Line 4 total -->
					<tr>
						<td class="styTableCellCtrInherit" style="font-weight:bold;border-width:1px 0px 0px 0px;">4</td>
						<td class="styTableCellTextInherit" style="">
							Residual income group (total)
							<span class="sty1065K2DotLn">.......................</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3TotalResidualIncomeGrp"/>
						</xsl:call-template>
					</tr>
					<xsl:call-template name="UnitLineIntFCIncome">
						<xsl:with-param name="TargetNode" select="K2K3ResidualIncomeGrp"/>
					</xsl:call-template>
					<!-- Line 5 total -->
					<tr style="border-top:2px solid black;">
						<td class="styTableCellCtrInherit" style="font-weight:bold;border-right:none;">5</td>
						<td class="styTableCellTextInherit" style="">
							<strong>Total </strong> 
							<span class="sty1065K2DotLn" style="margin-right:-6px;">.............................&#9658;</span>
						</td>
						<xsl:call-template name="TotCellsIntFCIncome">
							<xsl:with-param name="TargetNode" select="K2K3CFCTotalIncomeGrp"/>
						</xsl:call-template>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="LinePartnerDetermination">
		<xsl:param name="TargetNode"/>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/TotalAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/PartnerDeterminationAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/ECIUSSourceAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/ECIForeignSourceAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/NonECIUSSourceFDAPAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/NonECIUSSourceOtherAmt"/>
			</xsl:call-template>
		</td>
		<td class="styTableCellAmtInherit" style="border-right-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/NonECIForeignSourceAmt"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<xsl:template name="K3DistributiveShare">
		<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
			<div class="styPartName" style="width:15mm;">Part XIII</div>
			<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
				Foreign Partner's Distributive Share of Deemed Sale Items on Transfer of Partnership Interest
			</div>
		</div>
		<div class="styStdDivLS" style="">
			<div class="styGenericDiv" style="width:130mm;height:8mm;padding-top:4mm;border-right:1px solid black;">
				<div class="styLNLeftNumBox">A</div>
				<div class="styLNDesc" style="width:89mm;">
					Date of transfer of the partnership interest
					<span class="sty1065K2DotLn" style="margin-right:-6px;">.......&#9658;</span>
				</div>
				<div class="styLNAmountBoxNBB" style="text-align:center;border-left:none;">
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="PartnershipIntTransferredDt"/>
					</xsl:call-template>
				</div>
			</div>
			<div class="styGenericDiv" style="width:126mm;height:8mm;padding-top:4mm;">
				<div class="styLNLeftNumBox" style="">B1</div>
				<div class="styLNDesc" style="width:86mm;">
					Percentage interest in the partnership transferred 
					<span class="sty1065K2DotLn" style="margin-right:-6px;">....&#9658;</span>
				</div>
				<div class="styLNAmountBoxNBB" style="border-left:none;text-align:center;">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="PartnershipIntTransferredPct"/>
					</xsl:call-template>
				</div>
			</div>
		</div>
		<div class="styStdDivLS" style="border-top:1px solid black;">
			<div class="styGenericDiv" style="width:130mm;height:8mm;padding-top:4mm;border-right:1px solid black;">
				<div class="styLNLeftNumBox">B2</div>
				<div class="styLNDesc" style="width:77mm;">
					Number of units in the partnership transferred
					<span class="sty1065K2DotLn" style="margin-right:-6px;">...&#9658;</span>
				</div>
				<div class="styLNAmountBoxNBB" style="width:44mm;padding-right:0.5mm;border-left:none;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="PartnershipUnitsTransferredNum"/>
					</xsl:call-template>
				</div>
			</div>
			<div class="styGenericDiv" style="width:126mm;height:8mm;padding-top:4mm;">
				<div class="styLNLeftNumBox" style="">B3</div>
				<div class="styLNDesc" style="width:86mm;">
					Reserved for future use
					<span class="sty1065K2DotLn" style="margin-right:-6px;">............&#9658;</span>
				</div>
				<div class="styLNAmountBoxNBB" style="border-left:none;background-color:lightgrey;">&nbsp;</div>
			</div>
		</div>
		<div class="styStdDivLS" style="border-top:1px solid black;">
			<div class="styLNLeftNumBox" style="">C</div>
			<div class="styLNDesc" style="width:20mm;">Check if: </div>
			<div class="styLNLeftNumBoxSD" style="width:5mm;">1</div>
			<input type="checkbox" class="styCkbox" style="float:left;" alt="Capital">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="CapitalPrtshpIntTrnsfrInd"/>
					<xsl:with-param name="BackupName">K31065CapitalPrtshpIntTrnsfrInd<xsl:value-of select="position()"/></xsl:with-param>
				</xsl:call-template>
			</input>
			<div class="styLNDesc" style="width:20mm;">Capital</div>
			<div class="styLNLeftNumBoxSD" style="width:5mm;">2</div>
			<input type="checkbox" class="styCkbox" style="float:left;" alt="Preferred">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="PreferredPrtshpIntTrnsfrInd"/>
					<xsl:with-param name="BackupName">K31065PreferredPrtshpIntTrnsfrInd<xsl:value-of select="position()"/></xsl:with-param>
				</xsl:call-template>
			</input>
			<div class="styLNDesc" style="width:20mm;">Preferred</div>
			<div class="styLNLeftNumBoxSD" style="width:5mm;">3</div>
			<input type="checkbox" class="styCkbox" style="float:left;" alt="Profits">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="ProfitsPrtshpIntTrnsfrInd"/>
					<xsl:with-param name="BackupName">K31065ProfitsPrtshpIntTrnsfrInd<xsl:value-of select="position()"/></xsl:with-param>
				</xsl:call-template>
			</input>
			<div class="styLNDesc" style="width:20mm;">Profits</div>
			<div class="styLNLeftNumBoxSD" style="width:5mm;">4</div>
			<input type="checkbox" class="styCkbox" style="float:left;" alt="Other">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="OtherPrtshpIntTrnsfrInd"/>
					<xsl:with-param name="BackupName">K31065OtherPrtshpIntTrnsfrInd<xsl:value-of select="position()"/></xsl:with-param>
				</xsl:call-template>
			</input>
			<div class="styLNDesc" style="width:20mm;">Other</div>
		</div>
		<div class="styStdDivLS" style="border-top:1px solid black;">
			<div class="styLNLeftNumBoxSD">&nbsp;</div>
			<div class="styLNDesc" style="width:208mm;">&nbsp;</div>
			<div class="styLNRightNumBox" style="width:40mm;font-family:Arial;">Partner's Distributive Share</div>
		</div>
		<!-- Part 13, Line 1 -->
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">1</div>
			<div class="styLNDesc" style="width:208mm;">
				Total ordinary gain (loss) that would be recognized on the deemed sale of section 751 property
				<span class="sty1065K2DotLn">.....................</span>
			</div>
			<div class="styLNRightNumBox">1</div>
			<div class="styLNAmountBox">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="TotOrdinaryGainLossSect751Amt"/>
				</xsl:call-template>
			</div>
		</div>
		<!-- Part 13, Line 2 -->
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">2</div>
			<div class="styLNDesc" style="width:208mm;">
				Aggregate effectively connected ordinary gain (loss) that would be recognized on the deemed sale of section 751 property
				<span class="sty1065K2DotLn">.............</span>
			</div>
			<div class="styLNRightNumBox">2</div>
			<div class="styLNAmountBox">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="TotEffCnnctOrdnryGain751Amt"/>
				</xsl:call-template>
			</div>
		</div>
		<!-- Part 13, Line 3 -->
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">3</div>
			<div class="styLNDesc" style="width:208mm;">
				Aggregate effectively connected capital gain (loss) that would be recognized on the deemed sale of non-section 751 property
				<span class="sty1065K2DotLn">............</span>
			</div>
			<div class="styLNRightNumBox">3</div>
			<div class="styLNAmountBox">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="TotalEffCnnctCapGainNon751Amt"/>
				</xsl:call-template>
			</div>
		</div>
		<!-- Part 13, Line 4 -->
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">4</div>
			<div class="styLNDesc" style="width:208mm;">
				Gain (loss) that would be recognized under section 897(g) on the deemed sale of U.S. real property interests
				<span class="sty1065K2DotLn">.................</span>
			</div>
			<div class="styLNRightNumBox">4</div>
			<div class="styLNAmountBox">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="GainLossSect897gAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<!-- Part 13, Line 5 -->
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">5</div>
			<div class="styLNDesc" style="width:208mm;height:7.5mm;">
				Check this box if the amount provided on line 2 or 3 is determined (in whole or in part) under Regulations section 1.864(c)(8)-1(c)(2)(ii)(E) 
				(material change in circumstances rule for a deemed sale of the partnership's inventory property or intangibles)
				<span style="float:right;padding-right:2mm;">
					<span class="sty1065K2DotLn" style="float:none;margin-right:-6px;">....................&#9658;</span>
					<input type="checkbox" class="styCkboxNM" style="Determined Regulations section 1.864 C 8 - 1 c 2 ii E">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="RegsSect1864c81c2iiEInd"/>
							<xsl:with-param name="BackupName">K31065RegsSect1864c81c2iiEInd</xsl:with-param>
						</xsl:call-template>
					</input>
				</span>
			</div>
			<div class="styLNRightNumBox" style="background-color:lightgrey;height:7.5mm;">&nbsp;</div>
			<div class="styLNAmountBox" style="background-color:lightgrey;height:7.5mm;">&nbsp;</div>
		</div>
		<!-- Part 13, Lines 6-8 -->
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">6</div>
			<div class="styLNDesc" style="width:208mm;">
				Reserved for future use
				<span class="sty1065K2DotLn">............................................</span>
			</div>
			<div class="styLNRightNumBox">6</div>
			<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
		</div>
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">7</div>
			<div class="styLNDesc" style="width:208mm;">
				Reserved for future use
				<span class="sty1065K2DotLn">............................................</span>
			</div>
			<div class="styLNRightNumBox">7</div>
			<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
		</div>
		<div class="styStdDivLS">
			<div class="styLNLeftNumBoxSD">8</div>
			<div class="styLNDesc" style="width:208mm;">
				Reserved for future use
				<span class="sty1065K2DotLn">............................................</span>
			</div>
			<div class="styLNRightNumBoxNBB">8</div>
			<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
		</div>
	</xsl:template>

</xsl:stylesheet>