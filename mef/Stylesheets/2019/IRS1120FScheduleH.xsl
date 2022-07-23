<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FScheduleHStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest    -->
  <xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleH"/>
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
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="Form IRS1120FScheduleH"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!-- **************************************************************************************************************************    
             HINTS: The unique function of this form is L1 -20 display either in US or Foreign currency base on the 
                              response to the Note in Part I.  INLINE PRINT ONLY
              **************************************************************************************************************************** -->
          <!-- Print Statement -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120FScheduleHStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm">
        <form name="Form1120FScheduleH">
          <!-- BEGIN WARNING LINE -->
			<div class="styGenericDiv" style=" width:187mm;">
				<xsl:call-template name="DocumentHeader"/>
			</div>
			<!-- END WARNING LINE -->
			<!--Begin Header-->
			<div class="styBB" style="width:187mm;border-bottom-width:2px;">
				<div class="styFNBox" style="width:33.5mm;height:20mm;border-right-width:1px;">
					<div class="styFormNumber" style="font-size: 10pt;height:14mm">
						SCHEDULE H
						<br/>
						<div class="styFormNumber" style="font-size: 9pt;">(Form 1120-F)
						</div>	     
						<br/> 
						<!-- General Dependency Push Pin -->
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>			  
					</div>
					<div class="styAgency" style="font-weight:normal;height:6mm;">Department of the Treasury<br/>Internal Revenue Service
					</div>
			</div>
			<div class="styFTBox" style="width:122.5mm;height:20mm;">
				<div class="styMainTitle" style="height:10.5mm;">Deductions Allocated To Effectively Connected<br/>Income Under Regulations Section 1.861-8
				</div>
				<div class="styFST">
				<br/>
				  <img src="{$ImagePath}/1120FScheduleH_Bullet.gif" alt="Bullet Image"/>Attach to Form 1120-F.
				  <br/>
				  <img src="{$ImagePath}/1120FScheduleH_Bullet.gif" alt="Bullet Image"/>&#160;Go to 
				  <a style="text-decoration:none;color:black;"  href="http://www.irs.gov/form1120f"><i>www.irs.gov/Form1120F</i></a>for instructions and the latest information.
				</div>
			</div>
			<div class="styTYBox" style="width:31mm;height:20mm;border-left-width:1px;">
				<div class="styOMB" style="height:5mm;">OMB No. 1545-0123</div>
				<div class="styTY" style="padding-top:2mm;">20<span class="styTYColor">19</span></div>
			</div>					
			</div>
			<!--End header-->
           <!--Begin Name/EIN-->
			<div class="styGenericDiv" style="width:187mm;clear:all;">
            <div class="styTableCell" style="width:135mm;float:left;height:9mm;text-align:left">Name of corporation<br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				  </xsl:call-template>
				  <br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					</xsl:call-template>
            </div>
            <div class="styTableCell"  style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:9mm;text-align:left"><b>Employer identification number</b>
              <br/>
              <br/>        
			<xsl:call-template name="PopulateReturnHeaderFiler">
              	<xsl:with-param name="TargetNode">EIN</xsl:with-param>
             </xsl:call-template>
            </div>
          </div>
          <!--End Name/EIN-->
          <!--Begin Part 1-->
          <!--Part 1 Header-->
          <div class="styBB" style="width:187mm;height:11.5mm">
            <div class="styPartName">Part I</div>
            <div class="styPartDesc">Home Office Deductible Expenses Definitely Related Solely to ECI or Non&#45;ECI
              <span style="font-size:7pt;">Note:
                <span style="font-weight:normal">Enter all amounts on lines 1a through 13 in only U.S. dollars or in only functional currency. If U.S. dollars, check box
                </span>
                <span style="width:1mm"/>
                <input type="checkbox" alt="IRS1120FScheduleHUSDollarsInd" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/USDollarsInd"/>
                    <xsl:with-param name="BackupName">IRS1120F1120FScheduleHUSDollarsInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/USDollarsInd"/>
                      <xsl:with-param name="BackupName">IRS1120F1120FScheduleHUSDollarsInd</xsl:with-param>
                    </xsl:call-template>
                  </label> 
                <span>.</span>
                <br/>
                <span style="font-weight:normal"> Otherwise, specify currency</span>
                <span style="width:1mm"/>
                <img src="{$ImagePath}/1120FScheduleH_Bullet_Md.gif" alt="Bullet Image"/>
                 <span style="width:1mm;"/>
                    <span style="font-weight:normal; font-size:6pt;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/FunctionalCurrencyDesc"/>
                      </xsl:call-template>
                    </span>
              </span>
              </div>
            <!--Close part description line -->
          </div>
          <!-- Close Part line-->
          <!--Begin L1-12-->
		<div class="styGenericDiv" style="width:187mm;clear:all;height:auto;">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!-- Begin if it is USCurrency -->
                <!--L1a-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox">1a</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                    <span style="float:left;">Total expenses on the books of the home office
                    <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode"  select="$FormData/TotalExpensesOnHomeOfcBooksAmt"/>
                      </xsl:call-template>
                    </span>
                    <span class="styDotLn" style="float:right;">........</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">1a</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px"/>
                  <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode"  select="$FormData/TotalExpnssHomeOfcBooksFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode"  select="$FormData/TotalExpensesOnHomeOfcBooksAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
               <!--L1b-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox" style="padding-left:4mm;vertical-align:top;">b</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">Check the applicable box below to indicate the accounting convention used to compute the amount on line 1a:
                    <div style="width:100mm;">
				   <!--Check if it is US Dollar-->
				   <xsl:choose>
						<xsl:when test="$FormData/USDollarsInd">
							<div style="width:30mm;">
							 <input type="checkbox" alt="Line 1b U.S. GAAP Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/GAAPInd"/>
									<xsl:with-param name="BackupName">Line1bUSGAAPIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/GAAPInd"/>
									<xsl:with-param name="BackupName">Line1bUSGAAPIndicatorLabel</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;"> U.S. GAAP</span>
							</label>
						</div>
						<input type="checkbox" alt="Line 1b Home Country GAAP Indicator" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/HomeCountryGAAPInd"/>
									  <xsl:with-param name="BackupName">Line1bHomeCountryGAAPIndicator</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/HomeCountryGAAPInd"/>
								<xsl:with-param name="BackupName">Line1bHomeCountryGAAPIndicatorLabel</xsl:with-param>
							</xsl:call-template>
							<span style="1mm;"> Home Country GAAP</span>
						</label>
							<br/>
					    <div style="width:30mm;">
							<input type="checkbox" alt="Line 1b IFRS Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IFRSInd"/>
									<xsl:with-param name="BackupName">Line1bIFRSIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IFRSInd"/>
									<xsl:with-param name="BackupName">Line1bIFRSIndicatorLabel</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;"> IFRS</span>
							</label>
						</div>
						<input type="checkbox" alt="Line 1b Other Accounting Convention Indicator" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
								<xsl:with-param name="BackupName">Line1bOtherAccountingConventionIndicator</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
								<xsl:with-param name="BackupName">Line1bOtherAccountingConventionIndicatorLabel</xsl:with-param>
							</xsl:call-template>
							<span style="1mm;"> Other (specify)  <!--Start here -->
								<img src="{$ImagePath}/1120FScheduleH_Bullet.gif" alt="bulletpoint"/>
								<span style="border-color:black; border-style:solid; border-right-width: 0px;border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" 	select="$FormData/OtherInd/@specifyAccountingMethodTxt"/>
								</xsl:call-template>
								</span>
							</span>
						</label>
						</xsl:when>
						<xsl:otherwise>
							<!--Line 1b: Check if it is Functional Currency-->  
							<div style="width:30mm;">
								<input type="checkbox" alt="Line 1b GAAP Functional Currency Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/GAAPFuncInd"/>
										<xsl:with-param name="BackupName">Line1bGAAPFuncIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/GAAPFuncInd"/>
										<xsl:with-param name="BackupName">Line1bGAAPFuncIndicatorLabel</xsl:with-param>
									</xsl:call-template>
									<span style="1mm;"> U.S. GAAP</span>
								</label>
							</div>
								<input type="checkbox" alt="Line 1b Home Country GAAP Functional Currency Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/HomeCountryGAAPFuncInd"/>
											  <xsl:with-param name="BackupName">Line1bHomeCountryGAAPFunctionalCurrencyIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/HomeCountryGAAPFuncInd"/>
									<xsl:with-param name="BackupName">Line1bHomeCountryGAAPFunctionalCurrencyIndicatorLabel</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;"> Home Country GAAP</span>
							</label>
							<br/>
					    <div style="width:30mm;">
							<input type="checkbox" alt="Line 1b IFRS Functional Currency Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IFRSFuncInd"/>
									<xsl:with-param name="BackupName">Line1bIFRSFunctionalCurrencyIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IFRSFuncInd"/>
									<xsl:with-param name="BackupName">Line1bIFRSFunctionalCurrencyIndicatorLabel</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;"> IFRS</span>
							</label>
						</div>
                            <input type="checkbox" alt="Line 1b Other (Specify) Accounting Functional Currency Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAccountingFuncInd"/>
									<xsl:with-param name="BackupName">Line1bOtherAccountingFunctionalCurrencyIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAccountingFuncInd"/>
									<xsl:with-param name="BackupName">Line1bOtherAccountingFunctionalCurrencyIndicatorLabel</xsl:with-param>
								</xsl:call-template>
								<span style="1mm;"> Other (specify)   
								 <!--Start here -->
                                    <img src="{$ImagePath}/1120FScheduleH_Bullet.gif" alt="bulletpoint"/>
									<span style="border-color:black;border-style:solid;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width: 1px;width:25mm">
									<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/OtherAccountingFuncInd/@specifyAccountingMethodTxt"/>
									</xsl:call-template>
							</span>
						</span>
					</label>
						</xsl:otherwise>
					</xsl:choose>
                    </div>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:4px"/>
                  </td>
				</tr>  
                <!--L2-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox">2</td>
                  <td class="sty1120FSchHLNDescShort" style="font-size:7pt;" scope="row">Adjustments for U.S. tax principles (attach statement - see instructions)
                    <xsl:if test="$FormData/USDollarsInd">
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/PartIAdjustmentsUSTaxPrinAmt"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/PartIAdjUSTaxPrinciplesFuncAmt"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span style="width:1.1mm"/>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">2</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px;padding-top:3mm;"/>
                   <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/PartIAdjUSTaxPrinciplesFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                         <xsl:with-param name="TargetNode" select="$FormData/PartIAdjustmentsUSTaxPrinAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L3-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox">3</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                   <span style="float:left;">
                   Total deductible expenses on the books of the home office. Combine lines 1a and 2
                   </span>
                    <span class="styDotLn" style="float:right;">........</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">3</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px"/>
                  <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                         <xsl:with-param name="TargetNode" select="$FormData/TotalDeductibleExpensesFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/TotalDeductibleExpensesAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                 </td>
                </tr>
                <!--L4-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox">4</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                   <span style="float:left;">Interest expense included on line 3</span>
                    <span class="styDotLn" style="float:right;">............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">4</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px"/>
                     <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                       <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseDedAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L5-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox">5</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                   <span style="float:left;">Bad debt expense included on line 3</span>
                    <span class="styDotLn" style="float:right;">............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">5</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px"/>
                     <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                       <xsl:with-param name="TargetNode" select="$FormData/BadDebtExpenseFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/BadDebtExpenseAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L6-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox">6</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Total of interest expense and bad debt expense. Add lines 4 and 5</span>
                    <span class="styDotLn" style="float:right;">.............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">6</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px"/>
                         <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalIntAndBadDebtExpnsFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/TotalIntAndBadDebtExpenseAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                </tr>
                <!--L7-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox" style="padding-bottom:3.5mm">7</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">Remaining deductible expenses to be allocated and apportioned between           ECI and non&#45;ECI. Subtract line 6 
                    <span style="float:left;">from line 3</span>
                    <span class="styDotLn" style="float:right;">..............................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">7</td>
                  <td class="sty1120FSchHLNAmountBox" style="padding-top:3.5mm;">
                    <span style="width:1px"/>
                        <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$FormData/RemainingDeductibleExpnssFAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/RemainingDeductibleExpensesAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                </tr>
                <!--L8-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox" style="vertical-align:top;">8</td>
                  <td class="sty1120FSchHLNDescShort" style="font-size:7pt" scope="row">Deductible expenses definitely related solely to non&#45;ECI from subsidiaries
                    <span class="styDotLn" style="float:right;">.</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">8</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px"/>
                   <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/DedExpnssNonECISbsdryFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/DedExpnssNonECISbsdryAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L9-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox" style="padding-bottom:3.5mm">9</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">Deductible expenses definitely related solely to other non&#45;ECI booked in the 
                    <span style="float:left;">home country</span>
                    <span class="styDotLn" style="float:right;">...................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">9</td>
                  <td class="sty1120FSchHLNAmountBox" style="padding-top:3.5mm">
                    <span style="width:1px"/>
                  <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/DedExpnssOthNonECIHmCntryFAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/DedExpnssOthNonECIHmCntryAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L10-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD" style="padding-bottom:3.5mm">10</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">Deductible expenses definitely related solely to other non&#45;ECI booked in 
                   <span style="float:left;">other countries (including the United States)</span>
                    <span class="styDotLn" style="float:right;">..........</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">10</td>
                  <td class="sty1120FSchHLNAmountBox" style="padding-top:3.5mm">
                    <span style="width:1px"/>
                   <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/DedExpnssOthNonECIOthCntryFAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/DedExpnssOthNonECIOthCntryAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                 </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L11 -->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">11</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                    <span style="float:left;">Deductible expenses definitely related solely to ECI</span>
                 <span class="styDotLn" style="float:right;">.......</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">11</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <span style="width:1px"/>
                    <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$FormData/DeductibleExpensesECIFuncAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/DeductibleExpensesECIAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L12-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">12</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Total deductible expenses definitely related solely to ECI or non&#45;ECI. Add lines 8 through 11</span>
                    <span class="styDotLn" style="float:right;">.....</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox" style="border-bottom-width:0px;">12</td>
                  <td class="sty1120FSchHLNAmountBox" style="border-bottom-width:0px;">
                    <span style="width:1px"/>
                  <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$FormData/TotalDedExpnssECIOrNonECIFAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                         <xsl:with-param name="TargetNode" select="$FormData/TotalDedExpnssECIOrNonECIAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                 </td>
                </tr>
              </tbody>
            </table>
			<!-- End if it is USCurrency -->
			<!--End Lines 1-14-->
			<!--End Part I-->
			<!--Begin Part II-->
			<!--Part II Header-->
			  <div class="styBB" style="width:187mm;height:7.5mm;border-top-width:1px">
				<div class="styPartName">Part II</div>
				<div class="styPartDesc">Home Office Deductible Expenses Allocated and Apportioned to ECI<br/>
					  Note: <span style="font-weight:normal"> Enter the amounts on lines 15 through 20 in U.S.  dollars.</span>
				</div>
			  </div>
			<!--End Part II Header-->
			<!--Begin L13-20-->
			<!--L13-->
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD" style="padding-bottom:3.5mm">13</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">Remaining deductible expenses on the books of the home office not definitely  related solely to ECI or non&#45;ECI. 
                    <span style="float:left;">Subtract line 12 from line 7</span>
                    <span class="styDotLn" style="float:right;">........................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">13</td>
                  <td class="sty1120FSchHLNAmountBox" style="font-size:6pt;padding-top:3mm">
                    <span style="width:1px"/>
                 <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                       <xsl:with-param name="TargetNode" select="$FormData/RmngDedExpnssECIOrNonECIFAmt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/RmngDedExpnssECIOrNonECIAmt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                </td>
                </tr>
                <!--L14-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">14</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Average exchange rate used to convert amounts to U.S. dollars (see instructions)</span>
                    <span class="styDotLn" style="float:right;">........</span>
                    <span style="width:0.8mm"/>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">14</td>
                  <td class="sty1120FSchHLNAmountBox" style="font-size:6pt">
                    <span style="width:1px"/>
                     <xsl:choose>
                   <xsl:when test="$FormData/FunctionalCurrencyDesc">
                      <xsl:call-template name="PopulateAmount">
                       <xsl:with-param name="TargetNode" select="$FormData/ExchangeFuncRt"/>
                      </xsl:call-template>
                    </xsl:when>
                  <xsl:otherwise>
                   <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExchangeRt"/>
                      </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                </td>
                </tr>
                <!--L15-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">15</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Enter the amount from line 13. If line 13 is stated in functional currency, 
                    divide line 13 by line 14</span>
                    <span class="styDotLn" style="float:right;">....</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">15</td>
                  <td class="sty1120FSchHLNAmountBox" style="font-size:6pt">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/RemainingDedExpnssECIUSDolAmt"/>
                    </xsl:call-template>
                    </td>
                </tr>
                <!--L16-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD" style="padding-bottom:3.5mm">16</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    Remaining home office deductible expenses on line 15 allocated and apportioned 
                    under Regulations section
                    <span style="float:left;">1.861&#45;8 to ECI (attach computation)
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/RemainingDedExpnssSect18618Amt"/>
                    </xsl:call-template>
                    </span>
                    <span class="styDotLn" style="float:right;">......................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">16</td>
                  <td class="sty1120FSchHLNAmountBox" style="font-size:6pt;padding-top:3.5mm">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/RemainingDedExpnssSect18618Amt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L17-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">17</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Enter the amount from line 11. If line 11 is stated in functional currency, 
                    divide line 11 by line 14</span>
                    <span class="styDotLn" style="float:right;">....</span>
                   </td>
                  <td class="sty1120FSchHLNRightNumBox">17</td>
                  <td class="sty1120FSchHLNAmountBox" style="font-size:6pt">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/DeductibleExpensesECIUSDolAmt"/>
                    </xsl:call-template>
                    </td>
                </tr>
                <!--L18-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">18</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Total home office deductible expenses allocated and apportioned to ECI. 
                    Add lines 16 and 17</span>
                    <span class="styDotLn" style="float:right;">.....</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">18</td>
                  <td class="sty1120FSchHLNAmountBox" style="font-size:6pt">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalHomeOfficeDedAllocECIAmt"/>
                    </xsl:call-template>
                    </td>
                </tr>
                <!--L19-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">19</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Total deductible expenses from other non&#45;U.S. locations allocated and apportioned to ECI
                    <span style="width:0.5mm"/>
                    <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalDedOthNonUSLocAllocECIAmt"/>
                    </xsl:call-template>
                   </span>
                    <span class="styDotLn" style="float:right;">.....</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">19</td>
                  <td class="sty1120FSchHLNAmountBox" style="font-size:6pt">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalDedOthNonUSLocAllocECIAmt"/>
                    </xsl:call-template>
                    </td>
                </tr>
                <!--L20-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD" style="padding-bottom:3.5mm">20</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row"><b>Total deductible expenses allocated and apportioned to ECI.</b> Add lines 18 and 19 and enter the 
                    <span style="float:left;">amount here and on Form 1120&#45;F, Section II, line 26</span>
                    <span class="styDotLn" style="float:right;">................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxNBB">20</td>
                  <td class="sty1120FSchHLNAmountBoxNBB" style="padding-top:3.5mm;font-size:6pt">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotDedExpnssAllocApprtnECIAmt"/>
                    </xsl:call-template>
                    </td>
                </tr>
                </tbody>
                </table>
                <!--End L13-20-->
                <!--End Part II-->
                <!--Begin Part III-->
                <!--Part III Header-->
				  <div class="styBB" style="width:187mm;height:7.5mm;border-top-width:1px">
					<div class="styPartName">Part III</div>
					<div class="styPartDesc">Allocation and Apportionment Methods and Financial Records Used to Complete Parts I and II<br/>Note: <span style="font-weight:normal"> Enter the amounts in Part III, lines 21a, 21b, 22a, and 22b in U.S. dollars.</span>
					</div>
				  </div>
				<!--End Part III Header-->                
				  <div class="styBB" style="width:187mm;height:14mm;">
					<div style="width:187mm">
					  <img src="{$ImagePath}/1120FSchH_Bullet_Round.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
						<label>
						  <xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/MethodDifferentPriorYearInd"/>
							<xsl:with-param name="BackupName">IRS1120FIRS1120FScheduleHUSDollarsIndMethodDifferentPriorYearInd</xsl:with-param>
						  </xsl:call-template>
						</label>
					  <span style="padding-top:1mm;">If one or more methods used are different than in prior 
					  year, check box
					  </span>
				      <span class="styDotLn" style="float:right;">....................
                      <input type="checkbox" alt="IRS1120FIRS1120FScheduleHUSDollarsIndMethodDifferentPriorYearInd" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$FormData/MethodDifferentPriorYearInd"/>
                          <xsl:with-param name="BackupName">IRS1120FIRS1120FScheduleHUSDollarsIndMethodDifferentPriorYearInd</xsl:with-param>
                        </xsl:call-template>
                      </input>
					  </span>
                    </div>
                     <div style="clear:right;padding-top:1.5mm;">
                      <img src="{$ImagePath}/1120FSchH_Bullet_Round.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$FormData/RecordedInterbranchAmountInd"/>
                          <xsl:with-param name="BackupName">IRS1120FIRS1120FScheduleHUSDollarsIndRecordedInterbranchAmountInd</xsl:with-param>
                        </xsl:call-template>
                      </label>If any amount on line 20 is recorded as an interbranch amount on books and records used to prepare Form 1120&#45;F, Schedule L, include the amount 
						<span style="padding-left:2.5mm;padding-top:1.5mm;">on Part IV, line 35 and check this box</span>
						<span class="styDotLn" style="float:right;">...............................
						  <input type="checkbox"  alt=" IRS1120FIRS1120FScheduleHUSDollarsIndRecordedInterbranchAmountInd"  class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
							  <xsl:with-param name="TargetNode"  select="$FormData/RecordedInterbranchAmountInd"/>
							  <xsl:with-param name="BackupName">IRS1120FIRS1120FScheduleHUSDollarsIndRecordedInterbranchAmountInd</xsl:with-param>
							</xsl:call-template>
						  </input>
						</span>
                    </div>
				  </div>
           <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <!--Begin L21-23-->
                <!--L21-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">21</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">Gross income ratio:</td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB" style="width:40mm;">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L21a-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">a</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                    <span style="float:left;">Gross ECI</span>
                    <span class="styDotLn" style="float:right;">....................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">21a</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/GrossECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L21b-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">b</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                    <span style="float:left;">Worldwide gross income</span>
                    <span class="styDotLn" style="float:right;">...............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">21b</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/WorldwideGrossIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L21c-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">c</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Divide line 21a by line 21b</span>
                    <span class="styDotLn" style="float:right;">........................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">21c</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <div style="float:right;padding-top:0.5mm">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="$FormData/GrossIncomeRt"/>
                      </xsl:call-template>
                    </div>
                  </td>
                </tr>
                <!--L22-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">22</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">Asset ratio:</td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L22a -->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">a</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                    <span style="float:left;">Average U.S. assets from Schedule I, line 5, column (d)</span>
                    <span class="styDotLn" style="float:right;">.....</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">22a</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AverageUSAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L22b-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">b</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                   <span style="float:left;">Worldwide assets (if applicable, from Schedule I, line 6b)</span>
                    <span class="styDotLn" style="float:right;">.....</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">22b</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/WorldwideAssetsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L22c-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">c</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Divide line 22a by line 22b</span>
                    <span class="styDotLn" style="float:right;">........................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">22c</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <div style="float:right;padding-top:0.5mm">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="$FormData/GrossAssetRt"/>
                      </xsl:call-template>
                    </div>
                  </td>
                </tr>
                <!--L23-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">23</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">Number of personnel ratio:</td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 23a-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">a</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                    <span style="float:left;">Personnel of  U.S. trade or business </span>
                    <span class="styDotLn" style="float:right;">............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">23a</td>
                  <td class="sty1120FSchHLNAmountBox" style="text-align:left; padding-left:1mm;padding-top:0.5mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PersonnelWithinUSCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L23b-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">b</td>
                  <td class="sty1120FSchHLNDescShort" scope="row">
                    <span style="float:left;">Worldwide personnel </span>
                    <span class="styDotLn" style="float:right;">................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">23b</td>
                  <td class="sty1120FSchHLNAmountBox" 
                  style="text-align:left;padding-left:1mm;padding-top:0.5mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/WorldwidePersonnelCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L23c-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">c</td>
                  <td class="sty1120FSchHLNDesc" colspan="3" scope="row">
                    <span style="float:left;">Divide line 23a by line 23b</span>
                    <span class="styDotLn" style="float:right;">........................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">23c</td>
                  <td class="sty1120FSchHLNAmountBox">
                    <div style="float:right;padding-top:0.5mm">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="$FormData/PersonnelRt"/>
                      </xsl:call-template>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--Begin L24-25-->
          <div class="styBB" style="width:187mm;border-bottom-width:0px">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <!--L24 R1-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">24</td>
                  <td class="sty1120FSchHLNDescLong">Did the corporation use any ratio&#45;based methods (other than those indicated on lines 21 through 23 above) in Parts I and II? If</td>
                  <td class="sty1120FSchHLNRightNumBox">Yes</td>
                  <td class="sty1120FSchHLNRightNumBox">No</td>
                </tr>
                <!--L24 R2-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD"/>
                  <td class="sty1120FSchHLNDescLong" scope="row">
                  <span style="float:left;"> "Yes," attach statement (see instructions)
                  <span style="width:0.5mm"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherRatioBasedMethodsInd"/>
                     </xsl:call-template>
                  </span>
                    <span class="styDotLn" style="float:right;">..........................</span>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherRatioBasedMethodsInd"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherRatioBasedMethodsInd"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L25-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD" style="padding-bottom:3.5mm;">25</td>
                  <td class="sty1120FSchHLNDescLong" scope="row">Did the corporation use any other methods (e.g., time-spent analysis or estimates) 
                  in Parts I and II? If "Yes," attach statement
                  <span style="float:left;"> (see instructions)
                  <span style="width:0.5mm"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherMethodsInd"/>
                    </xsl:call-template>
                  </span>
                    <span class="styDotLn" style="float:right;">.................................</span>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox" style="border-bottom-width:0mm;">
                    <xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherMethodsInd"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox" style="border-bottom-width:0mm;">
                    <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherMethodsInd"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End L21-25-->
          <!--Begin Page 1 Footer-->
		  <div class="sty1120FSchHFooter">
            <div style="width:90mm" class="styGenericDiv"><b>For Paperwork Reduction Act Notice, see the instructions for Form 1120-F.</b>
            </div>
            <div style="width:57mm;text-align:center;font-size:6pt" class="styGenericDiv">Cat. No. 49679V</div>
            <div style="float:right;text-align:right;width:40mm" class="styGenericDiv"><b>Schedule H (Form 1120-F) 2019</b>
            </div>
          </div>
          <br/>
          <p style="page-break-before:always"/>
          <div class="pageEnd"/>
          <!-- End Page 1 Footer-->
          <!--BEGIN PAGE 2-->
          <!--Page 2 Header-->
          <div class="styTBB" style="width:187mm">
          <div>Schedule H (Form 1120-F) 2019</div>
            <div style="float:right;clear:none">
              Page <span style="font-size:8pt;font-weight:bold">2</span>
            </div>
          </div>
          <!--Part III Header Continued-->
		  <div class="styBB" style="width:187mm;height:12mm;">
            <div class="styPartName">Part III</div>
            <div class="styPartDesc">Allocation and Apportionment Methods and Financial Records Used to Complete Parts I and II <span style="font-weight:normal"><i>(continued)</i>
              </span>
            </div>
            <!--Part III Secondary Header-->
            <div class="styPartDesc" style="padding-left:17.5mm;font-weight:normal;"><b>Note:</b> Indicate whether the corporation used any of the following financial and other records in Parts I and II to identify deductible expenses allocated and apportioned to ECI.
            </div>
          </div>
          <!--Begin L26-28-->
          <div class="styBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Header-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD"/>
                  <td class="sty1120FSchHLNDescLong"/>
                  <td class="sty1120FSchHLNRightNumBox">Yes</td>
                  <td class="sty1120FSchHLNRightNumBox">No</td>
                </tr>
                <!--L26a-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">26a</td>
                  <td class="sty1120FSchHLNDescLong" scope="row">
                  <span style="float:left;">Published or other non&#45;public audited financial statements</span>
                    <span class="styDotLn" style="float:right;">......................</span>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/AuditedFinancialStatementsInd"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/AuditedFinancialStatementsInd"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L26b-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxLetter">b</td>
                  <td class="sty1120FSchHLNDescLong" scope="row">
                  <span style="float:left;">Non-audited financial statements</span>
                    <span class="styDotLn" style="float:right;">.............................</span>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/NonAuditedFinancialStmtInd"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/NonAuditedFinancialStmtInd"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L27-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">27</td>
                  <td class="sty1120FSchHLNDescLong" scope="row">
                  <span style="float:left;">Home office management or other departmental cost accounting 
                  reports</span>
                    <span class="styDotLn" style="float:right;">.................</span>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode"  select="$FormData/HomeOfficeMgmtCostAcctRptInd"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeOfficeMgmtCostAcctRptInd"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L28-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">28</td>
                  <td class="sty1120FSchHLNDescLong" scope="row">Other (e.g., home country regulatory reports or written, contemporaneous functional analyses) (attach statement)
                  <span style="width:0.5mm"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherRecordsInd"/>
                    </xsl:call-template>
                     <span class="styDotLn" style="float:right;">....</span>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode"  select="$FormData/OtherRecordsInd"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNYesNoBox">
                    <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode"  select="$FormData/OtherRecordsInd"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr style="height:3mm">
                </tr>
              </tbody>
            </table>
          </div>
          <!--End L26-28-->
          <!--End Part III-->
          <!--Begin Part IV-->
          <!--Part IV Header-->
		  <div class="styBB" style="width:187mm;height:8mm;">
            <div class="styPartName">Part IV</div>
            <div class="styPartDesc" style="font-size:7.5pt;">
            Allocation and Apportionment of Expenses on Books and Records Used to Prepare Form 1120F, Schedule L<br/>Note: <span style="font-weight:normal"> Enter all amounts in Part IV in U.S. dollars.</span>
            </div>
          </div>
          <!--Begin L29-41-->
          <div class="styBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--L29-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxDD">29</td>
                  <td class="sty1120FSchHLNDescTallShort" style="font-size:7pt" scope="row">Total expenses per books and records used to prepare Form 1120F, <br/> Schedule L
                    <span class="styDotLn" style="float:right;">....................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">29</td>
                  <td class="sty1120FSchHLNAmountBox" style="padding-top:5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalExpnssPerBks1120FSchLAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L30-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDD">30</td>
                  <td class="sty1120FSchHLNDescTallShort" style="font-size:7pt" scope="row">
                  <span style="float:left;">Adjustments for U.S. tax principles (attach statement - see instructions)
                  <span style="width:1.2mm"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PartIVAdjustmentsUSTaxPrinAmt"/>
                    </xsl:call-template>
                  </span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBox">30</td>
                  <td class="sty1120FSchHLNAmountBox" style="padding-top:4mm">
                    <xsl:call-template name="PopulateAmount" >
                      <xsl:with-param name="TargetNode" select="$FormData/PartIVAdjustmentsUSTaxPrinAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L31-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDD">31</td>
                  <td class="sty1120FSchHLNDescTall" colspan="3" scope="row">
                  <span style="float:left;">Total deductible expenses. Combine lines 29 and 30</span>
                    <span class="styDotLn" style="float:right;">.................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">31</td>
                  <td class="sty1120FSchHLNAmountBoxTall">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PartIVTotalDeductibleExpnssAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L32a-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDD">32a</td>
                  <td class="sty1120FSchHLNDescTallShort" scope="row">
                 <span style="float:left;">Third&#45;party interest expense included on line 31</span>
                    <span class="styDotLn" style="float:right;">.........</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">32a</td>
                  <td class="sty1120FSchHLNAmountBoxTall">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ThirdPartyIntExpnsPerBksAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTallShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L32b-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallLetter">b</td>
                  <td class="sty1120FSchHLNDescTallShort" scope="row">
                   <span style="float:left;">Interbranch interest expense included on line 31</span> 
                    <span class="styDotLn" style="float:right;">.........</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">32b</td>
                  <td class="sty1120FSchHLNAmountBoxTall">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterbranchIntExpensePerBksAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTallShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L33-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDD">33</td>
                  <td class="sty1120FSchHLNDescTallShort" scope="row">
                  <span style="float:left;">Bad debt expense included on line 31</span>
                    <span class="styDotLn" style="float:right;">............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">33</td>
                  <td class="sty1120FSchHLNAmountBoxTall">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/BadDebtExpensePerBooksAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTallShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L34-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDD" style="padding-bottom:6mm;">34</td>
                  <td class="sty1120FSchHLNDescTallShort" scope="row">Other third&#45;party deductible expenses not allocated or apportioned to ECI and non&#45;ECI under Regulations section 1.861&#45;8 included on line 31 (attach <span style="float:left;">statement)
                  <span style="width:1.5mm"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/Other3rdPartyDedNotAllocAmt"/>
                    </xsl:call-template>
                  </span>
                    <span class="styDotLn" style="float:right;">...................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">34</td>
                  <td class="sty1120FSchHLNAmountBoxTall" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/Other3rdPartyDedNotAllocAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTallShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L35-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDD" style="padding-top:1mm;">35</td>
                  <td class="sty1120FSchHLNDescTallShort" scope="row">Interbranch expenses per books and records included on line 31 and not <span style="float:left;"> included on line 32b (attach statement)
                    <span style="width:1.5mm"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/InterbranchExpensesNotIncldAmt"/>
                    </xsl:call-template>
                  </span>
                    <span class="styDotLn" style="float:right;">..........</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">35</td>
                  <td class="sty1120FSchHLNAmountBoxTall" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterbranchExpensesNotIncldAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTallShadedNBB">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallNBB">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--L36-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDD">36</td>
                  <td class="sty1120FSchHLNDescTall" colspan="3" scope="row">
                  <span style="float:left;">Add lines 32a through 35</span>
                    <span class="styDotLn" style="float:right;">.........................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">36</td>
                  <td class="sty1120FSchHLNAmountBoxTall">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/SumDeductibleExpensesAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L37-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDDTwoLines">37</td>
                  <td class="sty1120FSchHLNDescTall" colspan="3" scope="row">Deductible expenses on books and records allocated and apportioned to ECI or non&#45;
                  ECI under Regulations
                  <span style="float:left;"> section 1.861&#45;8. Subtract line 36 from line 31</span>
                    <span class="styDotLn" style="float:right;">..................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTallNBB">37</td>
                  <td class="sty1120FSchHLNAmountBoxTallNBBTwoLines">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/DedOnBooksAllcblSect18618Amt"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End L29-37-->
          <!--Begin L38-41-->
          <div class="styTBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Header-->
                <tr>
                  <th class="sty1120FSchHLNDescHeader" colspan="3" style="padding-left:6mm;" scope="col">Reconciliation of allocation and apportionment of deductible expenses to ECI and non&#45;ECI on books and records under Regulations section 1.861&#45;8 (from line 37)
                </th>
                  <th class="sty1120FSchHLNAmountBoxHeader" scope="col">(a)<br/>ECI Amounts</th>
                  <th class="sty1120FSchHLNAmountBoxHeader" scope="col">(b)<br/>Non&#45;ECI Amounts</th>
                  <th class="sty1120FSchHLNAmountBoxHeader" scope="col">(c)<br/>
                  Total: Add columns<br/>(a) and (b)</th>
                </tr>
                <!--L38a-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDDTwoLines" style="padding-top:1mm">38a</td>
                  <td class="sty1120FSchHLNDescTallShortest" scope="row">Derivative transaction deductible expenses definitely related to ECI 
                    <span style="float:left;">or non&#45;ECI under Regulations section 1.861&#45;8 (from line 37)</span>
                    <span class="styDotLn" style="float:right;">..</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">38a</td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/DerivativeTransDedExpnsRltdGrp/ECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"   select="$FormData/DerivativeTransDedExpnsRltdGrp/NonECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/DerivativeTransDedExpnsRltdGrp/TotalAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L38b-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallLetter" style="padding-bottom:3.5mm;">b</td>
                  <td class="sty1120FSchHLNDescTallShortest" scope="row">Other deductible expenses definitely related to ECI or non&#45;ECI
                  <span style="float:left;"> (from line 37)</span>
                  <span class="styDotLn" style="float:right;">................</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">38b</td>
                  <td class="sty1120FSchHLNAmountBoxTallShort" style="padding-top:6mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/OtherDeductionsExpensesRltdGrp/ECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShort" style="padding-top:6mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/OtherDeductionsExpensesRltdGrp/NonECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShort" style="padding-top:6mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/OtherDeductionsExpensesRltdGrp/TotalAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L39-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDDTwoLines">39</td>
                  <td class="sty1120FSchHLNDescTallShortest" scope="row">Total deductible expenses definitely related to ECI or non&#45;ECI. Add<span style="float:left;"> lines 38a and 38b</span>
                  <span class="styDotLn" style="float:right;">...............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">39</td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/TotalDeductibleExpensesRltdGrp/ECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalDeductibleExpensesRltdGrp/NonECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalDeductibleExpensesRltdGrp/TotalAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L40-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDDTwoLines" style="padding-bottom:3.5mm;">40</td>
                  <td class="sty1120FSchHLNDescTallShortest" scope="row">Other deductible expenses on books and records not definitely related to ECI or non&#45; ECI that are allocated and apportioned to ECI <span style="float:left;">and non&#45;ECI (from line 37)</span>
                  <span class="styDotLn" style="float:right;">............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">40</td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/DeductibleExpnssBksNotRltdGrp/ECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/DeductibleExpnssBksNotRltdGrp/NonECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/DeductibleExpnssBksNotRltdGrp/TotalAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--L41-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBoxTallDDTwoLines" style="padding-bottom:3.5mm;">41</td>
                  <td class="sty1120FSchHLNDescTallShortest" scope="row">Total deductible expenses on books and records allocated and apportioned to ECI  and non&#45;ECI. Add lines 39 and 40. Column (c) <span style="float:left;">must equal line 37</span>
                  <span class="styDotLn" style="float:right;">...............</span>
                  </td>
                  <td class="sty1120FSchHLNRightNumBoxTall">41</td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/TotalDeductibleExpnssAllocGrp/ECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/TotalDeductibleExpnssAllocGrp/NonECIAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchHLNAmountBoxTallShortTwoLines" style="padding-top:8mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode"  select="$FormData/TotalDeductibleExpnssAllocGrp/TotalAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Note-->
                <tr>
                  <td class="sty1120FSchHLNLeftNumBox"/>
                  <td class="sty1120FSchHLNDescShort" colspan="5" style="width:181mm;"> <b>Note:</b> Line 41, column (a) is the total of the deductions reported on Form 1120&#45;F, Section II, lines 12, 13, 14, 16, 17, 19 through 25, and 27.
                </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End L38-41-->
          <!--End Part IV-->
          <!--Begin Page 2 Footer-->
          <div  class="styGenericDiv" style="width:187mm;clear:both;padding-top:2px">
            <div style="float:right;" class="styGenericDiv"><b>Schedule H (Form 1120-F) 2019</b>
            </div>
          </div>
          <!-- End Page 2 Footer-->
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <p style="page-break-before:always"/>
	    <div class="styGenericDiv" style="width:187mm;clear:all;">
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">Additional Data        
        </div>
         <div class="styLeftOverButtonContainer">
         <input class="styLeftoverTableBtn" 
         type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
	</div>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>