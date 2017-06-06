<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8820Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8820"/>
  <xsl:template match="/">
    <html>
      <head>
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
        <meta name="Description" content="Form IRS 8820"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8820Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form8820">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 21mm">
            <div class="styFNBox" style="padding-top: 1mm;width:31mm;font-size: 7pt;height: 21mm">
            Form <span class="styFormNumber">8820</span>
              <br/>
              <div class="styAgency" style="padding-top: 1mm">(Rev. December 2008)</div>
              <div class="styAgency" style="padding-top: 1mm">Department of the Treasury<br/>Internal Revenue Service</div>
            </div>
            <div class="styFTBox" style="padding-top: 1mm; width:125mm">
              <div class="styMainTitle">Orphan Drug Credit</div>
              <div class="styFST" style="padding-top: 2mm; height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold">
                <br/>
                <img src="{$ImagePath}/8820_Bullet.gif" alt="MediumBullet"/>  
                Attach to your tax return.
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px">
              <div class="styOMB" style="height:8mm;padding-top:2mm">OMB No. 1545-1505</div>
              <div class="stySequence" style="padding-top:2mm">Attachment<br/>Sequence No. <b>103</b>
              </div>
            </div>
          </div>
          <!--  End title of Form  -->
          <!--  Name and Employer identification number  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:146.3mm;font-weight:normal;font-size:7pt;">
              Name(s) shown on return
              <br/>
              <div style="font-family:verdana;font-size:6pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- Close The Name line -->
            <div class="styEINBox" style="padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Identifying number</span>
              <div class="styNormalText" style="text-align:left; padding-top:2mm;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  End Name and Employer indentification number  -->
          <!--  L1 -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">1</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;">
                <span style="float:left;">Qualified clinical testing expenses paid or incurred during the tax year</span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">1</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QualifiedClinicalTestExpnssPd"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L1 -->
          <!--  L2a -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">2a</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm">
                <span style="float:left;">Current year credit. Multiply line 1 by 50% (.50) (see instructions)
              <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCredit"/>
                  </xsl:call-template>
                </span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">2a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L2a -->
          <!--  L2b -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height: 8mm; padding-top: 3mm">2b</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;height: 6mm; padding-top: 3mm;">
              Enter the amount from the employer differential wage credit line of Form 3800 (e. g., line 1w of the 2008 Form 3800) that is attributable to employees       
              whose wages were used to figure the credit on line 2a <span style="float:left;">above </span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:10mm; padding-top: 9mm;">2b</div>
              <div class="styLNAmountBox" style="height:10mm; padding-top: 9mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/EmployerDiffWageCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L2b -->
          <!--  L2c -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">2c</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm">
                <span style="float:left;">Subtract line 2b from 2a. If zero or less, enter -0-
              <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/CYCLessEmployerDiffWageCrAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox">2c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CYCLessEmployerDiffWageCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L2c -->
          <!--  L3 -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm">
                <span style="float:left;">Orphan drug credit from partnerships, S corporations, estates, or trusts</span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                </span>
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox">3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/OrphanDrugCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L3 -->
          <!--  L4 -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height: 10mm; padding-top: 3mm">4</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;height: 6mm; padding-top: 3mm;">Add lines 2c and 3. Estates and trusts go
              to line 5. Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on the
              applicable line of Form 3800 (e.g., line 1h of the <span style="float:left;">2008 Form 3800) 
              <span style="width:2mm;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 4 - 1041 Portion Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphanDrugCr/@indicatorPortion1041"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 4 - 1041 Portion Amount</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphanDrugCr/@portionAmount1041"/>
                    <xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
                  </xsl:call-template>
                </span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                 <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                </span>
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox" style="height:10mm; padding-top: 9.5mm; border-bottom-width:1px">4</div>
              <div class="styLNAmountBox" style="height:10mm; padding-top: 9.5mm; border-bottom-width:1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphanDrugCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L4 -->
          <!--  L5 -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">5</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm">
                <span style="float:left;">Amount allocated to the beneficiaries of the estate or trust (see instructions) </span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox">5</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AmountAllocatedtoBeneficiaries"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L5 -->
          <!--  L6 -->
          <div class="styBB" style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height: 8mm; padding-top: 3mm">6</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;height: 6mm; padding-top: 3mm;">
              Estates and trusts. Subtract line 5 from line 4. Report this amount on the applicable line of
              Form 3800 <span style="float:left;">(e.g., line 1h of the 2008 Form 3800) </span>
                <span class="styBoldText" style="float:right;padding-right:1mm;">
                  <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
              </span>
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox" style="height:8mm; padding-top: 7mm; border-bottom-width:0px">6</div>
              <div class="styLNAmountBox" style="height:8mm; padding-top: 7mm; border-bottom-width:0px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/EstatesandTrustsCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L6 -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see back of form. </span>
            <span style="width:100px;"/>                      
              Cat. No. 11208S 
            <span style="width:100px;"/>  
              Form <span class="styBoldText">8820</span> (Rev. 12-2008)
          </div>
          <br/>
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
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 4 - 1041 Portion Iindicator </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphanDrugCr/@indicatorPortion1041"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 4 - 1041 Portion Amount </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphanDrugCr/@portionAmount1041"/>
              <xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
