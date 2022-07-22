<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 09/01/2016 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040ScheduleAStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleA"/>
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
        <meta name="Description" content="Form IRS1040ScheduleA"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1040ScheduleAStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
       <body class="styBodyClass" style="width:187mm;">
        <form name="Form1040ScheduleA">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <div class="styTBB" style="width:187mm;height:19mm;">
            <div class="styFNBox" style="width:30mm;height:19mm;">
              <div style="height:8mm;">
                <!-- Ampersand code (&#38;)-->
                <span class="styFormNumber" style="font-size:9pt">SCHEDULE A</span>
                <br/>
                <span class="styFormNumber" style="font-size:9pt">(Form 1040)</span>
              </div> <br/>
              <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              <div style="height:6mm;">
                <span class="styAgency">Department of the Treasury</span>
                <span class="styAgency" style="width:30mm;">Internal Revenue Service 
                 <span style="padding-left:0.2mm;"> (99)</span>
                </span>
              </div>
            </div>         
            
            <div class="styFTBox" style="width:124.5mm;height:19mm;">
              <div class="styMainTitle" style="height:10mm;font-size:13pt;padding-top:2mm;">
                <span class="styBoldText">Itemized Deductions</span>
              </div>
              <br/>
              <div style="height:4mm;font-size:6.5pt;padding-bottom:1mm">
                <span style="width:124.5mm;">
                  <span style="width:2mm"/>
					  <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
					  <span class="styBoldText">Information about Schedule A and its separate instructions is at
                  <!--<a href="http://www.irs.gov/schedulea" title="Link to IRS.gov">--><i>www.irs.gov/schedulea.</i><!--</a>-->
                  </span>
                  <br/>                            
				  <span style="width:2mm"/>
                  <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                  <span class="styBoldText">Attach to Form 1040.</span>            
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:32mm;height:19mm;">
              <!--<span style="width:25px"/>Version A, Cycle 3--><br/>
                          <div class="styOMB" style="height:2mm;padding-top:0mm;padding-left:1mm;line-height: 0px;">
                            OMB No. 1545-0074
                          </div>
              <div class="styTY" style="height:6mm;font-size:20pt;padding-top:0mm;padding-bottom:0mm;line-height:100%;padding-left:1mm">
                            20<span class="stytycolor">15</span>
              </div>
              <div class="styOMB" style="padding-top:0mm;height:2mm;text-align:left;padding-left:3mm;border-bottom-width:0px;
                padding-bottom:.5mm;line-height:9px;">Attachment <br/>
                Sequence No. <span class="styBoldText">07</span>
              </div>
            </div>
          </div>
          <div style="width:187mm;height:8mm;" class="styBB">
            <div style="width:151.75mm;height:8mm;font-weight:normal;font-size:7pt;" class="styNameBox">
			   Name(s) shown on Form 1040<br/>
              <div style="padding-top:1.5mm">
                <!--<xsl:call-template name="PopulateReturnHeaderFiler">
               <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br/>
        <xsl:call-template name="PopulateReturnHeaderFiler">
               <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template>-->
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
                  <xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div style="width:35mm;height:8mm;padding-left:.3mm;font-size:6.2pt;font-weight:bold;" class="styEINBox">Your social security number<br/>
              <br/>
              <span style="width:9.5mm"/>
              <span style="font-weight:normal;font-size:6.4pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                </xsl:call-template>
                <!--<xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"></xsl:with-param>
                <xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
          </xsl:call-template>-->
              </span>
            </div>
          </div>
          <!-- Medical and Dental Expenses, Lines 1, 2, 3,4 -->
          <div class="styBB" style="width:187mm;height:24mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:24mm;font-size:8.8pt;border-left-width:0px;
              border-right-width:0px;padding-top:4.5mm;">
              <span class="styBoldText">Medical<br/>and<br/>Dental<br/>Expenses<br/>
              </span>
            </div>
            <!-- Code for Verbage only for Lines 1, 2, 3 and 4.  Note Line 2 amount box included hear
                  because of location on form-->
            <div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:19.7mm;font-size:7.5pt;border-right-width:0px;
              border-left-width:0px;">
              <div class="styIRS1040ScheduleAleftBox" style="width: 95.4mm; height:3.9mm;font-size:7.1pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:6.6mm;padding-top:.5mm;">
                <span class="styBoldText" style="font-size:7.1pt">Caution.</span>
               Do not include expenses reimbursed or paid by others.</div>
              <!--Line 1 Verbage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95.4mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm">
                <span class="styBoldText">1</span>
                <span style="width:1.9mm"/>
					Medical and dental expenses (see instructions)
              <span style="width:1.8mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">......</span>
              </div>
              <!--Line 2 Verbiage and amount box -->
              <div class="styIRS1040ScheduleAleftBox" style="width:61mm;height:3.9mm;border-left-width:0px;border-right-width:1px;
                border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
                <span class="styBoldText">2</span>
                <span style="width:2.9mm"/>
                <span style="font-family:arial;font-size:7pt">Enter amount from Form 1040, line 38</span>
                <span style="width:.5mm"/>
              </div>
              <div class="styIRS1040ScheduleAlnRightNumBox" style="width:5mm;height:4.2mm;border-left-width:0px;border-bottom-width:1px;">2</div>
              <div class="styIRS1040ScheduleAlnAmountBox" style="width:30mm;height:4.2mm;padding-right:.5mm;font-size:6pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TaxReturnAGIAmt"/>
                </xsl:call-template>
              </div>
              <!-- Line 3 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:96.5mm; height:7.5mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
                <span class="styBoldText">3</span>
                <span style="width:2.1mm"/>
                   Multiply line 2 by 10% (.10). But if either you or your spouse was<br/>
                <span style="width:4.8mm;"/>
                <span style="font-size:7pt">born before January 2, 1951, multiply line 2 by 7.5% (.075) instead</span>
                <span style="width:.1mm"/> 
			    <!--Form to Form Link -->
		    	<xsl:call-template name="SetFormLinkInline">
		    	<xsl:with-param name="TargetNode" select="$FormData/CalculatedMedicalAllowanceAmt"/>
		    	</xsl:call-template>	    	
				<!--<span style=" letter-spacing:3.2mm; font-weight:bold; "> .................</span>--> 	
                </div>         
            </div>
            <!-- Lines 1, 3 and 4 amount boxes.  Note Line 4 Verbiage included here because of location on form-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="background-color:lightgrey;height:3mm;border-left-width:1px;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="border-bottom-width:0px;height:3mm;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:3mm;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="border-bottom-width:0px;height:3mm;"/>
            <br/>
            <!--Line 1 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.5mm;border-left-width:1px;border-bottom-width:1px">1</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.5mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/MedicalAndDentalExpensesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
            <!--Line 3 amount boxes-->             
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>    
           <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px;"/> 
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:0px;background-color:lightgrey"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>   
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
             <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>   
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:1px">3</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CalculatedMedicalAllowanceAmt"/>
              </xsl:call-template>
            </div>    
              <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.5mm;background-color:lightgrey;border-left-width:1px;
                border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>    
            <br/>  
            <!--Line 4 Verbiage and amount box-->
            <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm; height:3.9mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
             <span class="styBoldText">4</span>
              <span style="width:2.1mm"/>
              Subtract line 3 from line 1. If line 3 is more than line 1, enter -0-
            <span style="width:2.5mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.........</span>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px;">
              4</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalMedicalAndDentalExpnssAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Taxes You Paid, Lines 5, 6, 7, 8, 9 -->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:31.5mm;font-size:8.8pt;border-left-width:0px;
              border-right-width:0px;padding-top:0mm">
              <span class="styBoldText">Taxes You<br/>Paid<br/>
              </span>
            </div>
            <!-- Lines 5, 6, 7 and 8 Verbiage only-->
            <div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:27mm;font-size:7pt;border-right-width:0px;border-left-width:0px;">
              <!--Line 5 Verbiage and check boxes-->
              <div class="styIRS1040ScheduleAleftBox" style="width:94.4mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
                <span class="styBoldText">5</span>
                <span style="width:2.1mm;"/>
                   State and local <span style="font-weight:bold;">(check only one box):</span>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 49mm; height:9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:0mm;">
                <span style="width:5mm;"/>
                <span class="styBoldText">a</span>
                <span style="width:2mm;"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/StateAndLocalIncomeTaxInd"/>
                    <xsl:with-param name="BackupName">IRS1040SchAStateAndLocalIncomeTaxInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/StateAndLocalIncomeTaxInd"/>
                    <xsl:with-param name="BackupName">IRS1040SchAStateAndLocalIncomeTaxInd</xsl:with-param>
                  </xsl:call-template>
                  Income taxes, <span style="font-weight:bold">or</span>
                  <br/>
                </label>
                <span style="width:5mm;"/>
                <span class="styBoldText">b</span>
                <span style="width:2mm;"/>
                <!-- Checkbox -->
			<!--	<img src="{$ImagePath}/1040_GrayCheckbox.gif" alt="Gray Checkbox"/>
				<span style="width:1px;"/> -->
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/StateAndLocalSalesTaxInd"/>
                    <xsl:with-param name="BackupName">IRS1040SchAStateAndLocalSalesTaxInd</xsl:with-param>
                  </xsl:call-template>
                  </input> 
                 <label>
                    <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/StateAndLocalSalesTaxInd"/>
                    <xsl:with-param name="BackupName">IRS1040SchAStateAndLocalSalesTaxInd</xsl:with-param>
                  </xsl:call-template>
                  General sales taxes
                  </label>
              </div>
              <!--Line 6 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:3mm;height:8.5mm;border-left-width:0px;border-right-width:0px;
                border-bottom-width:0px;padding-left:.5mm;padding-top:1mm;">
                <img src="{$ImagePath}/1040SchA_Bracket_Sm3.gif" alt="SmallerBracket Image" align="middle"/>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width:2mm;height:8.5mm;border-left-width:0px;border-right-width:0px;
                border-bottom-width:0px;padding-left:3mm;padding-top:2mm;">
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">..........</span>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 94.4mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
                <span class="styBoldText">6</span>
                <span style="width:2.1mm"/>
                   Real estate taxes (see instructions)
                 <span style="width:1.1mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.........</span>
              </div>
              <!--Line 7 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.3mm">
                <span class="styBoldText">7</span>
                <span style="width:2.1mm"/>
                    Personal property taxes
                <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.............</span>
              </div>
              <!--Line 8 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:94.4mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.3mm">
                <span class="styBoldText">8</span>
                <span style="width:2.1mm"/>
                   Other taxes. List type and amount
                 <span style="width:1mm"/>
                <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                <span style="width:1mm"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
                </xsl:call-template>
                <span style="width:2.5mm;"/>
                <span style="width:32mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 94mm; height:3.8mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2.5mm;padding-top:.3mm">
                <span style="width:5.7mm"/>
                <span style="width:84.5mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
            </div>
            <!--Lines 5, 6, 7, 8 and 9 amount boxes-->
            <!--Line 5 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:0px;
              border-bottom-width:1px;">5</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <!--Line 6 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:1px">6</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/RealEstateTaxesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <!--Line 7 amount boxes-->
            <!--<div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:1px">7</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:6pt">
              <!--Changes per emails from ETA analysts on 01/21/2010 and 02/10/2010.
                                If Line 6 (worksheet) <= Line 7 (worksheet) then Move line 3 (worksheet) to line 7 (Form)-->
                <xsl:choose>
                <xsl:when test="($FormData/SumOfAGIAndForeignIncmExclAmt) &lt;=($FormData/NewMotorVehicleIncomeLmtDedAmt)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/NewMtrVehAttributableTaxAmt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/PersonalPropertyTaxesAmt"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <!--Line 8 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;
              border-left-width:1px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:1px">8
            </div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <!--Line 9 Verbiage and amount boxes-->
            <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm;height:3.9mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;border-bottom-width:0px;padding-left:2mm;               padding-top:.3mm">
              <span class="styBoldText">9</span>
              <span style="width:2.1mm"/>
              Add lines 5 through 8
              <span style="width:2.7mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">......................</span>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px;">
              9</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalTaxesPaidAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Interest You Paid, Lines 10, 11, 12, 13, 14, 15 -->
          <div class="styBB" style="width:187mm;height:44.3mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:31mm;font-size:8.8pt;border-left-width:0px;
              border-right-width:0px;padding-top:0mm;">
              <span class="styBoldText" style="height:12mm;padding-top:0mm;">Interest<br/>You Paid<br/>
              </span>
              <br/>              
              <span class="styBoldText" style="font-size:7pt">Note.<br/>
              </span>
              <div style="font-size:7pt;padding-top:.2mm">Your mortgage<br/>interest <br/>
                deduction may<br/>
                be limited (see<br/>instructions).</div>
            </div>
            <!--Lines 10, 11, 12, 13 and 14 Verbiage only-->
            <div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:40mm;font-size:7pt;border-right-width:0px;
              border-left-width:0px;">
              <!--Line 10 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7.1pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:.5mm">
                <span class="styBoldText" style="font-size:7pt">10</span>
                <span style="width:2mm"/>
                     Home mortgage interest and points reported to you on Form 1098</div>
              <!--Line 11 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.4mm;padding-top:.5mm">
                <span class="styBoldText" style="font-size:7pt">11</span>
                <span style="width:2mm"/>
                     Home mortgage interest not reported to you on Form 1098. If paid</div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.5mm">
                <span style="width:5.4mm"/>
                    to the person from whom you bought the home, see instructions</div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.5mm">
                <span style="width:6.2mm"/>
                <span style="font-size:7.1pt">and show that person's name, identifying no., and address
                  <span style="width:1mm"/>
                  <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                  <span style="width:1mm"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
                </xsl:call-template>
                </span>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2.5mm;padding-top:.3mm;">
                <span style="width:4.5mm"/>
                <span style="width:85mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2.5mm;padding-top:.3mm;">
                <span style="width:4.5mm"/>
                <span style="width:85mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
              <!--Line 12 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:8mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.8mm;">
                <span class="styBoldText">12</span>
                <span style="width:2mm"/>
                     Points not reported to you on Form 1098. See instructions for<br/>
                 <span style="width:5.6mm;"/>
                 special rules
                <span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">.................</span>
              </div>
              <!--Line 13 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.2mm">
                <span class="styBoldText">13</span>
                <span style="width:2mm"/>
                    Mortgage insurance premiums (see instructions)
               <span style=" letter-spacing:3.2mm; font-weight:bold; ">......</span> 
              </div>
              <!--Line 14 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.7mm">
                <span class="styBoldText">14</span>
                <span style="width:2.9mm"/>
                <span style="font-size:8.5pt; font-family:arial narrow;">Investment interest. </span>
				<span style="font-size:7.0pt">Attach Form 4952 if required.(See instructions.)</span>
              </div>
            </div>
            <!-- Amount boxes for lines 10, 11, 12, 13, 14 and 15. Box 15 Verbaige included here because of location on form-->
            <!--Line 10 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">10</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/RptHomeMortgIntAndPointsAmt"/>
              </xsl:call-template>
            </div>
            <!--Line 11 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;
              border-left-width:1px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:0px;
              background-color:lightgrey"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">11</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:1px;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <!--Line 12 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">12</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:1px;padding-right:.5mm;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/Form1098PointsNotReportedAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <!--Line 13 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.2mm;border-left-width:1px;border-bottom-width:1px;">13</div>
            <!--<div class="styIRS1040ScheduleAlnAmountBox" style="height:4.2mm;border-bottom-width:1px;padding-right:.5mm; 
                  font-size:6pt;padding-top:.8mm"/>  -->
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.2mm;border-bottom-width:1px;padding-right:.5mm;font-size:6pt;
              padding-top:.8mm"> 
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/MortgageInsurancePremiumsAmt"/>
              </xsl:call-template> 
            </div> 
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.2mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.2mm;border-bottom-width:0px;"/>  
            <!--Line 14 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.8mm;border-left-width:1px;border-bottom-width:1px;">14</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.8mm;border-bottom-width:1px;padding-right:.5mm;font-size:6pt;
              padding-top:.8mm">
              <xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
              </xsl:call-template>
              <span style="width:4px;"/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.8mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.8mm;border-bottom-width:0px;"/>
            <!--Line 15 Verbiage and amount boxes-->
            <div class="styIRS1040ScheduleAleftBox" style="width:151.5mm;height:3.9mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.3mm;">
             <span style="width:20mm"/>
              <span class="styBoldText">15</span>
              <span style="width:2mm"/>
            Add lines 10 through 14
           <span style="width:2.7mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">......................</span>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px;padding-top:1mm;">15</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;padding-right:.5mm;font-size:6pt;
              padding-top:1mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalInterestPaidAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Gifts to Charity, Lines 16,17, 18, 19 -->
          <div class="styBB" style="width:187mm;height:23.7mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:20mm;font-size:8.8pt;border-left-width:0px;
              border-right-width:0px;padding-top:1mm;">
              <span class="styBoldText">Gifts to<br/>Charity<br/>
              </span>
              <div style="font-size:6.4pt;padding-top:.7mm;">If you made a<br/>gift and got a<br/>
                benefit for it,<br/><span style="font-size:6pt;">see instructions.</span></div>
            </div>
            <!--Lines 16, 17, 18 and 19 Verbiage only)-->
            <div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:19.5mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;">
              <!--Line 16 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95.4mm; height:7.8mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.5mm;">
                <span class="styBoldText">16</span>
                <span style="width:2mm"/>
                   Gifts by cash or check. If you made any gift of $250 or more, see<br/>
                <span style="width:6mm"/>
                 instructions
                  <span style="width:2.5mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">.................</span>
              </div>
              <!--Line 17 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95.4mm; height:7.8mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.7mm;padding-top:.8mm;">
                <span class="styBoldText">17</span>
                <span style="width:2mm;"/>
                    Other than by cash or check. If any gift of $250 or more, see<br/>
                <span style="width:6.6mm"/><span style="font-size:7.5pt;">instructions. You </span>
                <span style="width:1mm"/>
                <span style="font-weight:bold;font-size:7.5pt"> must </span>
                <span style="width:1mm"/>
                <span style="font-size:7pt;">attach Form 8283 if over $500</span>
                <span style="width:.5mm"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
                </xsl:call-template>
                <span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">...</span>
              </div>
              <!--Line 18 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.9mm">
                <span class="styBoldText">18</span>
                <span style="width:2.2mm"/>
                    Carryover from prior year<span style="width:3.8mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">............</span>
              </div>
            </div>
            <!--Lines 16, 17, 18 and 19 amount boxes.  Line 19 Verbiage also included here because of location on form-->
            <!--Line 16 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px">16</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <!--Line 17 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px">17</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;
              border-left-width:1px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <br/>
            <!--Line 18 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px">18</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CarryoverFromPriorYearAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <!--Line 19 Verbiage and amount boxes-->
            <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm;height:3.9mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.3mm">
              <span class="styBoldText">19</span>
              <span style="width:2.2mm"/>
               Add lines 16 through 18<span style="width:2.7mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">......................</span>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px;padding-top:1mm;">
              19</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;border-bottom-width:0px;font-size:6pt;
              padding-top:1mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalCharitableContriAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Casualty and Theft Losses, Line 20 -->
          <div class="styBB" style="width:187mm;height:7mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:6mm;font-size:7.5pt;border-left-width:0px;
              border-right-width:0px;padding-top:0mm;">
              <span class="styBoldText">Casualty and<br/>Theft Losses
              </span>
            </div>
            <div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:3mm;font-size:7pt;border-left-width:0px;border-right-width:0px;">
              <!--Line 20 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:3mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:3mm;">
                <span class="styBoldText">20</span>
                <span style="width:2mm"/>
                      Casualty or theft loss(es). Attach Form 4684. (See instructions.) 
                      <xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
                      </xsl:call-template>
                    <span style="width:2m"/>
                <span style="letter-spacing:3.2mm; font-weight:bold;float:right;">.........</span>
              </div>
            </div>
            <!--Line 20 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:1.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:1.9mm;border-bottom-width:0px"/>            
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.9mm;border-bottom-width:0px;padding-top:2mm;">
              20</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.9mm;border-bottom-width:0px;font-size:6pt;padding-top:2mm">
              <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
             </xsl:call-template>
            </div>
          </div>
          <!-- Job Expenses and Certain Misc Deductions, Lines 21, 22, 23, 24, 25, 26, 27 -->
          <div class="styBB" style="width:187mm;height:45.5mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:45.5mm;font-size:9pt;border-left-width:0px;
              border-right-width:0px;padding-top:.5mm;">
              <span class="styBoldText">
                <span style="font-family:arial narrow;">Job Expenses<br/>and Certain<br/>Miscellaneous<br/>
            Deductions<br/>
                  <br/>
                </span>
              </span>
              <br/>
              <br/>
            </div>
            <!--Lines 21, 22, 23, 24, 25, 26 and 27 Verbiage.  Line 25 amount boxes included here 
                 because of location on form-->
            <div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:38.5mm;font-size:7pt; border-right-width:0px;border-left-width:0px;">
              <!--Line 21 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:12mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.3mm;">
                <span class="styBoldText">21</span>
                <span style="width:2mm"/>
                  Unreimbursed employee expenses<img src="{$ImagePath}/1040SchA_JobExp_Longdash.gif" alt="JobExpLongdash Image"/>job travel,
                  union  dues,
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.3mm">
                <span style="width:5.4mm"/>
                     job education, etc. Attach Form 2106 or 2106-EZ  if required.</div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.3mm">
                <span style="width:5mm"/>
                 (See instructions.)<span style="width:1mm"/>
                <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                <span style="width:1mm"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt"/>
                </xsl:call-template>
                <span style="width:2.3mm"/>
                <span style="width:53mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
              </div>
              <!--Line 22 Verbiage-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.7mm;padding-top:.3mm">
                <span class="styBoldText">22</span>
                <span style="width:2mm"/>
                     Tax preparation fees<span style="width:3mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">..............</span>
              </div>
              <!--Line 23 Verbiage-->
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.7mm;padding-top:.3mm">
                <span class="styBoldText">23</span>
                <span style="width:2mm"/>
                     Other expenses<img src="{$ImagePath}/1040SchA_JobExp_Longdash.gif" alt="JobExpLongdash Image"/>investment, 
                     safe deposit box, etc. List</div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:.3m">
                <span style="width:6.6mm"/>type and amount<span style="width:1mm"/>
                <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                <span style="width:1mm"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesAmt"/>
                </xsl:call-template>
                <span style="width:2.3mm"/>
                <span style="width:55mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2.5mm;padding-top:.3mm">
                <span style="width:5mm"/>
                <span style="width:85mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
              <!--Line 24 Verbiage -->
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.9mm; padding-top:.5mm">
                <span class="styBoldText">24</span>
                <span style="width:2mm"/>
                     Add lines 21 through 23<span style="width:2.7mm"/>
                <span style="letter-spacing:3.2mm;font-weight:bold; float:right;">............</span>
              </div>
              <!--Line 25 Verbiage and amount boxes-->
              <div class="styIRS1040ScheduleAleftBox" style="width:60mm;height:4.9mm;border-left-width:0px;border-right-width:0px;
                border-bottom-width:0px;padding-left:.9mm;padding-top:.38mm;">
                <span class="styBoldText" style="font-size:7pt">25</span>
                <span style="width:3mm"/>
                <span style="font-family:arial;font-size:7pt">Enter amount from Form 1040, line 38</span>
                <span style="width:1mm"/>
              </div>
              <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.9mm;padding-top:1.2mm;border-left-width:1px;border-bottom-width:1px;">
                 25</div>
              <div class="styIRS1040ScheduleAlnAmountBox" style="width:30mm;height:4.9mm;padding-top:2mm;padding-right:.5mm;font-size:6pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TaxReturnAGIAmt"/>
                </xsl:call-template>
              </div>
              <!--Line 26 Verbiage -->
              <div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.9mm;padding-top:.0mm;">
                <span class="styBoldText">26</span>
                <span style="width:2mm"/>
                      Multiply line 25 by 2% (.02)<span style="width:1.5mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">...........</span>
              </div>
            </div>
            <!--Lines 21, 22, 23, 24, 26 and 27 amount boxes-->
            <!--Line 21 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">21</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;border-bottom-width:1px;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <!--Line 22 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px">22</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;border-bottom-width:1px;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TaxPreparationFeesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;
              border-left-width:1px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <!--Line 23 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:0px;
              background-color:lightgrey"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">23</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;border-bottom-width:1px;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <!--Line 24 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">24</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;border-bottom-width:1px;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotJobExpnssAndCrtnMiscDedAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
            <!--Line 26 aqmount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.5mm;background-color:lightgrey;border-left-width:1px;
              border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:5.5mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:5.5mm;border-bottom-width:0px;"/> 
            
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.1mm;border-left-width:1px;border-bottom-width:1px;">26</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:5.1mm;padding-right:.5mm; border-bottom-width:1px;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CalcJobExpnssMiscDedAllwncAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.1mm;background-color:lightgrey; border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:5.1mm;border-bottom-width:0px;"/>
            <!--Line 27 Verbiage and Amount boxes-->
            <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm;height:3.9mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;border-bottom-width:0px;padding-left:.9mm;padding-top:.3mm;">
              <span class="styBoldText">27</span>
              <span style="width:2mm"/>
               Subtract line 26 from line 24. If line 26 is more than line 24, enter -0- 
             <span style="letter-spacing:3mm; font-weight:bold; ">.........</span>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px;">27</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;border-bottom-width:0px;font-size:6pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/NetMiscellaneousDeductionsAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Other Miscellaneous Deductions, Line 28 -->
          <div class="styBB" style="width:187mm;height:11mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:11mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;padding-top:1mm;">
              <span class="styBoldText">Other<br/>Miscellaneous<br/>Deductions</span>
            </div>
            <div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:11mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;">
              <!--Line 28 Verbiage-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:1.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.9mm;padding-top:.3mm;">
                <span class="styBoldText">28</span>
                <span style="width:1.8mm"/>
                    Other <img src="{$ImagePath}/1040SchA_OthMisc_Longdash.gif" alt="OthMiscLongdash Image"/> from list in instructions. 
                    List type and amount
                  <span style="width:1mm"/>
                <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                <span style="width:1mm"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
                </xsl:call-template>
                <span style="width:1.5mm"/>
                <span style="width:42mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:1.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:3mm">
                <span style="width:8mm"/>
                <span style="width:120mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
            </div>
            <!--Line 28 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3mm;border-bottom-width:0px;"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.3mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.3mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.5mm;border-bottom-width:0px;">
              28</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.5mm;padding-right:.5mm;border-bottom-width:0px;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Total Itemized Deductions, Lines 29 and 30 -->
          <div class="styBB" style="width:187mm;height:28mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:11mm;font-size:8pt;border-left-width:0px;
              border-right-width:0px;padding-top:1mm;">
              <span class="styBoldText">Total<br/>Itemized<br/>Deductions</span>
            </div>                 	
            <!--Lines 29 and 30 Verbiage-->
            <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm; height:28mm;font-size:7pt;border-left-width:0px;border-right-width:0px;">
              <!--Line 29 Verbiage-->             
              <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm; height:4mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:.9mm;padding-top:.5mm;">
                <span class="styBoldText">29</span>
                <span style="width:2mm"/>
            <!--        Is Form 1040, line 38, over $300,000 if married filing jointly or qualifying widow(er);<br/>  
                <span style="width:7mm"/>$275,000 if head of household; $250,000 if single; 
                 or $150,000 if married filing separately?          -->   
                 Is Form 1040, line 38, over $154,950?   
              </div>                
             <div class="styLNDesc" style="height:16mm;width:123mm;">
			 <div class="styLNLeftNumBox" style="font-size:3pt;height:4mm;padding-bottom:0mm;padding-left: 1.2mm;"/>
			 <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
                  <xsl:with-param name="BackupName">IRS1040SchAItemizedLimitationsByFSInd</xsl:with-param>
                    </xsl:call-template>
                     </input> 
				<label>
					<xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
                   <xsl:with-param name="BackupName">IRS1040SchAItemizedLimitationsByFSInd</xsl:with-param>
                 </xsl:call-template>
								<span style="width:2px;"/>
								<b>No.  </b>
							</label> 
							Your deduction is not limited. Add the amounts in the far right column for lines 4		                     
							  <span style="width:13.5mm;"/>through 28. Also, enter this amount on Form 1040, line 40.
				<br/>					          								
		     <div class="styLNLeftNumBox" style="font-size:3pt;padding-bottom:0mm;padding-left: 1.2mm"/>
			 <input type="checkbox" class="styCkbox" name="Checkbox">
							   <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
                  <xsl:with-param name="BackupName">IRS1040SchAItemizedLimitationsByFSInd</xsl:with-param>
                    </xsl:call-template>
                      </input> 
							<span style="width:2px;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
                   <xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
                   <xsl:with-param name="BackupName">IRS1040SchAItemizedLimitationsByFSInd</xsl:with-param>
                 </xsl:call-template>
								<b>Yes.  </b>
							</label>
							Your deduction may be limited. See the Itemized Deductions Worksheet <br/> 
							<span style="width:13.5mm;"/>in the instructions to figure the amount to enter.	      
               </div>
               	<div class="styLNDesc" style="width:4px;">
					<img src="{$ImagePath}/1040SchA_Bracket_Sm2.gif" height="55mm;" alt="Curly Bracket Image"/>
			   </div>
				 <div class="styIRS1040ScheduleArightBox" style="width:5mm;height:3mm;font-size:7pt;border-left-width:0px;
				   border-right-width:0px;border-bottom-width:0px;padding-top:6.5mm;">   
                <span style="letter-spacing:2mm; font-weight:bold; ">..</span>
                </div>				
           		<!--Line 30 Verbiage-->             		              
                <div class="styIRS1040ScheduleAleftBox" style="width:130mm;height:5mm;font-size:7pt;border-left-width:0px;
                  border-right-width:0px;border-bottom-width:0px;padding-left:.9mm;padding-top:0mm">                
               <span class="styBoldText">30</span>
                <span style="width:1.7mm;"/>
                     If you elect to itemize deductions even though they are less than your standard <br/>
                <span style="width:6.2mm"/>deduction, check here
                     <span style="width:1.5mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">..................</span>
                <span style="width:3mm"/>
                <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                <span style="width:5mm"/>
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/ItmzdDedLessThanStdDedInd"/>
                    <xsl:with-param name="BackupName">IRS1040SchAItmzdDedLessThanStdDedInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>          
            <!--Line 29 amount boxes-->             	                
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>                 
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
             <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.2mm;border-bottom-width:1px;font-size:6.7pt;padding-top:0mm;">
              29</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.2mm;padding-right:.5mm;border-bottom-width:1px;font-size:6pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalItemizedDeductionsAmt"/>
              </xsl:call-template>
            </div>   
            <!--Line 30 shaded area-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:11.9mm;background-color:lightgrey; border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:11.9mm;background-color:lightgrey;border-bottom-width:0px"/>                 
          </div>
          <div style="width:187mm;clear:both;">
            <div style="width:100mm;font-weight:bold;" class="styGenericDiv">
              For Paperwork Reduction Act Notice, see Form 1040 instructions.</div>
            <div style="width:25mm;text-align:center;" class="styGenericDiv">Cat. No. 17145C</div>
            <div style="float:right;" class="styGenericDiv">
              <span class="styBoldText">Schedule A (Form 1040) 2015</span>
            </div>
          </div>

          <div class="pageEnd" style="width:187mm;"/>
          <!--Begininning of write-in data -->
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
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 2c - Form or schedule number</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/FormScheduleNumber"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>