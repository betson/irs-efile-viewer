<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!--  updated by iskilu lawal 08/24/2016  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8611Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8611"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<meta name="Description" content="Form IRS 8611"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8611Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
		    <body class="styBodyClass" style="width:187mm">
				<form name="Form8611">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 20mm;border-bottom-width:1.5px;">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height: 20mm;border-right-width:1.5px">
							<div style="height:14mm">
								  Form <span class="styFormNumber">8611</span>
								  <br/><br/>
								(Rev. December 2013)
								
								<!--General Dependency Push Pin -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<div class="styAgency" style="height:6mm">
								Department of the Treasury
								<br/>
								Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:21.5mm;">
							<div class="styMainTitle" style="padding-top:1mm;">Recapture of Low-Income Housing Credit</div>
							<br/>
							<div class="styFST" style="font-size:7pt;">
								<img src="{$ImagePath}/8611_Bullet.gif" alt="Bullet Image"/> Attach to your tax return.
              </div>
              <br/>
							<div class="styFST" style="font-size:6.2pt;padding-top:4mm;">
								<img src="{$ImagePath}/8611_Bullet.gif" alt="Bullet Image"/> Information about Form 8611 and its instructions is at <a href="http://www.irs.gov/form8611" title="Link to IRS.gov">
                <i>www.IRS.gov/form8611.</i>
            </a>
							</div>
						<div class="styFST" style="font-size:6.2pt;">
						<div style="padding-top:0mm;">
								Note: </div>
								<!--<img src="{$ImagePath}/8611_Bullet.gif" alt="Bullet Image"/>-->
				Complete a separate Form 8611 for each building to which recapture applies.
				  
									</div>	
						</div>
						<div class="styTYBox" style="width:31mm;height:20mm;border-left-width:1.5px;">
							<div class="styOMB" style="height:10mm;padding-top:3mm;padding-left:2mm;text-align:left;">
								OMB No. 1545-1035</div>
							<div style="height:10mm;width:30mm;padding-top:2mm;padding-left:2mm;font-size:7pt;text-align:left;">
								Attachment<br/>								
								Sequence No. 
							<span style="font-size:9pt"><b>90</b></span>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm; height:9mm">
						<div class="styNameBox" style="width:141mm; height:9mm;font-size:7pt;">
							<span class="styBoldText">A </span> Name(s) shown on return<br/>
							<div style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div class="styEINBox" style="width:46mm;font-size:7pt;padding-left:1mm;">
							<div style="height:4mm">
								<b>B Identifying number</b>
							</div>
							<div style="text-align:left;padding-top:1.5mm;height:5mm;font-weight:normal;">
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
							</div>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<div class="styBB" style="width: 187mm; height: 19mm">
						<div class="styNameAddr" 
						style="height: 19mm; width: 100mm;  padding-left:0px;border-right-width: 1px;font-size:7pt;border-bottom:0px;">
							<span class="styBoldText">C </span> Address of building (as shown on Form 8609)
								<br/>
							<xsl:if test="$FormData/BuildingUSAddress">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/BuildingUSAddress"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$FormData/BuildingForeignAddress">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/BuildingForeignAddress"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styNameAddr" style="height: 19mm; width: 41mm; border-right-width: 1px;font-size:7pt;border-bottom:0px;">
							<span class="styBoldText">D </span> Building identification<br/>
							<span style="width: 3mm"/>number (BIN)<br/>
							<br/><br/><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BIN"/>
							</xsl:call-template>
						</div>
						<div class="styNameAddr" style="height: 19mm; width: 46mm;font-size:7pt;border-bottom:0px;">
							<span class="styBoldText">E </span> Date placed in service (from<br/>
							<span style="width: 3mm"/>Form 8609)<br/>
							<br/><br/><br/>
							<span style="text-align:left; width: 42mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/PlacedInServiceDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div style="width: 187mm; height: 13mm">
						<div class="styNameAddr" style="height: 13mm; padding-left:0px; width: 141mm; border-right-width: 1px;font-size:7pt">
							<span class="styBoldText" style="width:5mm">F &nbsp;&nbsp;</span>
								   If building is financed in whole or part with tax-exempt bonds, see instructions and furnish:<br/>
							<span class="styBoldText" style="width:5mm">(1) </span> Issuer's name<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IssuerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/IssuerName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IssuerName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styNameAddr" style="height:13mm; width: 46mm;font-size:7pt">
							<span class="styBoldText">(2)</span> Date of issue<br/>
							<br/>
							<br/>
							<span style="text-align: left; width: 42mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IssueDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div style="width: 187mm; height: 9mm">
						<div class="styNameAddr" style="height: 9mm; padding-left:0px; width: 141mm; border-right-width: 1px;font-size:7pt">
							<div style="width: 187mm; height:5.5mm">
								<span class="styBoldText" style="width:5mm">(3) </span> Name of issue<br/>
							</div>
							<div style="width: 187mm; height:3.5mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IssueNm"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styNameAddr" style="height: 9mm; width: 46mm;font-size:7pt">
							<div style="width: 187mm; height:5.5mm">
								<span class="styBoldText">(4) </span> CUSIP number<br/>
							</div>
							<div style="width: 187mm; height:3.5mm">
								<xsl:choose>
									<xsl:when test="$FormData/CUSIPNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/CUSIPNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/MissingCUSIPReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<!--  Note -->
					<div class="styBB" style="width: 187mm">
						<div class="styGenericDiv" style="font-size: 8pt">
								<b>Note: </b> 
								<span class="styItalicText">Skip lines 1–7 and go to line 8 if recapture is passed through from a flow-through entity (partnership, S corporation,</span><br/>
								<span class="styItalicText" style="padding-left:9.5mm;"> estate, or trust).</span>	However, section 42(j)(5) partnerships must complete lines 1 through 7.
													
						</div>
					</div>
					<!--  End Note  -->
					<!--  Line 1 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">1</div>
						<div style="float:left">
							  Enter total credits reported on Form 8586 in prior years for this building    
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
									.........
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">1</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PYTotalCreditsOnForm8586Amt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 1 -->
					<!--  Line 2 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">2</div>
						<div style="float:left">
							  Credits included on line 1 attributable to additions to qualified basis (see instructions)  
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								.....
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">2</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CreditsIncludedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 2 -->
					<!--  Line 3 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">3</div>
						<div style="float:left">
						  Credits subject to recapture. Subtract line 2 from line 1    
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								.............
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">3</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CreditsSubjectToRecaptureAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 3 -->
					<!--  Line 4 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">4</div>
						<div style="float:left">
							  Credit recapture percentage (see instructions)    
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								................
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">4</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/CreditRecapturePercentRt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 4 -->
					<!--  Line 5 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">5</div>
						<div style="float:left">
						  Accelerated portion of credit. Multiply line 3 by line 4    
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
							..............
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">5</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AcceleratedPortionOfCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 5 -->
					<!--  Line 6 -->
					<div style="width: 187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">6</div>
						<div style="float:left">
							Percentage decrease in qualified basis. Express as a decimal amount carried out to at least 3 places    
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:8mm"/>
							<div class="styLNAmountBoxNBB" style="height:8mm"/>
						</div>
					</div>
					<div style="width:187mm;height:4mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">
							  (see instructions)    
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								......................
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px;border-bottom-width:0px ">6</div>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px ">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DecreaseInQualifiedBasisPctRt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 6 -->
					<!--  Line 7 -->
					<div style="width: 187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">7</div>
						<div style="float:left">
								  Amount of accelerated portion recaptured (see instructions if prior recapture on building). Multiply  
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:20mm;background-color:lightgrey;;border-top-width:1px"/>
							<div class="styLNAmountBoxNBB" style="height:24mm;;border-top-width:1px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">
							 line 5 by line 6. Section 42(j)(5) partnerships, go to line 16. All other flow-through entities (except 
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px "/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">
							  electing large partnerships), enter the result here and enter each recipient’s share in the appropriate  
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px "/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">
							  box of Schedule K-1. Generally, flow-through entities other than electing large partnerships will stop  
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px "/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">
							  here. (<span><b>Note:&#160;</b></span>
							<i>An estate or trust enters on line 8 only its share of recapture amount attributable to the</i>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px " />
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" />
						<div style="float:left">
							<span class="styItalicText">credit amount reported on its  Form 8586.) </span>
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  .................
						   </span>
							<div class="styLNRightNumBox">7</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AcceleratedPrtnRecapturedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 7 -->
					<!--  Line 8 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">8</div>
						<div style="float:left">
							Enter recapture amount from flow-through entity (see <span class="styBoldText">Note</span> above)   
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								..........
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">8</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FlowThruEntityRecaptureAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 8 -->
					<!--  Line 9 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">9</div>
						<div style="float:left">
							  Enter the unused portion of the accelerated amount from line 7 (see instructions)    
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
									......
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">9</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AcceleratedPrtnOfUnsdCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 9 -->
					<!--  Line 10 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-top:0;">10</div>
						<div style="float:left">
							  Net recapture. Subtract line 9 from line 7 or line 8. If less than zero, enter -0-    
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								.......
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">10</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetRecaptureAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 10 -->
					<!--  Line 11 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-top:0;">11</div>
						<div style="float:left">
							  Enter interest on the line 10 recapture amount (see instructions)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 8611, Line 11 - Section 42j5 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/InterestOnRecaptureAmt/@section42j5Cd"/>
							</xsl:call-template>
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								.........
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">11</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InterestOnRecaptureAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 11 -->
					<!--  Line 12 -->
					<div style="width: 187mm;height:3mm">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-top:0;">12</div>
						<div style="float:left">
							  Total amount subject to recapture. Add lines 10 and 11     
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								.............
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px ">12</div>
							<div class="styLNAmountBox" style="border-left-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSubjectToRecaptureAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 12 -->
					<!--  Line 13 -->
					<div style="width: 187mm;height:4mm">
						<div class="styLNLeftNumBox" style="padding-top:0;">13</div>
						<div style="float:left">
							 Unused credits attributable to this building reduced by the accelerated portion included on line 9 
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:8mm"/>
							<div class="styLNAmountBoxNBB" style="height:8mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">
							  (see instructions)
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								......................
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px;border-bottom-width:0px ">13</div>
							<div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/UnusedCreditRedByAccelPrtnAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 13 -->
					<!--  Line 14 -->
					<div style="width: 187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-top:0;">14</div>
						<div style="float:left">
							<span class="styBoldText">Recapture tax.</span> Subtract line 13 from line 12. If zero or less, enter -0-. Enter the result here and on the
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;border-top-width:1px"/>
							<div class="styLNAmountBoxNBB" style="height:16mm;border-top-width:1px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">appropriate line of your tax return (see instructions). If more than one Form 8611 is filed, add the
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" />
							<div class="styLNAmountBoxNBB" style="border-left-width:0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">line 14 amounts from all forms and enter the total on the appropriate line of your return. Electing large
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" />
							<div class="styLNAmountBoxNBB" style="border-left-width:0px"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left">partnerships, see instructions
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								....................
							</span>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox" style="border-left-width:0px"> 
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RecaptureTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 14 -->
					<!--  Line 15 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-top:0;">15</div>
						<div style="float:left">
							<span class="styBoldText">Carryforward of the low-income housing credit attributable to this building.</span> Subtract line 12 from
						</div>
						<div style="float:right">
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
					</div>
					<div class="styBB" style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float:left"> line 13. If zero or less, enter -0- (see instructions)</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
									..............
							</span>
							<div class="styLNRightNumBoxNBB">15</div>
							<div class="styLNAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CarryforwardCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 15 -->
					<!--  Only Section -->
					<div class="styBB" style="width: 187mm; height:6mm;border-top-width: 0px">
						<div class="styPartDesc" style="padding-left:0px;padding-top:1mm;padding-bottom:2mm;">
							Only Section 42(j)(5) partnerships need to complete lines 16 and 17.
						</div>
					</div>
					<!--  End Only Section -->
					<!--  Line 16 -->
					<div style="width: 187mm; height:3mm;">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-top:0;">16</div>
						<div style="float:left">
								Enter interest on the line 7 recapture amount (see instructions)
						</div>
						<div style="float:right;">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
									...........
							</span>
							<div class="styLNRightNumBox" style="border-left-width:0px">16</div>
							<div class="styLNAmountBox" style="border-left-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RecaptureAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 16 -->
					<!--  Line 17 -->
					<div style="width: 187mm;height:3mm;">
						<div style="float:right">
							<div class="styLNRightNumBoxNBB" style="height:7mm"/>
							<div class="styLNAmountBoxNBB" style="height:7mm"/>
						</div>
					</div>
					<div class="styBB" style="width: 187mm;border-bottom-width:1.5px">
						<div class="styLNLeftNumBox" style="padding-top:0;">17</div>
						<div style="float:left">
							  Total recapture. Add lines 7 and 16 (see instructions)
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
								..............
							</span>
							<div class="styLNRightNumBoxNBB" style="border-left-width:0px">17</div>
							<div class="styLNAmountBoxNBB" style="border-left-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRecaptureAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 17 -->
					<!--Footer-->
					<div class="pageEnd" style="width:187mm;">
						<span class="styBoldText" style="70mm">For Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:60mm;text-align:center">                   
								Cat. No. 63983Q </span>   
						<span style="width:50mm;text-align:right">
								Form <b>8611</b> (Rev. 12-2013)</span>  
					</div>
					<!-- BEGIN Left Over Table -->
					<p style="page-break-before:always"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
								Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" 
							onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 8611, Line 11 - Section 42j5 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/InterestOnRecaptureAmt/@section42j5Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
