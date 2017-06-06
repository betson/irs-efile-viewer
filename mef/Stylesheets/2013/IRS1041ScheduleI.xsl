<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1041ScheduleIStyle.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="Form1041ScheduleIData" select="$RtnDoc/IRS1041ScheduleI" />
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1041ScheduleIData)">
					</xsl:with-param></xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 1041ScheduleI" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"/>
				<style type="text/css"> 
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1041ScheduleIStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>  
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" >
				<form name="Form1041ScheduleI">
					<xsl:call-template name="DocumentHeader"></xsl:call-template>
					<!-- Begin Form Number and Name -->
					<!-- put comment here -->
					<div class="styBB" style="width:187mm;height:16mm;">
      <div class="styFNBox" style="width:29mm;height:16mm;">
        <div style="line-height:130%;">                  
          <span class="styFormNumber" style="font-size:9pt;" >SCHEDULE I</span>
          <br/>
          <span class="styFormNumber" style="font-size:9pt;">(Form 1041)</span>
          <br/>
        </div>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData"/>
        </xsl:call-template>
        <div style="padding-top:3mm;">
          <span class="styAgency">Department of the Treasury</span><br/>
          <span class="styAgency">Internal Revenue Service</span>  
        </div>
      </div>
      <div class="styFTBox" style="width:128mm;height:16mm; ">
        <div class="styMainTitle" style="height:4mm;">Alternative Minimum Tax<img src="{$ImagePath}/1041SchI_Longdash.gif"  alt="Longdash Image" style="vertical-align:middle;"/>Estates and Trusts</div>    
 <div class="styFBT" style="height:3mm;margin-top:1mm;font:size:6pt;width:128mm;">
 <img src="{$ImagePath}/1041SchI_Bullet_Sm.gif"  alt="Bullet Image"/> Attach to Form 1041<br/>
          <img src="{$ImagePath}/1041SchI_Bullet_Sm.gif"  alt="Bullet Image"/> Information about Schedule I (Form 1041) and its separate instructions is at <i>www.irs.gov/form1041</i>.        
        </div>
      </div>
      <div class="styTYBox" style="width:30mm;height:16mm;">
        <div class="styOMB" style="height:2mm;padding-top:0.5mm;padding-bottom:0.5mm;"><!--<span style="width:5mm;"></span>
        <span style="font-size:6pt;text-align:right;">Version A, Cycle 3</span><br/>-->
        OMB No. 1545-0092</div>
        <div class="styTaxYear" style="padding-top:0.7mm;">
			20<span class="styTYColor">13</span>
			<!--<xsl:call-template name="PopulateReturnHeaderTaxYear"/>-->
        </div>
      </div>
    </div>
    <!-- End Form Number and Name section -->
    <div class="styBB" style="width:187mm;">
      <div class="styNameBox" style="width:139mm;height:7mm;font-size:7pt;">
        Name of estate or trust<br/>
      <!--  <span class="stySmallText">-->     
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
		</xsl:call-template><br/>
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
		</xsl:call-template>
      <!--  </span>-->    
      </div>        
      <div class="styEINBox" style="width:46mm;height:7mm;font-size:7pt;padding-left:2mm;">
        Employer identification number<br/>
        <span class="styEINFld" style="width:100%; text-align:center;font-weight:normal;">
			<xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">EIN</xsl:with-param>
			</xsl:call-template>  
        </span>  
      </div>
    </div>
   
    <!-- BEGIN Part I Title -->
    <div class="styBB" style="width:187mm;">
          <div class="styPartName">Part I</div>
           <div class="styPartDesc"> <b>Estate's or Trust's Share of Alternative Minimum Taxable Income </b>             
      </div>
      </div>    
    <!-- END Part I Title --> 
    <!--Line 1-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">
        Adjusted total income or (loss) (from Form 1041, line 17)
			<span class="styBoldText">
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>. 
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>. 
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			</span>
       </div>
        <div class="styLNRightNumBox" style="height:4mm;width:8mm;">1</div>
      <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AdjustedTotalIncomeAmt" />
        </xsl:call-template>     
      </div>
  </div>
     
    <!-- Line 2  -->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">
        Interest
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
        <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">2</div>
      <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/InterestAmt" />
        </xsl:call-template>     
      </div>
  </div>
    <!-- Line 3  -->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">
        Taxes
        <span class="styBoldText">
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
        </span>
       </div>
        <div class="styLNRightNumBox" style="height:4mm;width:8mm;">3</div>
      <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TaxesAmt" />
        </xsl:call-template>     
      </div>
  </div>
    <!--Line 4-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Miscellaneous itemized deductions (from Form 1041, line 15c)
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.           
        </span>      
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">4</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/MiscItemizedDeductionsAmt" />
        </xsl:call-template>
      </div>    
    </div>  
    <!--Line 5-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Refund of taxes
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.           
        </span>    
          </div>  
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">5</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateNegativeNumber">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TotalRefundReceivedAmt" />
        </xsl:call-template>
      </div>  
    </div>
    <!--Line 6-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Depletion (difference between regular tax and AMT)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
        </span>    
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">6</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/DepletionAmt" />
        </xsl:call-template>
      </div>  
    </div>
<!--Line 7-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Net operating loss deduction. Enter as a positive amount
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">7</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetOperatingLossDeductionAmt" />
        </xsl:call-template>
      </div>  
    </div>
    
    <!--Line 8-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Interest from specified private activity bonds exempt from the regular tax
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">8</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/ExemptPrivateActivityBondsAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 9-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Qualified small business stock (see instructions)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">9</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/Section1202ExclusionAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 10-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">10</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Exercise of incentive stock options (excess of AMT income over regular tax income)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">10</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/IncentiveStockOptionsAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 11-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">11</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Other estates and trusts (amount from Schedule K-1 (Form 1041), box 12, code A)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">11</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/EstatesAndTrustsAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 12-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">12</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Electing large partnerships (amount from Schedule K-1 (Form 1065-B), box 6)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">12</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/LargePartnershipAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 13-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">13</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Disposition of property (difference between AMT and regular tax gain or loss)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">13</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/PropertyDispositionAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 14-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">14</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Depreciation on assets placed in service after 1986 (difference between regular tax and AMT)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">14</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/DepreciationAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 15-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">15</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Passive activities (difference between AMT and regular tax income or loss)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">15</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/PassiveActivityAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 16-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">16</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Loss limitations (difference between AMT and regular tax income or loss)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">16</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/LossLimitationAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 17-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">17</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Circulation costs (difference between regular tax and AMT)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">17</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/CirculationCostAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 18-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">18</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Long-term contracts (difference between AMT and regular tax income)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">18</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/LongTermContractAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 19-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">19</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Mining costs (difference between regular tax and AMT)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">19</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/MiningCostsAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 20-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">20</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Research and experimental costs (difference between regular tax and AMT)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">20</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/ResearchExperimentalCostAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 21-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">21</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Income from certain installment sales before January 1, 1987
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">21</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateNegativeNumber">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/InstallmentSaleIncomeAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 22-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">22</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Intangible drilling costs preference
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">22</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/IntangibleDrillingCostAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 23-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">23</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Other adjustments, including income-based related adjustments
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">23</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/RelatedAdjustmentAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 24-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">24</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Alternative tax net operating loss deduction (See the instructions for the limitation that applies.)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">24</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateNegativeNumber">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AltTaxNetOperatingLossDedAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 25-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">25</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Adjusted alternative minimum taxable income. Combine lines 1 through 24
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">25</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AdjAlternativeMinTaxableIncAmt" />
        </xsl:call-template>
      </div>  
    </div>
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:3.8mm;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNDesc" style="width:139.5mm;height:3.8mm;padding-top:0mm;padding-bottom:0mm;"><b>Note: </b><i>Complete Part II below before going to line 26.</i>
      </div>      
      <div class="styLNRightNumBox" style="height:3.8mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:3.8mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    
    <!--Line 26-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">26</div>
      <div class="styLNDesc" style="width:100mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">Income distribution deduction from Part II, line 44
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">26</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/IncomeDistributionDeductionAmt" />
        </xsl:call-template>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px; border-top-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    
    <!--Line 27-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">27</div>
      <div class="styLNDesc" style="width:100mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">Estate tax deduction (from Form 1041, line 19)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">27</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/EstateTaxDeductionAmt" />
        </xsl:call-template>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px; border-top-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    
    <!--Line 28-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">28</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Add lines 26 and 27
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">28</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/IncomeAndEstateDeductionAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 29-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4.8mm;">29</div>
      <div class="styLNDesc" style="width:139.5mm;height:4.8mm;">Estate's or trust's share of alternative minimum taxable income. Subtract line 28 from line 25
      <xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Line 29 - Residual Interst In REMIC Code</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
		</xsl:call-template>
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4.8mm;width:8mm; ">29</div>
      <div class="styLNAmountBox" style="height:4.8mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AlternativeMinTaxableIncomeAmt" />
        </xsl:call-template>        
      </div>  
    </div>
    
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:3.8mm;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNDesc" style="width:139.5mm;height:3.8mm;padding-top:0mm;padding-bottom:0mm;">If line 29 is:</div>
    </div>
    
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:3.8mm;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNDesc" style="width:139.5mm;height:3.8mm;padding-top:0mm;padding-bottom:0mm;"><li>$23,100 or less, stop here and enter -0- on Form 1041, Schedule G, line 1c. The estate or trust is not liable for the alternative minimum tax.</li></div>
    </div>
    
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBoxSD" style="height:3.8mm;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNDesc" style="width:139.5mm;height:3.8mm;padding-top:0mm;padding-bottom:0mm;"><li>Over $23,100, but less than $179,500, go to line 45.</li></div>
    </div>
    
    <div class="styBB" style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:3.8mm;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNDesc" style="width:139.5mm;height:3.8mm;padding-top:0mm;padding-bottom:0mm;"><li>$179,500 or more, enter the amount from line 29 on line 51 and go to line 52.</li></div>
    </div>
         
    <!-- BEGIN Part II Title -->
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part II</div>
      <div class="styPartDesc"> <b>Income Distribution Deduction on a Minimum Tax Basis</b></div>
    </div>
    <!-- END Part II Title -->    
    <!-- BEGIN Part II Line Items -->
      <!--Line 30-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">30</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">
        Adjusted alternative minimum taxable income (see instructions)
			<span class="styBoldText">
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>. 
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>. 
			  <span style="width:16px;"></span>.
			  <span style="width:16px;"></span>.
			</span>
       </div>
        <div class="styLNRightNumBox" style="height:4mm;width:8mm;">30</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/ModifiedAltMinTxblIncmAmt" />
        </xsl:call-template>     
      </div>
  </div>
     
    <!-- Line 31  -->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">31</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">
        Adjusted tax-exempt interest (other than amounts included on line 8)
        <span class="styBoldText">
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
        <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">31</div>
      <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AdjustedTaxExemptInterestAmt" />
        </xsl:call-template>     
      </div>
  </div>
  
    <!-- Line 32  -->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">32</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">
        Total net gain from Schedule D (Form 1041), line 19, column (1). If a loss, enter -0-
        <span class="styBoldText">
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
        </span>
       </div>
        <div class="styLNRightNumBox" style="height:4mm;width:8mm;">32</div>
      <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TotalNetGainOrLossAmt" />
        </xsl:call-template>     
      </div>
  </div>
    <!--Line 33-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:8mm;">33</div>
      <div class="styLNDesc" style="width:139.5mm;height:8mm;">Capital gains for the tax year allocated to corpus and paid or permanently set aside for charitable purposes (from Form 1041, Schedule A, line 4)
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>      
      </div>
      <div class="styLNRightNumBox" style="height:8mm;width:8mm;padding-top:4mm;">33</div>
      <div class="styLNAmountBox" style="height:8mm;width:31.5mm;padding-top:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/CapitalGainCorpusCharityAmt" />
        </xsl:call-template>
      </div>    
    </div>  
    
	<!--Line 34-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">34</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Capital gains paid or permanently set aside for charitable purposes from gross income (see instructions)
      </div>  
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">34</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/CapitalGainPdForChrtblPrpsAmt" />
        </xsl:call-template>
      </div>  
    </div>
    
	<!--Line 35-->
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">35</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Capital gains computed on a minimum tax basis included on line 25
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.  
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>    
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">35</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
        <xsl:call-template name="PopulateNegativeNumber">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/CapGainsCmptMinimumTaxBasisAmt" />
        </xsl:call-template>
      </div>  
    </div>

	<!--Line 36-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">36</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Capital losses computed on a minimum tax basis included on line 25. Enter as a positive amount
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">36</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/CapLossCmptMinimumTaxBasisAmt" />
        </xsl:call-template>
      </div>  
    </div>
    
    <!--Line 37-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:8mm;">37</div>
      <div class="styLNDesc" style="width:139.5mm;height:8mm;">Distributable net alternative minimum taxable income (DNAMTI). Combine lines 30 through 36. If zero<br/>or less, enter -0-
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:8mm;width:8mm;padding-top:4mm;">37</div>
      <div class="styLNAmountBox" style="height:8mm;width:31.5mm;padding-top:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/DistributableNetAMTIncomeAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
    <!--Line 38-->   
     <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">38</div>
      <div class="styLNDesc" style="width:139.5mm;height:4mm;">Income required to be distributed currently (from Form 1041, Schedule B, line 9)
      <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>      
      <div class="styLNRightNumBox" style="height:4mm;width:8mm; ">38</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/FirstTierDistributionAmt" />
        </xsl:call-template>
      </div>  
    </div>     
    
	<!--Line 39--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">39</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;font-family:Arial;">          
        Other amounts paid, credited, or otherwise required to be distributed (from Form 1041, Schedule B, line 10)
        <!--Dotted Line-->
        <span class="styBoldText" style="font-family:Verdana">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">      
        39
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SecondTierDistributionAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    
    <!--Line 40--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">40</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Total distributions. Add lines 38 and 39
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">40</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TotalDistributionAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    
    <!--Line 41--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">41</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Tax-exempt income included on line 40 (other than amounts included on line 8)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">41</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TaxExemptIncomeAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    
    <!--Line 42--> 
    <div class="styBB" style="width:187mm;font-size:7pt;">
      <div class="styLNLeftNumBox" style="height:4mm;">42</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Tentative income distribution deduction on a minimum tax basis. Subtract line 41 from line 40
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;">42</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TentativeIncmDistriDedAmt"/>
        </xsl:call-template>        
      </div>
    </div>

    <!-- Page Break-->
    <!-- Footer-->   
    <div class="pageEnd" style="width:187mm;">  
        <div class="styGenericDiv" style="font-weight:bold">For Paperwork Reduction Act Notice, see the Instructions for Form 1041.</div>   
        <div class="styGenericDiv" style="padding-left:15mm">Cat. No. 51517Q</div>                        
        <div class="styGenericDiv" style="font-weight:bold;float:right" >Schedule I (Form 1041) (2013) </div>
    </div>
    
    <!--Begin Page 2 -->   
    <!-- Header -->    
      <div class="styBB" style="width:187mm;border-bottom-width: 0px;">  
         <!--<div style="float:right;">
      Version A, Cycle 3</div>-->
      </div>  
    <div class="styBB" style="width:187mm;float:left;clear:none;">  
      <div style="float:left;">Schedule I (Form 1041) (2013) <span style="width:130mm;"></span></div>
      <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>  
    </div>  
    <!-- BEGIN Part II Title -->   
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part II</div>
      <div class="styPartDesc"> Income Distribution Deduction on a Minimum Tax Basis <span style="font-weight:normal;"><i>(continued)</i></span></div>
    </div>
      
      <!--Line 43--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:8mm;">43</div>      
      <div class="styLNDesc" style="width:139.5mm; height:8mm;">          
        Tentative income distribution deduction on a minimum tax basis. Subtract line 31 from line 37. If zero or less, enter -0-
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:8mm;width:8mm;padding-top:4mm;">43</div>
      <div class="styLNAmountBox" style="height:8mm;width:31.5mm;padding-top:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TentativeIncmDistriIntDedAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    
    <!--Line 44--> 
    <div class="styBB" style="width:187mm;font-size:7pt;">
      <div class="styLNLeftNumBox" style="height:8mm;">44</div>      
      <div class="styLNDesc" style="width:139.5mm; height:8mm;">          
        <b>Income distribution deduction on a minimum tax basis. </b>Enter the smaller of line 42 or line 43. Enter here and on line 26
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:8mm;width:8mm;border-bottom-width:0px;padding-top:4mm;">44</div>
      <div class="styLNAmountBox" style="height:8mm;width:31.5mm;border-bottom-width:0px;padding-top:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/IncomeDistributionDeductionAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    <!-- END Part II Title -->
    
    <!-- BEGIN Part III Title -->   
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part III</div>
      <div class="styPartDesc"> <b>Alternative Minimum Tax</b></div>
    </div>
      
      <!--Line 45--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">45</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Exemption amount
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">45</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
			$23,100.00
      </div>
    </div>
    
    <!--Line 46--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">46</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Enter the amount from line 29
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">46</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AlternativeMinTaxableIncomeAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;background-color:lightgrey;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    
    <!--Line 47--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">47</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Phase-out of exemption amount
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">47</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">        
        $76,950.00
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;background-color:lightgrey;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    
    <!--Line 48--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">48</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Subtract line 47 from line 46. If zero or less, enter -0-
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">48</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetShareAltMinTaxbleIncomeAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;background-color:lightgrey;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    
    <!--Line 49--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">49</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Multiply line 48 by 25% (.25)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">49</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetShareAltMinTxblIncmXPctAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    
    <!--Line 50--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">50</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Subtract line 49 from line 45. If zero or less, enter -0-
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">50</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetExemptionAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 51--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">51</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Subtract line 50 from line 46
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">51</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/EstateOrTrustShrLessExemptAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 52--> 
    <div style="width:187mm;font-size:7pt; padding-bottom:0mm;">
      <div class="styLNLeftNumBox">52</div>      
      <div class="styLNDesc" style="width:139.5mm;">          
        Go to Part IV of Schedule I to figure line 52 if the estate or trust has qualified dividends or has a gain on lines 18a and 19 of column (2) of Schedule D (Form 1041) (as refigured for the AMT, if necessary). Otherwise, if line 51 is<img src="{$ImagePath}/1041SchI_Longdash.gif"  alt="Longdash Image"/><br/>
        <li>$179,500 or less, multiply line 51 by 26% (.26).</li><br/>
        <li>Over $179,500, multiply line 51 by 28% (.28) and subtract $3,590 from the result</li>
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:17mm;width:8mm;0px;padding-top:0mm;">
		  <span style="width:100%;height:76%;background-color:lightgrey;"/>
		  <span style="width:100%;height:24%;padding-top:0.6mm;padding-bottom:0mm;">52</span>
	  </div>
      <div class="styLNAmountBox" style="height:17mm;width:31.5mm;padding-top:12mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/MaximumCapitalGainsOrNetAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    <!--Line 53--> 
    <div style="width:187mm;font-size:7pt;padding-top:0mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-top:0mm;">53</div>      
      <div class="styLNDesc" style="width:139.5mm; height:3mm;padding-top:0mm;">          
        Alternative minimum foreign tax credit (see instructions)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:3mm;width:8mm;padding-top:0mm;">53</div>
      <div class="styLNAmountBox" style="height:3mm;width:31.5mm;padding-top:0mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AMTForeignTaxCreditAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    <!--Line 54--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">54</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Tentative minimum tax. Subtract line 53 from line 52
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">54</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TentativeAlternativeMinTaxAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
	<!--Line 55--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">55</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Enter the tax from Form 1041, Schedule G, line 1a (minus any foreign tax credit from Schedule G, line 2a)
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">55</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AdjustedRegularTaxAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 56--> 
    <div class="styBB" style="width:187mm;font-size:7pt;">
      <div class="styLNLeftNumBox" style="height:8mm;">56</div>      
      <div class="styLNDesc" style="width:139.5mm; height:8mm;">          
        <b>Alternative minimum tax. </b>Subtract line 55 from line 54. If zero or less, enter -0-. Enter here and on Form 1041, Schedule G, line 1c
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:8mm;width:8mm;border-bottom-width:0px;padding-top:4mm;">56</div>
      <div class="styLNAmountBox" style="height:8mm;width:31.5mm;border-bottom-width:0px;padding-top:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AlternativeMinimumTaxAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
      
    <!-- END Part III Title -->
    
    <!-- BEGIN Part IV Title -->   
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part IV</div>
      <div class="styPartDesc"> <b>Line 52 Computation Using Maximum Capital Gains Rates</b></div>
    </div>
      
      <!--Caution--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:10mm;"/>      
      <div class="styLNDesc" style="width:139.5mm; height:10mm;">          
        <b>Caution: </b><i>If you did not complete Part V of Schedule D (Form 1041), the Schedule D Tax Worksheet, or the Qualified Dividends Tax Worksheet in the Instructions for Form 1041, see the instructions before completing this part.</i>
      </div>
      <div class="styLNRightNumBox" style="height:10.5mm;width:8mm;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:10.5mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>
    
    <!--Line 57--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">57</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Enter the amount from line 51
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">57</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/EstateOrTrustShrLessExemptAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    
    <!--Line 58--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:14mm;">58</div>      
      <div class="styLNDesc" style="width:100mm; height:14mm;">          
        Enter the amount from Schedule D (Form 1041), line 26, line 13 of the Schedule D Tax Worksheet, or line 4 of the Qualified Dividends Tax Worksheet in the Instructions for Form 1041, whichever applies (as refigured for the AMT, if necessary)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:14mm;width:8mm;padding-top:10mm;">58</div>
      <div class="styLNAmountBox" style="height:14mm;width:31.5mm;padding-top:10mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/CapitalGainsWorksheetAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:14mm;width:8mm;border-bottom-width:0px;background-color:lightgrey;"/>
      <div class="styLNAmountBox" style="height:14mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>
    
    <!--Line 59--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:11mm;">59</div>      
      <div class="styLNDesc" style="width:100mm; height:11mm;">          
        Enter the amount from Schedule D (Form 1041), line 18b, column (2) (as refigured for the AMT, if necessary). If you did not complete Schedule D for the regular tax or the AMT, enter -0-
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:11mm;width:8mm;padding-top:7mm;">59</div>
      <div class="styLNAmountBox" style="height:11mm;width:31.5mm;padding-top:7mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/UnrecapturedSection1250GainAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:11mm;width:8mm;border-bottom-width:0px;background-color:lightgrey;"/>
      <div class="styLNAmountBox" style="height:11mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>
    
    <!--Line 60--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:14mm;">60</div>      
      <div class="styLNDesc" style="width:100mm; height:14mm;">          
        If you did not complete a Schedule D Tax Worksheet for the regular tax or the AMT, enter the amount from line 58. Otherwise, add lines 58 and 59 and enter the <b>smaller</b> of that result or the amount from line 10 of the Schedule D Tax Worksheet (as refigured for the AMT, if necessary)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:14mm;width:8mm;padding-top:10mm;">60</div>
      <div class="styLNAmountBox" style="height:14mm;width:31.5mm;padding-top:10mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SumPlusUnrecapturedSect1250Amt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:14mm;width:8mm;border-bottom-width:0px;background-color:lightgrey;"/>
      <div class="styLNAmountBox" style="height:14mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>
    
    <!--Line 61--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">61</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Enter the <b>smaller</b> of line 57 or line 60
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">61</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SmallerOfAltMinTxblIncOrSumAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 62--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">62</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Subtract line 61 from line 57
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">62</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AdjAltMinTaxableIncLessGainAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 63--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:8mm;">63</div>      
      <div class="styLNDesc" style="width:139.5mm; height:8mm;">          
        If line 62 is $179,500 or less, multiply line 62 by 26% (.26). Otherwise, multiply line 62 by 28% (.28) and subtract $3,590 from the result
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
       <span style="width: 16px"></span><img src="{$ImagePath}/1041SchI_Bullet_Sm.gif" alt="Bullet Image"/>
      </div>
      <div class="styLNRightNumBox" style="height:8mm;width:8mm;padding-top:4mm;">63</div>
      <div class="styLNAmountBox" style="height:8mm;width:31.5mm;padding-top:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetAdjAltMinTxblIncTimesPctAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 64--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">64</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Maximum amount subject to the 0% rate
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">64</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">        
        $2,450.00
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    
	<!--Line 65--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:17mm;">65</div>      
      <div class="styLNDesc" style="width:100mm; height:17mm;">          
        Enter the amount from line 27 of Schedule D (Form 1041), line 14 of the<br/>Schedule D Tax Worksheet, or line 5 of the Qualified Dividends Tax<br/>Worksheet in the instructions for Form 1041, whichever applies (as figured<br/>for the regular tax). If you did not complete Schedule D or either worksheet<br/>for the regular tax, enter the amount from Form 1041, line 22; but do not<br/>enter less than -0-
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:20mm;width:8mm;padding-top:16mm;">65</div>
      <div class="styLNAmountBox" style="height:20mm;width:31.5mm;padding-top:16mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/IncomeAboveThresholdWorkshtAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:20mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:20mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>   
    
	<!--Line 66--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">66</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Subtract line 65 from line 64. If zero or less, enter -0-
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">66</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/FSAmtLessIncAboveThresholdAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>   
    
    <!--Line 67--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">67</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Enter the <b>smaller</b> of line 57 or line 58
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">67</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SmllrOfAdjustedAltMinOrSchDAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>   
    
    <!--Line 68--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">68</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Enter the <b>smaller</b> of line 66 or line 67.  This amount is taxed at 0%
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.        
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;">68</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SmllrAbvThrshldOrAltMinGainAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>   
    
    <!--Line 69--> 
    <div style="width:187mm;font-size:7pt;border-bottom:1px solid black;">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">69</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;padding-top:0mm;padding-bottom:0mm;">          
        Subtract line 68 from line 67
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;">69</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SmllrNetAdjAltMinOrNetGainAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;"/>
    </div>
    <!-- Page Break-->
    <!-- Footer-->   
    <div class="pageEnd" style="width:187mm;">  
        <div class="styGenericDiv" style="font-weight:bold"><!--For Paperwork Reduction Act Notice, see the Instructions for Form 1041.--></div>   
        <div class="styGenericDiv" style="padding-left:15mm"><!--Cat. No. 51517Q--></div>                        
        <div class="styGenericDiv" style="font-weight:bold;float:right" >Schedule I (Form 1041) (2013) </div>
    </div>
    
    <!--Begin Page 3 -->   
    <!-- Header -->    
      <div class="styBB" style="width:187mm;border-bottom-width: 0px;">  
         <!--<div style="float:right;">
      Version A, Cycle 3</div>-->
      </div>  
    <div class="styBB" style="width:187mm;float:left;clear:none;">  
      <div style="float:left;">Schedule I (Form 1041) (2013) <span style="width:130mm;"></span></div>
      <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></div>  
    </div>  
    <!-- BEGIN Part II Title -->   
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part IV</div>
      <div class="styPartDesc">Line 52 Computation Using Maximum Capital Gains Rates <span style="font-weight:normal;"><i>(continued)</i></span></div>
    </div>   
    <!--Line 70--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">70</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;">          
        Enter the amount from the Line 70 Worksheet in the instructions
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.        
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">70</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">       
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/ApplcblCapGainsOrSchDWrkshtAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4.4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:4.4mm;width:31.5mm;border-bottom-width:0px;"/>
    </div> 
    <!--Line 71--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">71</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;">          
        Enter the <b>smaller</b> of line 69 or 70
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.     
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">71</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SmllrAdjNetGainOrTxblIncAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4.4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:4.4mm;width:31.5mm;border-bottom-width:0px;"/>
    </div> 
    <!--Line 72--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">72</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Multiply line 71 by 15% (.15)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
       <span style="width: 16px"></span><img src="{$ImagePath}/1041SchI_Bullet_Sm.gif" alt="Bullet Image"/>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">72</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetAltMinTaxableIncTimesPctAmt"/>
        </xsl:call-template>        
      </div>
    </div> 
    <!--Line 73--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">73</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;">          
        Add lines 68 and 71
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.  
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">73</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SumOfSmllrAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4.4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:4.4mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>
     <!--Instructions--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;" />     
      <div class="styLNDesc" style="width:139.5mm; height:4mm;font-weight:bold;">          
        If lines 73 and 57 are the same, skip lines 74 through 78 and go to line 79, Otherwise, go to line 74.
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;" />
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;" />
    </div>
    <!--Line 74--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">74</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;">          
        Subtract line 73 from line 67
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.     
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">74</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/ExcessOfSumAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4.4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:4.4mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>
    <!--Line 75--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">75</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Multiply line 74 by 20% (.20)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
       <span style="width: 16px"></span><img src="{$ImagePath}/1041SchI_Bullet_Sm.gif" alt="Bullet Image"/>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">75</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/ExcessOfSumTimesPctAmt"/>
        </xsl:call-template>        
      </div>
    </div> 
    <!--Instructions--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;" />     
      <div class="styLNDesc" style="width:139.5mm; height:4mm;font-weight:bold;">          
        If line 59 is zero or blank, skip lines 76 through 78 and go to line 79. Otherwise, go to line 76.
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;" />
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;" />
    </div>
    <!--Line 76--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">76</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;">          
        Add lines 62, 73, and 74
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.     
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">76</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TotalNetAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4.4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:4.4mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>    
    <!--Line 77--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">77</div>      
      <div class="styLNDesc" style="width:100mm; height:4mm;">          
        Subtract line 76 from line 57
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">77</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetSmallerSchDOrAdjNetGainAmt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNRightNumBox" style="height:4.4mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:4.4mm;width:31.5mm;border-bottom-width:0px;"/>
    </div>   
    
    <!--Line 78--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">78</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Multiply line 77 by 25% (.25)
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
       <span style="width: 16px"></span><img src="{$ImagePath}/1041SchI_Bullet_Sm.gif" alt="Bullet Image"/>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">78</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetSchDOrAdjNetGainTimesPctAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 79--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:4mm;">79</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Add lines 63, 72, 75 and 78
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;">79</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/SumOfAltMinTaxPercentagesAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 80--> 
    <div style="width:187mm;font-size:7pt">
      <div class="styLNLeftNumBox" style="height:8mm;">80</div>      
      <div class="styLNDesc" style="width:139.5mm; height:8mm;">          
        If line 57 is $179,500 or less, multiply line 57 by 26% (.26). Otherwise, multiply line 57 by 28% (.28) and subtract $3,590 from the result
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:8mm;width:8mm;padding-top:4mm;">80</div>
      <div class="styLNAmountBox" style="height:8mm;width:31.5mm;padding-top:4mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/NetAltMinTxblIncTimesFSPctAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    
    <!--Line 81--> 
    <div class="styBB" style="width:187mm;font-size:7pt;">
      <div class="styLNLeftNumBox" style="height:4mm;">81</div>      
      <div class="styLNDesc" style="width:139.5mm; height:4mm;">          
        Enter the <b>smaller</b> of line 79 or line 80 here and on line 52
        <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
       </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;border-bottom-width:0px;">81</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-bottom-width:0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/TaxOnAlternativeMinimumGainAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
    <!-- END Part IV Title -->
 
     <!--Footer -->
    <div class="pageEnd" style="width:187mm;">
      <div class="styGenericDiv" style="width:187mm;text-align:right;font-weight:bold;">Schedule I (Form 1041) (2013)</div>
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
				<xsl:with-param name="TargetNode" select="$Form1041ScheduleIData"/>
				<xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Line 29 - Residual Interest In REMIC Code</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1041ScheduleIData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
				<xsl:with-param name="DescWidth" select="105"/>
			</xsl:call-template>
		</table>      
</form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>