<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8903Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8903"/>
	<!-- Check this out -->
	<xsl:template match="/">
		<html>
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
				<meta name="Description" content="Form IRS 8903"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8903Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8903">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 18mm;">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height: 18mm;">
      Form <span class="styFormNumber">8903</span>
							<span>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc"/>
									<xsl:with-param name="TargetNode" select="$FormData/@filedPursuantToSect30191002Cd"/>
								</xsl:call-template>
							</span>
							<div style="font-size:6pt"> (Rev. December 2010)</div>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="height: 18mm;width:125mm;padding-top:4mm;border-right:1 solid black;">
							<div class="styMainTitle" style="height: 5mm">Domestic Production Activities Deduction</div>
							<div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold">
								<br/>
								<br/>
								<img src="{$ImagePath}/8903_Bullet.gif" alt="MediumBullet"/>  
        							Attach to your tax return. 
      								<img src="{$ImagePath}/8903_Bullet.gif" alt="MediumBullet"/>  
       							See separate instructions.
       							<br/>
							</div>
						</div>
						<!--						<div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-1984</div>
 							<div class="styTaxYear" style="height:10mm">20<span class="styTYColor">10</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b>143</b>
							</div>
						</div>  -->
						<div style="float:left; font-size:7pt; width:31mm; padding-top:3.5mm; text-align:center; border-bottom:1 solid black; height:9mm">
          						OMB No. 1545-1984
       					</div>
						<div style="float:left; font-size:7pt; padding-top:1mm; padding-left:4.5mm">
       						   Attachment<br/>Sequence No. <b style="font-size:9pt">143</b>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) as shown on return<br/>
 							<xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
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
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;font-weight: normal;">Identifying number
      <br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
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
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:107mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm;width:40.25mm;text-align:center;font-weight:bold;border-bottom-width:0px;">(a)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;border-bottom-width:0px;width:31.75mm;">(b)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:107mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm;width:40.25mm;text-align:center;font-size:6pt;">Oil-related production activities</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;width:31.75mm;">All activities</div>
					</div>
					<!--  Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:3mm;  padding-left:4mm;">1</div>
						<div class="styLNDesc" style="width:107mm;padding-top:3mm;">
              Domestic production gross receipts (DPGR)
              <span class="styBoldText">
								<span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
               </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:4mm;">1</div>
						<div class="styLNAmountBox" style="padding-top:4mm;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/DomesticProductionGroRcptsAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<div class="styLNAmountBox" style="padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/DomesticProductionGroRcptsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 1 -->
					<!--  Line 2 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm; padding-left:4mm;">2</div>
						<div class="styLNDesc" style="width:107mm; height:4mm;">
    		Allocable cost of goods sold. If you are using the small business simplified
    		overall method, skip lines 2 and 3
            <span class="styBoldText">
								<span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                   <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
        </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:4mm;height:4mm;">2</div>
						<div class="styLNAmountBox" style="padding-top:4mm;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/AllocatedCostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<div class="styLNAmountBox" style="padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/AllocatedCostOfGoodsSoldAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 2 -->
					<!--  Line 3 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">3</div>
						<div class="styLNDesc" style="width:107mm">
     	Enter deductions and losses allocable to DPGR (see instructions)
     	             <span class="styBoldText">
								<span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
        </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/DirectDedExpensesLossesAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/DirectDedExpensesLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 3 -->
					<!--  Line 4 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">4</div>
						<div class="styLNDesc" style="width:107mm;">
	    If you are using the small business simplified overall method, enter
         the amount of cost of goods sold and other deductions or losses
         you ratably apportion to DPGR. All others, skip line 4    
	    <span class="styBoldText">
								<span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
        </span>
						</div>
						<div class="styLNRightNumBox" style="padding-top:6.5mm;height:6mm;">4</div>
						<div class="styLNAmountBox" style="padding-top:6.5mm;height:6mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/IndirectDedExpnssLossesAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<div class="styLNAmountBox" style="padding-top:6.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/IndirectDedExpnssLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 4 -->
					<!--  Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm; padding-left:4mm;">5</div>
						<div class="styLNDesc" style="width:107mm;padding-top:1mm;">
              Add lines 2 through 4
              <span class="styBoldText">
								<span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                   
              </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;">5</div>
						<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/TotCostGdsSoldDedExpnssLossAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/TotCostGdsSoldDedExpnssLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 5 -->
					<!--  Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm; padding-left:4mm;">6</div>
						<div class="styLNDesc" style="width:107mm;padding-top:1mm;">
              Subtract line 5 from line 1
              <span class="styBoldText">
								<span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
              </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">6</div>
						<div class="styLNAmountBox" style="height:5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/NetDomesticProdGrossRcptsAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<div class="styLNAmountBox" style="height:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/NetDomesticProdGrossRcptsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End Line 6 -->
					<!--  Line 7  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm; padding-left:4mm;">7</div>
						<div class="styLNDesc" style="width:107mm;padding-top:1mm;">
               Qualified production activities income from estates, trusts, and certain partnerships and
S corporations (see instructions).
              <span class="styBoldText">
								<span style="width:8px"/>.
                 <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.        
              </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">7</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/QlfyProductionActivitiesAmt"/>
							</xsl:call-template>
						</div>
						<!--							<div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;">
								<div style="width:7.75mm;background-color:lightgrey;height:4.5mm;"/>7         
   							</div>  -->
						<div style="float:right">
							<div class="styLNAmountBox" style="height:4.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/QlfyProductionActivitiesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 7  -->
					<!--  Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm; padding-left:4mm;">8</div>
						<div class="styLNDesc" style="width:107mm;padding-top:1mm;">
               Add lines 6 and 7. Estates and trusts, go to line 9, all others, skip line 9 and go to line 10.
              <span class="styBoldText">
								<span style="width:8px"/>.
                 <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.      
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.
                  <span style="width:8px"/>.      
                  <span style="width:8px"/>.
                 <span style="width:8px"/>.      
                  <span style="width:8px"/>.                              
                  <span style="width:8px"/>.                              
              </span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;">8</div>
						<div class="styLNAmountBox" style="height:7mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/ProductionActivitiesIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right">
							<div class="styLNAmountBox" style="height:4mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/ProductionActivitiesIncomeAmt"/>
								</xsl:call-template>
							</div>
							<!--      	<div class="styLNRightNumBoxNBB" style="height: 4.5mm;background-color: lightgrey;"></div>
     	 <div class="styLNAmountBoxNBB" style="height: 4.5mm;"></div>           -->
						</div>
					</div>
					<!--End  Line 8 -->
					<!--  Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm; padding-left:4mm;">9</div>
						<div class="styLNDesc" style="width:107mm;padding-top:1mm;">
               Amount allocated to beneficiaries of the estate or  trust (see instructions)
              <span class="styBoldText">
								<span style="width:8px"/>.
                 <span style="width:8px"/>.
                                                                                                 
              </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;">9</div>
						<div class="styLNAmountBox" style="height:4mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/EstateOrTrustAllocatedBenefAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right">
							<div class="styLNAmountBox" style="height:4mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/EstateOrTrustAllocatedBenefAmt"/>
								</xsl:call-template>
							</div>
							<!--	<div class="styLNRightNumBoxNBB" style="height: 3.5mm;background-color: lightgrey;"></div>
     	 <div class="styLNAmountBoxNBB" style="height: 3.5mm;"></div>          -->
						</div>
					</div>
					<!-- End Line 9 -->
					<!-- Line 10a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;">10a</div>
						<div class="styLNDesc" style="width:107mm;padding-top:1mm;">
							<b>Oil-related qualified production activities income.</b> Estates and trusts, subtract line 9, column (a), from line 8, column (a),
							 all others, enter amount from line 8, column (a).  If zero or less, enter -0- here
              <span class="styBoldText">
								<span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                                                                                        
              </span>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
								<div style="width:7.75mm;background-color:lightgrey;height:8mm;"/>
          	10a         
   		</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllProductionGrp/OilRelQlfyProdActivitiesIncAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="height: 12mm;background-color: lightgrey;border-bottom-width:1px;width:31.75mm;"/>
						</div>
					</div>
					<!-- End Line 10a -->
					<!-- Line 10b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:1mm;padding-left:5mm;">b</div>
						<div class="styLNDesc" style="width:107mm;padding-top:1mm;">
							<b>Qualified production activities income.</b> Estates and trusts, subtract line 9, column (b), from line 8, column (b),
							 all others, enter amount from line 8, column (b).  If zero or less, enter -0- here, skip lines 11 through 21, and enter -0- on line 22
              <span class="styBoldText">
								<span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                                                                              
              </span>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="height:10.5mm;padding-top:0mm;">
								<div style="width:7.75mm;background-color:lightgrey;height:10.5mm;"/>
          	10b         
   		</div>
							<div class="styLNAmountBoxNBB" style="height: 14.5mm;background-color: lightgrey;border-bottom-width:1px;"/>
							<div class="styLNAmountBox" style="height:10.5mm;padding-top:10.5mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllActivitiesGrp/QlfyProductionActyIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 10b -->
					<!-- Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm; padding-left:2mm;">11</div>
						<div class="styLNDesc" style="width:134mm;">
       	Income limitation (see instructions):          
          <li style="padding-top:1mm;">
          	Individuals, estates, and trusts. Enter your adjusted gross income figured without the domestic 
			<br/>
								<span style="width:4mm;"/>production activities deduction
       
            <span style="letter-spacing:4mm; font-weight:bold;">  
              ..................
            </span>
							</li>
							<li style="padding-top:1mm;">
          	All others. Enter your taxable income figured without the domestic production activities 
			<br/>
								<span style="width:4mm;"/>deduction (tax-exempt organizations, see instructions)
       
            <span style="letter-spacing:4mm; font-weight:bold;">  
              ...........
            </span>
							</li>
						</div>
						<div class="styGenericDiv" style="width:5mm; height:13mm;padding-top:4mm;">
							<img style="height:17mm" src="{$ImagePath}/8903_Bracket_Lg.gif" alt="Curly Bracket Image"/>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="width:7.75mm;height:14mm;padding-top=0mm;">
								<div style="width:7.75mm;border-left-width:0px;background-color:lightgrey;height:11mm;"/>
          	11
        	</div>
							<div class="styLNAmountBox" style="height:14mm;padding-top:11mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeLimitationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height: 8.25mm;background-color: lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height: 8.25mm;"/>
						</div>
					</div>
					<!-- End Line 11 -->
					<!--  Line 12 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">12</div>
						<div class="styLNDesc" style="width:139mm;">
       Enter the smaller of line 10b or line 11. If zero or less, enter -0- here, skip lines 13 through 21, and 
    	</div>
						<div style="float:right;">
							<div class="styShadingCellBox" style="height:4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
					</div>
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;"/>
						<div class="styLNDesc" style="padding-top:0mm;">
       enter -0- on line 22  
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.     
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">12</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedIncomeOrIncomeLmtAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 12 -->
					<!--  Line 13 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:2mm; padding-left:2mm;">13</div>
						<div class="styLNDesc" style="padding-top:2mm;">
       Enter 9% of line 12   
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.     
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
 
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:3mm;">13</div>
							<div class="styLNAmountBox" style="padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PercentOfIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 13 -->
					<!--  Line 14a -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">14a</div>
						<div class="styLNDesc" style="width:99mm;padding-top:1mm;">
       Enter the smaller of line 10a or line 12   
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.     
                <span style="width:8px"/>.
                <span style="width:8px"/>.     
                <span style="width:8px"/>.
  
          </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;">14a</div>
						<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyIncOrOilRelOrIncLimitsAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="padding-top:1mm;background-color:lightgrey;"/>
						</div>
					</div>
					<!-- End Line 14a -->
					<!--  Line 14b -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:4mm;">b</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       Reduction for oil-related qualified production activities income.  Multipy line 14a by 3%   
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
   
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">14b</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyIncOrOilRelOrIncPercentAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 14b -->
					<!--  Line 15 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">15</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       Subtract line 14b from line 13.
             <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.     
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">15</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DomesticProdActivityRedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End  Line 15 -->
					<!--  Line 16 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">16</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       Form W-2 wages (see instructions)  
             <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.     
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>. 
                <span style="width:8px"/>. 
                <span style="width:8px"/>.
                <span style="width:8px"/>.
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">16</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/W2WagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End  Line 16 -->
					<!--  Line 17  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;  padding-left:2mm;">17</div>
						<div class="styLNDesc" style="width:139mm;padding-top:1mm;">
               Form W-2 wages from estates, trusts, and certain partnerships and S corporations
                (see instructions)
              <span class="styBoldText">
								<!--                  <span style="width:8px"></span>.
                 <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.
                  <span style="width:8px"></span>.    -->
							</span>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;">
								<!--							<div style="width:7.75mm;background-color:lightgrey;height:4mm;"/>  -->
          	17         
   		</div>
							<div class="styLNAmountBox" style="height:4mm;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PassThroughW2WagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 17  -->
					<!--  Line 18 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">18</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       	Add lines 16 and 17. Estates and trusts, go to line 19, all others, skip line 19 and go to line 20  
              <span class="styBoldText">
								<span style="width:8px"/>.           
                     <span style="width:8px"/>.
             </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">
								<!--							<div style="width:7.75mm;background-color:lightgrey;height:4mm;"/>    -->
      		18
      	</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalW2WagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 18 -->
					<!-- Line 19 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">19</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       Amount allocated to beneficiaries of the estate or trust (see instructions).  
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.     
                <span style="width:8px"/>.
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">19</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustAllocatedBenefAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 19 -->
					<!-- Line 20 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;  padding-left:2mm;">20</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       Estates and trusts, subtract line 19 from line 18, all others, enter amount from line 18.
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
  
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">20</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 20 -->
					<!--  Line 21 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">21</div>
						<div class="styLNDesc" style="padding-top:1mm;">
     	 Form W-2 wage limitation. Enter 50% of line 20 
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
 
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">21</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/W2WageLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 21 -->
					<!--  Line 22 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">22</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       Enter the smaller of line 15 or line 21   
           <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">22</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomePctOrW2WageLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 22 -->
					<!--  Line 23 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">23</div>
						<div class="styLNDesc" style="padding-top:1mm;">
       Domestic production activities deduction from cooperatives. Enter deduction from Form 
	  1099-PATR, 
    	</div>
						<div style="float:right;">
							<div class="styShadingCellBox" style="height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:5mm;"/>
						</div>
					</div>
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;"/>
						<div class="styLNDesc" style="padding-top:0mm;">
       box 6   
                  <span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox">23</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CoopeartivesDomesticProdDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 23 -->
					<!--  Line 24 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm; padding-left:2mm;">24</div>
						<div class="styLNDesc" style="padding-top:1mm;">
        Expanded affiliated group allocation (see instructions)
        <span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ExpandedGroupAllocationAmt"/>
							</xsl:call-template>
							<span class="styBoldText">
								<span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                 <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                <span style="width:8px"/>.
                
          </span>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="padding-top:1mm;">24</div>
							<div class="styLNAmountBox" style="padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExpandedGroupAllocationAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End  Line 24 -->
					<!--  Line 25 -->
					<div class="StyTBB" style="width: 187mm;">
						<div class="styLNLeftNumBox" style=" padding-left:2mm;padding-top:0mm;">25</div>
						<div class="styLNDesc" style="width:138.5mm;padding-top:0mm;">
							<b>Domestic production activities deduction.</b> Combine lines 22 through 24 and enter the result
              here and on Form 1040, line 35; Form 1120, line 25; or the applicable
              line of your return  
              <span class="styBoldText">
								<span style="width:8px"/>.
                   <span style="width:8px"/>.
                   <span style="width:8px"/>.
                   <span style="width:8px"/>.
                   <span style="width:8px"/>.
                   <span style="width:8px"/>.
                   <span style="width:8px"/>.
                   <span style="width:8px"/>.                 
              </span>
						</div>
						<!-- 	<div  style="width=8.25mm;background-color:lightgrey;height:4.7mm;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px; solid;border-style: solid; border-color: black;"></div>    -->
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:7mm; padding-top:3mm;">25</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:7mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 25 -->
					<!--  FOOTER-->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
						<span style="width:100px;"/>                      
          Cat. No. 37712F 
          <span style="width:60px;"/>  
          Form <span class="styBoldText">8903</span> (Rev. 12-2010)
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
							<xsl:with-param name="Desc">Form 8903, Top Left Margin - Section 301.9100-2 Ind</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@filedPursuantToSect30191002Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>