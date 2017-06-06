<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS945AStyle.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="Form945AData" select="$RtnDoc/IRS945A" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form945AData)">
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
				<meta name="Description" content="IRS Form 945A" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"/>
				<style type="text/css"> 
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS945AStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>  
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;" >
				<form name="Form945A">
					<xsl:call-template name="DocumentHeader"></xsl:call-template>
					<!-- Begin Form Number and Name -->
					<!-- put comment here -->
					<div class="styBB" style="width:187mm;height:auto;">
      <div class="styFNBox" style="width:29mm;height:auto;">
        Form <span class="styFormNumber">945-A</span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form945AData"/>
        </xsl:call-template><br/>
        <div class="styAgency" style="height:auto;font-size:7.5pt;padding-bottom:2mm;padding-top:1mm;">
			(Rev. February 2014)
		</div>
		<div class="styAgency" style="height:auto;font-size:7.5pt;vertical-align:bottom;line-height:auto">
          Department of the Treasury<br/>
          Internal Revenue Service
        </div>
      </div>
      <div class="styFTBox" style="width:128mm;height:auto; ">
        <div class="styMainTitle" style="height:auto;padding-top:2mm;">Annual Record of Federal Tax Liability</div>    
 <div class="styFBT" style="width:128mm;height:auto;margin-top:2mm;font:size:6pt;">
 <img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/> Information about Form 945-A and its instructions is at <i>www.irs.gov/form945a</i>.<br/>
          <img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/> File with Form 945, 945-X, CT-1, CT-1 X, 944, or 944-X.        
        </div>
      </div>
      <div class="styTYBox" style="width:30mm;height:auto;">
        <div class="styOMB" style="height:auto;padding-top:2mm;">
        OMB No. 1545-1430</div>
        <div class="styTaxYear" style="width:20mm;height:auto;padding-top:0.5mm;border-bottom:1px dashed black;margin-bottom:1.4mm;">
			<xsl:variable name="RHTaxYear"><xsl:call-template name="PopulateReturnHeaderTaxYear"/></xsl:variable>
			<xsl:value-of select="substring($RHTaxYear, 1, 2)"/><span class="styTYColor"><xsl:value-of select="substring($RHTaxYear, 3, 2)"/></span> 
		</div>
        <span style="height:auto;vertical-align:bottom">Calendar Year</span>
      </div>
    </div>
    <!-- End Form Number and Name section -->
    <div class="styBB" style="width:187mm;">
      <div class="styNameBox" style="width:130mm;height:auto;font-size:7pt;">
        Name (as shown on Form 945, 945-X, CT-1, CT-1 X, 944, or 944-X)<br/>
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
		</xsl:call-template><br/>
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
		</xsl:call-template>
      </div>        
      <div class="styEINBox" style="width:55mm;height:8mm;font-size:7pt;padding-left:2mm;">
        Employer identification number (EIN)<br/>
        <span class="styEINFld" style="width:55mm; text-align:left;padding-top:3mm;font-weight:normal;">
			<xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">EIN</xsl:with-param>
			</xsl:call-template>
        </span>
      </div>
    </div>
    <!--Calendar Instructions-->
    <div style="width:187mm;font-size:7pt;float:left;clear:both;">
      <div class="styLNDesc" style="height:12mm;width:187mm;border-left-width:0px;border-right-width:0px;">You must complete this form if you are required to deposit on a semiweekly schedule or if your tax liability during any month was $100,000 or more. Show tax liability here, not deposits. (The IRS gets deposit data from electronic funds transfers.) <b>DO NOT change your tax liability by adjustments reported on any Form 945-X, 944-X, or CT-1 X.</b>
      </div>
    </div>
	<div style="float:left;clear:both;width:710px;">
	<!--January-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			January Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">31</xsl:with-param>
			<xsl:with-param name="Month">JANUARY</xsl:with-param>
			<xsl:with-param name="Letter">A</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--February-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			February Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">29</xsl:with-param>
			<xsl:with-param name="Month">FEBRUARY</xsl:with-param>
			<xsl:with-param name="Letter">B</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--March-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			March Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">31</xsl:with-param>
			<xsl:with-param name="Month">MARCH</xsl:with-param>
			<xsl:with-param name="Letter">C</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--April-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			April Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">30</xsl:with-param>
			<xsl:with-param name="Month">APRIL</xsl:with-param>
			<xsl:with-param name="Letter">D</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--May-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			May Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">31</xsl:with-param>
			<xsl:with-param name="Month">MAY</xsl:with-param>
			<xsl:with-param name="Letter">E</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--June-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			June Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">30</xsl:with-param>
			<xsl:with-param name="Month">JUNE</xsl:with-param>
			<xsl:with-param name="Letter">F</xsl:with-param>
		</xsl:call-template>
	</div>
	</div>
	<!--Page Break-->
	<div class="pageEnd" style="width:187mm;border: black solid 1px;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;">
		<div class="styGenericDiv" style="float:left;width:auto;text-align:left;font-weight:bold">For Paperwork Reduction Act Notice, see page 4.</div>
		<div class="styGenericDiv" style="float:left;width:50mm;text-align:right;">Cat. No. 14733M</div>                        
		<div class="styGenericDiv" style="float:right" >Form <span style="font-weight:bold;font-size:8.5pt;">945-A</span> (Rev. 2-2014)</div>
	</div>
		<p style="page-break-before: always"/>
	<div class="styBB" style="width:187mm;float:left;clear:both;">  
		<div style="float:left;">Form 945-A (Rev. 2-2014)<span style="width:130mm;"/></div>
		<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>  
	</div>
	<div style="width:710px;float:left;clear:both;">
	<!--July-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			July Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">31</xsl:with-param>
			<xsl:with-param name="Month">JULY</xsl:with-param>
			<xsl:with-param name="Letter">G</xsl:with-param>
		</xsl:call-template>
	</div>	
	<!--August-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			August Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">31</xsl:with-param>
			<xsl:with-param name="Month">AUGUST</xsl:with-param>
			<xsl:with-param name="Letter">H</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--September-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			September Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">30</xsl:with-param>
			<xsl:with-param name="Month">SEPTEMBER</xsl:with-param>
			<xsl:with-param name="Letter">I</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--October-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			October Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">31</xsl:with-param>
			<xsl:with-param name="Month">OCTOBER</xsl:with-param>
			<xsl:with-param name="Letter">J</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--November-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			November Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">30</xsl:with-param>
			<xsl:with-param name="Month">NOVEMBER</xsl:with-param>
			<xsl:with-param name="Letter">K</xsl:with-param>
		</xsl:call-template>
	</div>
	<!--December-->
	<div class="styIRS945ACalBox" style="width:236px;font-size:7pt;border-left-width:0px;">
		<div style="height:4mm;width:234px;text-align:center;font-weight:bold;font-size:8pt;">
			December Tax Liability
		</div>
		<xsl:call-template name="PopulateDays">
			<xsl:with-param name="NumDays">31</xsl:with-param>
			<xsl:with-param name="Month">DECEMBER</xsl:with-param>
			<xsl:with-param name="Letter">L</xsl:with-param>
		</xsl:call-template>
	</div>
	</div>
    <!--FULL CALENDAR TOTAL ROW-->
    <div style="width:187mm;float:left;font-size:7pt">
      <div class="styLNAmountBox" style="width:187mm;height:auto;float:left;border-left-width:0px;border-right-width:0px;font-weight:bold;text-align:left;">
		  <span style="float:left;">
			  M <span style="padding-left: 1.4mm; font-weight:normal;">Total tax liability for the year (add lines <b>A</b> through 
			  <b>L</b>). This should equal line 3 on Form 945 (line 15</span><br/>
			  <span style="float:left;padding-left:4.5mm;font-weight:normal;">on Form CT-1, line 7 on Form 944)</span>
			  <!--Dotted Line-->
			  <span class="styDotLn" style="float:left;padding-left:4mm;padding-right:1mm;">.......................</span>
			  <img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/>
			  </span>
		  <span style="float:right;padding-top:3mm;">
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$Form945AData/TotalTaxLiabilityAmt"/>
			</xsl:call-template>
		  </span>     
		  </div>
    </div>
    <!-- Page Break-->
    <!-- Footer-->   
    <div class="pageEnd" style="width:187mm;float:left;border:1px solid black;border-right-width:0px;border-bottom-width:0px;border-left-width:0px;">
        <div class="styGenericDiv" style="float:right" >Form <b><span style="font-size:8pt;">945-A</span></b> (Rev. 2-2014)</div>
    </div>
    <p style="page-break-before: always"/>
    <!-- BEGIN Left Over Table -->
	<!-- Additonal Data Title Bar and Button -->
	<div class="styLeftOverTitleLine" id="LeftoverData" style="float:left;">
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
			<xsl:with-param name="TargetNode" select="$Form945AData"/>
			<xsl:with-param name="DescWidth" select="100"/>
		</xsl:call-template>
	</table>
</form>
</body>
</html>
</xsl:template>
<xsl:template name="PopulateDays">
		<xsl:param name="NumDays"/>
		<xsl:param name="Month"/>
		<xsl:param name="Letter"/>
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<body class="styBodyClass" >
				<div style="float:left;width:117px;border:solid black;border-width:0px 1px 0px 0px;">
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">1</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=1]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">2</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=2]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">3</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=3]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">4</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=4]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">5</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=5]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">6</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=6]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">7</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=7]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">8</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=8]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">9</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=9]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">10</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=10]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">11</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=11]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">12</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=12]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">13</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=13]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">14</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=14]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">15</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=15]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;float:left;">16</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;float:right;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=16]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<div style="float:right;width:117px;">
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">17</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=17]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">18</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=18]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">19</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=19]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">20</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=20]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">21</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=21]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">22</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=22]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">23</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=23]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">24</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=24]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">25</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=25]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">26</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=26]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">27</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=27]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">28</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=28]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">29</div>
					<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=29]/TaxLiabilityAmt"/>
						</xsl:call-template>
					</div>
					<xsl:if test="$NumDays = 29">
						<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;background-color:lightgrey;"/>
						<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;background-color:lightgrey;"/>
					</xsl:if>
					<xsl:if test="$NumDays = 30">
						<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">30</div>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=30]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;background-color:lightgrey;"/>
					</xsl:if>
					<xsl:if test="$NumDays = 31">
						<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">30</div>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=30]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;">31</div>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;font-size:6pt;padding-top:1mm;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/DailyTaxLiabilityDetail[DayNum=31]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</xsl:if>
					<div class="styIRS945ACalNumBox" style="height:4.3mm;width:18px;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="border-top-width:1px;height:4.3mm;width:98px;border-bottom-width:0px;border-left-width:0px;background-color:lightgrey;padding-right:0px;padding-left:0px;padding-top:0px;padding-bottom:0px;"/>
				</div>
				<div class="styLNAmountBox" style="height:4mm;width:234px;font-weight:bold;text-align:left;border-bottom-width:0px;border-top-width:1px;border-left-width:0px;">
					<span style="float:left;">
						<xsl:value-of select="$Letter"/><span style="width:3mm"/>Total for month <img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/>
					</span>
					<span style="font-size:7pt;float:right;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form945AData/MonthlyTaxLiabilityGrp[MonthCd=$Month]/TotalMonthlyLiabilityAmt"/>
						</xsl:call-template>
					</span>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>