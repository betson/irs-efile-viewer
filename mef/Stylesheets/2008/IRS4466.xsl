<?xml version="1.0" encoding="UTF-8" ?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"  >
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS4466Style.xsl"/>
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form4466Data" select="$RtnDoc/IRS4466" />
  <xsl:template match="/">
  <html>
     <head>
       <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form4466Data)"></xsl:with-param>
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
        <meta name="Description" content="IRS Form 4466" />
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
          <xsl:call-template name="InitJS"></xsl:call-template>
             <style type="text/css">
             <!-- HINTS: Line 8 Record of Estimated Tax Deposits - 
             inline print this table display two sets of data on one row and in separated print this table is display one set of data per row --> 
            <xsl:if test="not($Print) or $Print=''">
                  <xsl:call-template name="IRS4466Style"></xsl:call-template>        
                  <xsl:call-template name="AddOnStyle"></xsl:call-template>    
               </xsl:if> 
             </style>        
             <xsl:call-template name="GlobalStylesForm"/>
     </head>
     <body class="styBodyClass">
       <form name="Form4466">
       <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"  />  
          <!-- END WARNING LINE -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:33mm;height:20mm;">
               <div style="height:13mm;">
                  Form<span class="styFormNumber" > 4466</span><br/>
                (Rev. December 2006)
               </div>
               <div style="height:7mm;font-size:7pt;font-family:arial;" >
                 <span>Department of the Treasury</span>
                 <br/>
                 <span>Internal Revenue Service</span>
               </div>        
            </div>    
            <div class="styFTBox" style="width:123mm;height:20mm;">
               <div class="styMainTitle" style="height:12;">Corporation Application for Quick Refund of Overpayment of Estimated Tax</div>
               <div style="height:8mm;padding-top:4mm;text-align:left;font-size:6pt;padding-left:2mm;">
                  For calendar year        
                  <span style="width: 8mm">
                    <xsl:call-template name="PopulateReturnHeaderTaxYear" />
                 </span>
                   or tax year beginning 
                 <span style="width:18mm">
                    <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate" />
                 </span>, 
	             and ending         
                 <span style="width: 18mm">
                    <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate" />
                 </span>
               </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:20mm;">
               <div style="text-align:center;padding-top:10mm;">OMB No. 1545-0170</div>
            </div>
          </div>
          <!--Name & EIN Line -->
          <div class="styBB" style="width:187mm;float:none;clear:right;">
            <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;">
              Name<br/>
               <xsl:call-template name="PopulateReturnHeaderFiler">
                 <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
               </xsl:call-template>
               <br/>
               <xsl:call-template name="PopulateReturnHeaderFiler">
                 <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
               </xsl:call-template>
            </div>
            <div class="styEINBox" style="width:52mm;height:4mm;padding-left:2mm;font-size:7pt;">
               Employer Identification number<br /><br />
               <span style="text-align:left;width:36mm;font-weight:normal;">            
                 <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                 </xsl:call-template>          
               </span>
             </div>
          </div><!--Name & EIN Line -->
          <!-- Street Address -->
          <div class="styBB">
            <div style="width:135mm;float:left;clear:left;">
               <div class="styBB" style="width:135mm;">
                 <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;">
                    Number,
                    <span style="width:4px;"></span>
                    street,
                    <span style="width:4px;"></span>
                    and
                    <span style="width:4px;"></span>
                    room
                    <span style="width:4px;"></span>
                    or
                    <span style="width:4px;"></span>
                    suite
                    <span style="width:4px;"></span>
                    no. (If a P.O. box, see instructions.)<br/>
                    <span>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                         <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                      </xsl:call-template>
                      <br />
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                         <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                      </xsl:call-template>
                    </span>            
                 </div>
               </div>
               <!-- VRB modified; 12/23/2003; for compinace with November 2003 pdf form -->
               <div class="styNameBox" style="height:8mm;width:135mm;font-size:7pt;">
                    City or town,
                    <span style="width:4px;"></span>
                    state,
                    <span style="width:4px;"></span>
                    and
                    <span style="width:4px;"></span>
                    ZIP code 
                    <br/>
                    <span>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                         <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                      </xsl:call-template>
                      <br />
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                         <xsl:with-param name="TargetNode">Country</xsl:with-param>
                      </xsl:call-template>
                    </span>    
               </div>
            </div>
            <!--Telephone Box -->    
            <div style="width:52mm;height:16.5mm;float:left;clear:none;">
               <span style="font-size:7pt;margin-left:3mm;">
                 Telephone number (optional)
               </span>
               <span style="width:43mm;float:left;clear:none;"/>        
               <span style="float:left;clear:none;margin-left:3mm;">
                 <xsl:call-template name="PopulatePhoneNumber">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TelephoneNumber" />
                  </xsl:call-template>
               </span>
            </div>
          </div><!-- Street Address -->
          <!-- Blank Line -->
          <div style="width:187mm"/>
          <!--Check Box Line -->
          <div class="styBB" style="width:187mm;">
            <span style="font-size:7pt;">
              Check type of return to be filed (see instructions):
            </span>
            <!-- 1120 Check Box -->
            <div style="width:187mm;"/>
            <div style="width:187mm;float:left;clear:all;">    
               <input type="checkbox" class="styCkbox">              
                 <xsl:call-template name="PopulateCheckbox">
                   <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120" />
                 </xsl:call-template>
               </input>
               <label>
                 <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120" />
                 </xsl:call-template> 
                    Form 1120
               </label>  
               <span style="width:2mm;"/> 
               <!--1120A Check Box -->
               <input type="checkbox" class="styCkbox">              
                 <xsl:call-template name="PopulateCheckbox">
                   <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120A" />
                 </xsl:call-template>
               </input>
               <label>
                 <xsl:call-template name="PopulateLabel">
                   <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120A" />
                 </xsl:call-template> 
                   Form 1120-A
               </label>  
               <span style="width:2mm;"/> 
               <!--1120C Check Box -->
               <input type="checkbox" class="styCkbox">              
                 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120C" />
                 </xsl:call-template>
               </input>
               <label>
                 <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120C" />
                 </xsl:call-template> 
                   Form 1120-C
               </label>  
               <span style="width:2mm;"/> 
               <!--1120F Check Box --> 
               <input type="checkbox" class="styCkbox">              
                 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120F" />
                 </xsl:call-template>
               </input>
               <label>
                 <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120F" />
                 </xsl:call-template> 
                    Form 1120-F
               </label>  
               <span style="width:2mm;"/> 
               <!--1120L Check Box -->
               <input type="checkbox" class="styCkbox">              
                 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120L" />
                 </xsl:call-template>
               </input>
               <label>
                 <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120L" />
                 </xsl:call-template> 
                    Form 1120-L
               </label>  
               <span style="width:2mm;"/> 
               <!-- Form 1120PC -->
               <input type="checkbox" class="styCkbox">              
                 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120PC" />
                 </xsl:call-template>
               </input>
               <label>
                 <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/Form1120PC" />
                 </xsl:call-template> 
                    Form 1120-PC
               </label>  
               <span style="width:2mm;"/> 
               <!-- Other Check Box -->
               <input type="checkbox" class="styCkbox">              
                 <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/OtherReturnType" />
                 </xsl:call-template>
               </input>
               <label>
                 <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/OtherReturnType" />
                 </xsl:call-template> 
                   Other
               </label>
               <img src="{$ImagePath}/4466_Bullet_Sm.gif" alt="bullet image" style="width:2mm;"/>
               <span style="width:4px;"></span>
               <span style="width:20mm;border-bottom:1 solid black;">
                 <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form4466Data/TypeOfReturn/OtherReturnType/@returnType"/>
                 </xsl:call-template>
               </span>
            </div><!-- 1120 Check Box -->
            <!--Blank Line -->
            <div style="width:187mm;"/>      
          </div><!--Check Box Line -->
          <!-- Blank Line -->
          <div class="styBB" style="width:187mm;">
          <!-- L1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">1</div>
            <div class="styLNDesc" style="width:136mm;height:4mm;">
               Estimated income tax paid during the tax year
               <!--Dotted Line-->
               <span class="styBoldText">
                 <span style="width:8px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:15px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:15px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:15px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
               </span>
             </div>
             <div class="styLNRightNumBox" style="height:4mm;">1</div>
             <div class="styLNAmountBox" style="width:35mm;">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/EstimatedIncomeTaxPaidDuringTY" />
               </xsl:call-template>
             </div>
          </div><!-- L1 -->
          <!-- L2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">2</div>
            <div class="styLNDesc" style="width:136mm;height:4mm;">
               Overpayment of income tax from prior year credited to this year’s estimated tax          
               <!--Dotted Line-->
               <span class="styBoldText">
                 <span style="width:13px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
               </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">2</div>
            <div class="styLNAmountBox" style="width:35mm;">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/PriorYearOverpaidIncomeTax" />
               </xsl:call-template>
            </div>
          </div><!-- L2 -->
          <!-- L3 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">3</div>
            <div class="styLNDesc" style="width:136mm;height:4mm;">
               Total. Add lines 1 and 2
               <!--Dotted Line-->
               <span class="styBoldText">
                 <span style="width:12px;"></span>
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:15px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:15px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
               </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">3</div>
            <div class="styLNAmountBox" style="width:35mm;">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/EstimatedPlusOverpaidIncomeTax" />
               </xsl:call-template>
             </div>
          </div><!-- L3 -->
          <!-- L4 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm">4</div>
            <div class="styLNDesc" style="width:85mm;height:7.5mm;">Enter total tax from the appropriate line of your tax return (for example, line 10 of the 2006 Schedule J (Form 1120))          
               <!-- dotted line -->
               <span style="letter-spacing:16px;font-weight:bold;"> ..</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;vertical-align:bottom;padding-top: 3.5mm">4</div>
            <div class="styLNAmountBox" style="height:7.5mm;width:43mm;vertical-align:bottom;padding-top: 3.5mm">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/TotalTax1120SchJOrOtherReturns" />
               </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:7.5mm;border-right-width:1px;"></div>   
          </div><!-- L4 -->
          <!--  Blank Line -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm"></div>
            <div class="styLNDesc" style="width:85mm;height:4.5mm;"></div>
            <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"></div>
            <div class="styLNAmountBox" style="height:4.5mm;width:43mm;background-color:lightgrey;border-bottom-width:0px"></div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"></div>        
          </div>
          <!-- L5a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">5a</div>
            <div class="styLNDesc" style="width:45mm;height:7.5mm;">
              Personal holding company tax, if any, included on line 4
              <!-- dotted line -->
              <span style="letter-spacing:16px;font-weight:bold;">...</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm">5a</div>
            <div class="styLNAmountBox" style="padding-top: 3.5mm; height:7.5mm;">          
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/PersonalHoldingCompanyTax" />
               </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.1mm;height:7.5mm;background-color:lightgrey;padding-top:3.5mm;border-right-width:1px;"></div>
            <div class="styLNAmountBox" style="background-color:lightgrey;height:7.5mm;width:42.75mm;border-left-width:0px;border-bottom-width:0px"></div>
	      <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;padding-top:3.5mm;width:8.1mm;border-right-width:1px;"></div>      
          </div><!-- L5a -->
          <!-- L5b -->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:7.5mm;">b</div>
            <div class="styLNDesc" style="width:45mm;height:7.5mm;">
               Estimated refundable tax credit for Federal tax on fuels
               <!-- dotted line -->
               <span style="letter-spacing:16px;">...</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm">5b</div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top: 3.5mm">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/EstRefundableFederalFuelTaxCr" />
               </xsl:call-template>
             </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;padding-top:3.5mm;width:8.1mm;border-right-width:1px;border-bottom-width:1px;"></div>
             <div class="styLNAmountBox" style="background-color:lightgrey;height:7.5mm;width:42.75mm;border-left-width:0px;border-bottom-width:1px;"></div>      
		<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;padding-top:3.5mm;width:8.1mm;border-right-width:1px;"></div>      
          </div><!-- L5b -->
          <!-- L6 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-top: 3.5mm;">6</div>
            <div class="styLNDesc" style="width:85mm;height:7.5mm;padding-top: 3.5mm;">
               Total. Add lines 5a and 5b
               <!--Dotted Line-->
               <span style="letter-spacing:16px;font-weight:bold;">..........</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 3.5mm;">6</div>
            <div class="styLNAmountBox" style="width:43mm;height:7.5mm;padding-top: 3.5mm">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/PrsnlHoldingTaxPlusFuelTaxCr" />
               </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:7.5mm;border-right-width:1px;"></div>        
          </div><!-- L6 -->
          <!-- L7 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-top: 3.5mm;">7</div>
            <div class="styLNDesc" style="width:136mm;height:4mm;padding-top: 3.5mm;">
               Expected income tax liability for the tax year. Subtract line 6 from line 4          
               <!--Dotted Line-->
               <span class="styBoldText">
                 <span style="width:6px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
                 <span style="width:16px;"></span>.
               </span>
             </div>
             <div class="styLNRightNumBox" style="height:4mm;padding-top: 3.5mm;">7</div>
             <div class="styLNAmountBox" style="width:35mm;padding-top: 3.5mm;">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/ExpectedIncomeTaxLiability" />
               </xsl:call-template>
             </div>
          </div><!-- L7 -->
          <!-- Blank Line -->
          <div style="width:144mm;float:left;"></div>
          <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;border-right-width:1px;"></div>
          <div style="width:34mm;float:left;"></div>    
          <!-- L8 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">8</div>
            <div class="styLNDesc" style="width:136.1mm;">
               <span style="font-weight:bold;">Overpayment of estimated tax.</span> Subtract line 7 from line 3. If this amount is at least 10% of
              line 7 <span style="font-weight:bold;">and</span> at least $500, the corporation is eligible for a quick refund. Otherwise, do not file
              this form (see instructions)
              <span style="letter-spacing:16px;font-weight:bold;">........................</span>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.1mm;height:6.25mm;background-color:lightgrey;border-right-width:1px;"></div>
            <div class="styLNAmountBox" style="width:34mm;height:6.25mm;border-left-width:0px;border-bottom-width:0px;"></div>
            <div class="styLNRightNumBoxNBB" style="foat:left;clear:none" >8</div>
            <div class="styLNAmountBoxNBB" style="width:35mm;">
               <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/OverpaymentOfEstimatedTax" />
               </xsl:call-template>
            </div>
          </div><!-- L8 -->
          </div><!-- Blank Line -->
          <!--Record of Estimated Tax Deposits Table Title-->
          <div class="styBB" style="width:187mm;clear:both;float:none;">
            <div class="styPartDesc" style="width:179mm;text-align:center;">
              Record of Estimated Tax Deposits
            </div>
            <div class="styGenericDiv" style="float:none;clear:none;width:7mm;text-align:right;">
            <!-- RETD table Toggle Button -->
               <xsl:call-template name="SetDynamicTableToggleButton">
                 <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTaxDeposits"/>
                 <xsl:with-param name="containerHeight" select="3"/>
                 <xsl:with-param name="containerID" select=" 'RETDctn' "/>
               </xsl:call-template>
            </div>      
          </div>      
          <!--Start RETD Table -->
          <div class="styTableContainer" id="RETDctn" style="height:12.5mm;">
            <xsl:call-template name="SetInitialState" />
            <table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
               <thead class="styTableThead">
                 <tr>
                    <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">Date of deposit</th>
                    <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">Amount</th>
                    <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">Date of deposit</th>
                    <th class="styTableCellHeader" style="font-size: 7pt; width:46mm;font-weight:normal;" scope="col">Amount</th>
                 </tr>
               </thead>
               <tfoot></tfoot>
               <tbody>
               <!-- Table Row mirror PDF Print -->
                 <xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form4466Data/RecordOfEstimatedTaxDeposits) &lt;5))">
                    <xsl:for-each select="$Form4466Data/RecordOfEstimatedTaxDeposits">
                      <tr>
                         <xsl:if test="position() mod 2 &gt;0">
                           <xsl:variable name="posofdeposit"><xsl:value-of select="position()" /></xsl:variable>
                           <td class="styTableCell" style="font-size: 7pt; text-align:center;width:46mm">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="DateOfDeposit" />
                              </xsl:call-template>
                              <span class="styTableCellPad"></span>
                           </td>
                           <td class="styTableCell" style="font-size: 7pt; text-align:right;width:46mm;">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="AmountOfDeposit" />
                              </xsl:call-template>
                              <span class="styTableCellPad"></span>
                            </td>
                            <td class="styTableCell" style="font-size: 7pt; text-align:center;width:46mm;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTaxDeposits[$posofdeposit +1]/DateOfDeposit" />
                              </xsl:call-template>
                              <span class="styTableCellPad"></span>
                            </td>
                            <td class="styTableCell" style="font-size: 7pt; text-align:right;width:46mm;">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTaxDeposits[$posofdeposit +1]/AmountOfDeposit" />
                              </xsl:call-template>
                              <span class="styTableCellPad"></span>
                            </td>
                         </xsl:if>
                       </tr>                        
                    </xsl:for-each>
                  </xsl:if>
                  <!-- Empty Table 2nd Row of data -->
                  <xsl:if test="(count($Form4466Data/RecordOfEstimatedTaxDeposits) &lt;= 2) or (($Print=$Separated) and (count($Form4466Data/RecordOfEstimatedTaxDeposits) &gt;2))">
                    <tr>
                      <td  class="styTableCell"><span class="styTableCellPad"></span>
                         <xsl:if test="($Print=$Separated) and (count($Form4466Data/RecordOfEstimatedTaxDeposits) &gt;4)">
                           <xsl:call-template name="PopulateAdditionalDataTableMessage">
                              <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTaxDeposits/DateOfDeposit"/>
                           </xsl:call-template>
                         </xsl:if>
                      </td>
                      <td  class="styTableCell"><span class="styTableCellPad"></span></td>
                      <td  class="styTableCell"><span class="styTableCellPad"></span></td>
                      <td  class="styTableCell"><span class="styTableCellPad"></span></td>
                    </tr>
                  </xsl:if>
                  <!-- Empty Table 1st Row of data -->
                  <xsl:if test="(count($Form4466Data/RecordOfEstimatedTaxDeposits) &lt; 1) or (($Print=$Separated) and (count($Form4466Data/RecordOfEstimatedTaxDeposits) &gt;4))">
                    <tr>
                      <td  class="styTableCell"><span class="styTableCellPad"></span></td>
                      <td  class="styTableCell"><span class="styTableCellPad"></span></td>
                      <td  class="styTableCell"><span class="styTableCellPad"></span></td>
                      <td  class="styTableCell"><span class="styTableCellPad"></span></td>
                    </tr>
                  </xsl:if>
                </tbody>
            </table>
          </div><!--End RETD Table -->
          <!-- RETD Table Initiate Toggle Button Begin -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form4466Data/RecordOfEstimatedTaxDeposits"/>
            <xsl:with-param name="containerHeight" select="3"/>
            <xsl:with-param name="containerID" select=" 'RETDctn' "/>
          </xsl:call-template>
          <!-- Implementing the signature section in table -->
          <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
	     <tr>
	       <td rowspan="3" style="width:13mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
	       <td colspan="5" style="padding-left:1mm;padding-bottom:1mm;">
	         Under penalties of perjury, I declare that I have examined this application, including any accompanying schedules and statements, and to the best of
                my knowledge and belief, it is true, correct, and complete. 
              </td>
	     </tr>
	     <tr>
	       <td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
	          <img src="{$ImagePath}/4466_Bullet_Lg.gif" alt="Big Right Arrow"/>
              </td>
		<td style="width:60mm;border-bottom:1 solid black;vertical-align:bottom;border-right:1 solid black;">
               <xsl:call-template name="PopulateReturnHeaderOfficer">
                 <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param> 
               </xsl:call-template>
               <span style="width:1px;"></span>
             </td>
		<td style="width:20mm;border-bottom:1 solid black;vertical-align:bottom;padding-left:1mm;">
               <xsl:call-template name="PopulateReturnHeaderOfficer">
                 <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
               </xsl:call-template>
             </td>
		<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
		  <img src="{$ImagePath}/4466_Bullet_Lg.gif" alt="Big Right Arrow"/>
             </td>
		<td style="width:50mm;border-bottom:1 solid black;vertical-align:bottom;">
               <xsl:call-template name="PopulateReturnHeaderOfficer">
                 <xsl:with-param name="TargetNode">Title</xsl:with-param>
               </xsl:call-template>
	       </td>
	     </tr>
	     <tr>
	       <td style="border-bottom:1 solid black;vertical-align:top;">Signature</td>
		<td style="border-bottom:1 solid black;vertical-align:top;padding-left:1mm;">Date</td>
	       <td style="border-bottom:1 solid black;vertical-align:top;">Title</td>
	     </tr>
          </table>
          <!-- End Signature Section -->
          <!-- Footer -->
          <div style="width:187mm;float:none;clear:both;padding-top:1mm;">
            <div style="width:100mm;float:left;clear:none;"></div>
            <div style="width:48mm;float:left;clear:none;">Cat. No. 12836A</div>
            <div style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">4466</span> (Rev. 12-2006)</div>
          </div>
          <!-- End footer -->
          <!-- add page break -->
          <p class="pageend"></p>
          <!-- Begininning of write-in data -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
               <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>      
          </div><!-- Begininning of write-in data -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
               <xsl:with-param name="TargetNode" select="$Form4466Data" />
               <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <!-- Tanuja: Removing as there is place to show the data on the form.  No need to show it in the additional data -->
          </table>
          <!--Begin Separated print for Record of Estimated Tax Deposits table where one set of data is display on one row -->
          <xsl:if test="($Print = $Separated) and (count($Form4466Data/RecordOfEstimatedTaxDeposits) &gt;2)">
            <br/>
            <span class="styRepeatingDataTitle">Form 4466 - Record of Estimated Tax Deposits  </span>			
            <table class="styDepTbl" style="font-size: 7pt; width: 92mm">
	       <thead class="styTableThead">
		   <tr class="styDepTblHdr">
                    <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">Date of deposit</th>
                    <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">Amount </th>
                </tr>
              </thead>
              <tfoot></tfoot>
              <tbody>
                 <xsl:for-each select="$Form4466Data/RecordOfEstimatedTaxDeposits">
                   <tr>
                      <xsl:attribute name="class">
		           <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                           <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                         </xsl:choose>
                      </xsl:attribute>
                      <td class="styDepTblCell" style="text-align:center;width:46mm">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DateOfDeposit" />
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styDepTblCell" style="text-align:right;width:46mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AmountOfDeposit" />
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                   </tr>                        
                 </xsl:for-each>
               </tbody>
            </table> 
          </xsl:if>
      </form>
    </body>
   </html>
 </xsl:template>
</xsl:stylesheet>
