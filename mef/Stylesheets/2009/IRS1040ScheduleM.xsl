<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1040ScheduleMStyle.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1" />
<xsl:strip-space elements="*" />
<xsl:param name="Form1040ScheduleMData" select="$RtnDoc/IRS1040ScheduleM" />
<xsl:template match="/">
<html >
<head>
  <title>
  <xsl:call-template name="FormTitle">
  <xsl:with-param name="RootElement" select="local-name($Form1040ScheduleMData)">
  </xsl:with-param>
  </xsl:call-template>
  </title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 1040ScheduleM" />
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS">
    </xsl:call-template>
 <style type="text/css"> 
 <xsl:if test="not($Print) or $Print=''">
        <!-- Form 1040ScheduleF CSS Styles are located in the template called below -->
        <xsl:call-template name="IRS1040ScheduleMStyle"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
 </xsl:if>
  </style>  
  <xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass" >
  <form name="Form1040ScheduleM">
    <!-- WARNING LINE -->
    <xsl:call-template name="DocumentHeader">
    </xsl:call-template>
    <!-- Begin Form Number and Name -->
<!-- put comment here -->
    <div class="styBB" style="width:187mm;height:20mm;">
      <div class="styFNBox" style="width:29mm;height:20mm;">
        <div style="padding-top:1mm;line-height:180%;">                  
          <span class="styFormNumber" style="font-size:9pt;" >SCHEDULE M</span>
          <br/>
          <span class="styFormNumber" style="font-size:7pt;padding-top:2mm;">(Form 1040A or 1040)</span>
          <br/>
        </div>
        <div style="padding-top:2mm;">
          <span class="styAgency">Department of the Treasury</span><br/>
          <span class="styAgency">Internal Revenue Service <span style="width:1mm" /> (99)</span>  
        </div>
      </div>
      <div class="styFTBox" style="width:127mm;height:20mm; ">
        <div class="styMainTitle" style="height:4mm;margin-top:2mm;">Making Work Pay and Government
        <br/>Retiree Credits
          </div>    
          <div class="styFBT" style="height:3mm;margin-top:4mm;width:127mm;text-align:left;">
           <span style="width:6mm;"></span>
       <img src="{$ImagePath}/1040SchM_Bullet_Sm.gif"  alt="Bullet Image"/> 
       Attach to Form 1040A, 1040, or 1040NR.
       <span style="width:14mm;"></span>
          <img src="{$ImagePath}/1040SchM_Bullet_Sm.gif"  alt="Bullet Image"/> See separate instructions   
        </div>
      </div>
      <div class="styTYBox" style="width:30mm;height:20mm;">
        <div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
        <div class="styTaxYear">
          20<span class="styTYColor">09</span>
        </div>
        <div  style="margin-left:2mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">166</span>
        </div>
      </div>
    </div>
    <!-- End Form Number and Name section -->
    <div class="styBB" style="width:187mm;">
      <div class="styNameBox" style="width:130mm;height:8mm;font-size:7pt;">
        Name(s) shown on return<br/> 
      <!--  <span class="stySmallText">-->    
               <span style="width:45mm; text-align:left;font-weight:normal;padding-top:2mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name" />
          </xsl:call-template>    
          <span style="width:1mm;"></span>
            <!--<xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/PersonLastName" />
          </xsl:call-template> -->  
       </span>
      </div>        
      <div class="styEINBox" style="width:55mm;height:8mm;font-size:7pt;padding-left:0mm;text-align:center;">
        Your Social security number <br/>
        <span class="styEINFld" style="width:45mm; text-align:left;font-weight:normal;padding-top:2mm;">
        <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN" />
          </xsl:call-template>            
        </span>  
      </div>
    </div>
    <!--Line 1-->
    <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBoxSD" style="padding-top:1mm;">1a</div>
      <div class="styForm1040SchedulelineItem" style="width:139.5mm;padding-top:1mm;font-size:7pt;">
      <b>lmportant:</b> See the instructions if you can be claimed as someone else’s dependent or are filing <br/>
      Form 1040NR. Check the “No” box below and see the instructions if (a) you have a net loss from a <br/>business,
       (b) you received a taxable scholarship or fellowship grant not reported on a Form W-2, (c)  <br/>your wages include
       pay for work performed while an inmate in a penal institution, (d) you received a <br/>pension or annuity from a nonqualified 
       deferred compensation plan or a nongovernmental section 457 plan, or (e) you are filing Form 2555 or 2555-EZ.    
       </div>
            <div class="styLNRightNumBox" style="height:21mm;padding-top:0mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"></div>
      <div class="styLNAmountBox" style="height:21mm;padding-top:0mm;width:31.5mm;border-bottom-width:0px;"></div>  
          </div>
      <div style="width:187mm;padding-top:0mm;">
        <div class="styLNLeftNumBoxSD" style="height:5mm;"></div>
        <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:5mm;padding-top:1mm;font-size:7pt;">
         Do you (and your spouse if filing jointly) have 2009 wages of more than $6,451 ($12,903 if <br/>married filing jointly)?      
              </div>
      <div class="styLNRightNumBox" style="height:10mm;padding-top:0mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"></div>
      <div class="styLNAmountBox" style="height:10mm;padding-top:0mm;width:31.5mm;border-bottom-width:0px;"></div>          
    </div>
    <div style="width:187mm;">
		<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
			<div class="styForm1040SchedulelineItem" style="height:4mm;width:139.5mm;">
			<input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayIncomeThresholdInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleMMakeWorkPayIncomeThresholdInd</xsl:with-param>
          </xsl:call-template>
        </input> 
			<label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayIncomeThresholdInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleMMakeWorkPayIncomeThresholdInd</xsl:with-param>
          </xsl:call-template>
			<span style="width:4px;"/>
			<b>Yes.  </b>
		</label> Skip lines 1a through 3. Enter $400 ($800 if married filing jointly) on line 4 and go to line 5.
	</div>
<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:4.5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
<div class="styLNAmountBox" style="width:31.5mm;height:4.5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
  </div>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm"/>
	<div class="styForm1040SchedulelineItem" style="height:3mm;width:96.2mm;">
		<input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayIncomeThresholdInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleMMakeWorkPayIncomeThresholdInd</xsl:with-param>
          </xsl:call-template>
        </input> 
		<span style="width:4px;"/>
		<label>
	 <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayIncomeThresholdInd" />
            <xsl:with-param name="BackupName">IRS1040ScheduleMMakeWorkPayIncomeThresholdInd</xsl:with-param>
          </xsl:call-template>
		<b>No.  </b>
		</label>Enter your earned income (see instructions)  
		</div>
		<div class="styLNRightNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm; width:7.1mm;">1a
          </div>
			<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm; border-buttom-width:1px;">
		<xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayEarnedIncomeAmt" />
        </xsl:call-template>      			
							</div>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                     </div>
  <!--Line 1b-->
 <div class="styBB" style="width:187mm;border-bottom-width:0px;">    
  <div class="styLNLeftLtrBox" style="">b</div>
  <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:4mm;">Nontaxable combat pay included on
  </div>
  <div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:4.5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
<div class="styLNAmountBox" style="width:31.5mm;height:4.5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
<div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:0mm;"></div>
<div class="styForm1040SchedulelineItem" style="width:53.3mm;height:4mm;padding-top:0mm;">line 1a (see instructions)  
<span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>. 
          <span style="width:16px;"></span>.
        </span>
</div>
<div class="styLNRightNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm; width:7.1mm;padding-top:0mm;">1b
      </div>
	<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm; border-bottom-width:1px;padding-top:0mm;">
		<xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/NontaxableCombatPayAmt" />
        </xsl:call-template>      						
	</div>
	<div class="styLNRightNumBox" style="width:7.1mm;font-size:7pt;height:5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
   </div>            
                   
    <!--Line 2-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
      <div class="styForm1040SchedulelineItem" style="width:96.2mm;height:4mm;">Multiply line 1a by 6.2% (.062)
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
      <div class="styLNRightNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm; width:7.1mm;">2
        </div>
		<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm; border-buttom-width:1px;">
		  <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/CalculatedEarnedIncomeAmt" />
        </xsl:call-template>      
							</div>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:6mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:6mm;padding-bottom:0mm;border-bottom-width:0px;"/>
    </div>
      <!-- Line 3-->
     <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm;">3</div>
      <div class="styForm1040SchedulelineItem" style="width:96.2mm;height:5mm;padding-top:1mm;">Enter $400 ($800 if married filing jointly)
        <!--Dotted Line-->
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
      <div class="styLNRightNumBox" style="font-size:7pt;height:3mm;padding-top:1mm; width:7.1mm;">3
        </div>
		<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-top:1mm; border-buttom-width:1px;">
		 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayCreditAmt" />
        </xsl:call-template>      
		</div>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
    </div>
    <!--Line 4-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:3mm;">4</div>
      <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:6mm;padding-top:3mm;">Enter the <b>smaller</b> of line 2 or line 3 (unless you checked "Yes" on line 1a)
        <!--Dotted Line-->
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
      <div class="styLNRightNumBox" style="height:6mm;width:8mm;padding-top:3mm;">4</div>
      <div class="styLNAmountBox" style="height:6mm;width:31.5mm;padding-top:3mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/SmallerOfCrAmtOrCalculateEIAmt" />
        </xsl:call-template>
      </div>    
    </div>  
    <!--Line 5-->
     <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm;">5</div>
      <div class="styForm1040SchedulelineItem" style="width:96.2mm;height:5mm;padding-top:1mm;">Enter the amount from Form 1040, line 38*, or Form 1040A, line 22.
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:9px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="font-size:7pt;height:3mm;padding-top:1mm; width:7.1mm;">5
        </div>
		<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-top:1mm; border-buttom-width:1px;">
		 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/AdjustedGrossIncomeAmt" />
        </xsl:call-template>
		</div>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:7mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:7mm;padding-bottom:0mm;border-bottom-width:0px;"/>
    </div>
    <!--Line 6-->
     <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm;">6</div>
      <div class="styForm1040SchedulelineItem" style="width:96.2mm;height:5mm;padding-top:1mm;">Enter $75,000 ($150,000 if married filing jointly)
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:9px;"></span>.
           <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="font-size:7pt;height:3mm;padding-top:1mm; width:7.1mm;">6
        </div>
		<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-top:1mm; border-buttom-width:1px;">
		<xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayFilingStatusCrAmt" />
        </xsl:call-template>
		</div>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:6mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:6mm;padding-bottom:0mm;border-bottom-width:0px;"/>
    </div>
<!--Line 7-->   
    <div style="width:187mm;padding-top:0mm;">
        <div class="styLNLeftNumBoxSD" style="height:5mm;">7</div>
        <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:5mm;padding-top:1mm;">
       Is the amount on line 5 more than the amount on line 6?  
              </div>
               <div class="styLNRightNumBox" style="height:5mm;padding-top:0mm;width:8mm;background-color:lightgrey;border-bottom-width:0px;"></div>
      <div class="styLNAmountBox" style="height:5mm;padding-top:0mm;width:31.5mm;border-bottom-width:0px;"></div>          
    </div>
    <div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
				<div class="styForm1040SchedulelineItem" style="height:4mm;width:139.5mm;">
					<input type="checkbox"  class="styCkbox"  name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/AGIMoreThanFilingStatusDedInd" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleMAGIMoreThanFilingStatusDedInd</xsl:with-param>
                    </xsl:call-template>
                     </input> 
					<label>
					<xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/AGIMoreThanFilingStatusDedInd" />
                   <xsl:with-param name="BackupName">IRS1040ScheduleMAGIMoreThanFilingStatusDedInd</xsl:with-param>
                 </xsl:call-template>
					<span style="width:4px;"/>
					<b>No.  </b>
				</label> Skip line 8. Enter the amount from line 4 on line 9 below.
							 </div>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:4.5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="width:31.5mm;height:4.5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                        </div>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							 <div class="styForm1040SchedulelineItem" style="height:3mm;width:96.2mm;">
								<input type="checkbox"  class="styCkbox"  name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/AGIMoreThanFilingStatusDedInd" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleMAGIMoreThanFilingStatusDedInd</xsl:with-param>
                    </xsl:call-template>
                     </input> 
							<span style="width:4px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/AGIMoreThanFilingStatusDedInd" />
                   <xsl:with-param name="BackupName">IRS1040ScheduleMAGIMoreThanFilingStatusDedInd</xsl:with-param>
                 </xsl:call-template>
								<b>Yes.  </b>
							</label>Subtract line 6 from line 5
							    </div>
		<div class="styLNRightNumBox" style="font-size:7pt;height:3mm;padding-bottom:0mm; width:7.1mm;">7
                            </div>
		<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm; border-buttom-width:1px;">
					<xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/AGILessFilingStatusCrAmt" />
        </xsl:call-template>			
							</div>
	<div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:5mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:5mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                     </div>
    <!--Line 8-->
     <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:3mm;">8</div>
      <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:6mm;padding-top:3mm;">Multiply line 7 by 2% (.02)
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
      <div class="styLNRightNumBox" style="height:6mm;width:8mm;padding-top:3mm;">8</div>
      <div class="styLNAmountBox" style="height:6mm;width:31.5mm;padding-top:3mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayCalculatedCrAmt" />
        </xsl:call-template>
      </div>    
    </div>  
    <!--Line 9-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">9</div>
      <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:4mm;padding-top:1mm;">Subtract line 8 from line 4. If zero or less, enter -0-
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
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>      
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-top:1mm;">9</div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:1mm; ">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayNetCrAmt" />
        </xsl:call-template>
      </div>    
    </div> 
    <!--Line 10--> 
      <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;">10</div>      
      <div class="styForm1040SchedulelineItem" style="width:139.4mm; height:5mm;padding-top:0mm;">          
        Did you (or your spouse, if filing jointly) receive an economic recovery payment in 2009? You
may have received this payment if you received social security benefits, supplemental security
income, railroad retirement benefits, or veterans disability compensation or pension benefits (see
instructions).
      </div>
    <div class="styLNRightNumBox" style="width:mm;font-size:7pt;height:10mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:10mm;padding-bottom:0mm;border-bottom-width:0px;"/>
	</div>
	<div style="width:187mm;">
				<div class="styForm1040SchedulelineItem" style="height:4mm;width:120mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm;"/>
							 <input type="checkbox"  class="styCkbox"  name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/EconomicRecoveryPymtInd" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleMEconomicRecoveryPymtInd</xsl:with-param>
                    </xsl:call-template>
                     </input> 
							<label>
								<xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/EconomicRecoveryPymtInd" />
                   <xsl:with-param name="BackupName">IRS1040ScheduleMEconomicRecoveryPymtInd</xsl:with-param>
                 </xsl:call-template>
								<span style="width:4px;"/>
								<b>No.  </b>
							</label> 
							<span style="width:1mm;"></span>Enter -0- on line 10 and go to line 11.
			<div style="width:120mm;">
			<div class="styLNLeftNumBox" style="font-size:7pt;padding-bottom:0mm;padding-left: 2.25mm"/>
			 <input type="checkbox"  class="styCkbox"  name="Checkbox">
							   <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/EconomicRecoveryPymtInd" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleMEconomicRecoveryPymtInd</xsl:with-param>
                    </xsl:call-template>
                      </input> 
							<span style="width:4px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/EconomicRecoveryPymtInd" />
                   <xsl:with-param name="BackupName">IRS1040ScheduleMEconomicRecoveryPymtInd</xsl:with-param>
                 </xsl:call-template>
								<b>Yes.  </b>
							</label>
							Enter the total of the payments received by you (and your spouse, if filing <br/>
							<span style="width:11mm;"></span>jointly). Do not enter more than $250 ($500 if married filing jointly)
				</div>
					</div>
<div class="styLNDesc" style="width:3mm; height:15mm;">
          <img src="{$ImagePath}/1040SchM_Bracket.gif" height="45mm" alt="Curly Bracket Image"/>   
        </div>    
        <div class="styForm1040SchedulelineItem" style="width:24.3mm;height:15mm;padding-top:4mm;">
                       <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>     
                 </div>    
       <div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:8mm;border-right-width:0px;padding-top:3mm;">10</div>
            <div class="styLNAmountBox" style="width:31.5mm;height:8mm;padding-bottom:0mm;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/EconomicRecoveryPymtAmt" />
        </xsl:call-template>
            </div>   
	 <div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:8mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	 <div class="styLNAmountBox" style="width:31.5mm;height:8mm;padding-bottom:0mm;border-bottom-width:0px;"/>
		</div>
    <!--Line 11-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;">11</div>      
      <div class="styForm1040SchedulelineItem" style="width:139.4mm; height:5mm;padding-top:0mm;">          
       Did you (or your spouse, if filing jointly) receive a pension or annuity in 2009 for services performed as an employee of the U.S. Government or any U.S. state or local government from work <b>not</b> covered by social security? Do not include any pension or annuity reported on Form W-2.
      </div>
    <div class="styLNRightNumBox" style="width:mm;font-size:7pt;height:11mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	<div class="styLNAmountBox" style="width:31.5mm;height:11mm;padding-bottom:0mm;border-bottom-width:0px;"/>
	</div>
	<div style="width:187mm;height:19mm;">
				<div class="styForm1040SchedulelineItem" style="width:120mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm;"/>
							 <input type="checkbox"  class="styCkbox"  name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/GovRetireeCrInd" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleMGovRetireeCrInd</xsl:with-param>
                    </xsl:call-template>
                     </input> 
							<label>
								<xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/GovRetireeCrInd" />
                   <xsl:with-param name="BackupName">IRS1040ScheduleMGovRetireeCrInd</xsl:with-param>
                 </xsl:call-template>
								<span style="width:4px;"/>
								<b>No.  </b>
							</label> 
							<span style="width:1mm;"></span>Enter -0- on line 11 and go to line 12.
			<div style="width:120mm;">
			<div class="styLNLeftNumBox" style="font-size:7pt;padding-bottom:0mm;padding-left: 2.25mm"/>
			 <input type="checkbox"  class="styCkbox"  name="Checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/GovRetireeCrInd" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleMGovRetireeCrInd</xsl:with-param>
                    </xsl:call-template>
                  </input> 
							<span style="width:4px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/GovRetireeCrInd" />
                   <xsl:with-param name="BackupName">IRS1040ScheduleMGovRetireeCrInd</xsl:with-param>
                 </xsl:call-template>
								<b>Yes.  </b>
								 <img src="{$ImagePath}/1040SchM_Bullet_Round.gif" alt="bullet image"/>
							If you checked "No" on Line 10, enter $250 ($500 if married filing jointly 
							<span style="width:13mm;"></span>and the answer on Line 11 is "Yes" for both spouses) <br/>
							<span style="width:19mm;"></span>
							<img src="{$ImagePath}/1040SchM_Bullet_Round.gif" alt="bullet image"/>
								If you checked "Yes" on Line 10, enter -0- (exception: enter $250 if filing<br/>
								<span style="width:21mm;"></span> jointly and the spouse who received 
								the pension or annuity did not receive<br/>
								 <span style="width:21mm;"></span>an economic recovery payment described on line 10)
							</label>
				</div>
					</div>
<div class="styForm1040SchedulelineItem" style="width:3mm;height:19mm; ">
          <img src="{$ImagePath}/1040SchM_Bracket_Lg.gif"  height="70mm" alt="Curly Bracket Image"/>   
        </div>    
        <div class="styLNDesc" style="width:24.3mm;padding-top:7mm;height:19mm;">
                       <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>     
                 </div>    
      <div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:10mm;border-right-width:0px;padding-top:5mm;">11</div>
            <div class="styLNAmountBox" style="width:31.5mm;height:10mm;padding-bottom:0mm;padding-top:5mm;">
             <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/GovRetireeCrAmt" />
        </xsl:call-template>
            </div>
            
	 <div class="styLNRightNumBox" style="width:8mm;font-size:7pt;height:11mm; background-color:lightgrey; border-bottom-width:0px; border-right-width:0px;"/>
	 <div class="styLNAmountBox" style="width:31.5mm;height:11mm;padding-bottom:0mm;border-bottom-width:0px;"/>
		</div>
	<!--Line 12--> 
    <div style="width:187mm;">      
      <div class="styLNLeftNumBox" style="height:4mm;">12</div>      
      <div class="styForm1040SchedulelineItem" style="width: 139.5mm; height:4mm;">        
        Add lines 10 and 11
        <!--Dotted Line-->
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
      <div class="styLNRightNumBox" style="height:5mm;">      
        12
      </div>
      <div class="styLNAmountBox" style="height:5mm;width:31.5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/SumEconRcvryPymtAndRtreCrAmt"/>
        </xsl:call-template>        
      </div>
    </div>
<!--Line 13-->
<div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">13</div>
        <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:5mm;">
         Subtract line 12 from line 9. If zero or less, enter -0-      
         <!--Dotted Line-->
          <span class="styBoldText" >
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
        <div class="styLNRightNumBox" style="height:5mm;">
           13
        </div>
        <div class="styLNAmountBox" style="height:5mm;width:31.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/RetireeCrLessWorkPayNetCrAmt"/>
          </xsl:call-template>
        </div>       
      </div>
      <!--Line 14-->
<div class="styBB" style="width:187mm;border-bottom-width: 0px;">
        <div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">14</div>
        <div class="styForm1040SchedulelineItem" style="width:139.5mm;height:5mm;">
      <b>Making work pay and government retiree credits.</b> Add lines 11 and 13. Enter the result here <br/>
      and on Form 1040, line 63; 
      Form 1040A, line 40; or Form 1040NR, line 60
         <!--Dotted Line-->
          <span class="styBoldText" >
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.  
            <span style="width:16px;"></span>.    
            <span style="width:16px;"></span>. 
            <span style="width:16px;"></span>.   
          </span>    
        </div>
        <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;">
           14
        </div>
        <div class="styLNAmountBox" style="height:8mm;width:31.5mm;padding-top:3mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData/MakeWorkPayandGovtRetireeCrAmt"/>
          </xsl:call-template>
        </div>    
            </div>
       <div class="styBB" style="width:187mm;border-bottom-width: 1px;padding-top:2mm;">
       *If you are filing Form 2555, 2555-EZ, or 4563 or you are excluding income from Puerto Rico, see instructions.
        </div>
    <!-- Page Break-->
    <!-- Footer-->   
    <div class="pageEnd" style="width:187mm;">   
        <div class="styBB" style="width:85mm;border-bottom-width: 0px;"><b>For Paperwork Reduction Act Notice, see Form 1040A,1040, or 1040NR instructions.</b> </div>   
        <span style="width:50px;"></span>                        
        Cat. No. 52903Q 
        <span style="width:38px;"></span>  
        <span class="styBoldText" >Schedule M (Form 1040A or 1040) 2009 </span>
    </div>   
      <!-- BEGIN Left Over Table -->  
       <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleMData" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>     
        </table>
      <!-- END Left Over Table --> 
    </form>
  </body>
</html>
</xsl:template>      
</xsl:stylesheet>

  
