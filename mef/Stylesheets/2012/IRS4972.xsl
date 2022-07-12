<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 sp1 (http://www.altova.com) by Daniel Ashton (IRS) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
            <div class="styFNBox" style="width:31mm;height:23mm;padding:bottom:0mm;">
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
            <div class="styFTBox" style="width:125mm;height:23mm;">
              <div class="styMainTitle" style="height:5mm;padding:bottom:0mm;">Tax on Lump-Sum Distributions<br/>
                <span class="styTitleDesc" style="width:125mm;font-size:10pt;">(From Qualified Plans of Participants Born Before January 2, 1936)</span>
              </div>
              <div class="styFBT" style="font-size:7.5pt;height:5mm;padding-top:1mm;">
				  <img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> Information about Form 4972 and its instructions is available<br />
				  at <i>www.irs.gov/form4972.</i><br />
                <img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> Attach to Form 1040, 1040NR, or Form 1041.</div>
            </div>
            <div class="styTYBox" style="width:31mm; height:23mm">
              <div style="padding-top:0mm;border-bottom:1 solid black;font:7pt;height:4.5mm">
                <span style="vertical-align:-30%">OMB No. 1545-0193</span>
              </div>
              <div style="margin-top:-1.5mm">
                <span class="styTaxYear" style="line-height:75%;font-family:'Arial';font-size:20pt">20</span>
                <span class="styTYColor" style="line-height:75%;font-family:'Arial Black';font-size:20pt">
                  <b>12</b>
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
          <div class="styBB" style="width:187mm;float:none;clear:both;">
			  <span class="styPartName" style="width:14mm;">Part I</span>
              <span class="styPartDesc" style="">Complete this part to see if you can use Form 4972</span>
          </div>
          <!-- Part I - Body -->
          <div class="styBB" style="width:187mm;">
            <!-- Line 1 -->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">1</div>
				<div class="styLNDesc" style="width:150.5mm;">
					<span style="float:left;">Was this a distribution of a plan participant's entire balance (excluding deductible voluntary employee<br/>contributions and certain forfeited amounts) from all of an employer's qualified plans of one kind (pension,<br/>profit-sharing, or stock bonus)? If "No," <b>do not</b> use this form
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
                </span>
				</div>
				</span>
				<span style="float:right;">
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;"/>
				<span class="styIRS4972LNYesNoBox" style="height:4.5mm;width:7.5mm;">Yes</span>
			    <span class="styIRS4972LNYesNoBox" style="height:4.5mm;width:7.5mm;">No</span>
				<br/>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:6mm;padding-top:1.5mm;">1</span>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:6mm;padding-top:1.5mm;font:normal;">
					<xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/DistributionOfQualifiedPlanInd"/>
                </xsl:call-template>
                </span>
                <span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:6mm;padding-top:1.5mm;font:normal">
					<xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/DistributionOfQualifiedPlanInd"/>
                </xsl:call-template>
			</span>
            </span>
            </div>
            <!-- Line 2 -->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">2</div>
				<div class="styLNDesc" style="width:150.5mm;">
					<span style="float:left;">Did you roll over any part of the distribution? If "Yes," <b>do not</b> use this form
						<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;">2</span>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;font:normal;">
					<xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/RolloverInd"/>
                </xsl:call-template>
                </span>
                <span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;font:normal">
					<xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/RolloverInd"/>
                </xsl:call-template>
			</span>
            </span>
            </div>

            <!-- Line 3 -->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">3</div>
				<div class="styLNDesc" style="width:149mm;">
					<span style="float:left;">Was this distribution paid to you as a beneficiary of a plan participant who was born before January 2, 1936?
					</span>
				</div>
				</span>
				<span style="float:right;">
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;">3</span>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;font:normal;">
					<xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/EmployeeBeneficiaryDistriInd"/>
                </xsl:call-template>
                </span>
                <span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;font:normal">
					<xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/EmployeeBeneficiaryDistriInd"/>
                </xsl:call-template>
			</span>
            </span>
            </div>
            <!-- Line 4 -->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">4</div>
				<div class="styLNDesc" style="width:150.5mm;">
					<span style="float:left;">Were you <b>(a)</b> a plan participant who received this distribution, <b>(b)</b> born before January 2, 1936, <b>and (c)</b> a<br/>participant in the plan for at least 5 years before the year of the distribution?
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
                </span>
				</div>
				</span>
				<span style="float:right;">
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;">4</span>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;font:normal;">
					<xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/QualifyingAge5YearMemberInd"/>
                </xsl:call-template>
                </span>
                <span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;font:normal">
					<xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/QualifyingAge5YearMemberInd"/>
                </xsl:call-template>
			</span>
            </span>
            </div>
            <!-- Line after 4 -->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;"></div>
				<div class="styLNDesc" style="width:138.5mm;">
					<span style="float:left;">If you answered "No" to both questions 3 <b>and</b> 4, <b>do not</b> use this form.
					</span>
				</div>
				</span>
				<span style="float:right;">
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;font:normal;background-color:lightgray;border-bottom-width:0px;"/>
                <span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:4.5mm;font:normal;background-color:lightgray;border-bottom-width:0px;"/>
           </span>
			</div>   
         
                        
            <!-- Line 5a-->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">5a</div>
				<div class="styLNDesc" style="width:150.5mm;">
					<span style="float:left;">Did you use Form 4972 after 1986 for a previous distribution from your own plan? If "Yes," <b>do not</b> use this<br/>form for a 2012 distribution from your own plan
						<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<span class="styIRS4972LNYesNoBox" style="height:7.5mm;padding-top:3mm;width:7.5mm;">5a</span>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;font:normal;">
					<xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/PriorYearDistributionInd"/>
                </xsl:call-template>
                </span>
                <span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:7.5mm;padding-top:3mm;font:normal">
					<xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/PriorYearDistributionInd"/>
                </xsl:call-template>
			</span>
            </span>				
            </div>
                       
            <!-- Line (5)b-->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">b</div>
				<div class="styLNDesc" style="width:150.5mm;">
					<span style="float:left;">If you are receiving this distribution as a beneficiary of a plan participant who died, did you use Form 4972<br/>for a previous distribution received for that participant after 1986? If "Yes," <b>do not</b> use the form for this<br/>distribution
				<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
                </span>
				</div>
				</span>
				<span style="float:right;">
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:10.5mm;padding-top:6mm;border-bottom-width:0px;">5b</span>
				<span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:10.5mm;padding-top:6mm;font:normal;border-bottom-width:0px;">
					<xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/BeneficiaryDistributionInd"/>
                </xsl:call-template>
                </span>
                <span class="styIRS4972LNYesNoBox" style="width:7.5mm;height:10.5mm;padding-top:6mm;font:normal;border-bottom-width:0px;">
					<xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form4972Data/BeneficiaryDistributionInd"/>
                </xsl:call-template>
			</span>
            </span>			  
            </div>
            </div>
     
          <!-- Part II - Header -->
          <div class="styBB" style="width:187mm;float:none;clear:both;">
			  <span class="styPartName" style="width:14mm;">Part II</span>
              <span class="styPartDesc" style="">Complete this part to choose the 20% capital gain election. <span style="font:normal;"> (see instructions)</span></span>
          </div>
          
          <!-- Part II - Body -->
          <!-- Line 6-->
         	<div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">6</div>
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
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="width:7.5mm;height:4.5mm;">6</div>
				<div class="styLNAmountBox" style="width:31mm;height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
          <!-- Line 7-->
          <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">7</div>
				<div class="styLNDesc" style="width:138.5mm;">
					<span style="float:left;">Multiply line 6 by 20% (.20)</span>
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">......................
						<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/>
						</div>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="width:7.5mm;height:4.5mm;">7</div>
				<div class="styLNAmountBox" style="width:31mm;height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainTimesElectionPctAmt"/>
					</xsl:call-template>
				</div>
				</span>
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
          <div class="styBB" style="width:187mm;float:none;clear:both;">
			  <span class="styPartName" style="width:14mm;">Part III</span>
              <span class="styPartDesc" style="">Complete this part to choose the 10-year tax option <span style="font:normal;">(see instructions)</span></span>
          </div>
          
          <!-- Part III - Body -->
          <div style="width:{$pageWidth}mm;height:0mm;border-style:solid; border-bottom-width:{$borderWidth}mm;border-top-width:0;
          border-right-width:0;border-left-width:0;">
            <!-- Line 8-->
            <div class="styGenericDiv" style="width:187mm;height:7.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">8</div>
				<div class="styLNDesc" style="height:7.5mm;width:138.5mm;">
					<span style="float:left;">
					Enter the amount from Form 1099-R, box 2a minus box 3. If you did not complete Part II, enter the<br/>
					amount from box 2a. Multiple recipients (and recipients who elect to include NUA in taxable income)<br/>
					see instructions
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
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:10.8mm;width:7.5mm;padding-top:6.8mm;padding-right:0.5mm;">8</div>
				<div class="styLNAmountBox" style="height:10.8mm;width:31mm;padding-top:6.8mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
            <!-- Line 9-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 3.2mm;">9</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">
					Death benefit exclusion for a beneficiary of a plan participant who died before August 21, 1996
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">9</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriDeathBnftExclAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
        
            <!-- Line 10-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">10</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">
					Total taxable amount. Subtract line 9 from line 8
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">10</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTotalTaxableAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
 
            <!-- Line 11-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">11</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">
					Current actuarial value of annuity from Form 1099-R, box 8. If none, enter -0-
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">11</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/AnnuityActuarialValueAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
			
            <!-- Line 12-->
            <div class="styGenericDiv" style="width:187mm;height:7.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">12</div>
				<div class="styLNDesc" style="height:7.5mm;width:138.5mm;">
					<span style="float:left;">
					Adjusted total taxable amount. Add lines 10 and 11. If this amount is $70,000 or more, <b>skip</b> lines<br/>
                13 through 16, enter this amount on line 17, and go to line 18
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;padding-top:3.5mm;padding-right:0.5mm;">12</div>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;padding-top:3.5mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjTotTaxableAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
			
            <!-- Line 13-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">13</div>
				<div class="styLNDesc" style="height:4.5mm;width:auto;">
					<span style="float:left;">
					Multiply line 12 by 50% (.50), but <b>do not</b> enter more than $10,000
						<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">13</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistri50PctTotalTxblAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div> 
            
            <!-- Line 14-->
            <div class="styGenericDiv" style="width:187mm;height:7.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">14</div>
				<div class="styLNDesc" style="height:7.5mm;width:auto;">
					<span style="float:left;">Subtract $20,000 from line 12. If line 12 is<br/>
                $20,000 or less, enter -0-
						<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;padding-top:3.5mm;padding-right:0.5mm;">14</div>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;padding-top:3.5mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumNetAdjTotalTaxableAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;border-bottom-width:0px;"/>
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div> 
            
            <!-- Line 15-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">15</div>
				<div class="styLNDesc" style="height:4.5mm;width:auto;">
					<span style="float:left;">Multiply line 14 by 20% (.20)
						<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">15</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriProratedTxblAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div> 
            
            <!-- Line 16-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">16</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">Minimum distribution allowance. Subtract line 15 from line 13
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">16</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumMinDistriAllowanceAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
			
            <!-- Line 17-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">17</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">Subtract line 16 from line 12
					
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">17</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAllowableTxblAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
            
            <!-- Line 18-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">18</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">Federal estate tax attributable to lump-sum distribution
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">18</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpDistribFederalEstateTaxAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
        
            <!-- Line 19-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">19</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">Subtract line 18 from line 17. If line 11 is zero, <b>skip</b> lines 20 through 22 and go to line 23
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">19</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriNetTaxableAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div> 
           
            <!-- Line 20-->
            <div class="styGenericDiv" style="width:187mm;height:7.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">20</div>
				<div class="styLNDesc" style="height:7.5mm;width:auto;">
					<span style="float:left;">Divide line 11 by line 12 and enter the result as a decimal (rounded to at<br/>
                least three places)
						<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;padding-top:3.5mm;padding-right:0.5mm;">20</div>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;padding-top:3.5mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulatePercent">
					  <xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriActuarialAdjPct"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div>
			
            <!-- Line 21-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">21</div>
				<div class="styLNDesc" style="height:4.5mm;width:auto;">
					<span style="float:left;">Multiply line 16 by the decimal on line 20
						<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">21</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMinAllwPercentAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div> 
          
            <!-- Line 22-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">22</div>
				<div class="styLNDesc" style="height:4.5mm;width:auto">
					<span style="float:left;">Subtract line 21 from line 11
						<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">22</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjActuarialAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div> 
            
            <!-- Line 23-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">23</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">Multiply line 19 by 10% (.10)
					
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">23</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriPctAdjTxblAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div>
        
            <!-- Line 24-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">24</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">Tax on amount on line 23. Use the Tax Rate Schedule in the instructions
					
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">24</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTaxOnPercentAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div>
          
            <!-- Line 25-->
            <div class="styGenericDiv" style="width:187mm;height:7.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">25</div>
				<div class="styLNDesc" style="height:7.5mm;width:138.5mm;">
					<span style="float:left;">Multiply line 24 by ten (10). If line 11 is zero, <b>skip</b> lines 26 through 28, enter this amount on<br/>line 29, and go to line 30
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;padding-top:3.5mm;padding-right:0.5mm;">25</div>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;padding-top:3.5mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTentAvgTaxAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div>
          
            <!-- Line 26-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">26</div>
				<div class="styLNDesc" style="height:4.5mm;width:auto;">
					<span style="float:left;">Multiply line 22 by 10% (.10)
						<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">26</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTxblAdjActrlAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div>
            
            <!-- Line 27-->
            <div class="styGenericDiv" style="width:187mm;height:7.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">27</div>
				<div class="styLNDesc" style="height:7.5mm;width:auto;">
					<span style="float:left;">Tax on amount on line 26. Use the Tax Rate Schedule in the<br/>instructions
						<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;padding-top:3.5mm;padding-right:0.5mm;">27</div>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;padding-top:3.5mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/AdjustedActuarialAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;background-color:lightgray;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:7.5mm;width:31mm;border-bottom-width:0px;"/>
				</span>
			</div>
            
            <!-- Line 28-->
            <div class="styGenericDiv" style="width:187mm;height:4.5mm">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">28</div>
				<div class="styLNDesc" style="height:4.5mm;width:138.5mm;">
					<span style="float:left;">Multiply line 27 by ten (10)
					
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="height:4.5mm;width:7.5mm;padding-right:0.5mm;">28</div>
				<div class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjAverageTaxAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div>
        
            <!-- Line 29-->
			<div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">29</div>
				<div class="styLNDesc" style="width:138.5mm;">
					<span style="float:left;">Subtract line 28 from line 25. Multiple recipients see instructions
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Lump Summary Distribution Multiplier Recipients Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMultRecipientsCd"/>
							</xsl:call-template>
					</span>
					<!--Dotted Line-->
					<div class="styDotLn" style="padding-right:1mm;">...........</div>
					<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> 
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="width:7.5mm;height:4.5mm;padding-right:0.5mm;">29</div>
				<div class="styLNAmountBox" style="width:31mm;height:4.5mm;padding-right:0.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumRsdlAnnuityAvgTaxAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div>
            <!-- Line 30-->
            <div style="width:187mm;float:left;clear:none;">
				<span style="float:left;">
				<div class="styLNLeftNumBox" style="width:10mm;padding-left: 1.6mm;">30</div>
				<div class="styLNDesc" style="width:138.5mm;">
					<span style="float:left;"><b>Tax on lump-sum distribution.</b> Add lines 7 and 29. Also include this amount in the total on Form<br/>1040, line 44, Form 1040NR, line 42, or Form 1041, Schedule G, line 1b, whichever applies
					<!--Dotted Line-->
					<span class="styBoldText" style="padding-left:1mm;padding-right:1mm;">
										<span style="width:2.6mm"/>.
										<span style="width:2.6mm"/>.
									</span>
					<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> 
					</span>
				</div>
				</span>
				<span style="float:right;">
				<div class="styLNRightNumBox" style="width:7.5mm;height:7.3mm;padding-right:0.5mm;padding-top:4mm;border-bottom-width:0px;">30</div>
				<div class="styLNAmountBox" style="width:31mm;height:7.3mm;padding-right:0.5mm;padding-top:4mm;border-bottom-width:0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistributionTaxAmt"/>
					</xsl:call-template>
				</div>
				</span>
			</div>
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
							<span class="styBoldText" style="font-size:8pt;">4972</span> (2012)
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
