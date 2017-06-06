<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8827Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8827Data" select="$RtnDoc/IRS8827"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8827Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 8827"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--HINTS:  Form 8827 CSS Styles are located in the template called below    
			                 Work sheet (Page 2 of PDF) Do not need to be display per customer-->
            <xsl:call-template name="IRS8827Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
      <form name="Form8827">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
         <div class="styFNBox" style="width:31mm;height:20mm;">
              Form <span class="styFormNumber">8827</span>
           <!--General Dependency Push Pin --> 
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8827Data"/>
              </xsl:call-template>
              <br/>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:123mm;height:20mm;">
              <div class="styMainTitle" style="height:8mm;padding-top:1mm;">
                Credit for Prior Year Minimum Tax-Corporations
              </div>
            
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:2mm">
                <img src="{$ImagePath}/8827_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
                  Attach to the corporation's tax return.
              </div>
               <div class="styFST" style="height:5mm;font-size:7pt;padding-top:2mm;font-size:6.5pt">
                <img src="{$ImagePath}/8827_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
                  Information about Form 8827 and its instructions is at 
   <a href="http://www.irs.gov/form8827" title="Link to IRS.gov">
                <i>www.IRS.gov/form8827.</i>
            </a>               
            </div>
            </div>
            <div class="styTYBox" style="width:32mm;height:20mm;">
              <div class="styOMB" style="height:2mm;">
                OMB No. 1545-0123
              </div>
              <div class="styTY" style="height:11mm;padding-top:2mm;">
                20<span class="styTYColor">14</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:140.75mm;height:10mm;font-size:7pt;">
              Name<br/>
           <span style="font-size: 7pt; font-weight: normal">
			 <xsl:choose>
			     <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
				     <xsl:call-template name="PopulateReturnHeaderFiler">
					 <xsl:with-param name="TargetNode">Name</xsl:with-param>
					 </xsl:call-template>
				</xsl:when>
				 <xsl:otherwise>
				     <xsl:call-template name="PopulateReturnHeaderFiler">
					 <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
					 </xsl:call-template>
					 <br/> 
					 <xsl:call-template name="PopulateReturnHeaderFiler">
					 <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					 </xsl:call-template>						
				</xsl:otherwise>
			</xsl:choose>
			</span>
            </div>
            <!--EIN-->
            <div class="styEINBox" style="width:46mm;height:4mm;font-size:7pt;float:left;padding-left:1mm;">
              Employer identification number
              <br/>
              <br/>
              <span style="font-weight:normal">
     <xsl:choose>
		     <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
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
          <!-- End Names and Identifying number section -->
          <!--Blank Line-->
          <div class="styBB" style="width:187mm">
            <!--L1-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">1</div>
              <div class="styLNDesc" style="width:138.75mm;">
                Alternative minimum tax (AMT) for 2013.  Enter the amount from line 14 of the 2013 Form 4626                
              </div>
              <div class="styLNRightNumBox">1</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/PYAlternativeMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L2-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">2</div>
              <div class="styLNDesc" style="width:138.75mm;">
                Minimum tax credit carryforward from 2013.  Enter the amount from line 9 of the 2013 Form 8827      
              </div>
              <div class="styLNRightNumBox">2</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/PriorYearMinimumTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L3-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">3</div>
              <div class="styLNDesc" style="width:138.75mm;">
                <span style="float:left;">
                Enter any 2013 unallowed qualified electric vehicle credit (see instructions). </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
              </div>
              <div class="styLNRightNumBox">3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8827Data/QlfyElecVehPYUnallowedCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L4-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">4</div>
              <div class="styLNDesc" style="width:138.75mm;">
                <span style="float:left;">
                Add lines 1, 2, and 3 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
              </div>
              <div class="styLNRightNumBox">4</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/TotalPriorYearMinimumTaxCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L5-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">5</div>
              <div class="styLNDesc" style="width:138.75mm;">
                Enter the corporation's 2014 regular income tax liability minus allowable tax credits (see instructions)                    
              </div>
              <div class="styLNRightNumBox">5</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/CYRegTaxLiabiMinusAllwblCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L6-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">6</div>
              <div class="styLNDesc" style="width:138.75mm;">
                Is the corporation a "small corporation" exempt from the AMT for 2014 (see instructions)?
                <br/>
               <img src="{$ImagePath}/8827_Bullet_Round.gif" width="6" height="6" alt="Bullet Image"/>
                <span class="styBoldText">  Yes. </span> Enter 25% of the excess of line 5 over $25,000.  If line 5 is $25,000 or less, enter -0-
                <br/>
               <span style="float:left;">
               <img src="{$ImagePath}/8827_Bullet_Round.gif" width="6" height="6" alt="Bullet Image"/>
                  <span class="styBoldText">  No. </span> 
                  Complete Form 4626 for 2014 and enter the tentative minimum tax from line 12 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
              </div>
              <div class="styLNRightNumBox" style="padding-top:6.5mm;">6</div>
              <div class="styLNAmountBox" style="padding-top:6.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/SmallCorporationExemptAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L7a-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:3mm;">7a</div>
              <div class="styLNDesc" style="width:138.75mm;height:3mm;">
                <span style="float:left;">
                Subtract line 6 from line 5.  If zero or less, enter -0- </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
              </div>
              <div class="styLNRightNumBox" style="height:3.5mm;">7a</div>
              <div class="styLNAmountBox" style="height:3.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/NetSmallCorporationExemptAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L7b-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:6mm;padding-left:3mm;">b</div>
              <div class="styLNDesc" style="width:138.75mm;height:6mm;">
                For a corporation electing to accelerate the minimum tax credit, enter the bonus depreciation amount 
                 <span style="float:left;">attributable to the minimum tax credit (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
              </div>
              <div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">7b</div>
              <div class="styLNAmountBox" style="height:7.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/BonusDepreciationAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L7c-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">c</div>
              <div class="styLNDesc" style="width:138.75mm;height:3mm;">
                <span style="float:left;">
                Add lines 7a and 7b </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
              </div>
              <div class="styLNRightNumBox" style="height:3.5mm;">7c</div>
              <div class="styLNAmountBox" style="height:3.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/TotalNetBonusDepreciationAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L8a-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox">8a</div>
              <div class="styLNDesc" style="width:138.75mm;">
                  Enter the <span class="styBoldText">smaller</span> 
                  of line 4 or line 7c. If the corporation had a post-1986 ownership change or has pre-
                  <span style="float:left;">acquisition excess credits, see instructions
                  <!-- Adding pen image -->
                  <span style="width:1px;"/>
                  <!-- Form to Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8827Data/SmallerAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 8a - Statement SEC</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form8827Data/SmallerAmt/@section383Or384IndicatorCd"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>                  
                </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">
                  8a          
              </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/SmallerAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L8b-->
            <div style="width:187mm">
         <div class="styLNLeftNumBox" style="height:14mm;padding-left:3mm;">b</div>
         
              <div class="styLNDesc" style="width:138.75mm;">
                 <b>Current year minimum tax credit.</b> Enter the smaller of line 4 or line 7a here and on Form 1120, Schedule J, Part I, line 5d (or the applicable line of your return). If the corporation had a post-1986 ownership change or has pre-acquisition excess credits, see instructions.  If you made an entry on line 7b, go to  
                  <span style="float:left;">line 8c. Otherwise, skip line 8c
                  <!-- Adding pen image -->
                  <span style="width:1px;"/>
<!-- Form to Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 8b - Statement SEC</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt/@section383Or384IndicatorCd"/>
            </xsl:call-template> 
                  <span style="width:1px;"/>                  
                </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
              <!-- <div class="styLNDesc" style="width:138.75mm;height:14mm;">
                <b>Current year minimum tax credit.</b> Enter the smaller of line 4 or line 7a here and on Form 1120, Schedule J, Part I, line 5d (or the applicable line of your return). If the corporation had a post-1986 ownership change or has pre-acquisition excess credits, see instructions. If you made an entry on line 7b, go to line 8c. Otherwise, skip line 8c
                 --><!-- Adding pen image --><!--
                  <span style="width:1px;"/>
                  --><!-- Form to Form Link --><!--
                <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8827Data/CYMinimumTaxCredit"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 8b - Statement SEC</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form8827Data/CYMinimumTaxCredit/@statementSEC"/>
            </xsl:call-template> 
       <b>
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
            </b>
                  <span style="width:1px;"/>                  
                --><!--Dotted Line-->
              </div>
             <div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">8b</div>
              <div class="styLNAmountBox" style="height:14mm;padding-top:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
           <!--L8c-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:10mm;padding-left:3mm;">c</div>
            <div class="styLNDesc" style="width:138.75mm;height:6mm;">
              Subtract line 8b from line 8a. This is the refundable amount for a corporation electing to  accelerate the minimum tax credit. Include this amount on Form 1120,  Schedule J, Part II, line 19c (or the applicable
                 <span style="float:left;">  line of your return) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
              </div>  
              <div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">8c</div>
              <div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
              <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8827Data/OverpaymentAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--L9-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">9</div>
              <div class="styLNDesc" style="width:138.75mm;">
                <span class="styBoldText">Minimum tax credit carryforward to 2015. </span> Subtract line 8a from line 4.  Keep a record of this amount to <span style="float:left;">carry forward and use in future years </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">9</div>
              <div class="styLNAmountBoxNBB" style="height:8mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8827Data/MinimumTaxCreditCarryfowardAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--Page Footer -->
          <div style="width:187mm;text-align:right;">                            
          Cat. No. 13008K        
          <span style="width:240px;"/>  
            Form <span class="styBoldText">8827</span>
            (2014) 
          </div>
          <br/>
          <!--Page break -->
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
              <xsl:with-param name="TargetNode" select="$Form8827Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 8a - Statement SEC</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form8827Data/SmallerAmt/@section383Or384IndicatorCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 8b - Statement SEC</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form8827Data/CurrentYearMinimumTaxCreditAmt/@section383Or384IndicatorCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>