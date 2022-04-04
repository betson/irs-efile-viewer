<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS6198Style.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Defines the stage of the data, e.g. original or latest -->
    <xsl:param name="Form6198Data" select="$RtnDoc/IRS6198"/>
    <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
      <head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form6198Data)"/>
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
        <meta name="Description" content="Form IRS6198"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
			<xsl:if test="not($Print) or $Print=''">
				<xsl:call-template name="IRS6198Style"/>
				<xsl:call-template name="AddOnStyle"/>
			</xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm;">
        <form name="Form6198">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:30mm;height:19mm;">
              <div style="height:9.5mm;">Form<span class="styFormNumber">  6198</span></div>
              <div style="height:6mm;">
                <div style=" font-size:6pt;">(Rev. December 2020)
                  <span style="padding-right:3mm"/>
                </div>
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:19mm;">
              <div class="styMainTitle" style="height:10mm;font-size:13pt;padding-top:1mm;display:block;">
                At-Risk Limitations
              </div>
              <div class="styFST" style="height:4mm;font-size:7pt;display:block;">
                <img src="{$ImagePath}/6198_Bullet.gif" alt="6198 Bullet"/>
                  Attach to your tax return.
              </div>
              <div class="styFST" style="height:4mm;font-size:7pt;">
                <img src="{$ImagePath}/6198_Bullet.gif" alt="6198 Bullet"/>
                Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form6198" title="Link to irs.gov/Form6198">
				<i>www.irs.gov/Form6198</i></a> for instructions and the latest information.
              </div>
            </div>
            <div class="styTYBox" style="width:32mm;height:19mm;">
              <div class="styBB" style="height:7mm;text-align:left;padding-left:5mm;font-size:6pt;padding-top:4mm;"><b>OMB NO. 1545-0712</b></div>
              <div style="height:6mm;text-align:left;padding-left:5mm;border-bottom-width:0px;padding-top:5mm">
                Attachment <br/>Sequence No. <span class="styBoldText">31</span>
              </div>
            </div>
          </div>
          <!-- Name and EIN/SSN  -->
          <div style="width:187mm;" class="styBB">
            <div style="width:138mm;height:auto;font-weight:normal;font-size:7pt;" class="styNameBox">
              Name(s) shown on return<br/>
              <span style="font-size: 7pt; font-weight: normal">
                <!--Choice for 1120, 1040, 1040NR and 1041 Return Header Filer info-->
				<xsl:call-template name="PopulateFilerName">
					<xsl:with-param name="TargetNode" select="$Form6198Data"/>
				</xsl:call-template> 				
			  </span>
            </div>
            <div style="width:49mm;padding-left:2mm;font-size:7pt;font-weight:bold;" class="styEINBox">
              Identifying number<br/>
              <br/>
              <span style="font-weight:normal">
				<!-- Choice for 1120, 1041, 1040 and 1040NR Return Header Filer info  -->
				<xsl:call-template name="PopulateFilerTIN">
					<xsl:with-param name="TargetNode" select="$Form6198Data"/>
				</xsl:call-template> 
				</span>
            </div>
          </div>
          <div style="width:187mm;height:9mm;" class="styBB">
  Description of activity (see instructions)<br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form6198Data/ActivityDescriptionTxt"/>
            </xsl:call-template>
          </div>
          <!-- Begin Part I -->
          <div style="width:187mm;height:8mm" class="styBB">
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;">
    Current Year Profit (Loss) From the Activity, Including Prior Year Nondeductible Amounts. 
    <br /><span class="styNormalText">See instructions.</span>
            </div>
          </div>
          <div style="width:187mm;" class="styBB">
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">1</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Ordinary income (loss) from the activity (see instructions)                
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      .........
      </span>
                <div class="styLNRightNumBox">1</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/OrdinaryIncomeLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">2</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Gain (loss) from the sale or other disposition of assets used in the activity (or of your interest in 
      the               
    </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;background;width:134mm;">
                 <span style="float:left;">activity) that you are reporting on:</span> 
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
    </div>
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftLtrBox" style="padding-left:4mm">a</div>
              <div style="float:left;">
      Schedule D                    
      <!-- set the push pin image -->
             <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form6198Data/ScheduleDGainOrLossAmt"/>
                </xsl:call-template>
              </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
        ............................
      </span>
                <div class="styLNRightNumBox">2a</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/ScheduleDGainOrLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftLtrBox" style="padding-left:4mm">b</div>
              <div style="float:left;">
      Form 4797  
      <!-- set the push pin image -->
         <xsl:call-template name="SetFormLinkInline">
         <xsl:with-param name="TargetNode" select="$Form6198Data/Form4797GainOrLossAmt"/>
                </xsl:call-template>
              </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
        ............................
      </span>
                <div class="styLNRightNumBox">2b</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/Form4797GainOrLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftLtrBox" style="padding-left:4mm">c</div>
              <div style="float:left;width: 38mm">
      Other form or schedule  
      <!-- set the push pin image -->
         <xsl:call-template name="SetFormLinkInline">
         <xsl:with-param name="TargetNode" select="$Form6198Data/OtherFormOrScheduleAmt"/>
          </xsl:call-template>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
                  <xsl:with-param name="Desc">Line 2c - Form or schedule number</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form6198Data/ScheduleOrFormNum"/>
                </xsl:call-template>
              </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
        .......................
      </span>
                <div class="styLNRightNumBox">2c</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/OtherFormOrScheduleAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">3</div>
              <div style="float:left;">
				Other income and gains from the activity, from Schedule K-1(Form 1065) or Schedule K-1(Form 1120-S),       
			</div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
				<div class="styLNLeftNumBox"/>
				<div style="float:left;">
					that were not included on lines 1 through 2c
				</div>
              <div style="float:right">
                <span class="styIRS6198DotLn"> ...................</span>
                <div class="styLNRightNumBox">3</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/ScheduleK1IncomeOrGainAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">4</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Other deductions and losses from the activity, including investment interest expense allowed
from        
    </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;">
      Form 4952, that were not included on lines 1 through 2c
    </div>
              <div style="float:right">
                <span class="styIRS6198DotLn">  
        ..............  
      </span>
                <div class="styLNRightNumBox">4</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateNegativeNumber">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/OtherDeductionsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">5</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
				  Current year profit (loss) from the activity. Combine lines 1 through 4. See the instructions before 
			  </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
				<div class="styLNLeftNumBox"/>
				<div style="float:left;">
					completing the rest of this form
				</div>
              <div style="float:right">
                <span class="styIRS6198DotLn">.......................</span>
                <div class="styLNRightNumBoxNBB">5</div>
                <div class="styLNAmountBoxNBB" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/CurrentYearProfitOrLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Begin Part II -->
          <div style="width:187mm;" class="styBB">
            <div class="styPartName" style="width:15mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;">
    Simplified Computation of Amount at Risk.<span class="styNormalText" style="display:inline;"> See the instructions before completing this part.</span>
            </div>
          </div>
          <div style="width:187mm;" class="styBB">
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">6</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Adjusted basis (as defined in section 1011) in the activity (or in your interest in the activity) on
the  </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;">
      first day of the tax year. <span class="styBoldText">Do not</span> enter less than zero
    </div>
              <div style="float:right">
                <span class="styIRS6198DotLn">  
        ................
      </span>
                <div class="styLNRightNumBox">6</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/AdjustedBasisAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">7</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Increases for the tax year (see instructions)                
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ...................
      </span>
                <div class="styLNRightNumBox">7</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/CurrentYearIncreaseRiskAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">8</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Add lines 6 and 7                
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ...........................
      </span>
                <div class="styLNRightNumBox">8</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/SumAdjBasisAndIncreaseRiskAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="padding-left:3mm">9</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Decreases for the tax year (see instructions)              
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ..................
      </span>
                <div class="styLNRightNumBox">9</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/CurrentYearDecreaseRiskAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">10a</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Subtract line 9 from line 8                    
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      .............. 
      </span>
                <div class="styGenericDiv">
                  <img src="{$ImagePath}/6198_Bullet.gif" alt="6198 Bullet"/>
                  <span style="width:5px;"/>
                </div>
                <div class="styLNRightNumBox">10a</div>
                <div class="styLNAmountBox">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/SumAdjBasisIncrLessDecrRiskAmt"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;height:4.5mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftLtrBox" style="padding-left:4mm">b</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
                   If line 10a is <span class="styBoldText">more</span> than zero, 
                   enter that amount here and go to line 20 (or complete Part III).
</div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;">
      Otherwise, enter -0- and see <span class="styBoldText">Pub. 925</span> for information on the recapture rules
    </div>
              <div style="float:right">
                <span class="styIRS6198DotLn">  
        ........
      </span>
                <div class="styLNRightNumBoxNBB">10b</div>
                <div class="styLNAmountBoxNBB" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/SimplifiedComputationRiskAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Begin Part III -->
          <div style="width:187mm;height:8mm" class="styBB">
            <div class="styPartName" style="width:15mm;">Part III</div>
            <div class="styPartDesc" style="padding-left:3mm;">
    Detailed Computation of Amount at Risk.<span class="styNormalText" style="display:inline;"> If you completed Part III of Form 6198 for the prior year, </span>
    <span class="styNormalText">see the instructions.</span>
            </div>
          </div>
          <div style="width:187mm;" class="styBB">
            <div style="width:187mm">
              <div class="styLNLeftNumBox">11</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Investment in the activity (or in your interest in the activity) at the effective date. <span class="styBoldText">
      Do not</span> enter less</div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;">
       than zero
    </div>
              <div style="float:right">
                <span class="styIRS6198DotLn">  
        ..............................
      </span>
                <div class="styLNRightNumBox">11</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/ActivityInvestmentAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">12</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Increases at effective date              
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ........................
      </span>
                <div class="styLNRightNumBox">12</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/EffectiveDateIncreaseAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">13</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Add lines 11 and 12        
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ..........................
      </span>
                <div class="styLNRightNumBox">13</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/SumActyInvestmentAndDtIncrAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">14</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Decreases at effective date              
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ........................
      </span>
                <div class="styLNRightNumBox">14</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/EffectiveDateDecreaseAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">15</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Amount at risk (check box that applies):            
    </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
               <div style="float:left;">
                <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;border:0 solid pink;width:134mm;" class="styLnDesc">
                  <span style="border:0 solid yellow;" class="">
                    <span class="" style="border:0 solid violet;width:8mm;height:4mm;padding-left:3.3mm;                     padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;padding-left:4.5mm">a</span>
                    <span class="" style="border:0 solid violet;height:4mm;padding-top:.5mm;                     padding-bottom:.5mm;">
                      <input type="checkbox" alt="At Risk Effective Date" class="styCkboxNM" onclick="return false;">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form6198Data/EffectiveDateRiskAmountInd"/>
                    <xsl:with-param name="BackupName">At Risk Effective Date</xsl:with-param>   
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form6198Data/EffectiveDateRiskAmountInd"/>
                        <xsl:with-param name="BackupName">At Risk Effective Date</xsl:with-param>   
                     </xsl:call-template>            
              At effective date. Subtract line 14 from line 13. <span class="styBoldText">
              Do not</span> enter less than zero.
            </label>
                    </span>
                  </span>
                  <br/>
                  <span style="border:0 solid red;" class="styGenericDiv">
                    <span class="" style="border:0 solid violet;width:8mm;height:4mm;padding-left:3.3mm;                     padding-top:.5mm;padding-bottom:.5mm;font-weight:bold;padding-left:4.5mm">b</span>
                 
                      <input type="checkbox" class="styCkboxNM" alt="Prior Year Form6198" onclick="return false;">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form6198Data/Form6198PriorYearInd"/>
                           <xsl:with-param name="BackupName">Prior Year Form6198</xsl:with-param>  
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form6198Data/Form6198PriorYearInd"/>
                         <xsl:with-param name="BackupName">Prior Year Form6198</xsl:with-param>    
                        </xsl:call-template>            
              From your prior year Form 6198, line 19b. <span class="styBoldText">Do not</span>
               enter the amount from line 10b of 
               <br/>
               <span style="width:12mm"/> your prior year form.
            </label>
                  </span>
                </div>
                <div style="border:0 solid green;width:2mm;" class="styLnDesc">
                  <img src="{$ImagePath}/6198_Bracket.gif" alt="6198 Bracket"/>
                </div>
               </div>
              <div style="border:0 solid red;float:right">            
                <div class="styDotLn" style="padding-top:2.5mm;height:8mm;letter-spacing:3mm; padding-right:1.1mm;">
        ..
      			</div>               
				<div style="height:13mm;padding-top:9mm;" class="styLNRightNumBox">15</div>
                <div style="width:34mm;height:13mm;padding-top:1mm;" class="styLNAmountBox">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DetailedComputationRisk1Amt"/>
                  </xsl:call-template>
                </div>
<!--          
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;height:8mm;"/>
-->                
                
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">16</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Increases since (check box that applies):    
    </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftLtrBox" style="padding-left:5mm">a</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
                <input type="checkbox" class="styCkboxNM" alt="Increases Of Effective Date" onclick="return false;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/IncreaseSinceEffectiveDateInd"/>
               <xsl:with-param name="BackupName">Increases Of Effective Date</xsl:with-param>           
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/IncreaseSinceEffectiveDateInd"/>
                  <xsl:with-param name="BackupName">Increases Of Effective Date</xsl:with-param>    
                  </xsl:call-template>            
        Effective date
      </label>
                <span style="width:5mm;"/>
                <span class="styBoldText">b</span>
                <span style="width:2mm;"/>
                <input type="checkbox" class="styCkboxNM" alt="Increases End Of Prior Year" onclick="return false;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/IncreaseSincePriorYearInd"/>
                <xsl:with-param name="BackupName">Increases End Of Prior Year</xsl:with-param>      
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/IncreaseSincePriorYearInd"/>
                   <xsl:with-param name="BackupName">Increases End Of Prior Year</xsl:with-param>  
                  </xsl:call-template>            
        The end of your prior year
      </label>
              </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ................
      </span>
                <div class="styLNRightNumBox" style="height:4.6mm;">16</div>
                <div class="styLNAmountBox" style="width:34mm;height:4.6mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/IncreasesAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">17</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Add lines 15 and 16              
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ..........................
      </span>
                <div class="styLNRightNumBox">17</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/SumAmountAtRiskAndIncreaseAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">18</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Decreases since (check box that applies):  
    </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftLtrBox" style="padding-left:4.5mm">a</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
                <input type="checkbox" class="styCkboxNM" alt="Decreases Of Effective Date" onclick="return false;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DecreaseSinceEffectiveDateInd"/>
                    <xsl:with-param name="BackupName">Decreases Of Effective Date</xsl:with-param>   
                 </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DecreaseSinceEffectiveDateInd"/>
                  <xsl:with-param name="BackupName">Decreases Of Effective Date</xsl:with-param>  
                  </xsl:call-template>            
        Effective date
      </label>
                <span style="width:5mm;"/>
                <span class="styBoldText">b</span>
                <span style="width:2mm;"/>
                <input type="checkbox" class="styCkboxNM" alt="Decreases End Of Prior Year" onclick="return false;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DecreaseSincePriorYearInd"/>
                    <xsl:with-param name="BackupName">Decreases End Of Prior Year</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DecreaseSincePriorYearInd"/>
                  <xsl:with-param name="BackupName">Decreases End Of Prior Year</xsl:with-param>   
                  </xsl:call-template>            
        The end of your prior year
      </label>
              </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ................
      </span>
                <div class="styLNRightNumBox" style="height:4.6mm;">18</div>
                <div class="styLNAmountBox" style="width:34mm;height:4.6mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DecreasesAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">19a</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Subtract line 18 from line 17                    
    </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
      ............
      </span>
                <div class="styGenericDiv">
                  <img src="{$ImagePath}/6198_Bullet.gif" alt="6198 Bullet"/>
                  <span style="width:5px;"/>
                </div>
                <div class="styLNRightNumBox">19a</div>
                <div class="styLNAmountBox">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/NetAtRiskAmt"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;height:4.5mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftLtrBox" style="padding-left:4.5mm">b</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      If line 19a is <span class="styBoldText">more</span> than zero, enter that amount here and go to line 20. Otherwise, enter -0- and
see</div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;">
                <span class="styBoldText">Pub. 925</span> for information on the recapture rules
    </div>
              <div style="float:right">
                <span class="styIRS6198DotLn">  
        .................
      </span>
                <div class="styLNRightNumBoxNBB">19b</div>
                <div class="styLNAmountBoxNBB" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DetailedComputationRiskAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- Begin Part IV -->
          <div style="width:187mm;" class="styBB">
            <div class="styPartName" style="width:15mm;">Part IV</div>
            <div class="styPartDesc" style="padding-left:3mm;">
    Deductible Loss  
  </div>
          </div>
          <div style="width:187mm;" class="styBB">
            <div style="width:187mm">
              <div class="styLNLeftNumBox">20</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
                <span class="styBoldText">Amount at risk.</span> Enter the <span class="styBoldText">larger</span> of line 10b or line 19b            
  </div>
              <div style="float:right;">
                <span class="styIRS6198DotLn">      
    ...............
    </span>
                <div class="styLNRightNumBox">20</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/AmountAtRiskAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox">21</div>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
                <span class="styBoldText">Deductible loss.</span> Enter the <span class="styBoldText">smaller</span> of the line 5 loss (treated as a positive number) or line 20. See the           
			  </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:34mm;"/>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
				instructions to find out how to report any deductible loss and any carryover.          
			  </div>
              <div style="float:right;">
                <div class="styLNRightNumBox">21</div>
                <div class="styLNAmountBox" style="width:34mm;">
                  <xsl:call-template name="PopulateNegativeNumber">
                    <xsl:with-param name="TargetNode" select="$Form6198Data/DeductibleLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm">
              <div class="styLNLeftNumBox"/>
              <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
                <span class="styBoldText" style="width:8mm;float:left;">Note:</span>
                <span class="styItalicText" style="width:170mm;float:left;"> 
                If the loss is from a passive activity, see the Instructions for
                 Form 8582, Passive Activity Loss Limitations, or the Instructions for 
                  Form 8810, Corporate Passive Activity Loss and Credit Limitations, 
                  to find out if the loss is allowed under the passive activity rules. 
                   If only part of the loss is subject to the passive activity loss rules, 
                   report only that part on Form 8582 or Form 8810, whichever applies.</span>
              </div>
            </div>
          </div>
          <div style="width:187mm;clear:both;">
            <div style="width:108mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the Instructions for Form 6198.</div>
            <div style="width:40mm;text-align:center;" class="styGenericDiv">Cat. No. 50012Y</div>
            <div style="float:right;" class="styGenericDiv">Form 
            <span class="styBoldText">6198</span> (Rev. 12-2020)</div>
          </div>
          <p class="pageEnd"/>
          <!-- Begininning of write-in data -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
        Additional Data        
      </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form6198Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 2c - Form or schedule number</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form6198Data/ScheduleOrFormNum"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>