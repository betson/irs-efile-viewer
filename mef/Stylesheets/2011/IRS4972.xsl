<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 sp1 (http://www.altova.com) by Daniel Ashton (IRS) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="FormTools.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS4972Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form4972Data" select="$RtnDoc/IRS4972"/>
  <!-- tallest box on the form was beside 5 lines of text and was 21mm tall -->
  <xsl:variable name="lineHeight" select="21 div 5"/>
  <!-- estimate of 1px line height or width in mm is 0.22 -->
  <xsl:variable name="borderWidth" select="0.17"/>
  <xsl:variable name="pageWidth" select="187"/>
  <xsl:variable name="greyColor" select="'lightgrey'"/>
  <xsl:variable name="widths">
    <!-- lnbox = left number box, rnbox = right number box
         rcbox = right cents box, rbox = total width of right boxes
         rinbox = total width of inner-level right boxes (e.g. lines 13 or 14) -->
    <rec linetype="YesNo" lnbox="10" rnbox="7.5" rcbox="7.75" rbox="23." rinbox="0"/>
    <rec linetype="StdLn" lnbox="10" rnbox="7.5" rcbox="0" rbox="38.5" rinbox="38.1"/>
  </xsl:variable>
  <xsl:variable name="standardLine" select="'StdLn'"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form4972Data)"/>
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
        <meta name="Description" content="IRS Form 4972"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS4972Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form4972">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:{$pageWidth}mm;">
            <div class="styFNBox" style="width:31mm;height:17mm;padding:bottom:0mm;">
              Form<span style="width:1mm;"/>
              <span class="styFormNumber">4972</span>
              <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form4972Data"/>
              </xsl:call-template>
              <div class="styAgency" style="padding-top:0mm;height:0mm;padding:bottom:0mm;">
                Department of the Treasury<br/>
						    Internal Revenue Service (99)
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:17mm;">
              <div class="styMainTitle" style="height:5mm;padding:bottom:0mm;">Tax on Lump-Sum Distributions<br/>
                <span class="styTitleDesc" style="width:125mm;font-size:10pt;">(From Qualified Plans of Participants Born Before January 2, 1936)</span>
              </div>
              <div class="styFBT" style="font-size:7.5pt;height:5mm;padding-top:1mm;">
                <img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> Attach to Form 1040, 1040NR, or Form 1041.</div>
            </div>
            <div class="styTYBox" style="width:31mm; height:17mm">
              <div style="padding-top:0mm;border-bottom:1 solid black;font:7pt;height:4.5mm">
                <span style="vertical-align:-30%">OMB No. 1545-0193</span>
              </div>
              <div style="margin-top:-1.5mm">
                <span class="styTaxYear" style="line-height:75%;font-family:'Arial';font-size:20pt">20</span>
                <span class="styTYColor" style="line-height:75%;font-family:'Arial Black';font-size:20pt">
                  <b>11</b>
                </span>
              </div>
              <br/>
              <div class="stySequence" style="">
                <span style="float:left">Attachment<br/>Sequence No. </span>
                <span>
                  <b style="font-size:11.5pt;font-family:'Arial';vertical-align:sub">28</b>
                </span>
              </div>
            </div>
          </div>
          <!-- Name(s) shown on return -->
          <div class="styBB" style="width:{$pageWidth}mm;">
            <div class="styFNBox" style="width:150mm; height:8mm">
              Name of recipient of distribution<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form4972Data/PersonName"/>
              </xsl:call-template>
              <br/>
              <div style="line-height:100%; font-family:verdana;font-size:7.5pt"/>
            </div>
            <b> Identifying number</b>
            <br/>
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="$Form4972Data/SSN"/>
            </xsl:call-template>
          </div>
          <!-- Part I -->
          <!-- Part I - Header -->
          <xsl:call-template name="PartHeader">
            <xsl:with-param name="partNum" select="'l'"/>
            <xsl:with-param name="text">
              <b>Complete this part to see if you can use Form 4972</b>
            </xsl:with-param>
          </xsl:call-template>
          <!-- Part I - Body -->
          <div style="width:{$pageWidth}mm;height:0mm;border-style:solid; border-bottom-width:{$borderWidth}mm;border-top-width:0;
          border-right-width:0;border-left-width:0;float:left;line-height:normal">
            <!-- Line 1 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="lineType" select="'YesNo'"/>
              <xsl:with-param name="linenum1" select="1"/>
              <xsl:with-param name="linetext">
                <line>Was this a distribution of a plan participant's entire balance (excluding deductible voluntary employee</line>
                <line>contributions and certain forfeited amounts) from all of an employer's qualified plans of one kind (pension,</line>
                <line>profit-sharing, or stock bonus)? If "No," <b>do not</b> use this form</line>
              </xsl:with-param>
              <xsl:with-param name="numdots">16</xsl:with-param>
              <xsl:with-param name="showHeader" select="true()"/>
              <xsl:with-param name="centerAll" select="true()"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/DistributionOfQualifiedPlanInd"/>
                </xsl:call-template>
              </xsl:with-param>
              <xsl:with-param name="cboxDataVal">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/DistributionOfQualifiedPlanInd"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 2 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="lineType" select="'YesNo'"/>
              <xsl:with-param name="linenum1" select="2"/>
              <xsl:with-param name="linetext">Did you roll over any part of the distribution? If "Yes," <b>do not</b> use this form</xsl:with-param>
              <xsl:with-param name="numdots" select="11"/>
              <xsl:with-param name="centerAll" select="true()"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/RolloverInd"/>
                </xsl:call-template>
              </xsl:with-param>
              <xsl:with-param name="cboxDataVal">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/RolloverInd"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 3 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="lineType" select="'YesNo'"/>
              <xsl:with-param name="linenum1" select="3"/>
              <xsl:with-param name="linetext">Was this distribution paid to you as a beneficiary of a plan participant who was born before January 2, 1936?</xsl:with-param>
              <xsl:with-param name="centerAll" select="true()"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/EmployeeBeneficiaryDistriInd"/>
                </xsl:call-template>
              </xsl:with-param>
              <xsl:with-param name="cboxDataVal">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/EmployeeBeneficiaryDistriInd"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 4 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="lineType" select="'YesNo'"/>
              <xsl:with-param name="linenum1" select="4"/>
              <xsl:with-param name="linetext">
                <line>Were you <b>(a)</b> a plan participant who received this distribution, <b>(b)</b> born before January 2, 1936, and <b>(c)</b> a</line>
                <line>participant in the plan for at least 5 years before the year of the distribution?</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="10"/>
              <xsl:with-param name="centerAll" select="true()"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/QualifyingAge5YearMemberInd"/>
                </xsl:call-template>
              </xsl:with-param>
              <xsl:with-param name="cboxDataVal">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/QualifyingAge5YearMemberInd"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line after 4 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="lineType" select="'YesNo'"/>
              <xsl:with-param name="linetext">If you answered "No" to both questions 3 <b>and</b> 4, <b>do not</b> use this form.</xsl:with-param>
              <xsl:with-param name="noBottomLine" select="1"/>
              <xsl:with-param name="backgroundColor" select="$greyColor"/>
            </xsl:call-template>
            <!-- Line 5a-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="lineType" select="'YesNo'"/>
              <xsl:with-param name="linenum1" select="'5'"/>
              <xsl:with-param name="lnalpha" select="'a'"/>
              <xsl:with-param name="linetext">
                <line>Did you use Form 4972 after 1986 for a previous distribution from your own plan? If "Yes," <b>do not</b> use this</line>
                <line>form for a 2011 distribution from your own plan</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="20"/>
              <xsl:with-param name="centerAll" select="true()"/>
              <xsl:with-param name="linenum2" select="'5a'"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/PriorYearDistributionInd"/>
                </xsl:call-template>
              </xsl:with-param>
              <xsl:with-param name="cboxDataVal">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/PriorYearDistributionInd"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line (5)b-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="lineType" select="'YesNo'"/>
              <xsl:with-param name="lnalpha" select="'b'"/>
              <xsl:with-param name="linetext">
                <line>If you are receiving this distribution as a beneficiary of a plan participant who died, did you use Form 4972</line>
                <line>for a previous distribution received for that participant after 1986? If "Yes," <b>do not</b> use the form for this</line>
                <line>distribution</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="32"/>
              <xsl:with-param name="centerAll" select="true()"/>
              <xsl:with-param name="linenum2" select="'5b'"/>
              <xsl:with-param name="noBottomLine" select="1"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/BeneficiaryDistributionInd"/>
                </xsl:call-template>
              </xsl:with-param>
              <xsl:with-param name="cboxDataVal">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/BeneficiaryDistributionInd"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
          </div>
          <!-- Part II - Header -->
          <xsl:call-template name="PartHeader">
            <xsl:with-param name="partNum" select="'ll'"/>
            <xsl:with-param name="text">
              <b>Complete this part to choose the 20% capital gain election. </b> (see instructions)</xsl:with-param>
          </xsl:call-template>
          <!-- Part II - Body -->
          <!-- Line 6-->
         	<div style="width:187mm;float:left;clear:none;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.6mm;">6</div>
				<div class="styLNDesc" style="width:138.5mm;">
					<span style="float:left;">Capital gain part from Form 1099-R, box 3
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Capital Gaining Election NUA Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt"/>
							</xsl:call-template>
							
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Capital Gaining Election NUA Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd"/>
							</xsl:call-template>
					</span>
					<!--Dotted Line-->
					<div class="styDotLn" style="padding-right:1mm;">...................</div>
				</div>
				<div class="styLNRightNumBox" style="width:7.5mm;height:4.5mm;">6</div>
				<div class="styLNAmountBox" style="width:31mm;height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt"/>
					</xsl:call-template>
				</div>
			</div> 
          <!-- Line 7-->
          <div style="width:187mm;float:left;clear:none;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.6mm;">7</div>
				<div class="styLNDesc" style="width:138.5mm;">
					<span style="float:left;">Multiply line 6 by 20% (.20)</span>
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">......................
						<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/>
						</div>
				</div>
				<div class="styLNRightNumBox" style="width:7.5mm;height:4.5mm;">7</div>
				<div class="styLNAmountBox" style="width:31mm;height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainTimesElectionPctAmt"/>
					</xsl:call-template>
				</div>
			</div> 
			<div style="width:187mm;float:left;clear:none;bottom;border-bottom: 1px solid black">
				<div class="styLNDesc" style="width:148.5mm;padding-left:10mm">
					<span style="float:left;">
					If you also choose to use Part III, go to line 8. Otherwise, include the amount from line 7 in the total on<br/>
					Form 1040, line 44, Form 1040NR, line 42, or Form 1041, Schedule G, line 1b, whichever applies.
					</span>
				</div>
				<div class="styLNAmountBox" style="float:right;height:7.4mm;border-bottom:0px;width:38.5mm;background-color:LightGrey"/>
			</div>
          <!-- Part III - Header -->
          <xsl:call-template name="PartHeader">
            <xsl:with-param name="partNum" select="'lll'"/>
            <xsl:with-param name="text">
              <b>Complete this part to choose the 10-year tax option </b> (see instructions)</xsl:with-param>
          </xsl:call-template>
          <!-- Part III - Body -->
          <div style="width:{$pageWidth}mm;height:0mm;border-style:solid; border-bottom-width:{$borderWidth}mm;border-top-width:0;
          border-right-width:0;border-left-width:0;">
            <!-- Line 8-->
            <div class="styGenericDiv" style="width:187mm;height:7.5mm">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.6mm;">8</div>
				<div class="styLNDesc" style="height:7.5mm;width:138.5mm;">
					<span style="float:left;">Ordinary income from Form 1099-R, box 2a minus box 3. If you did not complete Part II, enter the
						taxable amount from Form 1099-R, box 2a 
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Net Unrealized Appreciation Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Net Unrealized Appreciation Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationCd"/>
							</xsl:call-template>
					
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
					</span>
				</div>
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;">8</div>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;padding-top:3.5mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt"/>
					</xsl:call-template>
				</div>
			</div> 
            <!-- Line 9-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'9'"/>
              <xsl:with-param name="linetext">Death benefit exclusion for a beneficiary of a plan participant who died before August 21, 1996</xsl:with-param>
              <xsl:with-param name="numdots" select="3"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriDeathBnftExclAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 10-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'10'"/>
              <xsl:with-param name="linetext">Total taxable amount. Subtract line 9 from line 8</xsl:with-param>
              <xsl:with-param name="numdots" select="17"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTotalTaxableAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 11-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'11'"/>
              <xsl:with-param name="linetext">Current actuarial value of annuity from Form 1099-R, box 8. If none, enter -0-</xsl:with-param>
              <xsl:with-param name="numdots" select="7"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/AnnuityActuarialValueAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 12-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'12'"/>
              <xsl:with-param name="linetext">
                <line>Adjusted total taxable amount. Add lines 10 and 11. If this amount is $70,000 or more, skip lines</line>
                <line>13 through 16, enter this amount on line 17, and go to line 18</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="12"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjTotTaxableAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 13-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="linenum1" select="'13'"/>
              <xsl:with-param name="linetext">Multiply line 12 by 50% (.50), but <b>do not</b> enter more than $10,000</xsl:with-param>
              <xsl:with-param name="numdots" select="2"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistri50PctTotalTxblAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 14-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="3"/>
              <xsl:with-param name="linenum1" select="'14'"/>
              <xsl:with-param name="linetext">
                <line>Subtract $20,000 from line 12. If line 12 is</line>
                <line>$20,000 or less, enter -0-</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="6"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumNetAdjTotalTaxableAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 15-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="linenum1" select="'15'"/>
              <xsl:with-param name="linetext">Multiply line 14 by 20% (.20)</xsl:with-param>
              <xsl:with-param name="numdots" select="14"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriProratedTxblAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 16-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'16'"/>
              <xsl:with-param name="linetext">Minimum distribution allowance. Subtract line 15 from line 13</xsl:with-param>
              <xsl:with-param name="numdots" select="12"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumMinDistriAllowanceAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 17-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'17'"/>
              <xsl:with-param name="linetext">Subtract line 16 from line 12</xsl:with-param>
              <xsl:with-param name="numdots" select="23"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAllowableTxblAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 18-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'18'"/>
              <xsl:with-param name="linetext">Federal estate tax attributable to lump-sum distribution</xsl:with-param>
              <xsl:with-param name="numdots" select="14"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpDistribFederalEstateTaxAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 19-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'19'"/>
              <xsl:with-param name="linetext">Subtract line 18 from line 17. If line 11 is zero, <b>skip</b> lines 20 through 22 and go to line 23</xsl:with-param>
              <xsl:with-param name="numdots" select="3"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriNetTaxableAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 20-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="linenum1" select="'20'"/>
              <xsl:with-param name="linetext">
                <line>Divide line 11 by line 12 and enter the result as a decimal (rounded to at</line>
                <line>least three places)</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="18"/>
              <xsl:with-param name="slightlylong" select="1"/>
              <xsl:with-param name="percentageBox" select="1"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriActuarialAdjPct"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 21-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="linenum1" select="'21'"/>
              <xsl:with-param name="linetext">Multiply line 16 by the decimal on line 20</xsl:with-param>
              <xsl:with-param name="numdots" select="10"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMinAllwPercentAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 22-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="linenum1" select="'22'"/>
              <xsl:with-param name="linetext">Subtract line 21 from line 11</xsl:with-param>
              <xsl:with-param name="numdots" select="14"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjActuarialAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 23-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'23'"/>
              <xsl:with-param name="linetext">Multiply line 19 by 10% (.10)</xsl:with-param>
              <xsl:with-param name="numdots" select="23"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriPctAdjTxblAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 24-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'24'"/>
              <xsl:with-param name="linetext">Tax on amount on line 23. Use the Tax Rate Schedule in the instructions</xsl:with-param>
              <xsl:with-param name="numdots" select="9"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTaxOnPercentAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 25-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'25'"/>
              <xsl:with-param name="linetext">
                <line>Multiply line 24 by ten (10). If line 11 is zero, <b>skip</b> lines 26 through 28, enter this amount on</line>
                <line>line 29, and go to line 30</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="24"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTentAvgTaxAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 26-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="linenum1" select="'26'"/>
              <xsl:with-param name="linetext">Multiply line 22 by 10% (.10)</xsl:with-param>
              <xsl:with-param name="numdots" select="14"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTxblAdjActrlAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 27-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="linenum1" select="'27'"/>
              <xsl:with-param name="linetext">
                <line>Tax on amount on line 26. Use the Tax Rate Schedule in the</line>
                <line>instructions</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="20"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/AdjustedActuarialAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 28-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'28'"/>
              <xsl:with-param name="linetext">Multiply line 27 by ten (10)</xsl:with-param>
              <xsl:with-param name="numdots" select="24"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjAverageTaxAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Line 29-->
			<div style="width:187mm;float:left;clear:none;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">29</div>
				<div class="styLNDesc" style="width:138.5mm;">
					<span style="float:left;">Subtract line 28 from line 25. Multiple recipients, see instructions
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Lump Summary Distribution Multiplier Recipients Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMultRecipientsCd"/>
							</xsl:call-template>
					</span>
					<!--Dotted Line-->
					<div class="styDotLn" style="padding-right:1mm;">...........</div>
					<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> 
				</div>
				<div class="styLNRightNumBox" style="width:7.5mm;height:4.5mm;">29</div>
				<div class="styLNAmountBox" style="width:31mm;height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumRsdlAnnuityAvgTaxAmt"/>
					</xsl:call-template>
				</div>
			</div>
            <!-- Line 30-->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'30'"/>
              <xsl:with-param name="linetext">
                <line>
                  <b>Tax on lump-sum distribution.</b> Add lines 7 and 29. Also include this amount in the total on Form</line>
                <line>1040, line 44, Form 1040NR, line 42, or Form 1041, Schedule G, line 1b, whichever applies</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="2"/>
              <xsl:with-param name="withArrow" select="1"/>
              <xsl:with-param name="noBottomLine" select="1"/>
              <xsl:with-param name="dataVal">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistributionTaxAmt"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
          </div>
          <!-- Page Footer-->
          <div class="pageEnd" style="width:{$pageWidth}mm;padding-top:0mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
            </div>
            <div style="float:right;width:80mm;text-align:right">
							Cat. No. 13187U
							<span style="width:29.5mm;"/>
							Form 
							<span class="styBoldText" style="font-size:8pt;">4972</span> (2011)
                           </div>
          </div>
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
              <xsl:with-param name="TargetNode" select="$Form4972Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
           <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part II, Line 6 - Capital Gaining Election NUA Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part II, Line 6 - Capital Gaining Election NUA Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part III, Line 8 - Net Unrealized Appreciation Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part III, Line 8 - Net Unrealized Appreciation Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part III, Line 29 - Lump Summary Distribution Multiplier Recipients Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMultRecipientsCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part III, Line 17- Waived Short Method Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/PenaltyAmt/@waivedShortMethodAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part IV, Line 27 - Waived Literal Regular Method</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/TotalPenaltyAmt/@waivedLiteralRegularMethodCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part IV, Line 27 - Waived Regular Method Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4972Data/TotalPenaltyAmt/@waivedRegularMethodAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
