<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 7/19/2010 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8812Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8812Data" select="$RtnDoc/IRS8812"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8812Data)">
             </xsl:with-param>
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
        <meta name="Description" content="IRS Form 8812"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8812Style"/>
             <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8812" style="font-size:7pt;">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:18mm;">
            <div class="styFNBox" style="width:34mm;height:18mm;padding-top:1.5mm;">
              <div style="height:13mm;">
             Form <span class="styFormNumber" style="padding-left:2mm;" >8812</span>
                <br/>
              </div>
              <div style="height:8mm;padding-top:.75mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
                <span style="padding-left:3mm">(99)</span>
              </div>
            </div>
            <div class="styFTBox" style="width:96mm;text-align:left;height:18mm;">
              <div class="styMainTitle" style="height:11mm;font-size:18pt;padding-top:5mm;padding-left:5mm;">
            Additional Child Tax Credit
          </div>
              <div  style="height:4mm;font-size:7pt;padding-top:5mm;padding-bottom:1mm;text-align:right;">
         <i>Complete and attach to Form 1040, Form 1040A, or Form 1040NR.</i>
          </div>
            </div>
           <div class="styLNDesc" style="width:11mm;padding-right:6mm;padding-top:1mm;padding-bottom:0mm;">

                     <img src="{$ImagePath}/8812_1040_Top_Forms.gif" alt="TopFormsBullet"/>
          </div>
            <div class="styTYBox" style="width:32mm;height:18mm;">
              <div class="styOMB" style="height:2mm;">
            OMB No. 1545-0074
          </div>
              <div class="styTaxYear" style="height:9mm;padding-top:1mm;padding-bottom:1.5mm;">20<span class="styTYColor">12</span>
         </div>
              <div style="text-align:left;padding-left:3mm;">Attachment<br/>Sequence No.
           <span class="styBoldText">47</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">Name</xsl:with-param>
                </xsl:call-template>
             </div>
            <div class="styEINBox" style="width:45mm;height:4mm;padding-left:2mm;font-size:7pt;font-
        weight:bold;">Your social security number
        <br/>
              <span style="width:25mm;text-align:center;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <!-- BEGIN Part I Title -->
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="width:23mm;">Part I</div>
              <div class="styPartDesc" style="width:164mm;">All Filers <span class="styNormalText"/>
              </div>
            </div>
            <!-- END Part I  Title -->
            <!-- Line 1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:9mm;padding-left:3mm;">1</div>
              <div class="styLNDesc" style="width:138mm;height:9mm;">
                <div class="styLNDesc" style="width:24mm">
                  <b>1040 filers:</b>
                </div>
                <div class="styLNDesc" style="width:110mm">
						Enter the amount from line 6 of your Child Tax Credit Worksheet (see the<br/>
						Instructions for Form 1040, line 51).
				</div>
                <div class="styLNDesc" style="width:24mm">
                  <b>1040A filers:</b>
                </div>
                <div class="styLNDesc" style="width:110mm"> 
						Enter the amount from line 6 of your Child Tax Credit Worksheet (see the<br/>
						Instructions for Form 1040A, line 33).
				 </div>
                <br/>
                <div class="styLNDesc" style="width:24mm">
                  <b>1040NR filers:</b>
                </div>
                <div class="styLNDesc" style="width:110mm;">
						Enter the amount from line 6 of your Child Tax Credit Worksheet (see the
						Instructions for Form 1040NR, line 48).
                </div>
                
                <div class="styLNDesc" style="width:130mm;font-size:8pt;font-family:Arial;padding-top:4mm;"> 
					If you used Pub. 972, enter the amount from line 8 of the Child Tax Credit Worksheet in the publication.
				</div>
            </div>
              <div class="styLNDesc" style="width:2.8mm;">
                <img src="{$ImagePath}/8812_Bracket_X_Lg.gif" alt="Curly Bracket Image"/>
 
              </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6mm;padding-top:12mm">1</div>
              <div class="styLNAmountBox" style="height:13mm;padding-top:12mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/ChildTaxCreditWrkshtAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6mm;padding-top:12mm;border-bottom-width:0px"></div>
              <div class="styLNAmountBox" style="height:13mm;padding-top:12mm;border-bottom-width:0px;"></div>
            </div>
            <!--End of line 1 -->
            <!-- Line 2 space -->
            <!--End of line 2space -->
            <!-- Line 2 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
              <div class="styLNDesc" style="width:141mm;height:4mm;">
				<span style="float:left;clear:none;">  
					Enter the amount from Form 1040, line 51, Form 1040A, line 33, or Form 1040NR, line 48
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">..</span> 
              </div>
              <div class="styLNRightNumBox" style="height:4mm;width:6mm;">2</div>
              <div class="styLNAmountBox" style="height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/ChildTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 2 -->
            <!--Line 3 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;">3</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
				<span style="float:left;clear:none;">    
					Subtract line 2 from line 1. If zero, <b>stop;</b> you cannot take this credit
                </span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>    
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">3</div>
              <div class="styLNAmountBox" style="">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NetFromWorksheetAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 3 -->
            <!-- Line 4a -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm">4a </div>
              <div class="styLNDesc" style="width:103mm;height:2mm;">
				<span style="float:left;clear:none;">
					Earned income (see instructions on back). 
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>    
              </div>
              
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;padding-top:1mm;">4a </div>
              <div class="styLNAmountBox" style="height:2mm;border-bottom-width:1px;padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/TotalEarnedIncomeAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6.3mm;padding-top:1.3mm;background-color:lightgrey;
				  border-bottom-width:0px;border-right-width:1px;"/>
            </div>
            <!-- Line 4b1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b</div>
              <div class="styLNDesc" style="width:103mm;height:4.5mm;">Nontaxable combat pay (see instructions on</div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6mm;background-color:lightgrey;border-bottom-width:0px"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;">
                <!--  <xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form1120ScheduleJ/ForeignTaxCredit" />
      </xsl:call-template> -->
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;
      border-bottom-width:0px;"/>
             </div>
            <!-- Line 4b2 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm"/>
              <div class="styLNDesc" style="width:64.8mm;height:4mm;">
				<span style="float:left;clear:none;">
					back)
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span> 
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6mm;border-bottom-width:1px">4b</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:32.1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NontaxableCombatPayAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;width:32.1mm"/>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
             </div>
            <!--Line 5 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm">5</div>
              <div class="styLNDesc" 
              style="width:103mm;height:4mm;">Is the amount on line 4a more than $3,000?
       </div>
              <div class="styLNRightNumBox" style="height:5mm;width:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:5mm;">
                <!--<xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd" />
      </xsl:call-template>  -->
              </div>
              <div class="styLNRightNumBox" style="height:5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
            </div>
            <!--End of line 5 -->
            <!--Line 5 NO -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4.5mm;"/>
              <div class="styLNDesc" style="width:103mm;height:4mm;">
                <div class="styLNDesc" style="width:12mm;height:4mm;">
				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span style="width:4px"/>
                  <label>
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                    <b>No.</b>
                  </label>
                </div>
          Leave line 5 blank and enter -0- on line 6.
       </div>
              <div class="styLNRightNumBox" style="height:6mm;width:6mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:6mm;">
                <!--  <xsl:call-template name="PopulateAmount" >
      <xsl:with-param name="TargetNode"  select="$Form1120ScheduleJ/ForeignTaxCredit" />
      </xsl:call-template> -->
              </div>
              <div class="styLNRightNumBox" style="height:6mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
              </div>
            <!--End of line 5  No-->
            <!-- Line 5 Yes  -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:103mm;height:4mm;">
                <div class="styLNDesc" style="width:12mm;height:4mm;">
 				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span style="width:4px"/>
                  <label>
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/EarnedIncmMoreThanSpecifiedInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataEarnedIncmMoreThanSpecifiedInd</xsl:with-param>
                    </xsl:call-template>
                    <b>Yes. </b>
                  </label>
                </div>
					 Subtract $3,000 from the amount on line 4a. Enter the result
      </div>
              <div class="styLNRightNumBox" style="border-bottom-width:1px;height:4mm;width:6mm;padding-top:.5mm;padding-bottom:0mm">5</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NetTotalEarnedIncomeAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:5.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
             </div>
            <!--End of line 5 yes -->
            <!--Line 6 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;">6</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
				<span style="float:left;clear:none;">  
					Multiply the amount on line 5 by 15% (.15) and enter the result
				</span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">6</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/NetEarnedIncomeCalculatedAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 6 -->
            <!--Line 6A -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;"/>
              <div class="styLNDesc" style="width:141mm;height:4mm;">
                 <b>Next. </b> Do you have three or more qualifying children?
          </div>
              <div class="styLNRightNumBox" style="height:4mm;width:38mm;background-color:lightgrey;border-bottom-width:0px;"/>
            </div>
            <!--End of line 6A -->
            <!--Line 6A  no1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;"/>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
                <div class="styLNDesc" style="width:12mm;height:2mm;">
				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span style="width:8px"/>
                  <label>
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                    <b>  No.  </b>
                  </label>
                </div>
						If line 6 is zero, stop; you cannot take this credit. Otherwise, skip Part II and enter the
						<b>smaller</b> of line 3 or line 6 on line 13.
              </div>
              <div class="styLNRightNumBox" style="height:8mm;width:38mm;background-color:lightgrey;border-bottom-width:0px"/>
            </div>
            <!--End of line 6A  no1 -->
             <!--Line 6A  yes1 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBoxSD" style="height:2mm;"/>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
                <div class="styLNDesc" style="width:12mm;height:2mm;">
				  <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
				  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                   <span style="width:8px"/> 
                  <label>
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8812Data/ThreeOrMoreQlfyChildrenInd"/>
                      <xsl:with-param name="BackupName">$Form8812DataThreeOrMoreQlfyChildrenInd</xsl:with-param>
                    </xsl:call-template>
                    <b>Yes. </b>
                  </label>
                </div>
						 If line 6 is equal to or more than line 3, skip Part II and enter the amount 
						 from line 3 on line 13. Otherwise, go to line 7.
          </div>
              <div class="styLNRightNumBox" style="height:7.5mm;width:38mm;background-color:lightgrey;border-bottom-width:0px"/>
            </div>
            <!--End of line 6A  yes1 -->
            <!-- BEGIN Part II Title -->
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="width:23mm;">Part II</div>
              <div class="styPartDesc" style="width:164mm;">Certain Filers Who Have Three or More
     Qualifying Children <span class="styNormalText"/>
              </div>
            </div>
            <!-- END Part II  Title -->
            <!-- Line 7 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:11mm;padding-left:3mm;padding-top:2mm">7</div>
              <div class="styLNDesc" style="width:103mm;height:11mm;padding-top:2mm">
						Withheld social security and Medicare taxes from Form(s) W-2, boxes 4 and
						6. If married filing jointly, include your spouse’s amounts with yours. If you
						worked for a railroad, see instructions on back 
			   <span class="styDotLn" style="float:none;padding-left:2mm;">..........</span>
              </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6mm;padding-top:9mm">7 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:13mm;padding-top:9mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/FromW2Amt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:13mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
             </div>
            <!-- Line 8 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:9mm;padding-left:3mm;">8</div>
              <div class="styLNDesc" style="width:100mm;height:9mm;">
                <div class="styLNDesc" style="width:22mm">
                  <b>1040 filers:</b>
                </div>
                <div class="styLNDesc" style="width:75mm">
					Enter the total of the amounts from Form 1040, lines<br/>
					27 and 57, plus any taxes that you identified using code<br/>
					“UT” and entered on the dotted line next to line 60.
				</div>
                <div class="styLNDesc" style="width:22mm">
                  <b>1040A filers:</b>
                </div>
                <div class="styLNDesc" style="width:75mm"> Enter -0-.
				 </div>
                <br/>
                <div class="styLNDesc" style="width:22mm">
                  <b>1040NR filers:</b>
                </div>
                <div class="styLNDesc" 
                style="width:75mm;">
					Enter the total of the amounts from Form 1040NR, lines<br/>
					27 and 55, plus any taxes that you identified using code<br/>
					 "UT" and entered on the dotted line next to line 59.
			  </div>
              </div>
              <div class="styLNDesc" style="width:2.8mm;">
                <img src="{$ImagePath}/8812_Bracket_Lger.gif" alt="Curly Bracket Image"/>
               </div>
               <div class="styLNRightNumBox" style="height:27.3mm;width:6mm;border-bottom-width:0px;">
					   <span  style="height:6mm;width:5.8mm;padding-top:12mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">8</span>
               </div>
               <div class="styLNAmountBox" style="height:27.3mm;border-bottom-width:0px;">
				   <span  style="width:31.8mm;border-bottom-width:1px;height:6mm;padding-top:12mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form8812Data/FromTaxReturnAmt"/>
						  </xsl:call-template>
					</span>	  
               </div>
              <div class="styLNRightNumBox" style="height:27.3mm;width:6.3mm;padding-top:12mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px;"/>
            </div>
            <!-- Line 9 -->
            <div  style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-left:3mm">9</div>
              <div class="styLNDesc" style="height:2mm;width:389px;">
				<span style="float:left;clear:none;">      
					  Add lines 7 and 8
				 </span>
				<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">9</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/CalcFromW2AndReturnAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;width:6.3mm;background-color:lightgrey;border-right-width:1px;border-bottom-width:0px"/>
             </div>
            <!-- Line 10 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:11mm;">10</div>
              <div class="styLNDesc" style="width:100mm;">
                <div class="styLNDesc" style="width:22mm">
                  <b>1040 filers:</b>
                </div>
                <div class="styLNDesc" style="width:77mm;">Enter the total of the amounts from Form 1040, lines<br/>
					63a and 68.
				 </div>
                <br/>
                <div class="styLNDesc" style="width:22mm">
                  <b>1040A filers:</b>
                </div>
                <div class="styLNDesc" style="width:77mm">Enter the total of the amount from Form 1040A, line<br/>
						38a, plus any excess social security and tier 1 RRTA<br/>
						taxes withheld that you entered to the left of line 41<br/>
						(see instructions on back).
      </div>
                <div class="styLNDesc" style="width:22mm;">
                  <b>1040NR filers:</b>
                </div>
                <div class="styLNDesc" style="width:77mm;font-size:7.5pt;">Enter the amount from Form 1040NR, line 65.</div>
              </div>
              <div class="styLNDesc" style="width:2.8mm;">
                <img src="{$ImagePath}/8812_Bracket_Lger_1.gif" alt="Curly Bracket Image" width="6" height="90"/>
               </div>
              <div class="styLNRightNumBox" style="height:12mm;width:6mm;padding-top:11mm">10</div>
              <div class="styLNAmountBox" style="height:12mm;border-bottom-width:1px;padding-top:11mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/CalcAmtFromRetPlusTaxWhldAmt"/>
                </xsl:call-template>
              </div>
          <div class="styLNRightNumBox" style="height:27mm;width:5.8mm;border-bottom-width:0px;border-right-width:1px;padding-top:0mm;">
        <span style="height:15mm;background-color:lightgrey;width:5.8mm;"></span>
          </div>
            </div>
            <!--Line 11 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;">11</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
              <span style="float:left;clear:none;">  
					 Subtract line 10 from line 9. If zero or less, enter -0-
            </span>
        <!--Dotted Line-->   
            <span class="styDotLn" style="float:right;padding-right:2mm;">...............</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">11</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/CalculatedDifferenceAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 11 -->
            <!--Line 12 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;">12</div>
              <div class="styLNDesc" style="width:141mm;height:2mm;">
				<span style="float:left;clear:none;">    
					Enter the <b>larger </b> of line 6 or line 11
			    </span>
        <!--Dotted Line-->   
                <span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;">12</div>
              <div class="styLNAmountBox" style="height:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/LargerCalcIncomeOrDiffAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of line 12 -->
            <!--Line 12A -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-top:0mm;"/>
              <div class="styLNDesc" style="width:141mm;height:2mm;padding-top:0mm;">
                <b>Next, </b>
       enter the <b>smaller</b> of line 3 or line 12 on line 13.
          </div>
              <div class="styLNRightNumBox" style="height:2mm;width:38mm;padding-top:0mm;background-color:lightgrey;
          border-bottom-width:0px"/>
            </div>
            <!--End of line 12A -->
            <!-- BEGIN Part III Title -->
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="width:23mm;">Part III</div>
              <div class="styPartDesc" style="width:164mm;">Additional Child Tax Credit
    <span class="styNormalText"/>
              </div>
            </div>
            <!-- END Part III Title -->
            <!--Line 13 -->
            <div style="width:187mm;font-size:7.5pt;">
              <div class="styLNLeftNumBox" style="height:2mm;padding-top:.5mm">13</div>
            <div class="styLNDesc" style="width:141mm;height:2mm;padding-top:.5mm;">
				<span style="float:left;clear:none;">    
					<b>This is your additional child tax credit</b>
			   </span>
        <!--Dotted Line-->   
                <span class="styDotLn" style="float:right;padding-right:2mm;">....................</span> 
              </div>
              <div class="styLNRightNumBox" style="height:2mm;width:6mm;border-bottom-width:1px;padding-top:.5mm">13</div>
              <div class="styLNAmountBox" style="height:2mm;border-bottom-width:1px;padding-top:.5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8812Data/AdditionalChildTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
  
               <div class="styLNDesc" style="width:155mm;height:2mm;text-align: right;padding-top:0mm">
						    <img src="{$ImagePath}/8812_1040_Bottom_Forms.gif" alt="BottomFormsBullet"/>
						    <span style="width:6px;"/>
						    <img src="{$ImagePath}/8812_Bullet_Md-Rotated.gif" alt="MediumBullet"/>
						    <span style="width:6px;"/>.
						    <span style="width:6px;"/>.
						    </div>	
               <div class="styLNDesc" style="height:2mm;width:31mm;font-size:6pt;padding-top:1.2mm">
											    <span style="width:28.3mm;">Enter this amount on</span>.<br/>
												<span style="width:28.3mm;">Form 1040, line 64,</span>.<br/>
												<span style="width:28.3mm;">Form 1040A, line 39, or</span>.<br/>
												<span style="width:28.3mm;">Form 1040NR, line 63.</span>.<br/>
												<span class="styDotLn" style="float:none;padding-left:2mm;letter-spacing:2mm;">..........</span> 
			    </div>
			</div>   
            <!--End of line 13 -->
 
          <!-- capturing the page bottom info -->
          <!--  FOOTER-->
          <div class="pageEnd" style="width:187mm;">
            <span class="styBoldText" style="width:100mm;">
				For Paperwork Reduction Act Notice, see your tax return instructions.</span>
            <span style="width:20px;"/>                      
				Cat. No. 10644E 
            <span style="width:34mm;font-size:6pt;"/>
				<span style="font-size:6pt;">
					Form <span class="styBoldText"  style="font-size:8pt;">8812</span> (2012)
			</span>
        </div>
          <!-- Adding page break -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
        Additional Data        
      </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8812Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
