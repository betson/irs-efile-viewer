<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8609AStyle.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8609AData" select="$RtnDoc/IRS8609A"/>
  <xsl:template match="/">
  <!-- 6/15/2011 RLW -->
  <!-- 8/25/2011 RLW -->
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8609AData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching  -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Schedule A (Form 8609)"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <!-- Form8609A header start -->
        <style type="text/css">
          <!-- PRINT STATEMENT -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8609AStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm;">
        <form name="Form8609A">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;height:20mm;">
            <div class="styFNBox" style="width:32mm; height:20mm;border-right-width: 2px;">
              <div>
                Form<span class="styFormNumber">8609-A</span>
                <!--General Dependency Push Pin -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8609AData"/>
                </xsl:call-template>
                <br/>(Rev. December 2008)
				<div style="padding-top:1.5mm">
					<span class="styAgency">Department of the Treasury</span>
					<br/>
					<span class="styAgency">Internal Revenue Service</span>
				</div>
              </div>
            </div>
            <div class="styFTBox" style="width:120mm;height:20mm;">
              <div class="styMainTitle" style="height:8mm; padding-top:2mm">
                Annual Statement for Low-Income Housing Credit
               </div>
              <div class="styFBT" style="text-align:center">
                <img src="{$ImagePath}/8609A_Bullet_Lg.gif" alt="Arrow Bullet"/>
                File with owner's federal income tax return.
                 <br/> <br/>
                <span style="height:2mm;">
                  <img src="{$ImagePath}/8609A_Bullet_Md.gif" alt="MidSizeBullet"/> 
                  See separate instructions.</span>
              </div>
            </div>
              <div class="styOMB" 
              style="width:35mm;height:10mm;padding-top:1mm;padding-left:5mm;border-left-width:2px;">
              OMB No. 1545-0988</div>
              <div class="styTYBox" 
              style=" width:35mm;height:10mm; padding-top:1mm;
              padding-left:5mm;text-align: left;border-left-width:2px;">
              Attachment<br/>
                Sequence No. <b style="font-size:9pt">36</b>
              </div>
          </div>
          <!-- end headers line -->
          <!--========================BEGIN RETURN HEADER==========================-->
          <!-- Begin Names and Identifying number section -->
          <div style="width:187mm;" class="styBB">
            <div style="width:152.5mm;height:12mm;font-weight:normal;font-size:8pt;font-weight:normal;
            padding-top:1mm;border-right-width: 1px;" 
            class="styNameBox">
             <b>Name(s) shown on return</b> <br/>
             <!-- choise beween input Name versus Name from 1120/1065/1040 and 1041 Return Header info --> 
						    <xsl:call-template name="PopulateFilerName">
										<xsl:with-param name="TargetNode" 
										select="$Form8609AData"/>
									</xsl:call-template>
		  		</div>
                <div style="width:34mm;height:12mm;padding-left:2mm;font-size:8pt;padding-top:1mm;border-left-width:1px:"
                 class="styEINBox">
         	  Identifying number
             <br/> <br/>   
             <!-- Choice between input TIN versus TIN from 1120, 1065, 1040, and 1041 Return Header Filer info -->
							<xsl:call-template name="PopulateFilerTIN">
										<xsl:with-param name="TargetNode" 
										select="$Form8609AData"/>
									</xsl:call-template>
             </div>
     </div>
    <!-- End Names and Identifying number section -->
    <!-- Start Part I Compliance Informations -->
    <div style="width:187mm;" class="styBB">
        <div class="styPartName" style="width:15mm;">Part I</div>
        <div class="styPartDesc" style="padding-left:3mm;">
         Compliance Information  
        </div>
    </div>
         <!-- build yes/no headers -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:154.75mm;"/>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;">Yes</div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;">No</div>
            </div>
          </div>
          <!-- end build yes/no headers -->
          <!-- Begin line A -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">A</div>
              <div class="styLNDesc" style="height:4mm;width:159.75mm;">
                    Building identification number (BIN) 
                <img src="{$ImagePath}/8609A_Bullet_Lg.gif" alt="Arrow Bullet"/>
                <span style="width:2mm"/>
                <span class="styFixedUnderline" style="width:102mm;float:none;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/BIN"/>
                </xsl:call-template>
                </span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line A -->
          <!-- Begin line B -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;">B</div>
              <div class="styLNDesc" style="height:4mm;width:125mm;">
                    This Form 8609-A is for (check the box) 
                <img src="{$ImagePath}/8609A_Bullet_Lg.gif" alt="Arrow Bullet"/>
                    a newly constructed or existing building
                 <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8609AData/NewlyConstrOrExstngBuildingInd"/>
                    <xsl:with-param name="BackupName">IRS8609ANewlyConstructed</xsl:with-param>
                  </xsl:call-template>
                </input>
                <!-- Label Correction -->
                <span style="width: 2mm"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8609AData/NewlyConstrOrExstngBuildingInd"/>
                    <xsl:with-param name="BackupName">IRS8609ANewlyConstructed</xsl:with-param>
                  </xsl:call-template>
                </label>
                <!-- Label Correction -->
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line B -->
          <!-- Begin line B1 -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:6mm;width:120mm;padding-bottom:3mm;padding-top:0mm;">
                section 42(e) rehabilitation expenditures 
                 <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8609AData/Section42eRehbltExpendInd"/>
                    <xsl:with-param name="BackupName">IRSIRS8609ASection42e</xsl:with-param>
                  </xsl:call-template>
                </input>
                <!-- Label Correction -->
                <span style="width: 2mm"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8609AData/Section42eRehbltExpendInd"/>
                    <xsl:with-param name="BackupName">IRSIRS8609ASection42e</xsl:with-param>
                  </xsl:call-template>
                </label>
                <!-- Label Correction -->
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;height:6mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;height:6mm;text-align:center;font-weight:bold
              :0px;border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line B1 -->
          <!-- Begin line C -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">C</div>
              <div class="styLNDesc" style="height:4mm;width:160mm;">
                Do you have in your records the original Form 8609 (or a copy thereof) 
                signed and issued by the housing credit agency for the
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" 
              style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBox" 
              style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:1px;background-color:lightgrey"/>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:163mm;">
                <span style="float:left;"> building in<b> A</b>?</span>
                <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">....................................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/Orig8609HousingCrAgencyRecInd"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/Orig8609HousingCrAgencyRecInd"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:163mm;">
                If "No," see the instructions and stop here&#8212;do not go to Part II.  
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" 
              style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox"
               style="width:8mm;text-align:center;font-weight:bold;
               border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line C -->
          <!-- Begin line D -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">D</div>
              <div class="styLNDesc" style="height:4mm;width:160mm;">
                    Did the building in <b> A </b>
                    qualify as a part of a qualified low-income housing project and meet the requirements of section 42 as of 
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" 
              style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:1px;background-color:lightgrey"/>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:163mm;">
                <span style="float:left;">
                the end of the tax year for which this form is being filed? </span>
                <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/QlfyLowIncmHsngProjSect42Ind"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/QlfyLowIncmHsngProjSect42Ind"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                    If "No," see the instructions and stop here&#8212;do not go to Part II.  
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line D -->
     <!-- Begin line E -->
          <!-- Begin line E -->
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;">E</div>
              <div class="styLNDesc" style="height:4mm;width:155mm;">
                    Was there a decrease in the qualified  basis of the building in
                     <b>A </b>for the tax year for which this form is being filed?
                     <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
                     <!--<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>-->
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/DecreaseQualifiedBasisBldgInd"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/DecreaseQualifiedBasisBldgInd"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="height:4mm;width:160mm;">
                    If "Yes," see the instructions.  If "No," 
                    and the entire credit has been claimed in prior tax years, stop here&#8212;do 
                    not go to Part II. 
                </div>
            </div>
            <div style="float:right;">
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
              <div class="styLNAmountBox" style="width:8mm;text-align:center;font-weight:bold;
              border-bottom-width:0px;background-color:lightgrey"/>
            </div>
          </div>
          <!-- end line E -->
          <!-- Start Part II Current Year Credit -->
          <div class="styBB" style="width:187mm;border-top-width: 1px;">
            <div class="styPartName" style="width:15mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Computation of Credit  
            </div>
          </div>
          <!-- End Part II Current Year Credit -->
          <!-- begin part II line 1 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">1</div>
            <div style="float:left">
			  Eligible basis of building             
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ..........................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">1</div>
              <div class="styIRS8609ScheduleALNAmountBox">              
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/BuildingEligibleBasisAmt"/>
                </xsl:call-template>                
              </div>
            </div>
          </div>
          <!-- end part II line 1 -->
          <!-- begin part II line 2 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">2</div>
            <div style="float:left">
			 Low-income portion  (smaller of unit fraction or floor space fraction)
			  (if first year of the credit period, see   
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox" style="border-bottom:0 solid black"/>
              <div class="styIRS8609ScheduleALNAmountBox" style="border-bottom:0 solid black"/>
            </div>
          </div>
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum"/>
            <div style="float:left;padding-left:7mm;">
			   instructions)   
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ..............................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">2</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/LowIncomePortionRt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 2 -->
          <!-- begin part II line 3 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">3</div>
            <div style="float:left">
			 Qualified basis of low-income building. Multiply line 1 by line 2 (see instructions for exceptions)    
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">.....
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">3</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/QualifiedBasisOfLowIncmBldgAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 3 -->
          <!-- begin part II line 4 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">4</div>
            <div style="float:left">
			 Part-year adjustment for disposition or acquisition during the tax year   
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ............
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">4</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/PartYearAdjustmentDuringTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 4 -->
          <!-- begin part II line 5 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">5</div>
            <div style="float:left">
			 Credit percentage
			 </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ............................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">5</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/MaximumApplicableCrPct"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 5 -->
          <!-- begin part II line 6 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">6</div>
            <div style="float:left">
			  Multiply  line 3 or line 4 by the percentage on line 5
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ..................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">6</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/CreditForLowIncomeBuildingAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 6 -->
          <!-- begin part II line 7 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">7</div>
            <div style="float:left">
            Additions to qualified basis, if any
			 </div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> .......................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">7</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/QualifiedBasisAdditionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 7 -->
          <!-- begin part II line 8 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">8</div>
            <div style="float:left">
			  Part-year adjustment for disposition or acquisition during the tax year
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ............
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">8</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/PartYearAdjustment2DuringTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 8 -->
          <!-- begin part II line 9 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">9</div>
            <div style="float:left">
			  Credit percentage. Enter one-third of the percentage on line 5 
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ...............
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">9</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/OneThirdMaximumApplicableCrPct"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 9 -->
          <!-- begin part II line 10 -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">10</div>
            <div style="float:left">
			  Multiply line 7 or line 8 by the percentage on line 9 
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ..................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">10</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/IntBasedLowIncomeBuildingAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 10 -->
          <!-- begin part II line 11  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">11</div>
            <div style="float:left">
			  Section 42(f)(3)(B) modification
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> .......................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">11</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/Section42f3BModificationAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 11 -->
          <!-- begin part II line 12  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">12</div>
            <div style="float:left">
			  Add lines 10 and 11
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ...........................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">12</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/AdjCrForLowIncomeBuildingAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 12 -->
          <!-- begin part II line 13  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">13</div>
            <div style="float:left">
			  Credit for building before line 14 reduction. Subtract line 12 from line 6
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ............
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">13</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/CreditForBldgBfrReductionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 13 -->
          <!-- begin part II line 14  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">14</div>
            <div style="float:left">
			 Disallowed credit due to federal grants (see instructions)
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">14</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/DsallwCrDueToFederalGrantAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 14 -->
          <!-- begin part II   -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">15</div>
            <div style="float:left">
			 Credit allowed for building for tax year. Subtract line 14 from line 13, 
			 but do not enter more than the amount 
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox" style="border-bottom:0 solid black"/>
              <div class="styIRS8609ScheduleALNAmountBox" style="border-bottom:0 solid black"/>
            </div>
          </div>
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum"/>
            <div style="float:left;padding-left:7mm;">
			 shown on Form 8609, Part I, line 1b
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ......................
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">15</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/CreditAllowedForBldgForTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 15 -->
          <!-- begin part II line 16  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">16</div>
            <div style="float:left">
			   Taxpayer's proportionate share of credit for the year (see instructions)
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ............
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">16</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/TaxpayerShareOfCreditForYrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 16 -->
          <!-- begin part II line 17  -->
          <div style="width:187mm">
            <div class="styIRS8609ScheduleAItemNum">17</div>
            <div style="float:left">
			   Adjustments for deferred first-year credit (see instructions)
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn"> ...............
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox">17</div>
              <div class="styIRS8609ScheduleALNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/AdjForDeferredFirstYrCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 17 -->
          <!-- begin part II line 18  -->
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styIRS8609ScheduleAItemNum">18</div>
            <div style="float:left">
				Taxpayer's credit. Combine lines 16 and 17. Enter here and on Form 8586 (see instructions)  
			</div>
            <div style="float:right">
              <span class="styIRS8609ScheduleADotLn">......
			  </span>
              <div class="styIRS8609ScheduleALNRightNumBox" style="border-bottom-width:0px;">18</div>
              <div class="styIRS8609ScheduleALNAmountBox" style="border-bottom-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8609AData/LowIncomeHousingCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- end part II line 18 -->
          <div class="styFooter"
           style="width:187mm;clear:both;font-size:8pt;border-top:2 solid black;border-top-width:2px;">
            <div style="width:105mm;font-weight:bold;" class="styGenericDiv">
            For Paperwork Reduction Act Notice, see separate instructions.</div>
            <div style="width:25mm;text-align:left" class="styGenericDiv">Cat No. 38841T</div>
            <div style="width:57mm;padding-left:2mm;text-align:right" class="styGenericDiv">
              <span class="styBoldText">Form 8609-A (Rev 12-2008)</span>
            </div>
          </div>
          <p style="page-break-before:always"/>
          <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
            <div class="styLeftOverTitle">
			  Additional Data        
			</div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button"
               value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8609AData"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>