<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8835Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8835"/>
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
				<meta name="Author" content="Michelle Hayden - haydem@us.ibm.com"/>
				<meta name="Description" content="Form IRS 8835"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
				<link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8835Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8835">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 20mm">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height: 20mm">
              Form <span class="styFormNumber">8835</span>
							<br/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Fiscal Year Taxpayer Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@fiscalYearTaxpayerIndicator"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top: 1.5mm">Department of the Treasury</div>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="height: 20mm;width:125mm">
							<div class="styMainTitle" style="height: 8mm; padding-top: 1.5mm">Renewable Electricity, Refined Coal,<br/>and Indian Coal Production Credit</div>
	<!--						<div class="styFST" style="font-size:7pt;font-weight:bold; padding-top: 5mm">
								<img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>  
                See separate instructions.
               					 <span style="padding-left: 8mm">
									<img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>
								</span>						
                Attach to your tax return. 
          		   				 </div>  -->
          		   				 <div class="styFST" style="font-size:7pt;font-weight:bold; padding-top: 1mm">
								 <img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>
				Attach to your tax return. 
          		   				 </div>	
            		   			 <div class="styFST" style="font-size:7pt;font-weight:bold; padding-top: 1mm">
								 <img src="{$ImagePath}/8835_Bullet.gif" alt="MediumBullet"/>
				Information about Form 8835 and its separate instructions is at <i>www.irs.gov/form8835</i>.
          		   				 </div>	       		   				 			   
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm; border-left-width: 1px">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-1362</div>
							<div class="styTaxYear" style="height:10mm">20<span class="styTYColor">12</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b>95</b>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name(s) shown on return<br/>
<!--							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>   -->
 							<xsl:choose>
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
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">Identifying number</span>
							<div style="text-align:left;font-weight:normal;">
								<br/>
<!--								<xsl:choose>
									<xsl:when test="normalize-space($FormData/IdentifyingNumber) != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IdentifyingNumber"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>  -->
								<xsl:choose>
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
					</div>
					<!--  End Name and Employer indentification number  -->
					<!--Part I -->
					<!--  Part I Title-->
					<div class="styBB" style="width: 187mm; border-top-width: 0px">
						<div class="styPartName" style="width: 15mm">Part I</div>
						<div class="styPartDesc" style="width: 172mm">Electricity Produced at Qualified Facilities Placed in Service Before October 23, 2004 </div>
					</div>
					<!--  Line 1 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">1</div>
						<span class="styLNDesc" style="width: 137mm">
              Kilowatt-hours produced and sold (see instructions)
              <span style="width: 7mm">
								<span class="styDotLn" style="float: none">  
                  ..
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 36mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="18"/>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/NumKwHrsProducedAndSold"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>0.022</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">1</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/TotalKwHrsProducedAndSoldCr"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/TotalKwHrsProducedAndSoldCr"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 1 -->
					<!--  Line 2 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm">2</div>
						<span class="styLNDesc" style="width: 137mm">
      Phaseout adjustment (see instructions)  
      <span style="width: 26.5mm">
								<span class="styDotLn" style="float: none">  
          .......
        </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34mm">$
        <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/CreditBeforePhaseoutAdjustment"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>
								<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 10mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/PhaseoutAdjustmentRate"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">2</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/TotalPhaseoutAdjustment"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/TotalPhaseoutAdjustment"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 2 -->
					<!--  Line 3 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm; height:4mm;">3</div>
						<div style="float: left; padding-top: .5mm">
      Credit before reduction. Subtract line 2 from line 1     
    </div>
						<div style="float: right">
							<!--Dotted Line-->
							<div class="styDotLn" style="padding-top: .5mm">  
          .................
        </div>
							<div class="styLNRightNumBox" style="height:4.5mm">3
    </div>
							<div class="styLNAmountBox" style="height:4.5mm; width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/CreditBeforeReduction"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 3 -->
					<div style="width: 187mm">
						<div style="float:left; padding-left: 8.5mm; padding-top: .5mm">
							<span class="styBoldText">
        Reduction for government grants, subsidized financing, and other credits:
      </span>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="background-color: lightgrey; height: 4mm; border-bottom-width: 0px"/>
							<div class="styLNAmountBox" style="height: 4mm; border-bottom-width: 0px; width: 34mm"/>
						</div>
					</div>
					<!--  Line 4 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">4</div>
						<div style="float: left; padding-top: .5mm; font-size:6pt; ">
      Total of government grants, proceeds of tax-exempt government obligations, subsidized energy financing,
    </div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; background-color: lilghtgrey; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm; font-size:6pt;">
       and any federal tax credits allowed for the project for this and all prior tax years (see instructions)
    </div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
         .......
      </span>
							<span class="styLNRightNumBox" style="height: 5mm">4</span>
							<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/TotalOfGovernmentGrants"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  Line 4 -->
					<!--  Line 5 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">5</div>
						<div style="float: left; padding-top: .5mm">
     Total of additions to the capital account for the project for this and all prior tax years
     </div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
          ...... 
      </span>
							<span class="styLNRightNumBox" style="height: 5mm">5</span>
							<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/TotalOfCapitalAccountAdditions"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  Line 5 -->
					<!--  Line 6 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">6</div>
						<div style="float:left; padding-top: .5mm">
      Divide line 4 by line 5. Show as a decimal carried to at least 4 places  
    </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ...........
      </span>
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/CreditReductionPercentage"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 6 -->
					<!--  Line 7 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">7</div>
						<div style="float:left; padding-top: .5mm">
      Multiply line 3 by line 6  
    </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        .........................
      </span>
							<div class="styLNRightNumBox">7</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/CreditReduction"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 7  -->
					<!--  Line 8 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">8</div>
						<div style="float:left; padding-top: .5mm">
      Subtract line 7 from line 3  
    </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ........................
      </span>
							<div class="styLNRightNumBox">8</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/AdjustedCreditReduction"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 8  -->
					<!--  Line 9  -->
					<div style="width:187mm;float:left;clear:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">9</div>
						<div class="styLNDesc" style="width:137mm;height:4.5mm;">
                      Part I renewable electricity production credit from partnerships, S corporations,
                       cooperatives, estates, and trusts  
                      <span class="styBoldText">
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
                        <span style="width:16px;"/>.
                  </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.3mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.3mm;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
						<div class="styLNAmountBox" style="width:34mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/RenewableElectricityProdCr"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 10 -->
					<div style="width:187mm;float:left;clear:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm;">10</div>
						<div class="styLNDesc" style="width:137mm;height:4.5mm;">
                    Add lines 8 and 9. Cooperatives, estates, and trusts, go to line 11. Partnerships and S corporations,
                     report this amount on Schedule K. All others, report this amount on Form 3800, line 1f (see instructions)
                      <span class="styBoldText">
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
                         <span style="width:16px;"/>.                        
                         <span style="width:16px;"/>.         
					  </span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;"/>
						<div class="styLNAmountBoxNBB" style="height:6mm;"/>
						<div class="styLNRightNumBox" style="height:1mm;">10</div>
						<div class="styLNAmountBox" style="width:34mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/AdjCrRedandRnwbleElecProdCr"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 10 -->
					<!--  Line 11 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">11</div>
						<div style="float:left; padding-top: .5mm;">
      Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions)  
    </div>
						<div style="float:right">
							<!--      <span class="styDotLn" style="padding-top: .5mm">  
        .
      </spa>        -->
							<div class="styLNRightNumBox">11</div>
							<div class="styLNAmountBox" style="width: 34mm; ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/AmtAllocToPatronsofCooporBenef"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 11 -->
					<!--  Line 12 -->
					<div class="styBB" style="width:187mm;float:left;clear:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm;">12</div>
						<div class="styLNDesc" style="width:137mm;height:4.5mm;">
						Cooperatives, estates, and trusts, subtract line 11 from line 10. Report this amount on Form 3800,
<!--							<span class="styBoldText">Cooperatives, estates, and trusts.</span> Subtract line 11 from line 10. Report this amount on Form 3800,  -->
							<div>line 1f 
                    <span class="styBoldText">
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
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                         <span style="width:16px;"/>.                         
                  </span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:2mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:1mm;">12</div>
						<div class="styLNAmountBoxNBB" style="width:34mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesPriorTo1023/EstatesTrustsandCooperativesCr"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 12 -->
					<!--  Part II Title-->
					<div class="styBB" style="width: 187mm; border-top-width: 0px">
						<div class="styPartName" style="width: 15mm">Part II</div>
						<div class="styPartDesc" style="width: 172mm">Electricity and Refined Coal Produced at Qualified Facilities Placed in Service After October 22, 2004 (After October 2, 2008, for Electricity Produced From Marine and Hydrokinetic Renewables),
 <!--            <span style="font-weight:normal;">(after October 2, 2008 for electricity produced from marine and hydrokinetic renewables)</span>  -->
             and Indian Coal Produced at Facilities Placed in Service After August 8, 2005</div>
					</div>
					<!--  End Part II Title-->
					<div class="styTableContainer" style="border-top-width: 0px; border-bottom-width:0px; width: 187mm; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th class="styTableCellHeader" colspan="2" style="text-align:left;width: 48mm; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;height:4mm;">
										<span class="styBoldText" style="padding-left:1.5mm;">13</span>
										<span style="width: 3mm"/>
										<span class="styNormalText">Electricity produced at <span style="padding-left:8mm"/>qualified facilities using:</span>
										<!--									<span class="styTableCellPad"/>    -->
									</th>
									<th class="styTableCellHeader" style="width: 36mm;">
        (a)<br/>
										<span class="styNormalText">Kilowatt-hours produced and sold (see instructions)</span>
									</th>
									<th class="styTableCellHeader" style="width: 15mm">
        (b)<br/>
										<span class="styNormalText">Rate</span>
									</th>
									<th class="styTableCellHeader" style="width: 35.25mm">
        (c)<br/>
										<span class="styNormalText">Column (a) x Column (b)</span>
									</th>
									<th class="styTableCellHeader" style="width: 7.25mm; background-color:lightgrey;color:lightgrey;border-right-width:1px;border-bottom-width:0px;">.
									</th>
									<th class="styTableCellHeader" style="width: 32mm; border-right-width: 0px;border-bottom-width:0px;"/>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">a</span>
										<span style="width: 2mm"/>
         Wind<span class="styDotLn" style="float:none; clear:none">........</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;border-top-width: 1px;text-align:center;font:bold;">13a
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldWindNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.022
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldWindCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey; border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px;border-right-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">b</span>
										<span style="width: 1.5mm"/>
         Closed-loop biomass<span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">13b
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldClsLoopBmssNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;border-bottom-width:1px;text-align:center;">0.022
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldClsLoopBmssCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">c</span>
										<span style="width: 1.5mm"/>
        Geothermal<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">13c
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldGeothermalNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm; border-bottom-width:1px;text-align:center;">0.022
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldGthrmlAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm;">d</span>
										<span style="width: 1.5mm;"/>
         Solar<span class="styDotLn" style="float:none; clear:none">.......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">13d
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldSolarNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.022
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldSolarCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
						<span class="styLNDesc" style="width: 137mm">
              Add column (c) of lines 13a through 13d and enter here (see instructions)<span style="width: 7mm">
								<span class="styDotLn" style="float: none">..........</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">13e</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalForCreditRateUnder45a1Amt"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styTableContainer" style="width: 187mm; border-bottom-width:0px; height: 100%">
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr scope="col">
									<th class="styTableCellHeader" colspan="2" style="text-align:left;width: 48mm; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px">
										<span class="styBoldText" style="padding-left:1.5mm">14</span>
										<span style="width: 3mm"/>
										<span class="styNormalText">Electricity produced at <span style="padding-left:8mm"/>qualified facilities using:</span>
										<span class="styTableCellPad"/>
									</th>
									<th class="styTableCellHeader" style="width: 36mm">
        (a)<br/>
										<span class="styNormalText">Kilowatt-hours produced and sold (see instructions)</span>
									</th>
									<th class="styTableCellHeader" style="width: 15mm">
        (b)<br/>
										<span class="styNormalText">Rate</span>
									</th>
									<th class="styTableCellHeader" style="width: 35.25mm">
        (c)<br/>
										<span class="styNormalText">Column (a) x Column (b)</span>
									</th>
									<th class="styTableCellHeader" style="width: 7.25mm; background-color:lightgrey;color:lightgrey;border-bottom-width: 0px;float:none;clear:both;">.
									</th>
									<th class="styTableCellHeader" style="width: 32mm; border-right-width: 0px;border-bottom-width: 0px;float:none;clear:both;"/>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">a</span>
										<span style="width: 1.5mm"/>
        Open-loop biomass<span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;border-top-width: 1px;text-align:center;font:bold;">14a
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldOpenLoopBmssNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.011
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldOpenLopBmssCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey; border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px;border-right-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">b</span>
										<span style="width: 1.5mm"/>
         Small irrigation power<span class="styDotLn" style="float:none; clear:none">...</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">14b
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSoldSmllIrgtnPwrNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;border-bottom-width:1px;text-align:center;">0.011
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSldSmllIrgtnPwrCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">c</span>
										<span style="width: 1.5mm"/>
        Landfill gas<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">14c
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldLndfllGasNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm; border-bottom-width:1px;text-align:center;">0.011
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldLndfllGsCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-bottom-width:0px; border-right-width:0px">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">d</span>
										<span style="width: 1.5mm"/>
         Trash<span class="styDotLn" style="float:none; clear:none">........</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">14d
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldTrashNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.011
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldTrashCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">e</span>
										<span style="width: 1.5mm"/>
         Hydropower<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;">14e
									</td>
									<td class="styTableCellSmall" style="width: 36mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldHydropowerNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm;text-align:center;">0.011
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdAndSoldHydropwrCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; border-bottom-width:0px; background-color:lightgrey;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 47mm">
										<span class="styBoldText" style="padding-left: 4mm">f</span>
										<span style="width: 1.5mm"/>
         Marine and hydrokinetic <span style="padding-left:8mm"/>renewables<span class="styDotLn" style="float:none; clear:none">......</span>
									</td>
									<td class="styTableCellSmall" style="width: 8mm;text-align:center;font:bold;padding-top:3mm;">14f
									</td>
									<td class="styTableCellSmall" style="width: 36mm;padding-top:3mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdcdSldMarinHydrokntcNum"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 15mm; text-align:center;padding-top:3mm;">0.011
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 35.25mm;padding-top:3mm;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/KwHrsPrdSldMarinHydrokntcCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall" style="width: 7.25mm; background-color:lightgrey;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellSmall" style="width: 28mm; border-right-width:0px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">g</div>
						<span class="styLNDesc" style="width: 137mm">
              Add column (c) of lines 14a through 14f and enter here (see instructions)<span style="width: 7mm">
								<span class="styDotLn" style="float: none">..........</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">14g</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalForCreditRtUnder45b4AAmt"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Start here I-->
					<!--					<div style="width187mm;">
						<div class="styLNDesc">
							<span style="padding-left:9mm;font-weight:bold; width:145mm;">Electricity produced at qualified facilities using wind, closed-loop biomass geothermal, and solar</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"/>
					</div>    -->
					<!-- Part II Line 14 -->
					<!--					<div style="width: 187mm">
						<div class="styLNLeftNumBox"> 14</div>
						<span class="styLNDesc" style="width: 137mm">
      Kilowatt-hours produced and sold (see instructions)
      <span style="width: 7mm">
								<span class="styDotLn" style="float: none">  
          ..
        </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 36mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="18"/>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/NumOpenLoopPrdcdSold"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>.011</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">14</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotOpenLoopPrdcdSold"/>
							</xsl:call-template>
						</span>
					</div>  -->
					<!--  Line 14 -->
					<!-- Part II Line 15 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">15</div>
						<div style="float:left; padding-top: .5mm">
              Add lines 13e and 14g  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
                ..........................
              </span>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotClosedOpenKwHrsPrdcdSoldCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 15  -->
					<!-- Part II Line 16 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">16</div>
						<span class="styLNDesc" style="width: 137mm">
              Phaseout adjustment (see instructions)  
              <span style="width: 26.5mm">
								<span class="styDotLn" style="float: none">  
                  .......
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34mm">$
                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/ClosedOpenLoopCrBfrPhaseoutAdj"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>
								<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 10mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/ClosedOpenLoopPhaseoutAdjRate"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">16</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/ClosedOpenLoopTotalPhaseoutAdj"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 16 -->
					<!-- Part II  Line 17 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">17</div>
						<div style="float:left; padding-top: .5mm">
              Subtract line 16 from line 15  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
                ........................
              </span>
							<div class="styLNRightNumBox">17</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/ClosedOpenLoopKwHrsCrMinusAdj"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 17  -->
					<div style="width187mm;">
						<div class="styLNDesc">
							<span style="font-weight:bold; width:145mm; padding-left:9mm;">Refined coal produced at a qualified refined coal production facility</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<!-- Part II Line 18 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">18</div>
						<span class="styLNDesc" style="width: 137mm">
              Tons produced and sold (see instructions)
              <span style="width: 7mm">
								<span class="styDotLn" style="float: none">  
                  ......
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34.25mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="18"/>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/NumRefinedCoalTonsPrdcdAndSold"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>$6.475</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">18</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotRefinedCoalTonsPrdcdSoldCr"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 18 -->
					<!-- Part II Line 19 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">19</div>
						<span class="styLNDesc" style="width: 137mm">
              Phaseout adjustment (see instructions)  
            <span style="width: 26.5mm">
								<span class="styDotLn" style="float: none">  
                  .......
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34mm">$
                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalCrBeforePhaseoutAdj"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>
								<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 10mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalPhaseoutAdjRate"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">19</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalTotalPhaseoutAdj"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 19 -->
					<!-- Part II  Line 20 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">20</div>
						<div style="float:left; padding-top: .5mm">
              Subtract line 19 from line 18  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
                ........................
              </span>
							<div class="styLNRightNumBox">20</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalTonsCreditMinusAdj"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 20  -->
					<!-- Part II  Line 21  -->
<!--					<div style="width187mm;">
						<div class="styLNDesc">
							<span style="font-weight:bold; width:145mm; padding-left:9mm;">Steel industry fuel produced at a qualified refined coal production facility</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"/>
					</div>  -->
					<!--Line 21 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">21</div>
						<span class="styLNDesc" style="width: 137mm;">
							<span style="width:78mm;">
              Reserved for future use (see instructions)</span>
							<!--<span style="width: 7mm">
                <span class="styDotLn" style="float: none">  
                  ....
                </span>
              </span>-->
	<!--						<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34mm;font-size:7pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="21"/>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/SteelFuelPrdcdQlfdRefinedCoal"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm;font-size:7pt;">
								<span style="width: 2mm"/> X<span style="width: 2mm;font-size:7pt;"/>$2.89</span>  -->
						</span>
						<span class="styLNRightNumBox" style="height: 5mm">21</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;background-color:lightgrey;">
							<span style="float: left; clear:none"/>
	<!--						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotSteelFuelPrdcdQlfdRfndCoal"/>
							</xsl:call-template>  -->
						</span>
					</div>
					<!--  Line 21 -->
					<div style="width187mm;">
						<div class="styLNDesc">
							<span style="font-weight:bold; width:145mm; padding-left:9mm;">Indian coal produced at a qualified Indian coal production facility</span>
						</div>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<!-- Part II Line 22 -->
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox">22</div>
						<span class="styLNDesc" style="width: 137mm;">
              Tons produced and sold (see instructions)
              <span style="width: 7mm">
								<span class="styDotLn" style="float: none">  
                  ......
                </span>
							</span>
							<span style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px; width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="MaxSize" select="18"/>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/IndianCoalProducedAndSold"/>
								</xsl:call-template>
							</span>
							<span style="width: 22mm">
								<span style="width: 2mm"/> X<span style="width: 2mm"/>$2.267</span>
						</span>
						<span class="styLNRightNumBox" style="height: 5mm;border-bottom-width:0px;">22</span>
						<span class="styLNAmountBox" style="width: 34mm; height: 5mm;border-bottom-width:0px;">
							<span style="float: left; clear:none"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotIndianCoalProducedAndSoldCr"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 22 -->
					<!--  FOOTER-->
					<div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:0px;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="width:20mm;"/>Cat. No. 14954R 
						<span style="width:126px;"/>Form <span class="styBoldText">8835</span> (2012) 
	                          </div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:187mm">
						<div style="float: left; clear: none">Form 8835 (2012)</div>
						<div style="float:right">
              Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--  End Part II Title-->
					<!-- Part II  Line 23 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">23</div>
						<div style="float:left; padding-top: .5mm">
              Credit before reduction. Add lines 17, 20, 21, and 22  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
                ...............
              </span>
							<div class="styLNRightNumBox">23</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RefinedCoalCrBeforeReduction"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 24  -->
					<div style="width: 187mm">
						<div style="float:left; padding-left: 8.5mm; padding-top: .5mm">
							<span class="styBoldText">
        Reduction for government grants, subsidized financing, and other credits:
      </span>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="background-color: lightgrey; height: 4mm; border-bottom-width: 0px"/>
							<div class="styLNAmountBox" style="height: 4mm; border-bottom-width: 0px; width: 34mm"/>
						</div>
					</div>
					<!--  Part II Line 24 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">24</div>
						<div style="float: left; padding-top: .5mm; font-size:6pt; ">
      Total of government grants, proceeds of tax-exempt government obligations, subsidized energy financing,
    </div>
						<div style="float: right">
							<span class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
							<span class="styLNAmountBox" style="width: 34mm; background-color: lilghtgrey; border-bottom-width: 0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left; padding-top: .5mm; font-size:6pt;">
       and any federal tax credits allowed for the project for this and all prior tax years (see instructions)
    </div>
						<div style="float: right">
							<span class="styDotLn" style="padding-top: .5mm">  
         .......
      </span>
							<span class="styLNRightNumBox" style="height: 5mm">24</span>
							<span class="styLNAmountBox" style="width: 34mm; height: 5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalOfGovernmentGrants"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  Line 24 -->
					<!-- Part II  Line 25 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">25</div>
						<div style="float:left; padding-top: .5mm">
        Total of additions to the capital account for the project for this and all prior tax years
    </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ......
      </span>
							<div class="styLNRightNumBox">25</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalOfCapitalAccountAdditions"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 25  -->
					<!-- Part II  Line 26 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">26</div>
						<div style="float:left; padding-top: .5mm">
              Divide line 24 by line 25. Show as a decimal carried to at least 4 places  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ..........
      </span>
							<div class="styLNRightNumBox">26</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CreditReductionPercentage"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 26  -->
					<!-- Part II  Line 27 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">27</div>
						<div style="float:left; padding-top: .5mm">
              Multiply line 23 by the smaller of 1⁄2 or line 26  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ..................
      </span>
							<div class="styLNRightNumBox">27</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CreditReduction"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 27  -->
					<!-- Part II  Line 28 -->
					<div class="styGeneric" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left: 1mm">28</div>
						<div style="float:left; padding-top: .5mm">
              Subtract line 27 from line 23  
            </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm">  
        ........................
      </span>
							<div class="styLNRightNumBox">28</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/AdjustedCreditReduction"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 28  -->
					<!-- Part II Line 29  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">29</div>
						<div style="float:left; padding-top: .5mm">
              Part II renewable electricity, refined coal, and Indian coal production credit from partnerships, </div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
        S corporations, cooperatives, estates, and trusts
        </div>
						<div style="float: right">
							<!--Dotted Line-->
							<span class="styDotLn">  
              .................
            </span>
							<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
							<div class="styLNAmountBox" style="height:4.5mm;width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/RenElecRfndandIndianCoalProdCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 29  -->
					<!-- Part II Line 30  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">30</div>
						<div style="float:left; padding-top: .5mm">
           Add lines 28 and 29.  Cooperatives, estates, and trusts, go to line 31. Partnerships and S corporations,
         </div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
		 report this amount on Schedule K. All others: For electricity, refined coal, or Indian coal produced 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
              during the 4-year period beginning on the date the facility was placed in service, report the applicable 
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
		part of this amount on Form 3800, line 4e. For all other production of electricity, refined coal, or Indian
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
              coal, report the applicable part of this amount on Form 3800, line 1f (see instructions)
             <span style="width:2px;"/>
							<!-- Form to Form Link -->
<!--							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 36 - Form 6478 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Indicator"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 36 - Form 6478 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Amount"/>
							</xsl:call-template>  -->
						</div>
						<div style="float: right">
							<!--Dotted Line-->
							<span class="styDotLn">..... </span>
							<div class="styLNRightNumBox" style="height:4.5mm;">30</div>
							<div class="styLNAmountBox" style="height:4.5mm;width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 30  -->
					<!--  Part II  Line 31 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">31</div>
						<div style="float: left; padding-top: .5mm">
        Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions) 
      </div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top: .5mm"/>
							<div class="styLNRightNumBox">31</div>
							<div class="styLNAmountBox" style="width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/AmtAlloctoPtronsofCooporBenef"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 31 -->
					<!-- Part I Line 32  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">32</div>
						<div style="float:left; padding-top: .5mm">
						Cooperatives, estates, and trusts, subtract line 31 from line 30. For electricity, refined coal, or
<!--							<span class="styBoldText">Cooperatives, estates, and trusts.</span>
							<span style="text-weight:normal;"> Subtract line 37 from line 36. For electricity, refined coal, or</span> -->
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
       		      Indian coal produced during the 4-year period beginning on the date the facility was placed in service,
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
     		    	 	report the applicable part of this amount on Form 3800, line 4e. For all other production of electricity,
						</div>
						<div style="float: right">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;width: 34mm"/>
						</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div style="float:left">
          		   	 refined	coal, or Indian coal, report the applicable part of this amount on Form 3800, line 1f
						</div>
						<div style="float: right">
							<!--Dotted Line-->
								<span class="styDotLn">....  </span>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">32</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;width: 34mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/EstatesTrustsandCooperativesCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Line 32  -->
					<!--  FOOTER-->
					<div style="width:187mm">
						<span style="float: right">
          Form <span class="styBoldText">8835</span> (2012)
        </span>
					</div>
					<br class="pageEnd"/>
					<br/>
					<br/>
					<!--END FOOTER-->
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
							<xsl:with-param name="Desc">Fiscal Year Taxpayer Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@fiscalYearTaxpayerIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
<!--						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 34 - Form 8884 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CfwdRnwblElecRefinedCoalCr/@form8884Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 34 - Form 8884 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/CfwdRnwblElecRefinedCoalCr/@form8884Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 36 - Form 6478 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 36 - Form 6478 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedFacilitiesAfter1022/TotalAllowedTaxCredit/@form6478Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>  -->
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
