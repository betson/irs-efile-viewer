<?xml version="1.0" encoding="UTF-8"?>
<!-- 05/05/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 05/11/2017 - Changes made for UWR 194393 - Jeremy Nichols -->
<!-- 08/01/2017 - Changes made for UWR 199448 - Jeremy Nichols -->
<!-- 09/05/2017 - Changes made for defect 125034 - Jeremy Nichols -->
<!-- 07/25/2019 - Changes made for UWR 217968 - Jeremy Nichols -->
<!-- 10/08/2019 - Changes made per 2019 pdf review - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8882Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8882"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<!-- Define Character Set -->
				<meta http-equip="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8882"/>
				<meta name="Generator" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8882Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form 8882">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form number and name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:23mm;">
							Form <span class="styFormNumber">8882</span>
							<br/>
							<span class="styAgency">(Rev. December 2019)</span><br/>
							<!--Push Pin-->
							<span style="height:4mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</span>
							<br/>
							<div >
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:23mm;">
							<div class="styMainTitle">
							  Credit for Employer-Provided Childcare<br/>Facilities and Services
							</div>
							<div class="styFST" style="font-size:7pt;padding-top:4mm;">
								<img src="{$ImagePath}/8882_Bullet.gif" alt="bullet image"/>
							  Attach to your tax return.
							</div><br/>
						    <div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm;">
								<img src="{$ImagePath}/8882_Bullet.gif" alt="Bullet Image"/>
								Go to <i>www.irs.gov/Form8882</i> for the latest information.
							</div>           
						</div>
						<div class="styTYBox" style="width:30mm;height:23mm;padding-left:0mm;">
							<div class="styOMB" style="height:8mm;padding-top:3.5mm;">OMB No. 1545-0123</div>
							<div class="stySequence" style="text-align:left;padding-left:0mm;padding-top:6mm;">Attachment <br/>Sequence No.<b>131</b>
							</div>
						</div>
					</div>
					<!-- End form title and Form number Section -->
					<!-- Begin Name and Identifying Number Section-->
					<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:144mm;height:9mm;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateFilerName">
							  <xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:42mm;height:9mm;padding-left:1mm;">
							<span class="styBoldText">Identifying number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateFilerTIN">
							   <xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Name and Identifying Number Section-->
					<!-- line 1 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">1</div>
							<div class="styLNDesc" style="width:99mm;height:8mm;padding-top:4mm;">
          	Qualified childcare facility expenditures paid or incurred     
          	   <!--Dotted Line-->
								<span class="styDotLn" style="float:none;">......</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">1</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyChldCareFcltyExpendAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;padding-top: 4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top: 4mm;width:31.75mm;"/>
						</div>
					</div>
					<!-- line 2 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">2</div>
							<div class="styLNDesc" style="width:139mm;height:8mm;padding-right:1mm;padding-top: 4mm;">
          Enter 25% (0.25) of line 1  
          <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TwentyFivePctOfFcltyExpendAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;">.........................</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm;">
								<div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        		2
        	</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TwentyFivePctOfFcltyExpendAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--begin  line 3 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">3</div>
							<div class="styLNDesc" style="width:99mm;height:8mm;padding-top:4mm;">
          	Qualified childcare resource and referral expenditures paid or incurred         
          </div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">3</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedChildCareRscExpendAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;padding-top: 4mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;padding-top: 4mm;width:31.75mm;"/>
						</div>
					</div>
					<!--begin  line 4 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">4</div>
							<div class="styLNDesc" style="width:139mm;height:8mm;padding-right:1mm;padding-top: 4mm;">
          Enter 10% (0.10) of line 3  
          <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TenPercentOfResourceExpendAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;">.........................</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm;">
								<div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        		4
        	</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TenPercentOfResourceExpendAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- begin line 5 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 1mm;;">5</div>
							<div class="styLNDesc" style="width:139mm;height:8mm;padding-right:1mm;padding-top: 1mm;">
          Credit for employer-provided childcare facilities and services from partnerships, S corporations,
		estates, and trusts 
		 <!--Dotted Line-->
								<span class="styDotLn" style="float:none;">................................</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/EmplrChldCareFcltsAndSrvcCrAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm;">
								<div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        	5
        </div>
							<div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EmplrChldCareFcltsAndSrvcCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- line 6 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">6</div>
							<div class="styLNDesc" style="height:8mm;padding-right:1mm;padding-top: 4mm;">
         Add lines 2, 4, and 5     
          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;">...........................</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm;">
								<div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;"/>
        	6
        </div>
							<div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SumOfPassThruEntCostsAndCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- line 7 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 1mm;">7</div>
							<div class="styLNDesc" style="width:139mm;height:8.5mm;padding-right:1mm;padding-top: 1mm;">
          Enter the <b>smaller</b> of line 6 or<b> $150,000.</b> Estates and trusts, go to line 8. Partnerships and S corporations, stop here and report this amount on Schedule K. All others, stop here and report this amount on Form 3800, Part III, line 1k.
<!--        <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/EnterSmallerOfLine6Or150000"/>
								</xsl:call-template>  -->
            <!--   Pen & ink   -->
              <xsl:call-template name="LinkToLeftoverDataTableInline"> 
		<xsl:with-param name="Desc">Line 7 Portion Amount 1041</xsl:with-param>
		<xsl:with-param name="TargetNode" select="$FormData/SmllrOfEntitiesSumOr150000Amt/@portionAmount1041"/>
		<xsl:with-param name="DescWidth" select="100"/>
             </xsl:call-template>
								
								<!--Dotted Line-->
								<span class="styDotLn" style="float:none;padding-left:2mm;">............................</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:11mm;padding-top: 0mm;">
								<div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;height:7mm;"/>
     	  7
         </div>
							<div class="styLNAmountBox" style="height:11mm;padding-top: 7mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmllrOfEntitiesSumOr150000Amt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--                  Push Pin
                    <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form1120SData"/>
            </xsl:call-template>

               Pen & ink
              <xsl:call-template name="LinkToLeftoverDataTableInline">          
              <xsl:with-param name="Desc">Form 1120S, Top Left Margin - Section 501d Indicator</xsl:with-param>    
              <xsl:with-param name="TargetNode" select="$Form1120SData/@section501dIndicator"/>    
            </xsl:call-template>   -->
            
					<!-- line 8 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 3.75mm;">8</div>
							<div class="styLNDesc" style="height:8mm;padding-right:1mm;padding-top: 4mm;">
         Amount allocated to beneficiaries of the estate or trust (see instructions)
          <!--Dotted Line-->
								<span class="styDotLn" style="float:none;">...........</span>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top: 0mm;">
								<div class="styLNRightNumBoxNBB" style="width:8mm;border-left-width:0px;"/>
        	8
        </div>
							<div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AllocatedtoBeneficiariesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- begin line 9 -->
					<div style="width:187mm">
						<div style="float:left;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;padding-top: 1mm;;">9</div>
							<div class="styLNDesc" style="width:139mm;height:4mm;padding-right:1mm;padding-top: 1mm;">
          Estates and trusts. Subtract line 8 from line 7. Report this amount on Form 3800, Part III, line 1k<span style="width:2mm;"/>
	   <!--Dotted Line-->
								<span class="styDotLn" style="float:none;">...</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsCreditAmt"/>
									<xsl:with-param name="TabOrder" select="2"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:right;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top: 1mm;">
	
        9
        </div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;width:31.75mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Page End-->
					<div style="width:187mm; border-top:1px solid Black; font-size:8pt">
						<div style="font-weight:bold; float:left; padding-top:0.5mm">
          For Paperwork Reduction Act Notice,  see instructions.
        </div>
						<div style="float:right">
							<span style="margin-right:14mm; font-size:7pt">Cat. No. 33436Y</span>          
          Form <b>8882</b> (Rev. 12-2019)
        </div>
					</div>
					<br/><br/>
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 Portion Amount 1041</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SmllrOfEntitiesSumOr150000Amt/@portionAmount1041"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>