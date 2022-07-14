<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS5884Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form5884Data" select="$RtnDoc/IRS5884"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form5884Data)"/>
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
        <meta name="Description" content="IRS Form 5884"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!-- Form 5884 CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS5884Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form5884">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:19.5mm;">
          Form <span class="styFormNumber">&#160;5884</span>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:13mm;">
              <span style="height: 1mm;"/>
              <div class="styMainTitle" style="height:8mm;">
          Work Opportunity Credit          
        </div>
              <br/>
              <div class="styFST" style="height:5mm;font-size:7pt;">
                <img src="{$ImagePath}/5884_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
          Attach to your tax return.
        </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:19.5mm;">
              <div class="styOMB" style="height:2mm;">
          OMB No. 1545-0219
        </div>
              <div class="styTaxYear">
          20<span class="styTYColor">08</span>
              </div>
              <div>
                <span style="padding-right:6mm;">Attachment</span>
                <br/> Sequence No. <span class="styBoldText">77</span>
              </div>
            </div>
          </div>
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:148mm;height:8mm;font-size:7pt;">
        Name(s) shown on return<br/>
              <span>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            <div class="styEINBox" style="width:35mm;height:4mm;padding-left:2mm;font-size:7pt;">
        Identifying number<br/>
              <span style="width:34mm; text-align:left;font-weight:normal;padding-top:2mm;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!--Line 1 Begin-->
          <div class="styTBB" style="width:187mm;">
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">
                    1
               </div>
              <div class="styLNDesc" style="height:4mm;"> Enter on the applicable line below the total qualified first- or second-year wages paid or incurred
                during the tax year, and multiply by the percentage shown, for services of employees who are
              certified (if required) as members of a targeted group.       
               </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:11mm;border-right-width:1px;padding-top:0mm;"/>
            </div>
            <!-- line 1a -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">a</div>
              <div class="styLNDesc" style="width:138mm;height:4mm; ">
               Qualified first-year wages of employees who worked for you at least 120 hours but fewer than 400 hours 
        </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;padding-top:0mm;"/>
            </div>
            <div style="width:187mm;">
              <div style="padding-left:9mm;width:146mm;float:left;">
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
            </span>
                <span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
                <span style="width:32mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form5884Data/WagesBetween120And399Hours"/>
                  </xsl:call-template>
                </span>
                <span style="width:18mm;">
                  <span style="width:4px;"/>X 25% (.25)</span>
              </div>
              <div class="styLNRightNumBox" style="padding-top:0mm;">
             1a
          </div>
              <div class="styLNAmountBox" style="padding-top:0mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalWagesBetween120And399Hrs"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 1b -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:138mm;height:4mm;"/>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;padding-top:0mm;"/>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:3px;padding-left:4mm;">b</div>
              <div style="width:138mm;float:left;">Qualified first-year wages of employees who worked for you at least 400 hours </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;padding-top:0mm;"/>
            </div>
            <div style="width:187mm;">
              <div style="padding-left:9mm;width:146mm;float:left;">
                <span class="styBoldText">
                  <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
               <span style="width:15px;"/>.
 		        <span style="width:15px;"/>.
               <span style="width:15px;"/>.
                     <span style="width:10px;"/>.
            </span>
                <span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
                <span style="width:32mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form5884Data/WagesFor400HoursOrMore"/>
                  </xsl:call-template>
                </span>
                <span style="width:18mm;">
                  <span style="width:4px;"/>X 40% (.40)</span>
              </div>
              <div class="styLNRightNumBox" style="padding-top:1mm;">
             1b
          </div>
              <div class="styLNAmountBox" style="padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/CreditForWagesOf400OrMoreHours"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 1c -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:138mm;height:4mm; ">
               Qualified second-year wages of employees certified as long-term family assistance recipients 
        </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;padding-top:0mm;"/>
            </div>
            <div style="width:187mm;">
              <div style="padding-left:9mm;width:146mm;float:left;">
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
                <span style="width:7px;"/>
                </span>
                <span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
                <span style="width:32mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form5884Data/QualifiedSecondYearWages"/>
                  </xsl:call-template>
                </span>
                <span style="width:18mm;">
                  <span style="width:4px;"/>X 50% (.50)</span>
              </div>
              <div class="styLNRightNumBox" style="padding-top:0mm;">
             1c
          </div>
              <div class="styLNAmountBox" style="padding-top:0mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalQualifiedSecondYearWages"/>
                </xsl:call-template>
              </div>
            </div>
            <!--Line 2 Begin-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:3.5mm;">2</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;padding-top:3.5mm;">
            Add lines 1a, 1b and 1c. See instructions for the adjustment you must make for salaries and wages
          <!--Dotted Line-->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalWages"/>
                </xsl:call-template>
                <span class="styBoldText"/>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-top:0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;">
                  <br/>
                </div>
        2
        </div>
              <div class="styLNAmountBox" style="height:8.3mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalWages"/>
                </xsl:call-template>
              </div>
            </div>
            <!--Line 3 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styLNDesc">
                <span style="float:left;">opportunity credit from partnerships, S corporations, cooperatives, estates, and trusts </span>
                  <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.  
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
                </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/PassThruWorkOpportunityCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!--Line 4 Begin-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
                Add lines 2 and 3. Partnerships and S corporations, report this amount on Schedule K; all others, go to 
              <span style="float:left;">line 5 </span>
               <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
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
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="padding-top:0mm;padding-bottom:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;
                background-color:lightgrey;">
                  <br/>
                </div>
                4
              </div>
              <div class="styLNAmountBox" style="height:4mm;padding-top:.5mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalWagesPlusWOCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 5 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">5</div>
              <div class="styLNDesc" style="width:138mm;">
              <span style="float:left;">Work opportunity credit included on line 4 from passive activities (see instructions) </span>
              <!--Dotted Line-->
                <span class="styBoldText"  style="float:right;padding-right:1mm;">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.  
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
                </span>
              </div>
              <div class="styLNRightNumBox">5</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/WorkOpptCrFromPassiveActy"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 6 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">6</div>
              <div class="styLNDesc" style="width:138mm;">
                <span style="float:left;">Subtract line 5 from line 4 </span>
   <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
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
              <div class="styLNRightNumBox">6</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/WorkOpptCrFromTotWagesPlusWOCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 7 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">7</div>
              <div class="styLNDesc" style="width:138mm;">
                <span style="float:left;">Work opportunity credit allowed for 2008 from a passive activity (see instructions) </span>
      <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:16px;"/>.  
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.  
          </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;padding-bottom:.5mm;">
               7
        </div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/WorkOpptCr2008FromPassiveActy"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Line 8-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
             Carryforward of any work opportunity credit that originated in a tax year that began after 2006 and
             <span style="float:left;">carryforward from 2007 of the New York Liberty Zone business employee credit </span>
          <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:16px;"/>.  
                <span style="width:16px;"/>.  
                <span style="width:16px;"/>.  
                <span style="width:16px;"/>.  
                <span style="width:16px;"/>.  
          </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-top:0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
       8
        </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4.2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/CfwdWorkOpptCrTYBeginAfter2006"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 9 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">9</div>
              <div class="styLNDesc" style="width:138mm;">
                <span style="float:left;">Carryback of the work opportunity credit from 2009 (see instructions) </span>
               <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span style="width:16px;"/>.  
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.  
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.  
          </span>
              </div>
              <div class="styLNRightNumBox">9</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/CarryBackWorkOpptCrFrom2009"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 10 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">10</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
        Add lines 6 through 9. Cooperatives, estates, and trusts, continue on to line 11. All others, report this <span style="float:left;">amount on Form 3800, line 29b </span>
        <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
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
              <div class="styLNRightNumBox" style="height:4mm;padding-top:0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        10
        </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4.2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalCredits"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 11 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">11</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
                Amount allocated to the patrons of the cooperative or beneficiaries of the estate or trust 
                (see <span style="float:left;">instructions) </span>
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
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
              <div class="styLNRightNumBox" style="height:4mm;padding-top:0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        11
        </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4.2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/AmountAllocation"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 12 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">12</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
                Cooperatives, estates, and trusts, subtract line 11 from line 10. Report this amount on Form 3800, line <span style="float:left;">29b </span>     
                <!--Dotted Line-->
                <span class="styBoldText" style="float:right;padding-right:1mm;">
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
            <span style="width:16px;"/>.  
          </span>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:0mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
        12
        </div>
              <div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/EstatesTrustsCoopsWorkOpCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--End of form-->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
          Cat. No. 13570D 
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:14px;"/>
            <span style="width:8px;"/>
       Form <span class="styBoldText">5884</span> (2008)
        </div>
          <!--<br class="pageEnd"/>-->
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
              <xsl:with-param name="TargetNode" select="$Form5884Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
