<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5884Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5884Data" select="$RtnDoc/IRS5884"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5884Data)"/>
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
				<meta name="Description" content="IRS Form 5884"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 5884 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS5884Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form5884">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;">Form<span class="styFormNumber">5884</span>
							<div style="margin-top:5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:13mm;padding-top:3mm;">
							<span style="height: 1mm;"/>
							<div class="styMainTitle" style="height:8mm;padding-top:1mm;">Work Opportunity Credit</div>
							<br/>					
							<img src="{$ImagePath}/5884_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
							<b>Attach to your tax return.</b>
							<span style="height:5mm;font-size:7pt;padding-top:1mm;background-color:yellow;"></span>							
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:0mm;align:bottom;">
								<img src="{$ImagePath}/5884_Bullet.gif" width="4" height="7" alt="Bullet Image"/>Information about Form 5884 and its instructions is at                                 
									  <a href="http://www.irs.gov/form5884" title="Link to IRS.gov">
									<i>www.irs.gov/form5884.</i>
								</a>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:auto;">OMB No. 1545-0219</div>
							<div class="styTaxYear">20<span class="styTYColor">15</span>
							</div>
							<div>
								<span style="padding-right:6mm;">Attachment</span>
								Sequence No. <span class="styBoldText">77</span>
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:147.25mm;height:9mm;font-size:7pt;">Name(s) shown on return<br/>
							<span>
							  <xsl:choose>
							  <!-- Name from 1120/990/1065 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<!-- Name from 1040 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<!-- Name from 1041 Return Header 
				<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
				  </xsl:call-template>
				  <br/>
				</xsl:when> -->
			  </xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:39.75mm;height:9mm;padding-left:1mm;padding-bottom:0mm;font-size:7pt;">
						Identifying number<br/>
							<span style="height:9mm;float:left;font-weight:normal;padding-top:3mm;padding-bottom:0mm;">
								<xsl:choose>
		          <xsl:when test="$RtnHdrData/Filer/EIN">
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
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
					<!--Line 1 Begin-->
					<div style="width:187mm;">
					  <div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;height:11mm;">1</div>           
						<div class="styLNDesc" style="width:139mm;height:11mm;"> 
						  Enter on the applicable line below the total qualified first- or second-year wages paid or incurred during             
                          the tax year, and multiply by the percentage shown, for services of employees who are certified as members of a targeted group.                 
						</div>
					  </div>
					  <div style="float:right;clear:none;">
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:11mm;background-color:lightgrey;border-right-width:1px;"/>
						<div class="styLNAmountBoxNBB" style="width:31.75mm;height:11mm;border-left-width:0px" />
					  </div>
					</div>
					<br></br>
					<!-- Begin Line 1a -->
					<div style="width:187mm;">
					  <div style="float:left;clear:none;">
					  <div class="styLNLeftNumBoxSD" style="width:8mm;height:8mm;padding-left:4mm;padding-top:1mm;">a</div>
					  <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:1mm;">
						Qualified first-year wages of employees who worked or you at least 120 hours but fewer than 400 hours 
						<!--Dotted Line-->
						<span class="styDotLn" style="height:4mm;padding-top:1mm;float:left;">......................</span>
						<span style="height:4mm;">
						  <span style="width:3mm;height:4mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
						  <span style="width:26mm;height:4mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form5884Data/WagesBetween120And399HrsAmt"/>
							</xsl:call-template>
						  </span>
						  <span style="width:18mm;">
						    <span style="width:1mm;"/>X 25% (.25)</span>
						  </span>
						</div>
						</div>
						<div style="width:40mm;float:right;clear:none;">
						<div class="styLNRightNumBoxNBB" style="width:8mm;height:4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="width:32mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="width:8mm;height:5mm;" >1a</div>
						<div class="styLNAmountBox" style="width:32mm;height:5mm;padding-top:2mm;" >
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form5884Data/TotWagesBetween120And399HrsAmt"/>
						  </xsl:call-template>
						</div>
					  </div>
					  </div>
					  <!-- End Line 1a -->
					  <!-- Begin Line 1b -->
					  <br></br>
					  <div style="width:187mm;">
					  <div style="float:left;clear:none;">
						<div class="styLNLeftNumBoxSD" style="width:8mm;height:6mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:139mm;height:6mm;">
                          Qualified first-year wages of employees who worked for you at least 400 hours
						  <!--Dotted Line-->
						  <span class="styDotLn" style="height:4mm;float:left;">......................</span>
						  <span style="height:4mm;">
						  <span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
						  <span style="width:26mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form5884Data/Wages400OrMoreHoursAmt"/>
							</xsl:call-template>
						  </span>
						  <span style="width:18mm;">
							<span style="width:1mm;"/>X 40% (.40)</span>
						  </span>
						</div>
						</div>
						<div style="width:40mm;float:right;clear:none;">
						<div class="styLNRightNumBox" style="width:8mm;height:9mm;padding-top:4mm;" >1b</div>
						  <div class="styLNAmountBox" style="width:32mm;height:9mm;padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form5884Data/Wages400OrMoreHoursCreditAmt"/>
							</xsl:call-template>
						  </div>
						</div>
						</div>
						<!-- End Line 1b -->
						<!-- Begin Line 1c -->
						<div style="width:187mm;">
						<div style="float:left;clear:none;">
						  <div class="styLNLeftNumBoxSD" style="width:8mm;padding-left:4mm;">c</div>
						  <div class="styLNDesc" style="width:139mm;">Qualified second-year wages of employees certified as long-term family assistance recipients 
						    <br/>
						    <!--Dotted Line-->
							<span class="styDotLn" style="float:left;;">......................</span>								
							<span style="height:4mm;">
                              <span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>									
                              <span style="width:26mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;text-align:right;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form5884Data/SecondYearWagesAmt"/>
								</xsl:call-template>
							  </span>
							  <span style="width:18mm;">
								<span style="width:1mm;"/>X 50% (.50)</span>
							  </span>
							</div>
							</div>
							<div style="width;40mm;float:right;clear:none;">
							<div class="styLNRightNumBox" style="width:8mm;height:8mm;padding-top:4mm;">1c</div>
							<div class="styLNAmountBox" style="width:32mm;height:8mm;padding-top:5mm;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5884Data/TotalSecondYearWagesAmt"/>
							  </xsl:call-template>
							</div>
						  </div>
						  </div>
						  <!--Line 2 Begin-->
						  <div style="width:187mm;">
						  <div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:4mm;">2</div>
							<div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                              <span style="float:left;">Add lines 1a, 1b and 1c. See instructions for the adjustment you must make to salaries and wages </span>  
                              <!--Dotted Line-->
							  <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
							</div>
							<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="width:8mm;height:8mm;padding-top:4.5mm;">2</div>
							<div class="styLNAmountBox" style="width:32mm;height:8mm;padding-top:4.5mm;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5884Data/TotalWagesAmt"/>
						      </xsl:call-template>
							</div>
							</div>
						  </div>
						  <!--Line 3 -->
						<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;height:8mm;padding-top:4mm;">3</div>
							<div class="styLNDesc" style="width:138mm;height:8mm;padding-top:4mm;">
								Work opportunity credit from partnerships, S corporations, cooperatives, estates, and trusts (see instructions)
								<!-- Dotted Line -->
								<!--<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">....</span>-->
								<span style="padding-right:4mm;"></span>
							</div>
							</div>
							<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount" >
									<xsl:with-param name="TargetNode" select="$Form5884Data/PassThruWorkOpportunityCrAmt"/>
								</xsl:call-template>
							</div>
							</div>
						</div>
						<!-- line 4 -->
						<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:12mm;padding-left:2mm;padding-top:2mm;">4</div>
								<div class="styLNDesc" style="width:139mm;padding-top:2mm;">
								    Add lines 2 and 3. Cooperatives, estates, and trusts, go to line 5. Partnerships and S corporations, stop here and report this 
								    amount on Schedule K. All others, stop here and report this amount on Form 3800, Part III, 
								  <span style="float:left;">line 4b</span> 
								<!-- Dotted Line -->
								 <span class="styDotLn" style="float:right;padding-right:1mm;">................................</span>
							</div>
							</div>
							<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:12mm;padding-top:0mm;">
								<div class="styLNRightNumBoxNBB" style="width:8mm;height:4mm;border-left-width:0px;background-color:lightgrey;padding-top:8mm;"/>4</div>
							<div class="styLNAmountBox" style="height:12mm;padding-top:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884Data/TotalCreditsAmt"/>
								</xsl:call-template>
							</div>
							</div>
						</div>
						<!-- line 5 -->
						<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">5</div>
							<div class="styLNDesc" style="width:139mm;padding-top:4mm;">
							  <span style="float:left;">
							    Amount allocated to the patrons of the cooperative or beneficiaries of the estate or trust (see instructions) 								
							  </span>
							  <!-- Dotted Line -->
							   <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>     					
						    </div>
						    </div>
						    <div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4.5mm;">5</div>            
							<div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5884Data/CreditAllocationAmt"/>
								</xsl:call-template>
							</div>
							</div>
						</div>
						<!-- line 6 -->
						<div class="styTBB" style="width:187mm;">
						  <div style="float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:4mm;">6</div>
							<div class="styLNDesc" style="width:139mm;padding-top:4mm;">
							  Cooperatives, estates, and trusts, subtract line 5 from line 4.  Report this amount on Form 3800, Part III, line 
							  <span style="float:left;">4b </span>            
							  <span class="styDotLn" style="float:right;padding-right:1mm;">.................................</span>
						    </div>
						   </div>
						   <div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:11mm;padding-top:7.5mm;">6</div>
							<div class="styLNAmountBoxNBB" style="height:11mm;padding-top:7.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5884Data/EstatesTrustsAndCoopsCreditAmt"/>
								</xsl:call-template>
							</div>
							</div>
						</div>
					<!--End of form-->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:94px;"/>
						Cat. No. 13570D 
						<span style="width:39mm;"/>
                     Form <span class="styBoldText">5884</span> (2015)
                </div>
					<!--Page break for printing on separate page-->
					<!--<br class="pageEnd"/>-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
					<br>	
					</br>
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
							<xsl:with-param name="TargetNode" select="$Form5884Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 8: Form 8884 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form5884Data/CfwdWorkOpptCrTYBeginAfter2006/@form8884Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
