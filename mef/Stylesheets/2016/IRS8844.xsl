<?xml version="1.0" encoding="UTF-8"?>

<!--Updated per 39570 removed word available on 12/12/2013 By Robert Jones -->
<!--Kisams IM01417117 indicated that FIT testing didn't show above so will check in this code again - Robert L Jones 5-22-2014 -->
<!-- Updated per UWR 101606 -->
<!-- Updated per UWR 111640 6/18/14 -->
<!-- Updated 8/7/2014 per IBM Defect 41255 by Robert L Jones -->
<!--Updated per IBM Defect  42896 on 06/02/2015 Additional Data not on page by itself-rlj -->
<!-- Updated per UWR 159942 6/18/14 -->
<!--Updated per IBM Defect  44482 on 09/26/2015 -->
<!--Updated per IBM Defect  44906 on 09/26/2015 Removed Reserved by Robert L Jones-->
<!-- Last modified on 1/7/2016 by Robert Jones UWR 172430 Extender Fixes  -->
<!--Updated per IBM Defect  46787 on 09/28/2016 Add Data to same page by Robert L Jones-->
<!--Updated per IBM Defect  46788 on 09/28/2016 Update to dates from 2015 to 2016 by Robert L Jones-->
<!-- Last modified on 9/28/2016 by Robert Jones UWR 183722   -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8844Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8844Data" select="$RtnDoc/IRS8844"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8844Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching  -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 8844"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8844Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form id="Form8844">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:30mm;height:23mm;">
              <div style="height:9mm;">Form<span class="styFormNumber">  8844</span>
                <br/>
              </div>
              <div style="height:auto;padding-top:7mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:auto;">
              <div class="styMainTitle" style="height:auto;font-size:13pt;padding-top:1mm;">
            Empowerment Zone Employment Credit
          </div>
              <div class="styFMT" style="height:auto;font-size:7pt;padding-top:1mm;">
                <img src="{$ImagePath}/8844_Bullet.gif" alt="Bullet Image"/>
              Attach to your tax return.
          </div>
          <div class="styFMT" style="height:auto;font-size:6.5pt;padding-top:2mm;">
                <img src="{$ImagePath}/8844_Bullet.gif" alt="Bullet Image"/> Information about Form 8844 and its separate instructions is at 
                 <a href="http://www.irs.gov/form8844" title="Link to IRS.gov">
                 <i>www.irs.gov/form 8844.</i>
                 </a>
          </div>
            </div>
            <div class="styTYBox" style="width:32mm;height:23mm;">
              <div class="styOMB" style="height:auto;padding-top:0mm;">
            OMB No. 1545-1444
          </div>
              <div class="styTY" style="height:auto;font-size:21pt;padding-top:0mm;padding-bottom:0mm;">
            20<span class="styTYcolor">16</span>
              </div>
              <div class="styOMB" style="height:auto;text-align:left;padding-left:5mm;border-bottom-width:0px;">
             Attachment <br/>Sequence No. <span class="styBoldText">99</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div style="width:187mm;" class="styBB">
            <div style="width:138mm;height:auto;font-weight:normal;font-size:7pt;" class="styNameBox">
          Name(s) shown on return<br/>
              <div style="font-family:verdana;font-size:7pt;height:auto">
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
                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                </xsl:call-template>
                </xsl:otherwise>
				                  </xsl:choose>
              </div>
            </div>
            <div style="width:49mm;height:auto;padding-left:2mm;font-size:7pt;" class="styEINBox">
            Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
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
          <!-- Start Part I Current Year Credit -->
          <!--
          <div style="width:187mm;" class="styBB">
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;">
            Current Year Credit  
          </div>
          </div>
-->
          <!-- L1 -->
           <!-- Part I, line 1 -->
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">1</div>
                <div class="styLNDesc" style="width:139mm;height:7.5mm;">
                 <span style="float:left;">Enter the total qualified empowerment zone wages paid or incurred during calendar year 2016 only (see instructions)<!-- Per DOW not PDF -->
                 <span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
                 </span>
                    </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">1</div>
                            <div class="styLNAmountBox" style="text-align:bottom;height:7.5mm;padding-top:3mm;">
             <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/TotalQualifiedEmpwrZoneWgsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            
          
          
         
            <!-- Part I, line 2 -->
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">2</div>
                <div class="styLNDesc" style="width:139mm;height:auto;">
               <span style="float:left;">Multiply line 1 by 20% (0.20). See instructions for the adjustment you must make to salaries and wages.</span>
                    </div>
                </div>
            
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;">2</div>
                  <div class="styLNAmountBox" style="text-align:bottom;height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/CurrentYearCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Part I, line 3 -->
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">3</div>
                <div class="styLNDesc" style="width:139mm;height:auto;">
                    Empowerment zone employment credit from partnerships, S corporations,
                    cooperatives, estates, and trusts
                  
               <!--   <span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>-->
                    
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:auto;padding-top:.5mm;">3</div>
                <div class="styLNAmountBox" style="height:auto;padding-top:.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/FlowthroughEntityCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Part I, line 4 -->
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">4</div>
                <div class="styLNDesc" style="width:139mm;height:8mm;">
                    Add lines 2 and 3. Cooperatives, estates, and trusts, go to line 5. Partnerships and S corporations, stop here and report this amount on Schedule K. All others, stop here and report this amount on Form 3800,   
                   <span style="float:left;">Part III, line 3</span>
                 <span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:10mm;padding-top:7mm;">4</div>
                <div class="styLNAmountBox" style="height:10mm;padding-top:7mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/TotalCurrentYearEZRCECreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Part I, line 5 -->
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">5</div>
                <div class="styLNDesc" style="width:139mm;height:auto;">
                    Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see
instructions)  
                    <!--<span style="float:left;">activities (see instructions) </span>-->
                   <!-- <span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>-->
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:auto;">5</div>
                <div class="styLNAmountBox" style="height:auto;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/AllocatedToBeneficiariesAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Part I, line 6 -->
            <div class="styTBB" style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">6</div>
                <div class="styLNDesc" style="width:139mm;height:auto;">
                    Cooperatives, estates, and trusts, subtract line 5 from line 4. Report this amount on Form 3800, Part III, line 3 

                   <!-- <span class="styDotLn" style="padding-right:2mm;"></span>-->
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:auto;">6</div>
                <div class="styLNAmountBox"  style="height:auto;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/EstatesTrustsAndCoopsCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Part I, line 7 Removed lines 7 through 12 per UWR 45320 - Robert L Jones
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">7</div>
                <div class="styLNDesc" style="width:139mm;">
                    <span style="float:left;">Passive activity credit allowed for 2010 (see instructions) </span>
                    <span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox">7</div>
                <div class="styLNAmountBox">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/PssvActivityCreditAllowedForPY"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
      
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">8</div>
                <div class="styLNDesc" style="width:139mm;">
                    <span style="float:left;">Carryforward of empowerment zone and renewal community employment credit to 2010 </span>
                    <span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox">8</div>
                <div class="styLNAmountBox">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/CarryForwardOfEZECrToPY"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBoxSD" style="">9</div>
                <div class="styLNDesc" style="width:139mm;">
                  <span style="float:left;font-size:7pt;">Carryback of empowerment zone employment credit from 2011 (see instructions) </span>
                  
                </div>
              </div>
              <div style="float:right;clear:none;">
              <div style="width:40mm:">
                <div class="styLNRightNumBox">9</div>
                <div class="styLNAmountBox">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/CarrybackofEZECredit"/>
                  </xsl:call-template>
                </div>
                </div>
              </div>
            </div>
         
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBox" style="">10</div>
                <div class="styLNDesc" style="width:139mm;">
                    Add lines 6 through 9. Cooperatives, estates, and trusts, go to line 11. All others, report this  
                    <span style="float:left;">amount on Form 3800, line 24 </span>
                    <span class="styDotLn" style="float:right;padding-right:2mm;">........................</span>
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">10</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/SumOfLinesSixThroughNine"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
        
          <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBox" style="">11</div>
                <div class="styLNDesc" style="width:139mm;">
                    Amount allocated to the patrons of the cooperative or the beneficiaries of the estate or trust (see  
                    <span style="float:left;"> instructions) </span>
                    <span class="styDotLn" style="float:right;padding-right:2mm;">..............................</span>
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">11</div>
                <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/AmountAllocatedToBeneficiaries"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
        
          <div class="styTBB" style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBox" style="">12</div>
                <div class="styLNDesc" style="width:139mm;">
                    <b>Cooperatives, estates, and trusts.</b> Subtract line 11 from line 10. Report this amount on Form 3800, line  
                    <span style="float:left;">24 </span>
                    <span class="styDotLn" style="float:right;padding-right:2mm;">.................................</span>
                </div>
              </div>
              <div style="float:right;">
                <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">12</div>
                <div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8844Data/EstatesTrustsCooperativeCr"/>
                  </xsl:call-template>
                </div>
              </div>
              -->
            </div>
          <!--Page End-->
          <div style="width:186mm;clear:both;padding-top:0mm;">
            <div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 16145S</div>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8844</span> (2016)</div>
          </div>
          <br></br>
        <!--  <div class="pageEnd"/>-->
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
              <xsl:with-param name="TargetNode" select="$Form8844Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
