<?xml version="1.0" encoding="UTF-8"?>
<!--Updated per UWR 36537 on 06/16/2011  although not listed in UWR which updated Tax Year on ETA Several FormsBy Robert Jones -->
<!--Updated per UWR 40639 on 07/07/2011 but no changes made as Tax Year done in prior UWR By Robert Jones -->
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
    <html lang="EN-US">
      <head>
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
            <div class="styFNBox" style="width:31mm;height:21mm;">
            Form <span class="styFormNumber">8846</span>
              <br/>
              <br/>
              <div style="padding-top:2mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:13mm;">
              <div class="styMainTitle">
          	Credit for Employer Social Security and Medicare Taxes<br/>
          	Paid on Certain Employee Tips      
          </div>
              <br/>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:4mm;">
                <img src="{$ImagePath}/8846_Bullet_Md.gif" width="4" height="7" alt="Bullet Image"/>
              Information on Form 8846 and its instructions is available at www.irs.gov/form8846.
          </div>
            </div>
            <!-- This can be taken out later -->
            <div class="styTYBox" style="width:30mm;height:21mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1414</div>
              <div class="styTY" style="height:7.5mm;font-size:24pt;">
           20<span class="styTYColor">11</span>
              </div>
              <div class="stySequence">Attachment<br/>Sequence No. <b>98</b>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:156mm;height:8mm;font-weight:normal;font-size:7pt;">
            Name(s) shown on return
            <br/>
              <div style="font-family:verdana;font-size:6pt;height:6.25mm">
              <!-- Added per UWR 31342 to allow 1040/ssn filer to use this form -->
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
              </div>
            </div>
            <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;">
              Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
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
          <!-- End Names and Identifying number section -->
          <!--Note Line -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;padding-bottom:.5mm;">
            <b>Note.</b>
          Claim this credit <b>only</b> for social security and Medicare taxes paid by a food or beverage establishment where tipping is customary for providing food or beverages. See the instructions for line 1.
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
                  <xsl:with-param name="TargetNode" select="$Form8846Data/TipsRcvdByEmployeesForServices"/>
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
                  <xsl:with-param name="TargetNode" select="$Form8846Data/TipsNotSubjectToTheCreditPrvsn"/>
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
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>  
              3
            </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CreditableTips"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- L4 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">4</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:8mm;padding-right:1mm;">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8846Data/EmpWagesExceededMaxAmt"/>
                    <xsl:with-param name="BackupName">IRS8846EmpWagesExceededMaxAmt</xsl:with-param>
                  </xsl:call-template>
                    Multiply line 3 by 7.65% (.0765). If you had any tipped employees whose wages (including tips) 
                  <span style="float:left;">exceeded $106,800, see instructions and check here.  
              <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8846Data/EmpWagesExceededMaxAmt"/>
                  </xsl:call-template>
                  </span>
                </label>
                <span style="float:right;">
                <!--Dotted Line-->
                <span style="letter-spacing:3.4mm;font-weight:bold;skiplink:display:none;">.............</span>
                <!--<span style="padding-left:3.5mm;">-->
                <img src="{$ImagePath}/8846_Bullet_Md.gif" width="4" height="7" alt="Bullet Image"/>
                <!--</span>-->
                <span style="width:1mm;"/>
                <input type="checkbox" class="styCkbox" style="padding-right:1mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8846Data/EmpWagesExceededMaxAmt"/>
                    <xsl:with-param name="BackupName">IRS8846EmpWagesExceededMaxAmt</xsl:with-param>
                  </xsl:call-template>
                </input>
                </span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
              4
            </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CurrentYearCredit"/>
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
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CrdtsForEmplrSSAndMedicareTxs"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Line 6 -->
            <div class="styTBB" style="width:187mm;">
             <div style="float:left;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">6</div>
              <div class="styLNDesc" style="font-size:7pt; width:138.9mm;height:9.5mm;">
                Add lines 4 and 5. Partnerships and S corporations, report this amount on Schedule K. All others,  
              <span style="float:left;">report this amount on Form 3800, line 4f </span>
		<!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
              </div>
              </div>
              <div class="styLNRightNumBox" style="height:9.5mm;padding-top:0mm;border-bottom-width:0px;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
                6
              </div>
              <div class="styLNAmountBox" style="height:9.5mm;padding-top:1mm;border-bottom-width:0px;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/AddLines4And5"/>
                </xsl:call-template>
              </div>
            </div>
            <!--
            
            Part I, line 6
            <div class="styTBB" style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">6</div>
                <div class="styLNDesc" style="width:139mm;height:9.5mm;">
                    Cooperatives, estates, and trusts subtract line 5 from line 4. Report this amount on Form 3800, 
<span style="float:left;">Part III, line3  </span>
                    <span class="styDotLn" style="padding-right:2mm;">......</span>
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:9.5mm;padding-top:4mm;">6</div>
                <div class="styLNAmountBox"  style="height:9.5mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/CreditWithoutPssvActyForPY"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            
            
            
            
            -->
            
            
            
            
            
            <!-- L7  Removed lines 7 through 12 per UWR 43852 08/2011 - Robert Jones 
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">7</div>
              <div class="styLNDesc" style="width:139mm;height:8mm;">
    		    Credit for employer social security and Medicare taxes paid on certain employee tips included on line 6 
    		<span style="float:left;">from passive activities (see instructions) </span>
           
                <span style="letter-spacing:3.4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">....................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
                7
              </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/EmployerCrForEmployeeTipsIncld"/>
                </xsl:call-template>
              </div>
            </div>
           
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
                <span style="float:left;">Subtract line 7 from line 6 </span>
       
                <span style="letter-spacing:3.3mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">..........................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
              8
            </div>
              <div class="styLNAmountBox" style="height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/SubtractLine7From6"/>
                </xsl:call-template>
              </div>
            </div>
          
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">9</div>
              <div class="styLNDesc" style="width:139mm;height:8mm;">
                Credit for employer social security and Medicare taxes paid on certain employee tips allowed for 2009 
                <span style="float:left;">from passive activities (see instructions) </span>
             
                <span style="letter-spacing:3.4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">....................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
              9
            </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/EmployerCrForEmployeeTipsAllw"/>
                </xsl:call-template>
              </div>
            </div>
            
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:8mm;">10</div>
              <div class="styLNDesc" style="width:139mm;height:8mm;">
                Carryforward of the credit for employer social security and Medicare taxes paid on certain employee tips 
              <span style="float:left;">that originated in a tax year that began after 2006 (see instructions) </span>
              
                <span style="letter-spacing:3.4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">...........</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
                10
              </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CarryfowardCredit"/>
                </xsl:call-template>
              </div>
            </div>
            
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:8mm;">11</div>
              <div class="styLNDesc" style="width:139mm;height:8mm;">
                  Carryback of the credit for employer social security and Medicare taxes paid on certain employee tips 
                  <span style="float:left;">from 2010 (see instructions) 
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Form 8846, Line 11 - Credit Indicator</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CarrybackCredit/@creditIndicator"/>
                </xsl:call-template>
                </span>
               
                <span style="letter-spacing:3.4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.......................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:0mm;">
                <div class="styLNRightNumBoxNBB" style="width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>
                  11
                </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:1mm;">
                <br/>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/CarrybackCredit"/>
                </xsl:call-template>
              </div>
            </div>
            
            <div style="width:187mm" class="styBB">
              <div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;">
                  <span style="float:left;">Add lines 8 through 11. Report this amount on Form 3800, line 29f </span>
                  
                <span style="letter-spacing:3.3mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:.5mm;border-bottom:0px">
                12
              </div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-top: .5mm;border-bottom:0px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8846Data/AddLines8Through11"/>
                </xsl:call-template>
              </div>
 -->
            </div>
          
         
          <!-- Page footer -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
            <span style="width:128px;"/>  
                Cat. No. 16148Z
              <span style="width:115px;"/>  
                Form <span class="styBoldText">8846</span> (2011)
            </div>
          <!--Page End break -->
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
