<?xml version="1.0" encoding="UTF-8" ?>
<!--Created by Doug Peterson 6-27-2006 submitted for inspection 7-13-2006-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1065ScheduleCStyle.xsl"/>


<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="Form1065SchCData" select="$RtnDoc/IRS1065ScheduleC" />

 <xsl:param name="Form1065BScheduleC" select="$Form1065SchCData/IRS1065BScheduleC"/>


<xsl:template match="/">

<html>
  <head>
  
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form1065SchCData)"></xsl:with-param></xsl:call-template></title>

  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 1065 Schedule C" />
  
 
  
  <xsl:call-template name="InitJS"></xsl:call-template>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  
  <style type="text/css">
   <xsl:if test="not($Print) or $Print=''">
      
           
      <xsl:call-template name="IRS1065ScheduleCStyle"></xsl:call-template>  

      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form1065ScheduleC">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>

      <div class="styTBB" style="width:187mm;height:9mm;">
        <div class="styFNBox" style="width:31mm;height:9mm;">
          <div style="height:9mm">
              <span class="styFormNumber" style="font-size:10pt;" >SCHEDULE C(Form 1065)<br/>
              </span>
             </div>
          <div style="padding-top: .0mm">
            <span class="styAgency">Department of the Treasury</span><br/>
            <span class="styAgency">Internal Revenue Service</span>
          
          </div>
        </div>
        <div class="styFTBox" style="width:125mm;height:12mm;">
          <div class="styMainTitle" style="height:7mm;padding-top:1mm;">Additional Information for Schedule M-3 Filers</div>
            <div class="styFBT" style="height:5mm;padding-top:6.5mm;">
            <img src="{$ImagePath}/1065SchC_Bullet.gif" alt="Bullet"/> Attach to Form 1065. See separate instructions.
           </div>
        </div>
        <div class="styTYBox" style="width:30mm;height:12mm;">
          <div class="styOMB" style="height:2mm;">OMB No. 1545-0099</div>
          <div class="styTaxYear" style="height:12mm;font-size: 26pt;padding-top:2.mm;padding-bottom:2.mm;">20<span class="styTYColor">09</span></div>
        
           </div>
      </div>

      <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;">
          Name of partnership<br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template><br/>
         </div>
        <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;">
         Employer identification number<br/><br/>
          <span style="font-weight:normal;"><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template></span>          
        </div>
      </div>
      

      <!-- BEGIN Yes Column -->
      
     <div  style="width:187mm">
 
      <div class="styPartDesc" style="height:2mm;width:175mm;font-size:9pt;padding-left:0mm;padding-bottom:0mm;padding-top: 1mm;
      border-right-	width:0px; border-left-width:0px;border-top-width:0px;border-bottom-width:0px;text-align:left;clear:none;">
    	</div>

      
      <div class="styPartDesc" style="width:2mm;font-size:8pt;padding-top:1mm;padding-right:0mm;padding-left:0mm;border-style:solid;border-right-width:1px;
      		border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;float:left;clear:none;">
      		<div style="height:2mm;font-weight:bold;text-align:center;">Yes</div>
      </div>
	
	<!-- END Yes Column -->

     <!-- BEGIN No Column  -->
      
      <div class="styPartDesc" style="width:5.5 mm;padding-top:1mm;padding-right:0mm;padding-left:0mm;border-style:solid;border-right-width:0px;
      		border-left-width:0px;border-top-width:0px;border-bottom-width:1px;border-color:black;float:left;clear:none;">
     		<div style="height:2mm;font-weight:bold;text-align:center;font-size:8pt;">No</div>
      	</div>
 	</div>

	<!-- END No Column -->

                    
 <!-- Start Line 1 -->
                   
                    <div  style="width:187mm">
                        <div class="styLNLeftNumBox" style="height:4mm;font-size:8pt;padding-top:1mm">1</div>
                        <div class="styLNDesc" style="width:167mm;font-size:8pt;padding-top:1mm;">At any time during the tax year, were there any transfers between the partnership and its partners subject to the
				disclosure requirements of Regulations section 1.707-8?
                            <span class="styBoldText">
 									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065SchCData/SubjectToDisclosureRequirement"/>
									</xsl:call-template>                           
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                               <span style="width:16px"/>.
                            </span>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:3.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:3.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateYesBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/SubjectToDisclosureRequirement"/>
                            </xsl:call-template>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateNoBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/SubjectToDisclosureRequirement"/>
                            </xsl:call-template>
                        </div>
                    </div>
<!-- End Line 1 -->
                    
                    
 <!-- Start Line 2 -->
                   
                    <div  style="width:187mm">
                        <div class="styLNLeftNumBox" style="height:4mm;font-size:8pt;padding-top:3.5mm">2</div>
                        <div class="styLNDesc" style="width:167mm;font-size:8pt;padding-top:3.5mm;">Do the amounts reported on Schedule M-3, 
                        Part II, lines 7 or 8, column (d), reflect allocations to this<br/>partnership from another partnership of income, gain, loss, deduction, 
                        or credit that are disproportionate to<br/>this partnership’s share of capital in such partnership or its ratio for sharing other items of such partnership?
                           </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:10mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:10mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateYesBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/PrtnrshpCaptialContribution"/>
                            </xsl:call-template>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateNoBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/PrtnrshpCaptialContribution"/>
                            </xsl:call-template>
                        </div>
                    </div>
<!-- End Line 2 -->
                    
                    
 <!-- Start Line 3 -->
                   
                    <div  style="width:187mm">
                        <div class="styLNLeftNumBox" style="height:4mm;font-size:8pt;padding-top:3.5mm">3</div>
                        <div class="styLNDesc" style="width:167mm;font-size:8pt;padding-top:3.5mm;">At any time during the tax year, did the partnership sell, exchange, or 
                        transfer any interest in an intangible<br/>asset to a related person as defined in sections 267(b) and 707(b)(1)?
                            <span class="styBoldText">
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                               <span style="width:16px"/>.
                            </span>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateYesBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/SellExchangeTransferInterest"/>
                            </xsl:call-template>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateNoBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/SellExchangeTransferInterest"/>
                            </xsl:call-template>
                        </div>
                    </div>
<!-- End Line 3 -->
                   
                    
<!-- Start Line 4 -->
                   
                    <div  style="width:187mm">
                        <div class="styLNLeftNumBox" style="height:4mm;font-size:8pt;padding-top:3.5mm">4</div>
                        <div class="styLNDesc" style="width:167mm;font-size:8pt;padding-top:3.5mm;">At any time during the tax year, did the partnership acquire any interest in an intangible asset from a related<br/> 
				person as defined in sections 267(b) and 707(b)(1)?
                            <span class="styBoldText">
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                               <span style="width:16px"/>.
                            </span>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateYesBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/InterestInIntangibleAsset"/>
                            </xsl:call-template>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateNoBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/InterestInIntangibleAsset"/>
                            </xsl:call-template>
                        </div>
                    </div>
<!-- End Line 4 -->

<!-- Start Line 5 -->
                   
                    <div  style="width:187mm">
                        <div class="styLNLeftNumBox" style="height:4mm;font-size:8pt;padding-top:3.5mm">5</div>
                        <div class="styLNDesc" style="width:167mm;font-size:8pt;padding-top:3.5mm;">At any time during the tax year, did the partnership make any change in accounting principle for financial<br/> 
				accounting purposes? See instructions for a definition of change in accounting principle
                            <span class="styBoldText">
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                 <span style="width:16px"/>.
                                <span style="width:16px"/>.
                            </span>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateYesBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/ChangeInAccountingPrinciple"/>
                            </xsl:call-template>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="">
                            <xsl:call-template name="PopulateNoBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/ChangeInAccountingPrinciple"/>
                            </xsl:call-template>
                        </div>
                    </div>
<!-- End Line 5 -->


 <!-- Start Line 6 -->
                   
                    <div class="styBB" style="width:187mm">
                        <div class="styLNLeftNumBox" style="height:4mm;font-size:8pt;padding-top:3.5mm">6</div>
                        <div class="styLNDesc" style="width:167mm;font-size:8pt;padding-top:3.5mm;">At any time during the tax year, did the partnership make any change in a method of accounting for U.S.<br/> 
				income tax purposes?
                            <span class="styBoldText">
 									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065SchCData/ChangeInMethodOfAccounting"/>
									</xsl:call-template>                                                              
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:15px"/>.
                                <span style="width:16px"/>.
                                <span style="width:15px"/>.
                                <span style="width:16px"/>.
                                <span style="width:15px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:15px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                                <span style="width:16px"/>.
                            </span>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="height:6.5mm;background:lightgrey;border-bottom-width:0"/>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="border-bottom-width:0;">
                            <xsl:call-template name="PopulateYesBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/ChangeInMethodOfAccounting"/>
                            </xsl:call-template>
                        </div>
                        <div class="styIRS1065ScheduleCBLNYesNoBox" style="border-bottom-width:0;">
                            <xsl:call-template name="PopulateNoBoxText">
                                <xsl:with-param name="TargetNode" select="$Form1065SchCData/ChangeInMethodOfAccounting"/>
                            </xsl:call-template>
                        </div>
                    </div>
<!-- End Line 6 -->


                    <div style="width:187mm;padding-top:1mm">
                        <span style="font-weight:bold;width:110mm;font-size:7pt">For Paperwork Reduction Act Notice, see the instructions for Form 1065.</span>
                        <span style="width:40mm;font-size: 6pt;">Cat. No. 49945S</span>
                        <span style="font-weight:bold;font-size: 6pt;">Schedule C (Form 1065) 2009</span>
                    </div>
                    <br/>
                    <!-- BEGIN Left Over Table -->
                    <!-- Additonal Data Title Bar and Button -->
                    <div class="pageEnd" style="width:187mm;"/>
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
                            <xsl:with-param name="TargetNode" select="$Form1065SchCData"/>
                            <xsl:with-param name="DescWidth" select="100"/>
                        </xsl:call-template>
                    </table>
                    <!-- END Left Over Table -->
  
     

    
     
    </form>
  </body>
</html>

</xsl:template>



</xsl:stylesheet>
