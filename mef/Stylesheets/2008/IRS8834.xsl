<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="IRS8834Style.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8834"/>
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
        <meta name="Description" content="Form IRS 8834"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8834Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form8834">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 20mm">
            <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm">
      Form <span class="styFormNumber">8834</span>
              <br/>
              <span class="styAgency">(Rev. Novmber 2008)</span>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="height: 22mm;width:125mm">
              <div class="styMainTitle" style="height: 8mm">Qualified Electric Vehicle Credit</div>
              <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold">
                <br/>
                <div style="margin-left: 1.5mm; padding-top:1mm">
                  <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>  
          Attach to your tax return.
        </div>
                <div style="padding-top:1.5mm">
                  <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>  
          See instructions on back.
        </div>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1374</div>
              <div class="styTY" style="height:10mm">20<span class="styTYColor">08</span>
              </div>
              <div class="stySequence">Attachment<br/>Sequence No. <b>111</b>
              </div>
            </div>
          </div>
          <!--  End title of Form  -->
          <!--  Name and Employer identification number  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
              <div style="font-family:verdana;font-size:6pt;height:6mm">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div class="styEINBox" style=" padding-left:2mm; font-size:7pt;">
              <span class="BoldText">Identifying number</span>
              <div style="text-align:left;font-weight:normal; ">
                <br/>
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/IdentifyingNumber) != ''">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$FormData/IdentifyingNumber"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
          </div>
          <!--  End Name and Employer indentification number  -->
          <!--  Part I -->
          <div class="styBB" style="width:187mm;font-size:8pt;">
            <b>Caution.</b> This form only applies to qualified electric vehicle passive activity credits from prior
             years allowed on Form <br/>8582-CR or Form 8810 for the current tax year.</div>
          <!--  End Part I -->
          <!--  Line 1 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">1</div>
            <div style="float:left">
             Passive activity credits allowed for your current tax year (see instructions)</div>
            <div style="float:right">
              <span style="letter-spacing:4mm; font-weight:bold; float:left">........</span>
              <div class="styLNRightNumBox" style="border-bottom-width: 1px">1</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/PassiveActivityCreditsAllowed"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  Line 2 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">2</div>
            <div style="float:left">
               Regular tax before credits (see instructions)
            </div>
            <div style="float:right">
              <span style="letter-spacing:4mm; font-weight:bold; float:left">.................</span>
              <div class="styLNRightNumBox" style="border-bottom-width: 1px">2</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/RegularTaxBeforeCredits"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- line 3  -->
          <!-- blank line first -->
          <div class="styBB" style="width:187mm;">
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">3</div>
              <div class="styLNDesc" style="width:139.2mm;height:4mm">
          Credits that reduce regular tax before the qualified electric vehicle credit:
        </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey; border-bottom-width: 0px"/>
              <div class="styLNAmountBox" style="width:31mm;height:4.5mm;border-bottom-width: 0px"/>
            </div>
            <!-- line 3a  -->
            <div style="width:187mm;height:8mm">
              <div class="styLNLeftLtrBox" style="height:4mm;padding-top:4mm;">a</div>
              <div class="styLNDesc" style="width:99.2mm;height:4mm;padding-top:4mm;">
                Personal credits from Form 1040 or 1040NR (see instructions)
              <span style="letter-spacing:4mm; font-weight:bold">  
            ...
          </span>
              </div>
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.5mm;padding-bottom:0px">3a</div>
              <div class="styLNAmountBox" style="height:8.5mm;padding-top:4.5mm;padding-bottom:0px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/xxx"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:8.5mm;border-right-width:1px;"/>
            </div>
            <!-- Line 3b-->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox">b</div>
              <div class="styLNDesc" style="width:99.2mm">
             Foreign tax credit
          
                    <!--Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold">  
            ...............
          </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
              <div class="styLNAmountBox" style="height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCredits"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
            </div>
            <!-- Line 3c-->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox">c</div>
              <div class="styLNDesc" style="width:99.2mm">
             American Samoa economic development credit (Form 5735)
          
                    <!--Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold">...
          </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">3c</div>
              <div class="styLNAmountBox" style="height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AmericanSamoaEconomicDevCredit"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
            </div>
            <!-- Line 3d -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4mm;">d</div>
              <div class="styLNDesc" style="width:139.2mm;height:4mm;">
               Add lines 3a through 3c
            <!--Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold">  
              ......................
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">3d</div>
              <div class="styLNAmountBox" style="height:4.5mm;width:31mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/SumOfCredits"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Line 4  -->
            <!-- blank line -->
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139.2mm;height:4mm;float:right:"/>
            <div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-bottom-width:0px;border-right-width:1px;
                        padding-top:0mm;background-color:lightgrey;"/>
            <!-- line 4 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">4</div>
              <div class="styLNDesc" style="width:139.2mm;height:4mm;">
                Net regular tax. Subtract line 3d from line 2. If zero or less, <b>do not </b>file this form; you cannot
                claim this
              </div>
              <div class="styLNRightNumBoxNBB"/>
              <div class="styLNAmountBoxNBB" style="height:4mm;width:31mm"/>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:139.2mm;height:4mm;">
                 credit
          <!--Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold">  
              ...........................
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
              <div class="styLNAmountBox" style="height:4.5mm;width:31mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/NetRegularTax"/>
                </xsl:call-template>
              </div>
            </div>
            <!--  Line 5  -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">5</div>
              <div class="styLNDesc" style="width:139.2mm;height:4mm;">
          		 Tentative minimum tax (see instructions)
          	    <span style="letter-spacing:4mm; font-weight:bold">..............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
              <div class="styLNAmountBox" style="height:4.5mm;width:31mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TentativeMinimumTax"/>
                </xsl:call-template>
              </div>
            </div>
            <!--  Line 6  -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">6</div>
              <div class="styLNDesc" style="width:139.2mm;height:4mm;">
          		Subtract line 5 from line 4. If zero or less, <b>do not </b>
          		file this form; you cannot claim this credit
          	    <span style="letter-spacing:4mm; font-weight:bold">....</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
              <div class="styLNAmountBox" style="height:4.5mm;width:31mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ExcessOfNetOverTentativeTax"/>
                </xsl:call-template>
              </div>
            </div>
            <!--  Line 7  -->
            <!-- blank line -->
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139.2mm;height:4mm;float:right:"/>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;padding-top:0mm;
            background-color:lightgrey;"/>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">7</div>
              <div class="styLNDesc" style="height:4mm;width:139.2mm;padding-right:0mm;">
                <span class="styBoldText">Qualified electric vehicle credit.</span>
                 Enter the <span class="styBoldText">smaller</span> 
                 of line 1 or 6 here and on the appropriate line of your return (see instructions). 
                 If line 6 is smaller than line 1, see instructions
		<!--Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold;">........</span>
                <span style="width:2mm"/>
                <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;padding-top:4mm">7</div>
              <div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;padding-top:4mm;width:31mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AllowableQlfyElectricVehicleCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end of page -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see back of form. </span>
            <span style="width:120px;"/>                      
          Cat. No. 14953G 
          <span style="width:125px;"/>  
          Form <span class="styBoldText">8834</span> (2008)
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
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
