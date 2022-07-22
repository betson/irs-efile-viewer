<?xml version="1.0" encoding="UTF-8"?>
<!--Updated per UWR 36537 on 06/16/2011  although not listed in UWR which updated Tax Year on ETA Several FormsBy Robert Jones -->
<!--Updated per UWR 40639 on 07/07/2011 but no changes made as Tax Year done in prior UWR By Robert Jones -->
<!--Updated per UWR 56925 on 08/23/2012 Changed element at line 4 to EmpWagesExceededMaxAmtInd By Robert Jones -->
<!--Updated per IBM Defect  33282 on 12/04/2012 Changed element at line 4 to EmpWagesExceededMaxAmtInd By Robert Jones Looks like code overwritten at some point with older code-rlj -->
<!--Updated per IBM Defect  38275 on 10/08/2013 Changed link verbiage attop of form to match PDF-rlj -->
<!--Updated per UWR 112011 on 06/17/2014 By Robert Jones -->
<!--Updated per UWR 105805 on 06/18/2014 By Robert Jones -->
<!--Updated per Kisam Im02019323 on 02/10/2015 By Robert Jones -->
<!--Updated per IBM Defect  42875 on 06/02/2015 Additional Data not on page by itself-rlj -->
<!--Updated per IBM Defect  43489 on 07/01/2015 JAWS line 4 multiple readings by Jaws. Put pushpin at end after checkbox-rlj -->
<!--Updated per UWR 158695 on 08/11/2015 By Robert Jones -->
<!--Updated per IBM Defect on 09/02/2015 Additional Data shld not be on page by itself when form is half page or less-rlj -->
<!--Updated per IBM Defect 44849 for 2015 09/29/2015 Additional Data shld not be on page by itself when form is half page or less-rlj -->
<!--Updated per Kisam Im2394173 on 12/15/2015 By Robert Jones -->
<!-- Last modified on 5/18/2017 by Robert Jones UWR 194393 and 195664 Return Headers for 1120, 1041, 1040 and 1040NR  -->
<!-- Last modified on 5/23/2017 by Robert Jones UWR 194393 and 195664 Return Headers for 1120, 1041, 1040 and 1040NR  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8846Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8846Data" select="$RtnDoc/IRS8846"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8846Data)"/>
          </xsl:call-template>
        </title>
        <!-- This is a comment line to be taken out later -->
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 8846"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--This form does not have repeatable data that required separated print format -->
          <xsl:if test="not($Print) or $Print=''">
            <!-- Form 8846 CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS8846Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8846" id="Form8846">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:auto;">
            Form <span class="styFormNumber">8846</span>
              <br/>
              <br/>
              <div style="padding-top:2mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:auto;padding-top:2mm;">
              <div class="styMainTitle">
          	Credit for Employer Social Security and Medicare Taxes<br/>
          	Paid on Certain Employee Tips      
                 <div class="styFST" style="height:auto;font-size:7pt;">
                 <img src="{$ImagePath}/8846_Bullet_Md.gif" width="4" height="7" alt="Bullet Image"/>
              Attach to your tax return.<br/>
                <img src="{$ImagePath}/8846_Bullet_Md.gif" width="4" height="7" alt="Bullet Image"/>
              Information about Form 8846 and its instructions is at <!--www.irs.gov/form8846.-->
              <a href="http://www.irs.gov/form8846" title="Link to IRS.gov">
                <i>www.irs.gov/form8846</i>
            </a>.
          </div>
            </div>
            </div>
            <!-- This can be taken out later -->
            <div class="styTYBox" style="width:30mm;height:auto;">
              <div class="styOMB" style="height:auto;">OMB No. 1545-1414</div>
              <div class="styTY" style="height:auto;font-size:24pt;">
           20<span class="styTYColor">15</span>
              </div>
              <div class="stySequence">Attachment<br/>Sequence No. <b>98</b>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:156mm;height:auto;font-weight:normal;font-size:8pt;">
            Name(s) shown on return
            <br/>
              <div style="font-family:verdana;font-size:7pt;height:auto;">
              <!-- Added per UWR 31342 to allow 1040/ssn filer to use this form -->
         <!--     <xsl:choose>
								    <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
						<br/>
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
			   </xsl:choose>-->
			    <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                         <xsl:call-template name="PopulateFilerName">
                                                            <xsl:with-param name="TargetNode" select="$Form8846Data"/>
                                                         </xsl:call-template> 
              </div>
            </div>
            <div class="styEINBox" style="width:30mm;height:auto;padding-left:2mm;font-size:7pt;">
              Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
         <!--     <xsl:choose>
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
			</xsl:choose>-->
              </span>
              

                <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                     <xsl:call-template name="PopulateFilerTIN">
                                                       <xsl:with-param name="TargetNode" select="$Form8846Data"/>
                                                     </xsl:call-template>
             
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <!--Note Line -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;padding-bottom:.5mm;">
            <b>Note.</b>
          Claim this credit <b>only</b>  for employer social security and Medicare taxes paid by food or beverage establishment where tipping is customary for providing food or beverages. See the instructions for line 1.
        </div>
          <!-- L1 blank line -->
          <div class="styBB" style="width:187mm;">
            <!-- L1  -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:1mm;">1</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:4mm;padding-top:1mm;">
                Tips received by employees for services on which you paid or incurred employer social security and 
                <span style="float:left;">Medicare taxes during the tax year (see instructions) </span>         
            <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
            1
          </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/TotalTipsReceivedAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- L2 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">2</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:4mm;padding-top:4mm;">
                <span style="float:left;">Tips not subject to the credit provisions (see instructions) </span>
              <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
              2
            </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/TipsNotSubjectToCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Line 3 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:4mm;">3</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:4mm;padding-top:4mm;">
                  <span style="float:left;">Creditable tips. Subtract line 2 from line 1 </span> 
            <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;"/>  
              3
            </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CreditableTipsAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- L4 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">4</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:4.5mm;padding-right:1mm;">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8846Data/EmplWageExceededMaxAmtInd"/>
                    <xsl:with-param name="BackupName">IRS8846EmplWageExceededMaxAmtInd</xsl:with-param>
                  </xsl:call-template></label>
                    Multiply line 3 by 7.65% (.0765). If you had any tipped employees whose wages (including tips) 
                exceeded $118,500, see instructions and check here  
              <!--Dotted Line-->
                <span style="letter-spacing:3.4mm;font-weight:bold;skiplink:display:none;">.............
                         <img src="{$ImagePath}/8846_Bullet_Md.gif" width="4" height="7" alt="Bullet Image"/>
                 <span style="width:1mm;"/>
                <input type="checkbox" class="styCkbox" style="padding-right:1mm;height:2.25mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8846Data/EmplWageExceededMaxAmtInd"/>
                    <xsl:with-param name="BackupName">IRS8846EmplWageExceededMaxAmtInd</xsl:with-param>
                  </xsl:call-template>
                </input>
               <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8846Data/EmplWageExceededMaxAmtInd"/>
                  </xsl:call-template>
                  </span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
              4
            </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CurrentYearCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- L5 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">5</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:8mm;">
              Credit for employer social security and Medicare taxes paid on certain employee tips from partnerships 
              <span style="float:left;">and S corporations </span>
  		 <!--Dotted Line-->
              <span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
                5
              </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CrForEmplrSSAndMedcrTxsAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Line 6 -->
            <div class="styTBB" style="width:187mm;">
             <div style="float:left;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">6</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:9.5mm;">
                Add lines 4 and 5. Partnerships and S corporations, report this amount on Schedule K. All others,  
              <span style="float:left;">report this amount on Form 3800, Part III, line 4f </span>
		<!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
              </div>
              </div>
              <div class="styLNRightNumBox" style="height:9.5mm;padding-top:0mm;border-bottom-width:0px;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
                6
              </div>
              <div class="styLNAmountBox" style="height:9.5mm;padding-top:1mm;border-bottom-width:0px;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/TotalCrTipsAndEmplrSSMedcrAmt"/>
                </xsl:call-template>
              </div>
            </div>
           
            </div>
          
         
          <!-- Page footer -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
            <span style="width:128px;"/>  
                Cat. No. 16148Z
              <span style="width:115px;"/>  
                Form <span class="styBoldText">8846</span> (2015)
            </div>
          <!--Page End break -->
       <!--   <div class="pageEnd"/>2014 Per new guidelines this was removed to have additional data on same page when form is a short (half page )-->
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
              <xsl:with-param name="TargetNode" select="$Form8846Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 8846, Line 11 - Credit Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form8846Data/CarrybackCredit/@creditIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
