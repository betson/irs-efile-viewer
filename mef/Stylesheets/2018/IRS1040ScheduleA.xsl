<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 01/06/2020 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
          <div class="styTBB" style="width:187mm;height:19.5mm;">
            <div class="styFNBox" style="width:28mm;height:19.5mm;">
              <div style="height:8mm;">
                <!-- Ampersand code (&#38;)-->
                <span class="styFormNumber" style="font-size:9pt">SCHEDULE A</span>
                <br/>
                <span class="styFormNumber" style="font-size:9pt">(Form 1040)</span>
              </div> <br/>
              <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              <div style="height:6mm;padding-top:1mm;">
                <span class="styAgency">Department of the Treasury</span>
                <span class="styAgency" style="width:28mm;">Internal Revenue Service 
                 <span style="padding-left:0.2mm;"> (99)</span>
                </span>
              </div>
            </div>         
            <div class="styFTBox" style="width:126.5mm;height:19.5mm;">
              <div class="styMainTitle">
                Itemized Deductions
              </div>
			  <div class="styFBT" style="width:126.5mm;font-size:7pt;margin-top:.5mm;font-weight:normal">         
				  <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
				  <b>Go to <a style="text-decoration:none;color:black;" href="www.irs.gov/ScheduleA " title="Link to IRS.gov"><i>www.irs.gov/ScheduleA </i></a> for instructions and the latest information.</b><br/>
				  <span style="padding-top:.5mm;">
				 	 <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/> <b>Attach to Form 1040.</b>
				  </span>    
				  <span style="padding-top:.5mm;">				  
					   <b>Caution:</b> If you are claiming a net qualified disaster loss on Form 4684, see the instructions for <br/>line 16.
				  </span>                  
              </div>
            </div>           
            <div class="styTYBox" style="width:32mm;height:19.5mm;">
                <br/>
                <div class="styOMB" style="height:2mm;padding-top:0mm;padding-left:3mm;line-height: 0px;">
                    OMB No. 1545-0074
                </div>
                <div class="styTY" style="height:6mm;font-size:18pt;padding-top:0mm;padding-bottom:0mm;line-height:100%;padding-left:0mm">
                    20<span class="styTYColor">18</span>
                </div>
                <div class="styOMB" style="padding-top:1mm;text-align:left;padding-left:5mm;border-bottom-width:0px;line-height:10px">Attachment <br/>
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
          <div class="styBB" style="width:187mm;height:20mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:20mm;font-size:8.8pt;border-left-width:0px;
              border-right-width:0px;padding-top:2.5mm;">
              <span class="styBoldText">Medical<br/>and<br/>Dental<br/>Expenses<br/>
              </span>
            </div>
            <!-- Code for Verbage only for Lines 1, 2, 3 and 4.  Note Line 2 amount box included hear
                  because of location on form-->
            <div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:15.7mm;font-size:7.5pt;border-right-width:0px;
              border-left-width:0px;">
              <div class="styIRS1040ScheduleAleftBox" style="width: 95.4mm; height:3.9mm;font-size:7.1pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:6mm;padding-top:.5mm;">
                <span class="styBoldText" style="font-size:7.1pt">Caution:</span>
               Do not include expenses reimbursed or paid by others.</div>
              <!--Line 1 Verbage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 95.4mm; height:3.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm">
                <span class="styBoldText">1</span>
                <span style="width:1.4mm"/>
					Medical and dental expenses (see instructions)
              <span style="width:1.8mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">......</span>
              </div>
              <!--Line 2 Verbiage and amount box -->
              <div class="styIRS1040ScheduleAleftBox" style="width:61mm;height:3.9mm;border-left-width:0px;border-right-width:1px;
                border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
                <span class="styBoldText">2</span>
                <span style="width:2.3mm"/>
                <span style="font-size:7pt">Enter amount from Form 1040, line 7</span>
                <span style="width:.5mm"/>
              </div>
              <div class="styIRS1040ScheduleAlnRightNumBox" style="width:5mm;height:4.2mm;border-left-width:0px;border-bottom-width:1px;">2</div>
              <div class="styIRS1040ScheduleAlnAmountBox" style="width:30mm;height:4.2mm;padding-right:.5mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TaxReturnAGIAmt"/>
                </xsl:call-template>
              </div>
              <!-- Line 3 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width:96.5mm; height:7.5mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
                <span class="styBoldText">3</span>
                <span style="width:1.5mm"/>
                   Multiply line 2 by 7.5% (0.075)
                <span style="width:.1mm"/>
			    <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">............</span>    	
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
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.5mm;padding-right:.5mm;font-size:7pt">
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
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:1px">3</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:7pt">
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
              <span style="width:1.7mm"/>
              Subtract line 3 from line 1. If line 3 is more than line 1, enter -0-
            <span style="width:2.5mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.........</span>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px;">
              4</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;padding-right:.5mm;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalMedicalAndDentalExpnssAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Taxes You Paid, Lines 5, 6, 7 -->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:51mm;font-size:8.8pt;border-left-width:0px;
              border-right-width:0px;padding-top:0mm;">
              <span class="styBoldText">Taxes You<br/>Paid<br/>
              </span>
            </div>
            <!-- Lines 5, 6,and 7 Verbiage only-->
            <div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:47mm;font-size:7pt;border-right-width:0px;border-left-width:0px;">
				<!--Line 5 Verbiage and check boxes-->
				<div class="styIRS1040ScheduleAleftBox" style="width:94.4mm; height:5.9mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.5mm;">
					<span class="styBoldText">5</span>
					<span style="width:1.6mm;"/>
					  State and local taxes
				</div>
				<div class="styIRS1040ScheduleAleftBox" style="width: 94mm; height:32mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:0mm;">
					<div class="styIRS1040ScheduleAleftBox" style="height:13mm;border-left-width:0px;">
						<span style="width:1.5mm;"/>
						<span class="styBoldText">a</span>
						<span style="width:.2mm;"/>
						State and local taxes or general sales taxes. You may include
						<br/>
						<span style="width:4.2mm;"/>either income taxes or general sales taxes on line 5a, but not
						<br/>
						<span style="width:4.2mm;"/>both. If you elect to include general sales taxes instead of
						<br/>
						<span style="width:4.2mm;"/>income taxes, check this box 
						<span style="width:1.3mm"/>
						<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
						<span style="width:2mm"/>
						<input type="checkbox" alt="alt" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalSalesTaxInd"/>
								<xsl:with-param name="BackupName">IRS1040SchAStateAndLocalSalesTaxInd</xsl:with-param>
						  </xsl:call-template>
						</input>
						<span style="width:1.3mm"/>
						<span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.......</span>
						<span style="width:2mm"/>
					</div>
					<br/>
					<div class="styIRS1040ScheduleAleftBox" style="height:4mm;border-left-width:0px;">
						<span style="width:1.5mm;"/>
						<span class="styBoldText">b</span>
						<span style="width:.2mm;"/>
						State and local real estate taxes (see instructions)
						<span style="width:1.3mm"/>
						<span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.....</span>
						<span style="width:2mm"/>
					</div>
						<br/>
					<div class="styIRS1040ScheduleAleftBox" style="height:4mm;border-left-width:0px;">
						<span style="width:1.5mm;"/>
						<span class="styBoldText">c</span>
						<span style="width:.2mm"/>
						State and local personal property taxes
						<span style="width:3mm"/>
						<span style=" letter-spacing:3.2mm; font-weight:bold;float:right;">........</span>
						<span style="width:2mm"/>
					</div>
					<br/>
					<div class="styIRS1040ScheduleAleftBox" style="height:4mm;border-left-width:0px;">
						<span style="width:1.5mm;"/>
						<span class="styBoldText">d</span>
						<span style="width:.2mm;"/>
						Add lines 5a through 5c
						<span style="width:1.5mm"/>
						<span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.............</span>
						<span style="width:2mm"/>
					</div>
					<br/>
					<div class="styIRS1040ScheduleAleftBox" style="height:8mm;padding-top:1.5mm;border-left-width:0px;">					
						<span style="width:1.5mm;"/>
						<span class="styBoldText">e</span>
						<span style="width:.2mm;"/>
						Enter the smaller of line 5d or $10,000 ($5,000 if married filing
						<br/>
						<span style="width:4.5mm"/>separately)
						<span style="width:1.3mm"/>
						<span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">.................</span>
						<span style="width:2mm"/>
					</div>
					<br/>
			    </div>
                <!--Line 6 Verbiage only-->
              <div class="styIRS1040ScheduleAleftBox" style="width: 94.4mm; height:12mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:2mm;">
                <span class="styBoldText">6</span>
                <span style="width:2.1mm"/>
                   Other taxes. List type and amount 
					<span style="width:1.3mm"/>
					<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
					<span style="width:2mm"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
					</xsl:call-template>
					 <span style="width:24mm;border-bottom:dotted 1px;text-align:right;"/>
                   <br/>
                   <span style="width:6mm"/>
                   <span style="width:84mm;border-bottom:dotted 1px;text-align:right;"/>
                 <span style="width:1.1mm"/>
              </div>
              <div class="styIRS1040ScheduleAleftBox" style="width: 94mm; height:3.8mm;font-size:7pt;border-left-width:0px;
                border-right-width:0px;border-bottom-width:0px;padding-left:2.5mm;padding-top:.3mm">
                <span style="width:5.7mm"/>
                <span style="width:84.5mm;border-bottom:dotted 1px;text-align:right;"/>
              </div>
            </div>
            <!--Lines 5, 6, and 7 amount boxes-->
            <!--Line 5a amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:15mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:15mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:15mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:15mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:0px;
              border-bottom-width:1px;">5a</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:7pt;padding-top:.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxAmt"/>
              </xsl:call-template>
            </div>
            <!--Line 5b amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:0px;
              border-bottom-width:1px;">5b</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:7pt;padding-top:.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/RealEstateTaxesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <!--Line 5c amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:0px;
              border-bottom-width:1px;">5c</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:7pt;padding-top:.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/PersonalPropertyTaxesAmt"/>
              </xsl:call-template>
            </div>
            <!--Line 5d amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:0px;
              border-bottom-width:1px;">5d</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:7pt;padding-top:.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalStateAndLocalTaxAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <!--Line 5e amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:0px;
              border-bottom-width:1px;">5e</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:7pt;padding-top:.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxLimitationAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <!--Line 6 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-left-width:1px;border-bottom-width:1px">6</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;padding-right:.5mm;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px"/>
            <br/>
            <!--Line 7 Verbiage and amount boxes-->
            <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm;height:4mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;border-bottom-width:0px;padding-left:2mm;padding-top:.3mm">
              <span class="styBoldText">7</span>
              <span style="width:2.1mm"/>
              Add lines 5e and 6
              <span style="width:2.7mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">......................</span>
            </div>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4mm;border-bottom-width:0px;">
              7</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4mm;border-bottom-width:0px;padding-right:.5mm;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalTaxesPaidAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Interest You Paid, Lines 8, 8a, 8b, 8c, 8d, 8e, 9 and 10 -->
          <div class="styBB" style="width:187mm;">
				<div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:56mm;font-size:8.8pt;border-left-width:0px;
				  border-right-width:0px;padding-top:0mm;">
					<span class="styBoldText" style="height:12mm;padding-top:0mm;">Interest<br/>You Paid<br/>
					</span>
					<br/>              
					<span class="styBoldText" style="font-size:7pt">Caution: </span>
					<span style="width:4px"/><span style="font-size:7pt"> Your </span> 
				    <div style="font-size:7pt;padding-top:.2mm">mortgage interest <br/>
						deduction may<br/>
						be limited (see<br/>instructions). 
					</div>
				</div>
			    <!--Lines 8a, 8b, 8c, 8d, 8e, 9 and 10 Verbiage only-->
				<div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:52mm;font-size:7pt;border-right-width:0px;
				  border-left-width:0px;">
					<!--Line 8 Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:10mm;font-size:7.1pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:1.8mm;padding-top:.5mm">
						<span class="styBoldText" style="font-size:7pt">8</span>
						<span style="width:2mm"/>Home mortgage interest and points. If you didn't use all of your <br/>
						<span style="width:4mm"/>home mortgage loan(s) to buy, build, or improve your home,<br/>
						<span style="width:4mm"/>see instructions and check this box
						<span style="width:1.3mm"/>
						<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
						<span style="width:2mm"/>
						<input type="checkbox" alt="alt" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/HomeMortgNotUsedInd"/>
								<xsl:with-param name="BackupName">IRS1040SchAHomeMortgNotUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:2mm"/>
						<span style="width:24mm;border-bottom:dotted 1px;text-align:right;"/><br/><br/>
					</div>
					<!--Line 8a Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.7mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:3.3mm;padding-top:1.5mm;">
						<span class="styBoldText" style="font-size:7pt">a</span>
							Home mortgage interest and points reported to you on Form 1098
					</div>
					<!--Line 8b Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:10mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:3.3mm;padding-top:1.5mm;">
						<span class="styBoldText" style="font-size:7pt">b</span>
							Home mortgage interest not reported to you on Form 1098. If<br/>
						<span style="width:2.5mm"/>paid  to the person from whom you bought the home, see instructions<br/>
						<span style="width:2.5mm"/>and show that person's name, identifying no., and address
						<span style="font-size:7.1pt">
							<span style="width:1mm"/>
							<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
							<span style="width:1mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
							</xsl:call-template>
							</span>
					</div>
					<div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:3.5mm;padding-top:.3mm;">
						<span style="width:2.5mm"/>
						<span style="width:85mm;border-bottom:dotted 1px;text-align:right;"/>
					</div>
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:3.9mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:3.5mm;padding-top:.3mm;">
						<span style="width:2.5mm"/>
						<span style="width:85mm;border-bottom:dotted 1px;text-align:right;"/>
					</div>
					<!--Line 8c Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:8mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:3.3mm;padding-top:.8mm;">
						<span class="styBoldText" style="font-size:7pt">c</span>
                            Points not reported to you on Form 1098. See instructions for<br/>
						<span style="width:1.8mm;"/>
							special rules
						<span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">.................</span>
					</div>
					<!--Line 8d Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:4mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:3.3mm;padding-top:.8mm;">
						<span class="styBoldText" style="font-size:7pt">d</span>
                            Reserved
						<span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">.................</span>
					</div>
					<!--Line 8e Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:4mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:3.3mm;padding-top:.8mm;">
						<span class="styBoldText" style="font-size:7pt">e</span>
                            Add lines 8a through 8c
						<span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">..............</span>
					</div>
					 <!--Line 9 Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:4.4mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:1.8mm;padding-top:.6mm">
						<span class="styBoldText" style="font-size:7pt">9</span>
						<span style="width:1.6mm"/>
							Investment interest.  Attach Form 4952 if required.  See instructions
						<!--<span style="width:.2mm"/>-->
						<span style=" letter-spacing:3.2mm; font-weight:bold; ">.</span> 
					</div>
				</div>
				<!-- Amount boxes for lines 8, 8a, 8b, 8c, 8d, 8e, 9 and 10. Box 10 Verbaige included here because of location on form-->
				<!--Line 8 amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-left-width:1px;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:6.5mm;background-color:lightgrey;border-left-width:1px;
				  border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:6.5mm;border-bottom-width:0px"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:6.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:6.5mm;border-bottom-width:0px;"/>
				<!--Line 8a amount boxes--> 
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:0px">8a</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:1px">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/RptHomeMortgIntAndPointsAmt"/>
					</xsl:call-template>
				</div>
				<!--Line 8b amount boxes--> 
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;
				  border-left-width:1px"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:12.3mm;border-left-width:1px;border-bottom-width:0px;
				  background-color:lightgrey"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:12.3mm;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:12.3mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:12.3mm;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">8b</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:1px;padding-right:.5mm;font-size:6pt">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/Form1098HomeMortgIntNotRptAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
				<!--Line 8c amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:1px;">8c</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:1px;padding-right:.5mm;font-size:7pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/Form1098PointsNotReportedAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;"/>
				<!--Line 8d amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.3mm;border-left-width:1px;padding-top:1.5mm;
					border-bottom-width:1px;">8d</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:5.3mm;background-color:lightgrey;border-bottom-width:1px;
					padding-right:.5mm;font-size:6pt;padding-top:.8mm"> 
				</div> 
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.3mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:5.3mm;border-bottom-width:0px;"/>  
				<!--Line 8e amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.1mm;border-left-width:1px;border-bottom-width:1px;
					padding-top:1mm">8e</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:4.1mm;border-bottom-width:1px;padding-right:.5mm;font-size:7pt;
				  padding-top:1mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalHomeMortgIntAndPointsAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.1mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:4.1mm;border-bottom-width:0px;"/>
				<!--Line 9 amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.5mm;border-left-width:1px;border-bottom-width:1px;
					padding-top:1mm">9</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:4.5mm;border-bottom-width:1px;padding-right:.5mm;font-size:6pt;
				  padding-top:1mm">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
					</xsl:call-template>
					<span style="width:4px;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
				<!--Line 10 Verbiage and amount boxes-->
				<div class="styIRS1040ScheduleAleftBox" style="width:131.5mm;height:3.9mm;font-size:7pt;border-left-width:0px;
					border-right-width:0px;border-bottom-width:0px;padding-left:0mm;padding-top:.3mm;">
					<span class="styBoldText">10</span>
					<span style="width:1.6mm"/>
						Add lines 8e and 9
					<span style="width:2.7mm"/>
					<span style=" letter-spacing:3.2mm; font-weight:bold;float:right; ">......................</span>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px;">
				  10</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px;padding-right:.5mm;font-size:7pt">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalInterestPaidAmt"/>
					</xsl:call-template>
				</div>
			</div>
			<!-- Gifts to Charity, Lines 11,12, 13 and 14 -->
			<div class="styBB" style="width:187mm;height:24mm;">
				<div class="styIRS1040ScheduleAleftBox" style="width:20mm; height:24mm;font-size:8.8pt;border-left-width:0px;
				  border-right-width:0px;padding-top:1mm;">
					<span class="styBoldText">Gifts to<br/>Charity<br/>
					</span>
					<div style="font-size:6.4pt;padding-top:.7mm;">If you made a<br/>gift and got a<br/>
						benefit for it,<br/><span style="font-size:6pt;">see instructions.</span></div>
				</div>
				<!--Lines 11, 12, and 13 Verbiage only)-->
				<div class="styIRS1040ScheduleAleftBox" style="width:96mm; height:20mm;font-size:7pt;border-left-width:0px;
				  border-right-width:0px;">
					<!--Line 11 Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 96mm; height:7.8mm;font-size:7pt;border-left-width:0px;
					  border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:.5mm;">
						<span class="styBoldText">11</span>
						<span style="width:1.3mm"/>
						    Gifts by cash or check. If you made any gift of $250 or more, see<br/>
						<span style="width:5.5mm"/>
							instructions
						<span style="width:2.5mm"/>
						<span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">...............</span>
					</div>
					<!--Line 12 Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width: 95mm; height:7.8mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:.8mm;">
						<span class="styBoldText">12</span>
						<span style="width:1.2mm;"/>
							Other than by cash or check. If any gift of $250 or more, see<br/>
						<span style="width:5.9mm"/><span style="font-size:7.5pt;">instructions. You </span>
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
					<!--Line 13 Verbiage only-->
					<div class="styIRS1040ScheduleAleftBox" style="width:95mm;height:3.9mm;font-size:7pt;border-left-width:0px;
						border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:.9mm">
						<span class="styBoldText">13</span>
						<span style="width:1.2mm"/>
							Carryover from prior year<span style="width:2.5mm"/>
						<span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">.............</span>
					</div>
				</div>
				<!--Amount boxes for Lines 11, 12, 13 and Box 14 Verbaige included here because of location on form -->
				<!--Line 11 amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:6.4mm;border-left-width:1px;border-bottom-width:1px;
					padding-top:3mm">11</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:6.4mm;padding-right:.5mm;font-size:6pt;padding-top:3mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:6.4mm;background-color:lightgrey;border-left-width:1px;
				  border-bottom-width:0px;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:6.4mm;border-bottom-width:0px"/>
				<!--Line 12 amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:8.4mm;border-left-width:1px;border-bottom-width:1px;
					padding-top:5mm">12</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:8.4mm;padding-right:.5mm;font-size:6pt;padding-top:5mm">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
					</xsl:call-template>
					<span style="width:4px;"/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:8.4mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:8.4mm;border-bottom-width:0px"/>
				<br/>
				<!--Line 13 amount boxes-->
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.2mm;border-left-width:1px;border-bottom-width:1px;
					padding-top:2mm">13</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:5.2mm;padding-right:.5mm;border-bottom-width:1px;padding-top:2mm;
					font-size:7pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/CarryoverFromPriorYearAmt"/>
					</xsl:call-template>
				</div>
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:5.2mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:5.2mm;border-bottom-width:0px"/>
				<!--Line 14 Verbiage and amount boxes-->
				<div class="styIRS1040ScheduleAleftBox" style="width:131.5mm;height:3.9mm;font-size:7pt;border-left-width:0px;
					border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:.7mm;">
					<span class="styBoldText">14</span>
					<span style="width:1.5mm"/>
						Add lines 11 through 13<span style="width:2.5mm"/>
					<span style=" letter-spacing:3.2mm; font-weight:bold; float:right;">......................</span>
				</div> 
				<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-left-width:1px;border-bottom-width:0px;
					padding-top:.7mm;">14</div>
				<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;padding-right:.5mm;border-bottom-width:0px;padding-top:.7mm;
					font-size:7pt">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalCharitableContriAmt"/>
					</xsl:call-template>
				</div>
	        </div>
			<!-- Casualty and Theft Losses, Line 15 -->
			<div class="styBB" style="width:187mm;height:7mm;">
				<div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:10mm;font-size:7.5pt;border-left-width:0px;
				  border-right-width:0px;padding-top:0mm;">
				  <span class="styBoldText">Casualty and<br/>Theft Losses
				  </span>
				</div>
				<div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:10mm;font-size:7pt;border-left-width:0px;border-right-width:0px;">
				<!--Line 15 Verbiage only-->
				<div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:10mm;font-size:7pt;border-left-width:0px;
					border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:0mm;">
					<span class="styBoldText">15</span>
					<span style="width:2.2mm"/>Casualty and theft loss(es) from a federally declared disaster (other than net qualified disaster<br/>
					<span style="width:5.4mm"/>	losses). Attach Form 4684 and enter the amount from line 18 of that form. See instructions 
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/CalcAdjGroIncmMnsTotNetLossAmt"/>
						</xsl:call-template>
						<span style="width:.2m"/>
						<span style="letter-spacing:3.2mm; font-weight:bold;float:right;">.</span>
				</div>
            </div>
            <!--Line 15 amount boxes-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:2.5mm;border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:2.5mm;border-bottom-width:0px;"/>            
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.5mm;border-bottom-width:0px;padding-top:1mm;">
              15</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.5mm;border-bottom-width:1px;font-size:7pt;
				padding-top:1mm;">
				<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/CalcAdjGroIncmMnsTotNetLossAmt"/>
				</xsl:call-template>
            </div>
        </div>
        <!-- Other Itemized Deductions, Line 16 -->
        <div class="styBB" style="width:187mm;height:11mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:11mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;padding-top:1mm;">
              <span class="styBoldText">Other<br/>Itemized<br/>Deductions</span>
            </div>
            <div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:11mm;font-size:7pt;border-left-width:0px;
              border-right-width:0px;">
				<!--Line 16 Verbiage-->
				<div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:1.9mm;font-size:7pt;border-left-width:0px;
					border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:.3mm;">
					<span class="styBoldText" style="font-size:7pt">16</span>
					<span style="width:1.5mm"/>
						Other <img src="{$ImagePath}/1040SchA_OthMisc_Longdash.gif" alt="OthMiscLongdash Image"/> from list in instructions. 
						List type and amount
					<span style="width:1mm"/>
					<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
					<span style="width:1mm"/>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
					</xsl:call-template>
					<span style="width:.5mm"/>
					<span style="width:43mm;border-bottom:dotted 1px;text-align:right;"/>
				</div>
				<div class="styIRS1040ScheduleAleftBox" style="width: 131.5mm; height:1.9mm;font-size:7pt;border-left-width:0px;
				  border-right-width:0px;border-bottom-width:0px;padding-left:.5mm;padding-top:3mm">
					<span style="width:7mm"/>
					<span style="width:120mm;border-bottom:dotted 1px;text-align:right;"/>
				</div>
			</div>
			<!--Line 16 amount boxes-->
			<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3mm;background-color:lightgrey;border-bottom-width:0px;"/>
			<div class="styIRS1040ScheduleAlnAmountBox" style="height:3mm;border-bottom-width:0px;"/>
			<br/>
			<div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.3mm;background-color:lightgrey;border-bottom-width:0px;"/>
			<div class="styIRS1040ScheduleAlnAmountBox" style="height:4.3mm;border-bottom-width:0px"/>
			<br/>
			<div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.5mm;border-bottom-width:0px;">
			  16</div>
			<div class="styIRS1040ScheduleAlnAmountBox" style="height:3.5mm;padding-right:.5mm;border-bottom-width:0px;font-size:7pt">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<!-- Total Itemized Deductions, Lines 17 and 18 -->
		<div class="styBB" style="width:187mm;height:16mm;">
            <div class="styIRS1040ScheduleAleftBox" style="width: 20mm; height:11mm;font-size:8pt;border-left-width:0px;
              border-right-width:0px;padding-top:1mm;">
				<span class="styBoldText">Total<br/>Itemized<br/>Deductions</span>
            </div>                 	
            <!--Lines 17 and 18 Verbiage-->
            <div class="styIRS1040ScheduleAleftBox" style="width:131.5mm; height:16mm;font-size:7pt;border-left-width:0px;border-right-width:0px;">
				<!--Line 17 Verbiage-->             
				<div class="styIRS1040ScheduleAleftBox" style="width:131.5mm; height:8mm;font-size:7pt;border-left-width:0px;
					border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:.5mm;">
					<span class="styBoldText" style="font-size:7pt">17</span>
					<span style="width:1.5mm"/>
					  Add the amounts in the far right column for lines 4 through 16. Also, enter this amount on <br/>
					 <span style="width:5.2mm"/> Form 1040, line 8  <span style="width:2mm"/>
					<span style="letter-spacing:3.2mm; font-weight:bold;float:right;">.......................</span>  
				</div>                
				<!--Line 18 Verbiage-->             		              
                <div class="styIRS1040ScheduleAleftBox" style="width:130mm;height:5mm;font-size:7pt;border-left-width:0px;
                  border-right-width:0px;border-bottom-width:0px;padding-left:.2mm;padding-top:0mm">                
               <span class="styBoldText" style="font-size:7pt;">18</span>
                <span style="width:1.2mm;"/>
                     If you elect to itemize deductions even though they are less than your standard <br/>
                <span style="width:5.5mm"/>deduction, check here
                     <span style="width:1.3mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">....................</span>
                <span style="width:2mm"/>
                <img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
                <span style="width:2mm"/>
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/ItmzdDedLessThanStdDedInd"/>
                    <xsl:with-param name="BackupName">IRS1040SchAItmzdDedLessThanStdDedInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>          
            <!--Line 17 amount boxes-->             	                
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:3.9mm;border-bottom-width:0px"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:3.9mm;border-bottom-width:0px"/>
             <br/>
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:4.2mm;border-bottom-width:1px;font-size:6.7pt;padding-top:0mm;">
              17</div>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:4.2mm;padding-right:.5mm;border-bottom-width:1px;font-size:7pt">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalItemizedDeductionsAmt"/>
              </xsl:call-template>
            </div>   
            <!--Line 18 shaded area-->
            <div class="styIRS1040ScheduleAlnRightNumBox" style="height:7.6mm;background-color:lightgrey; border-bottom-width:0px;"/>
            <div class="styIRS1040ScheduleAlnAmountBox" style="height:7.6mm;background-color:lightgrey;border-bottom-width:0px"/>                 
          </div>
          <div style="width:187mm;clear:both;">
            <div style="width:110mm;font-weight:bold;" class="styGenericDiv">
              For Paperwork Reduction Act Notice, see the <span style="font-family:Arial">I</span>nstructions for Form 1040.</div>
            <div style="width:25mm;text-align:center;" class="styGenericDiv">Cat. No. 17145C</div>
            <div style="float:right;" class="styGenericDiv">
              <span class="styBoldText">Schedule A (Form 1040) 2018</span>
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