<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS8941Style.xsl"/>
    <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*"/>
	<xsl:param name="Form8941Data" select="$RtnDoc/IRS8941"/>
        <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:call-template name="FormTitle">
                        <xsl:with-param name="RootElement" select="local-name($Form8941Data)"/>
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
                <meta name="Description" content="IRS Form 1065"/>
                <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
                <xsl:call-template name="InitJS"/>
                <style type="text/css">
                    <xsl:if test="not($Print) or $Print=''">
                        <xsl:call-template name="IRS8941Style"/>
                        <xsl:call-template name="AddOnStyle"/>
                    </xsl:if>
                </style>
                <xsl:call-template name="GlobalStylesForm"/>
            </head>
            <body class="styBodyClass">
                <form name="Form8941">
                    <xsl:call-template name="DocumentHeader"/>
                    <div class="styBB" style="width:187mm;">
                        <div class="styFNBox" style="height:21mm; width:33mm;">
                          
            <span class="styFormNumber">8941</span>
                               
                                <div style="font-size:6pt; padding-top:1.8mm">
              Department of the Treasury<br/>Internal Revenue Service 
                                </div>
                            
                        </div>
                        <div class="styFTBox" style="width:123mm;text-align:left;">
                            <div class="styMainTitle" style="padding-top:6mm;text-align:center;">Credit for Small Employer Health Insurance Premiums</div>
                            <div class="styFBT" style="margin-top:3mm;padding-left:45mm;">
                               <img src="{$ImagePath}/8941_Bullet.gif" alt="Bullet Image"/>See separate instructions.
                            </div>    
                            <div class="styFBT" style="margin-top:0mm;padding-left:45mm;"> 
                                <img src="{$ImagePath}/8941_Bullet.gif" alt="Bullet Image"/>Attach to your tax return.
                            </div>
                        </div>
                        <div class="styTYBox" style="width:31mm; height:19mm">
                            <div style="padding-top:2mm;border-bottom:1 solid black">OMB No. 1545-xxxx</div>
                            <div class="styTaxYear">
          20<span class="styTYColor">10</span>
		</div>
                            <div style="padding-left:2.5mm; text-align:left; margin-top:0mm; padding-bottom:0mm;">Attachment<br/>Sequence No.<b>63</b>
                            </div>
                        </div>
                    </div>
     <!-- Begin Names and Identifying number section -->

    <div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
      <div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
        Name shown on return<br/><br/>
             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template><br/>
       </div>
      <div class="styEINBox" style="width:35mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
        <b>Identifying number</b><br/>
        <span style="width:34mm; text-align:left;font-weight:normal;"><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>          
        </span>          
      </div>
    </div>
    
    <!-- End Names and Identifying number section -->
         
 
<!-- Start Line 1 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:2mm;">1
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;padding-top:2mm;font size:7pt">Enter the number of individuals you employed during the tax year who are considered employees for purposes of this credit (see instructions)
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.                                                                
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.   
                                    <span style="width:8px"></span>.                                                                
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.   
                                    <span style="width:8px"></span>.
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:9mm;width:6mm;border-right-width:0px;padding-top:4mm;">1
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:9mm;width:28.5mm;border-left-width:1px;padding-top:4mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPIndivEmpldForCrCnt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 1 -->
<!-- Start Line 2 -->
                        
                        <div style="width:187mm">
                            <div class="styLNLeftNumBoxSD" style="height:7mm;">2
                            </div>
                        <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Enter the number of full-time equivalent employees you had for the tax year (see instructions). If you entered 25 or more, skip lines 3 through 11 and enter -0- on line 12
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                                                     
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">2
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPFTEEmplForTaxYrCnt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 2 -->
<!-- Start Line 3 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:7mm;">3
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Average annual wages you paid for the tax year (see instructions). If you entered $50,000 or more, skip lines 4 through 11 and enter -0- on line 12
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.   
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.   
                                    <span style="width:8px"></span>.                                 
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">3
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/AvgAnnualWagesPdForTxYrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 3 -->
<!-- Start Line 4-->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:7mm;">4
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Premiums you paid during the tax year for employees included on line 1 for health insurance coverage under a qualifying arrangement (see instructions)
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.   
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.   
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">4
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/HIPPaidForEmplEmployedForCrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 4 -->
<!-- Start Line 5-->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:7mm;">5
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Premiums you would have entered on line 4 if the total premium for each employee equaled the average premium for the small group market in which you offered health insurance coverage (see instructions)
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">5
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPPotentiallyPaidAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 5 -->
<!-- Start Line 6-->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm;">6
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">
                            Enter the <b>smaller</b> of line 4 or line 5
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.    
                                    <span style="width:8px"></span>.   
                                    <span style="width:8px"></span>.                                   
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">6
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrEligibleHIPPaidAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 6 -->
<!-- Start Line 7-->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:2mm;">7
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:2mm;font size:7pt">
                            Multiply line 6 by the applicable percentage:
        <!--Dotted Line-->
                    
                            </div>
                               <div class="styLNRightNumBox" style="height:2mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;">
                            </div>
                                 <div class="styLNAmountBox"   style="height:2mm;width:28.5mm;border-left-width:1px;border-bottom-width:0px;">
                                    </div>
                                     <div class="styLNLeftNumBoxSD" style="height:7mm;">
                            </div>
                                    <div class="styLNDesc" style="width:144mm;height:7mm;">
                          <img src="{$ImagePath}/8941_Bullet_Round.gif" alt="RoundBullet"/> Tax-exempt small employers, multiply line 6 by 25% (.25)<br/>
                          
                          <img src="{$ImagePath}/8941_Bullet_Round.gif" alt="RoundBullet"/> All other small employers, multiply line 6 by 35% (.35)
        <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                               </span>
                        
                            </div> 
                            <div class="styLNRightNumBox" style="height:2mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;">
                            </div>
                            <div class="styLNAmountBox"   style="height:2mm;width:28.5mm;border-left-width:1px;border-bottom-width:0px;">
                                    </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">7
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrEligHIPTimesPctAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 7 -->
<!-- Start Line 8 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm;">8
                           </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">If line 2 is 10 or less, enter the amount from line 7. Otherwise, see instructions
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                    
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">8
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPFTECreditAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 8 -->
<!-- Start Line 9 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm;">9
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">If line 3 is $25,000 or less, enter the amount from line 8. Otherwise, see instructions
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                   
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">9
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/AnnualWgPdLessThanSpecifiedAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 9 -->
<!-- Start Line 10 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">10
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Enter the total amount of any state premium subsidies paid and any state tax credits available to you for premiums included on line 4 (see instructions)
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">10
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/TotStPremSbsdyPdOrCrForHIPAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 10 -->
<!-- Start Line 11 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:4mm;">11
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">Subtract line 10 from line 4. If zero or less, enter -0-
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                      
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px">11
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/HIPPdLessTotStPremOrCrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 11 -->
<!-- Start Line 12 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:4mm;">12
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">Enter the <b>smaller</b> of line 9 or line 11
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                    
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px">12
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmallerAnnualWgPdOrHIPPdAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 12 -->
<!-- Start Line 13 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:10mm;">13
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:10mm;font size:7pt">If line 12 is zero, skip lines 13 and 14 and go to line 15. Otherwise, enter the number of employees included on line 1 for whom you paid premiums during the tax year for health insurance coverage under a qualifying arrangement (see instructions)
        <!--Dotted Line-->
        
		               		                
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.      
                               </span>
                            </div>
          <div class="styLNRightNumBox" style="height:6.5mm;width:6mm;border-right-width;border-bottom-width: 0px;background-color:lightgrey;" />
                               <div class="styLNAmountBox" 
                                    style="height:6.5mm;width:28.5mm;border-left-width:1px;border-bottom-width: 0px;">
                                  
                             </div>
                            <div class="styLNRightNumBox" style="height:3mm;width:6mm;border-right-width:0px;padding-top:0mm;">13
                            </div>
                   <div class="styLNAmountBox" 
                                    style="height:3mm;width:28.5mm;border-left-width:1px;padding-top:0mm;">
                                   <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/PaidHIPForEmplForPrpsOfCrCnt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 13 -->
<!-- Start Line 14 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">14
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Enter the number of full-time equivalent employees you would have entered on line 2 if you only included employees included on line 13
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.   
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">14
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/FTEEmplPdHIPForPrpsOfCrCnt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 14 -->
<!-- Start Line 15 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">15
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Credit for small employer health insurance premiums from partnerships, S corporations, cooperatives, estates, and trusts (see instructions)
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.                          
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">15
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrCreditForHIPAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 15 -->
<!-- Start Line 16 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">16
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Add lines 12 and 15. Partnerships and S corporations, stop here and report this amount on Schedule K; all others, go to line 17
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.                               
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">16
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SumSmllrAmtAndCreditForHIPAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 16 -->
<!-- Start Line 17 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">17
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Credit for small employer health insurance premiums included on line 16 from passive activities (see <br>instructions)</br>
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.                                    
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">17
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPFromPssvActyCrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 17 -->
<!-- Start Line 18 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:4mm;">18
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">Subtract line 17 from line 16
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.                                    
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">18
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrSumLessPssvActyCrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 18 -->
<!-- Start Line 19 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">19
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Credit for small employer health insurance premiums allowed for 2010 from a passive activity (see <br/>instructions)
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.  
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">19
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPAllwPssvActyCrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 19 -->
<!-- Start Line 20 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:4mm;">20
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">Carryback of the credit for small employer health insurance premiums from 2011
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                 
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">20
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPCarrybackCrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 20 -->
<!-- Start Line 21 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">21
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Add lines 18 through 20. Cooperatives, estates, and trusts, go to line 22. Tax-exempt small employers, skip lines 22 and 23 and go to line 24. All others, stop here and report this amount on Form 3800, line 29h
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                              
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">21
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPSumCreditsAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 21 -->
<!-- Start Line 22 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:4mm;">22
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions)
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                  
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px">22
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPAllocToPatronsAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 22 -->
<!-- Start Line 23 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">23
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Cooperatives, estates, and trusts, subtract line 22 from line 21. Stop here and report this amount on Form 3800, line 29h
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                      
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">23
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPSumLessAllocAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 23 -->
<!-- Start Line 24 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:7mm;">24
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:7mm;font size:7pt">Enter the amount you paid in 2010 for taxes considered payroll taxes for purposes of this credit (see <br/>instructions) 
        <!--Dotted Line-->
                                <span class="styBoldText">
                                <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>. 
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.  
                                    <span style="width:8px"></span>.  
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;width:6mm;border-right-width:0px;padding-top:2mm;">24
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:28.5mm;border-left-width:1px;padding-top:2mm;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPPayrollTxsPdCrAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 24 -->
<!-- Start Line 25 -->
                        
                        <div style="width:187mm;">
                            <div class="styLNLeftNumBox" style="height:4mm;">25
                            </div>
                            <div class="styLNDesc" style="width:144mm;height:4mm;font size:7pt">Tax-exempt small employers, enter the <b>smaller</b> of line 21 or line 24 here and on Form 990-T, line 44f
        <!--Dotted Line-->
                                <span class="styBoldText">
                                    <span style="width:8px"></span>.
                                    <span style="width:8px"></span>.                                            
                               </span>
                            </div>
                            <div class="styLNRightNumBox" style="height:4mm;width:6mm;border-right-width:0px;">25
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:4mm;width:28.5mm;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8941Data/SmllEmplrHIPTaxExemptCreditAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 25 -->
   <!--  FOOTER-->
        <div style="width:187mm;padding-top:1mm;border-top:1px solid black;">
          <span class="styBoldText"  style="width:109.5mm">For Paperwork Reduction Act Notice, see separate instructions. </span> 
          <span style="width:30mm;">Cat. No. 37757S</span>                      
          
          <span style="width:14mm;"></span>  
          Form <span class="styBoldText" style="width:10mm">8941</span> (2010)
        </div> 
        <br class="pageEnd"/>
             
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
            <xsl:with-param name="TargetNode" select="$Form8941Data" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>                   
        </table>
      <!-- END Left Over Table --> 
      
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
