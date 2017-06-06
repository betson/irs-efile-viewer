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
    <!-- Updated 5/8/2012-->
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
            <div class="styFNBox" style="width:31mm;height:20mm;">
            Form <span class="styFormNumber">&#160;5884</span><br/>
            <div style="margin-top:4.5mm;">
             <span class="styAgency">Department of the Treasury</span><br/>
             <span class="styAgency">Internal Revenue Service</span>
           </div>
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
          <div class="styTYBox" style="width:30mm;height:20mm;">
            <div class="styOMB" style="height:2mm;">
              OMB No. 1545-0219
            </div>
            <div class="styTaxYear">
              20<span class="styTYColor">12</span>
            </div>
            <div>
              <span style="padding-right:6mm;">Attachment</span>
                Sequence No. <span class="styBoldText">77</span>
            </div>
          </div>
        </div>
        <!-- Begin Names and Identifying number section -->
        <div class="styBB" style="width:187mm;">
          <div class="styNameBox" style="width:148mm;height:8mm;font-size:7pt;">
            Name(s) shown on return<br/>
            <span>
              <xsl:choose>
                <xsl:when test="$RtnHdrData/ReturnType='1040'">								  
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">Name</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </div>
          <div class="styEINBox" style="width:35mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Identifying number<br/>
            <span style="width:34mm; text-align:left;font-weight:normal;padding-top:2mm;">
              <xsl:choose>
                <xsl:when test="$RtnHdrData/ReturnType='1040'">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
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
              certified as members of a targeted group.       
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:11mm;border-right-width:1px;padding-top:0mm;"/>
            </div>
            <!-- Begin Line 1a -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
              <div class="styLNDesc" style="width:138mm;">
                Qualified first-year wages of employees who worked for you                
                <span style="float:left;width:60mm;">at least 120 hours but fewer than 400 hours</span>
                <!--Dotted Line-->
                <span class="styDotLn" style="padding-right:1mm;">.....</span>
                <span style="float:right;padding-right:6mm;">
<span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
<span style="width:32mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;float:">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form5884Data/WagesBetween120And399Hours"/>
                  </xsl:call-template>
                </span>
                <span style="width:18mm;">
                  <span style="width:4px;"/>X 25% (.25)</span>
                  </span>
                </div>
                  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:0mm;"/>
                  <div class="styLNAmountBoxNBB" style="padding-top:0mm;"/>
                  <div class="styLNRightNumBox" >1a</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalWagesBetween120And399Hrs"/>
                </xsl:call-template>
              </div>
             </div>
<!-- End Line 1a --> 
<!-- Begin Line 1b -->
 <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:138mm;">
                Qualified first-year wages of employees who worked for you                
                <span style="float:left;width:27mm;">at least 400 hours</span>
                <!--Dotted Line-->
                <span class="styDotLn" style="padding-right:1mm;">............</span>
                <span style="float:right;padding-right:6mm;">
<span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
<span style="width:32mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;float:">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form5884Data/WagesFor400HoursOrMore"/>
                  </xsl:call-template>
                </span>
                <span style="width:18mm;">
                  <span style="width:4px;"/>X 40% (.40)</span>
                  </span>
                </div>
                  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:0mm;height:6mm"/>
                  <div class="styLNAmountBoxNBB" style="padding-top:0mm;height:6mm"/>
                  <div class="styLNRightNumBox" >1b</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/CreditForWagesOf400OrMoreHours"/>
                </xsl:call-template>
              </div>
             </div>
      <!-- End Line 1b -->
        <!-- Begin Line 1c -->
   <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:138mm;">
                Qualified second-year wages of employees certified as              
                <span style="float:left;width:54mm;">long-term family assistance recipients</span>
                <!--Dotted Line-->
                <span class="styDotLn" style="padding-right:1mm;">......</span>
                <span style="float:right;padding-right:6mm;">
<span style="width:3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;">$</span>
<span style="width:32mm;text-align:right;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width:1px; border-left-width: 0px; border-right-width: 0px;float:">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form5884Data/QualifiedSecondYearWages"/>
                  </xsl:call-template>
                </span>
                <span style="width:18mm;">
                  <span style="width:4px;"/>X 50% (.50)</span>
                  </span>
                </div>
                  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:0mm;"/>
                  <div class="styLNAmountBoxNBB" style="padding-top:0mm;"/>
                  <div class="styLNRightNumBox" >1c</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalQualifiedSecondYearWages"/>
                </xsl:call-template>
              </div>
             </div>
            <!--Line 2 Begin-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:3.5mm;">2</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;padding-top:3.5mm;">
            Add lines 1a, 1b and 1c. See instructions for the adjustment you must make to salaries and wages
          <!--Dotted Line-->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalWages"/>
                </xsl:call-template>
                <span class="styBoldText"/>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:0mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="padding-top:0mm;height:4mm;"/>
              <div class="styLNRightNumBox" >2</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalWages"/>
                </xsl:call-template>
              </div>
            </div>
            <!--Line 3 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styLNDesc">
                <span style="float:left;">Work opportunity credit from partnerships, S corporations, cooperatives, estates, and trusts </span>                
                <!-- Dotted Line -->
                <span  class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;margin-right:2mm;">...</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.25mm;padding-top:.5mm;padding-bottom:.5mm;">3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/PassThruWorkOpportunityCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 4 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">4</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
         Add lines 2 and 3. Cooperatives, estates, and trusts, go to line 5. Partnerships and S corporations, stop here and report this amount on Schedule K. All others, stop here and report this amount on Form 3800,<span style="float:left;">line 4b </span>
          <!-- Dotted Line -->
          <span  class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;margin-right:2mm;">...............................</span>
              </div>
              <div class="styLNRightNumBox" style="height:11mm;padding-top:3mm">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;"/>
        4
        </div>
              <div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/TotalCredits"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 5 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">5</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
                Amount allocated to the patrons of the cooperative or beneficiaries of the estate or trust 
                (see <span style="float:left;">instructions) </span>
                <!-- Dotted Line -->
                <span  class="styDotLn" style="float:right;font-weight:bold;padding-right:1mm;margin-right:2mm;">.............................</span>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:0mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="padding-top:0mm;height:4mm;"/>
              <div class="styLNRightNumBox" >5</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form5884Data/AmountAllocation"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 6 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:8mm;padding-top:4.1mm;padding-left:2mm">6</div>
              <div class="styLNDesc" style="width:138mm;height:8mm;padding-top:4.1mm;">
                Cooperatives, estates, and trusts, subtract line 5 from line 4. Report this amount on Form 3800, line 4b
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:0mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="padding-top:0mm;height:4mm;"/>
              <div class="styLNRightNumBoxNBB" >6</div>
              <div class="styLNAmountBoxNBB">
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
       Form <span class="styBoldText">5884</span> (2012)
        </div>
        <!--Page break for printing on separate page-->
          <br class="pageEnd"/>
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
			  <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 8: Form 8884 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form5884Data/CfwdWorkOpptCrTYBeginAfter2006/@form8884Indicator" />
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>                          
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
