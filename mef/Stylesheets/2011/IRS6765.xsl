<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<!--Updated per UWR 40639 on 07/07/2011 but no changes made as Tax Year done in prior UWR By Robert Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS6765Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form6765Data" select="$RtnDoc/IRS6765"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form6765Data)"/>
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
				<meta name="Description" content="IRS Form 6765"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 6765 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS6765Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form6765">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:24.5mm;">						    
                             Form <span class="styFormNumber">6765</span>        
                                <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6765Data"/>
								</xsl:call-template>  										
							<br/>
							<br/>
							<br/>
							<span style="height:5.9mm;"></span>
						    <!-- span class="styAgency">Rev. December 2008</span -->		                
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:123mm;height:24.5mm;">
							<div class="styMainTitle" style="height:8mm;">
                             Credit for Increasing Research Activities
                            </div>
							<br/>
							<div class="styFST" style="height:5mm;font-size:7pt;">
								<img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
                                 Attach to your tax return.
                             </div>
						</div>
						<div class="styTYBox" style="width:32mm;height:24.5mm;">
							<div class="styOMB" style="height:2mm;border-bottom-width:1px;padding-top:3mm;">
                             OMB No. 1545-0619
                            </div>
							<div class="styTY" style="height:11mm;">20<span class="styTYColor">11</span>
							</div>
							<div style="text-align:left;padding-left:6mm;">Attachment<br/> Sequence No.<span class="styBoldText">
									<span style="width:4px;"/>81</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:147mm;height:8mm;font-weight:normal;font-size:7pt;">
        Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:39mm;height:4mm;padding-left:2mm;font-size:7pt;">
        Identifying number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!--Begin Section A-->
					<div class="styBB" style="width:187mm;font-size:7pt;">
						<div class="styPartDesc" style="width:183mm;font-size:7pt;padding-left:0mm;">Section A—Regular Credit. <span class="styNormalText">Skip this section and go to Section B if you are electing or previously elected (and are not revoking) the alternative simplified credit.</span>
						</div>
					</div>
					<!-- line 1 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
     1
        </div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
						 <span style="float:left;">Certain amounts paid or incurred to energy consortia (see instructions)</span>     
                         <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="width:8.25mm;height:4mm;border-right-width:1px;">1</div>
						<div class="styLNAmountBox" style="height:4mm;border-right-width:0px;border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/EnergyConsortiaAmount"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 2 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
         2
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
        Basic research payments to qualified organizations (see instructions)
         
        </div>
						<div class="styLNRightNumBox" style="height:4mm;">
         2          
        </div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/BasicResearchPayment"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
						<!--  
         <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;"></div>
         <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"></div>
         -->
					</div>
					<!-- line 3 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
         3
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                         <span style="float:left;">Qualified organization base period amount</span>
                         <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
         3          
        </div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/BasePeriodAmount"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 4 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">4</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">     
                         <span style="float:left;">Subtract line 3 from line 2. If zero or less, enter -0-</span>
                         <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/ResearchPymtMinusBasePeriodAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 5 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">5</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
						  <span style="float:left;white-space:nowrap;">Wages for qualified services (do not include wages used in figuring the </span>
						  <span style="float:left;white-space:nowrap;">work opportunity credit)</span>
                          <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">5</div>            
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/WagesForQualifiedServices"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 6 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">6</div>
				             <div class="styLNDesc" style="width:98.75mm;height:4mm;">
                                <span style="float:left;">Cost of supplies</span>       
                                <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						     </div>
						<div class="styLNRightNumBox" style="height:4mm;">6</div> 
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/CostOfSupplies"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 7 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">7</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;white-space:nowrap;">Rental or lease costs of computers (see instructions )</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
         7          
        </div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RentalOrLeaseCostsOfComputers"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line8  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">8</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                              <span style="float:left;white-space:nowrap;">Enter the applicable percentage of contract research expenses (see</span>
                              <span style="float:left;white-space:nowrap;">instructions)</span>
                              <span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
       8          
        </div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/PctOfContractResearchExpenses"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
						<!-- line 9 -->
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">9</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;white-space:nowrap;">Total qualified research expenses. Add lines 5 through 8</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
          9         
        </div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/TotalQualifedResearchExpenses"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 10 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">
       10
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
           Enter fixed-base percentage, but not more than 16% (see instructions)
             <!--
            <span class="styBoldText">
              <span style="width:16px;"></span>.
              </span>
              -->
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
        10          
        </div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:choose>
								<xsl:when test="$Form6765Data/FixedBasePercentage=''">
									<td class="styTableCell" style="width:17mm;height:5mm;text-align:right;font-size:7pt;border-color:black;">
										<span style="width:2px;">%</span>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styTableCell" style="width:17mm;height:5mm;text-align:right;font-size:7pt;border-color:black;padding-right:1mm;">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasePercentage"/>
										</xsl:call-template>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 11 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">11</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;white-space:nowrap;">Enter average annual gross receipts (see instructions)</span> 
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
          11          
        </div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AverageAnnualGrossReceipts"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 12 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">
          12
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                         <span style="float:left;">Multiply line 11 by the percentage on line 10</span>
                         <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">
          12          
        </div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasePctTimesGrossReceipts"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 13 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">13</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;">Subtract line 12 from line 9. If zero or less, enter -0-</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">13</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AdjTotQualifedResearchExpenses"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 14 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">14</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;">Multiply line 9 by 50% (.50)  </span>  
                             <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">14</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/HalfAdjTotQlfyResearchExpenses"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
			
					<!-- line 15-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">15 </div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                             <span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 13 or line 14 </span>        
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/SmallestQlfyResearchExpenses"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 16-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">16</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                             <span style="float:left;">Add lines 1, 4,  and 15 </span>         
                             <span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RsrchExpensesPlusRsrchPayments"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 17 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">17</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                             Are you electing the reduced credit under Section 280C?<img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
							<!-- yes checkbox -->
							<span style="width:.5mm;"/>
							<span style="padding-right:1mm;">Yes</span>
							<span>
								<xsl:call-template name="PopulateSpan">
                                 <xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElection"/>                                
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
                                     <xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElection"/>
                                     <xsl:with-param name="BackupName">IRS6765ReducedSection280CCrElection</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
                                     <xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElection"/>
                                     <xsl:with-param name="BackupName">IRS6765ReducedSection280CCrElection</xsl:with-param>
								</xsl:call-template>
							</label>
							<!-- no checkbox -->
							<span style="width:2mm;"/>
							<span style="padding-right:1mm;">No</span>
							<span>
								<xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElection"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
                                         <xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElection"/>
                                         <xsl:with-param name="BackupName">IRS6765ReducedSection280CCrElection</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
                                         <xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElection"/>
                                         <xsl:with-param name="BackupName">IRS6765ReducedSection280CCrElection</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:138.75mm;height:10mm;">
						     <span style="float:left; white-space:nowrap;">If “Yes,” multiply line 16 by 13% (.13). If “No,” multiply line 16 by 20% (.20) and see the instructions</span>
                             <span style="float:left; white-space:nowrap;">for the schedule that must be attached. Members of controlled groups or businesses under common </span>
                             <span style="float:left; white-space:nowrap;">control: see instructions for the schedule that must be attached  
          <!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
							</xsl:call-template></span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;border-bottom-width:0px;">17</div>
						<div class="styLNAmountBox" style="height:10.5mm;padding-right:1mm;padding-top:6.5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
							</xsl:call-template>
						</div>
													
						</div>
																	

					<!--End of Section A-->
					<!-- Begin Section B-->
					<div class="styBB" style="width:187mm;border-top-width:1px;height:8mm;padding-top:2mm;">
						<div class="styPartDesc" style="font-size:7pt;padding-left:0mm;">Section B&#151;Alternative Simplified Credit. <span class="styNormalText">Skip this section if you are completing Section A. </span>
						</div>
					</div>
					<!-- line 18 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">
      18
    </div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
						     <span style="float:left;">Certain amounts paid or incurred to energy consortia (see the line 1 instructions)</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="width:8.25mm;height:4mm;border-right-width:1px;">18</div>
						<div class="styLNAmountBox" style="height:4mm;border-right-width:0px;border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" 
                select="$Form6765Data/AmtPaidOrIncurredToEnergyCnsrt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 19 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">
      19
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;white-space:nowrap;padding-right:15px;">Basic research payments to qualified organizations (see the line 2 </span>
                             <span style="float:left;">instructions)</span>  
                             <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">19</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/BasicResearchPymtToQlfyOrg"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 20 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">20</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                            Qualified organization base period amount (see the line 3 instructions)
                        </div>
						<div class="styLNRightNumBox" style="height:4mm;">20</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/QualifiedOrgBasePeriodAmount"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 21 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">21</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                         <span style="float:left;">Subtract line 20 from line 19. If zero or less, enter -0-</span>
                         <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AdjBasicResearchPymtToQlfyOrg"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 22 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">22</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                             <span style="float:left;">Add lines 18 and 21</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/SumOfAmtPdAndAdjBscRsrchPymt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 23 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">23</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                         <span style="float:left;">Multiply line 22 by 20% (.20)</span>
                         <span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/TwentyPctOfLine22"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 24  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">24</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;">Wages for qualified services (do not include wages used in figuring the</span> 
                             <span style="float:left;">work opportunity credit)</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">24</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/WagesForQualifiedServicesSectB"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 25 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">25</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;">Cost of supplies</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">25</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/CostOfSuppliesSectB"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 26 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">26</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;">Rental or lease costs of computers (see the line 7 instructions)</span>
                             <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">26</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RntlOrLsCostsOfComputers"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 27 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">27</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                             <span style="float:left;white-space:nowrap;">Enter the applicable percentage of contract research expenses (see the </span>
                             <span style="float:left;white-space:nowrap;">line 8 instructions) </span>         
                             <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">27</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/ApplcblPctOfCntrctRsrchExpnss"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 28-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">28</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                              <span style="float:left;">Total qualified research expenses. Add lines 24 through 27</span>
                              <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">28</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/TotalQualifiedResearchExpenses"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 29 -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm;">29</div>
							<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                                     <span style="float:left;white-space:nowrap;">Enter your total qualified research expenses for the prior 3 tax years. If</span>
                                     <span style="float:left;white-space:nowrap;">you had no qualified research expenses in any one of those years, skip</span>
                                     <span style="float:left;white-space:nowrap;">lines 30 and 31</span>
                                     <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">29</div>
							<div class="styLNAmountBox" style="height:11mm;padding-right:1mm;padding-top:7mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/TotQlfyRsrchExpnssForPrior3TYs"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:11mm;border-right-width:1px;background-color:lightgrey"/>
							<div class="styLNAmountBoxNBB" style="height:11mm;border-right-width:0px;border-left-width:0px;"/>
						</div>
					<!-- line 30-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">30</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                            <span style="float:left;white-space:nowrap;">Divide line 29 by 6.0</span>
                        <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">30</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/PartialResearchExpenses"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 31 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">31</div>
						<div class="styLNDesc" style="width:98.75mm;height:4mm;">
                         <span style="float:left;white-space:nowrap;">Subtract line 30 from line 28. If zero or less, enter -0-</span>
                         <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">31</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/DiffOfTotalAndPartialRsrchExp"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!--line32 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">32</div>
							<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							 <span style="float:left;white-space:nowrap;">Multiply line 31 by 14% (.14) If you skipped lines 30 and 31,</span>
							 <br></br>
							 <span style="float:left;white-space:nowrap;">multiply line 28 by 6% (.06).</span>
                             <!--Dotted Line-->
                             <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
                        </div>
                         <div class="styLNRightNumBox" style="height:4mm;padding-top:5mm;border-bottom-width:0px;">32</div>
                         <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;padding-top:5mm;border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/MultiplyDiffRsrchExpByPct"/>
								</xsl:call-template>
							</div>
						</div>
		
         <div class="styBB" style="width:187mm;text-align:right;border-top-width:1px;height:8mm;padding-top:1mm;">  
					<div style="float:left;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions </span>    
					</div>   
        Form <span class="styBoldText">6765</span>    (2011)
      </div>
					<br class="pageEnd"/>
        <!--Begin Page 2 -->
  <!-- Header -->
  <div class="styBB" style="width:187mm;padding-top:.5mm;">  
    <div style="float:left;">Form 6765 (2011)<span style="width:140mm;"></span>
    </div>  
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
</div>
      </div>  
  						
						
					<!-- Begin Section B-->
					<div class="styBB" style="width:187mm;border-top-width:1px;height:8mm;padding-top:2mm;">
						<div class="styPartDesc" style="font-size:7pt;padding-left:0mm;">Section B&#151;Alternative Simplified Credit. <span class="styNormalText">(continued). </span>
						</div>
					</div>	
						<!--line 33 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">33</div>
							<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                                 <span style="float:left;">Add lines 23 and 32</span>
                                 <!--Dotted Line-->
                                 <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">33</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/SumOfLn23AndLn32"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 34 -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm;">34</div>
							<div class="styLNDesc" style="width:138.75mm;height:4mm;">
                                 Are you electing the reduced credit under Section 280C?
                                 <img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
								<!-- yes checkbox -->
								<span style="width:.5mm;"/>
								<span style="padding-right:1mm;">Yes</span>
								<span>
									<xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" 
                    select="$Form6765Data/SectBReducedSect280CCrElection"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/SectBReducedSect280CCrElection"/>
                      <xsl:with-param name="BackupName">IRS6765SectBReducedSect280CCrElection</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode"  select="$Form6765Data/SectBReducedSect280CCrElection"/>
                    <xsl:with-param name="BackupName">IRS6765SectBReducedSect280CCrElection</xsl:with-param>
                  </xsl:call-template>
                </label>
                <!-- no checkbox -->
                <span style="width:2mm;"/>
                <span style="padding-right:1mm;">No</span>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" 
                    select="$Form6765Data/SectBReducedSect280CCrElection"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateNoCheckbox">
                         <xsl:with-param name="TargetNode" select="$Form6765Data/SectBReducedSect280CCrElection"/>
                         <xsl:with-param name="BackupName">IRS6765SectBReducedSect280CCrElection</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectBReducedSect280CCrElection"/>
                    <xsl:with-param name="BackupName">IRS6765SectBReducedSect280CCrElection</xsl:with-param>
<!--                    <xsl:with-param name="BackupName" 
                    select="Form6765Data/SectBReducedSect280CCrElection"/>-->
				  </xsl:call-template>
								</label>
							</div>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB" style="height:4mm;"/>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							 <span style="float:left;white-space:nowrap;">If “Yes,” multiply line 33 by 65% (.65). If “No,” enter the amount from line 33 and see the line 17</span>
                             <span style="float:left;white-space:nowrap;">instructions for the schedule that must be attached. Members of controlled groups or businesses </span>
                             <span style="float:left;white-space:nowrap;">under common control: see instructions for the schedule that must be attached 
          <!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBReducedCr"/>
								</xsl:call-template></span>
                                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>             
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:8mm">34</div>
							<div class="styLNAmountBoxNBB" style="height:8mm;;padding-top:8mm">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBReducedCr"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Begin Section D-->
						<div class="styBB" style="width:187mm;float:none; clear:none;">
							<div class="styGenericDiv" style="font-size:7pt;font-weight:bold;height:8mm;padding-top:2mm;">Section C &#151; Summary
    </div>
						</div>
				<!--line 35 -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBox" style="height:4mm;">35</div>
					<div class="styLNDesc" style="width:138mm;height:4mm;">
                     <span style="float:left;white-space:nowrap;">Enter the portion of the credit from Form 8932, line 2, that is attributable to wages that were also used </span>
                     <span style="float:left;white-space:nowrap;">to figure the credit on line 17 or 34 (whichever applies).</span>
                     <!--Dotted Line-->
                     <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">35</div>
              <div class="styLNAmountBox" style="height:8mm;padding-right:1mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CrForEmployerDiffWagePymt"/>
                </xsl:call-template>
              </div>
            </div>
				<!--line 36 -->
				<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">36</div>
						<div class="styLNDesc" style="width:138mm;height:4mm;">
                        <span style="float:left;">Subtract line 35 from line 17 or line 34 (whichever applies). If zero or less, enter -0-</span>
                        <!--Dotted Line-->
                        <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">36</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/AdjCurrentYearCredit"/>
                </xsl:call-template>
              </div>
            </div>
			     <!--line 37 -->
				<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">37</div>
						<div class="styLNDesc" style="width:138mm;height:4mm;">
                         <span style="float:left;">Credit for increasing research activities from partnerships, S corporations, estates, and trusts</span>
                         <!--Dotted Line-->
                         <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </div>
							<div class="styLNRightNumBox" style="height:4.5mm;">37</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/ResearchActivitiesIncreaseCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 38 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">38</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
                 <span style="float:left;white-space:nowrap;"> Add lines 36 and 37. Estates and trusts go to line 39; partnerships and S corporations, report this </span>
                 <span style="float:left;white-space:nowrap;"> amount on Schedule K; all others, report this amount on line 1c of Form 3800</span>
                    <!--Dotted Line-->
                    <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm">38</div>
              <div class="styLNAmountBox" style="height:8mm;padding-right:1mm;;padding-top:5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCreditPlusIncrease"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line39 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">39</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
                     <span style="float:left;">Amount allocated to beneficiaries of the estate or trust (see instructions)</span>
                     <!--Dotted Line-->
                     <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">39</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/BeneficiariesAllocation"/>
								</xsl:call-template>
							</div>
						</div>
            <!-- line 40 -->
			<div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">40
              </div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
                         <span style="float:left;">Estates and trusts:subtract line 39 from line 38. Report the credit on line 1c of Form 3800 </span>
                         <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top:.5mm;">40</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/EstatesAndTrustsNetTotal"/>
								</xsl:call-template>
							</div>
			   </div>
					
					<!-- END Part II  -->
					
		<!--Footer-->
					<div class="styBB" style="width:187mm;text-align:right;border-top-width:1px;height:8mm;padding-top:1mm;">  
					<div style="float:left;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions </span>    
					</div>   
        Form <span class="styBoldText">6765</span>    (2011)
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
							<xsl:with-param name="TargetNode" select="$Form6765Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 16 - Reduced Credit Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form6765Data/RegularCredit/@reducedCreditIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 39 - Reduced Credit Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form6765Data/AlternateIncrementalCredit/@reducedCreditIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
