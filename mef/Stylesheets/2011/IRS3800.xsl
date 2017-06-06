<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS3800Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form3800Data" select="$RtnDoc/IRS3800"/>
  <!--Per Michael Tikoian defect 27860 to comment out this line to resolve yellow screen error <xsl:param name="Form3800ScheduleAData" select="$RtnDoc/IRS3800/IRS3800ScheduleA"/>-->
  <!--   -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form3800Data)"/>
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
        <meta name="Description" content="IRS Form 3800"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--PRINT STATEMENT-->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS3800Style"/>
            <xsl:call-template name="AddOnStyle"/>
        </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form3800" style="font-size:7pt;">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:21mm;">
            <div class="styFNBox" style="width:34mm;height:21mm;">
              <div style="height:13mm;">
               Form<span class="styFormNumber">  3800</span>
                <br/>
                <!--General Dependency Push Pin-->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data"/>
                </xsl:call-template>
              </div>
              <div style="height:8mm;padding-top:.75mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service <span style="padding-left:0mm;">(99)</span>
                </span>
              </div>
            </div>
            <div class="styFTBox" style="width:122mm;height:21mm;">
              <div class="styMainTitle" style="height:11mm;">
               General Business Credit
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm;">
                <img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                 See separate instructions.
              </div>
              <div class="styFST" style="height:4mm;font-size:7pt;padding-top:.5mm;">
                <img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                 Attach to your tax return.
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:21mm;">
              <div class="styOMB" style="height:2mm;">
                OMB No. 1545-0895
              </div>
              <div class="styTaxYear" style="height:9mm;padding-top:0;">20<span class="styTYColor">11</span>
              </div>
              <div style="text-align:left;padding-left:3mm;">Attachment Sequence No. <span class="styBoldText">22</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:150mm;height:8mm;font-size:7pt;font-weight:normal;">
              Name(s) shown on return<br/>
              <span>
             <xsl:choose>
            <xsl:when test="$RtnHdrData/ReturnType='1040'">
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
            <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
              Identifying number<br/>
              <br/>
          
               <span style="font-size: 7pt; font-weight: normal;text-align:left; vertical-align: bottom;">
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
          <!-- Begin Part I (Tentative Credit) Section -->
          <div class="styBB" style="width:187mm;padding-top:2mm;padding-bottom:2mm;">
            <div class="styPartName" style="background-color:black;">Part I</div>
            <!-- Revisit:-->
            <div class="styPartDesc">
              <span style="width:158mm;">Current Year Credit for Credits Not Allowed Against Tentative Minimum Tax (TMT)</span>
              <div style="width:158mm;font-weight:normal">(See instructions and complete Part(s) III before Parts I and II)</div>
            </div>
          </div>
          <!--Part I, Important Line -->
          
         <!--  <xsl:if test="not($Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp !='')">
         <xsl:call-template name="PartIIITemplate"/>        
         
        </xsl:if>-->
          
     
          <div class="styBB" style="width:187mm;">
                  <!-- Part I, Line 1-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">1</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">General business credit from line 2 of all Parts III with box A checked </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
              </div>
              <div class="styLNRightNumBox" >1</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/GeneralBusCrFromNnPssvActyAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 2-->
            <div style="width:187mm;">
               <div class="styLNLeftNumBoxSD" >2</div>
              <div class="styLNDesc" style="width:103mm;">
                <span style="float:left;">Passive activity credits from line 2 of all Parts III with box B checked </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;"></div>
              </div>
              <div class="styLNRightNumBox" >2</div>
              <div class="styLNAmountBox" style="width:28mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearPassiveActyCredits"/>
                </xsl:call-template>
                </div>
               <div class="styLNRightNumBox" style="border-right-width:1px;border-bottom-width:0px;width:8.2mm;background-color:lightgray;"></div> 
            </div>
            <!-- Part I, Line 3-->
            <div style="width:187mm;">
             
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" >3</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Enter the passive activity credits allowed from line 2 for 2011 (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
              </div>
             
              <div class="styLNRightNumBox" >3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/PssvActyForGenBusCrAllowedAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 4-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <!--<div style="width:187mm;">
                <div class="styLNLeftNumBox" />
                <div class="styLNDesc" style="width:139mm;"/>
                <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>-->
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" >4</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Carryforward of general business credit to 2011. Enter the amount from line 2 of Part III with box C
                checked. See instructions for schedule to attach
                    <!--Dotted Line-->
                    	<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3800Data/GeneralBusCrCarryforwardCY"/>
									</xsl:call-template>
                 <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...............</span>
                </span>
                <!--Dotted Line-->
            
              </div>
              <div class="styLNRightNumBox"  style="height:4mm;padding-top:3.5mm;">4</div>
              <div class="styLNAmountBox" style="height:4mm;padding-top:3.5mm;" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/GeneralBusCrCarryforwardCY"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 5-->
            <div style="width:187mm;">
           
              <div class="styLNLeftNumBoxSD" >5</div>
              <div class="styLNDesc" style="width:139mm;">
                <!-- Revisit: Changing year 2002 to 2003 -->
                <!--Passive activity credits allowed for 2002-->
                <span style="float:left;">Carryback of general business credit from 2012. Enter the amount from line 2 of Part III with box D
                checked (see instructions)
                <!--Dotted Line-->
                <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">....................</span>
                </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-top:3.5mm;" >5</div>
              <div class="styLNAmountBox" style="height:4mm;padding-top:3.5mm;" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CarryBackGeneralBusinessCredit"/>
                </xsl:call-template>
              </div>
            </div>
           
            <!-- Part I, Line 6-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" >6</div>
              <div class="styLNDesc" style="width:139mm;">
                <!-- Revisit: Changing year 2002 to 2003 -->
                <!--Passive activity credits allowed for 2002-->
                <span style="float:left;">Add lines 1, 3, 4, and 5</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:3mm;" >6</div>
              <div class="styLNAmountBoxNBB" style="height:4mm;padding-top:3mm;" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYCreditsNotAllwAgainstTMTAmt"/>
                </xsl:call-template>
              </div> 
              
            </div>
          </div>
                   <!--  Begin Part II Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="background-color:black;">Part II</div>
            <div class="styPartDesc">
              <span style="width:8px;"/>Allowable Credit
            </div>
          </div>
          <!-- Part II, Line 7 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">7</div>
            <div class="styLNDesc" style="width:115mm;height:3mm;">
		       Regular tax before credits:
		       <li>Individuals. Enter the amount from Form 1040, line 44, or Form 1040NR, line 42 <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.</span>
              </li>
              <li>Corporations. Enter the amount from Form 1120, Schedule J, Part I, line 2; or the
		       <span style="padding-left:4.6mm;"> applicable line of your return<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">..................</span>
                </span>
              </li>
              <li>Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G,<br/>
                <span style="padding-left:4.6mm;">lines 1a and 1b, or the amount from the applicable line of your return<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.....</span>
                </span>
              </li>
            </div>
            <div class="styLNDesc" style="width:5mm; ">
              <img src="{$ImagePath}/3800_Bracket_Lger.gif" height="75mm" alt="Curly Bracket Image"/>
            </div>
            <span style="width:18.7mm; height:14mm;letter-spacing:3.3mm; font-weight:bold; float:left;padding-bottom:0mm;padding-top:8.5mm;">...</span>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:5mm;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:5mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
            <div class="styLNAmountBox" style="height:4.5mm;width:32.25mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/RegularTaxBeforeCredits"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:5mm;"/>
          </div>
          <!-- Part II, Line 8 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
            <div class="styLNDesc" style="width:115mm;height:4mm;">
                 Alternative minimum tax: 
                 <li>Individuals. Enter the amount from Form 6251, line 35<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">..........</span>
              </li>
              <li>Corporations. Enter the amount from Form 4626, line 14<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.........</span>
              </li>
              <li>Estates and trusts. Enter the amount from Schedule I (Form 1041), line 56<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">...</span>
              </li>
            </div>
            <div class="styLNDesc" style="width:5mm; ">
                <img src="{$ImagePath}/3800_Bracket_Sm.gif" height="50mm" alt="Curly Bracket Image"/>
            </div>
            <span style="width:18.8mm; height:14mm;letter-spacing:3.3mm; font-weight:bold; float:left;padding-bottom:0mm;padding-top:4.5mm;padding-right:1mm;">  
                            ....
                    </span>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:1mm;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;">8</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AlternativeMinimumTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;padding-top:2.5mm;background-color:lightgray;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:2.5mm;"/>
          </div>
          <!-- Part II, Line 9 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" >9</div>
            <div class="styLNDesc" style="width:138.8mm;">
              <span style="float:left;">Add lines 7 and 8 </span>
              <!--Dotted Line-->
              <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
            </div>
      
            <div class="styLNRightNumBox" >9</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedRegTaxBeforeCredits"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 10a -->
          <!-- The following form element does not have a matching element in the schema -->
          <div style="width:187mm;">
            <!--     Extra Space   -->
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>           
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            <!-- extra space -->
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >10a</div>
            <div class="styLNDesc" style="width:98.9mm;">
              <span style="float:left;">Foreign tax credit </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">10a</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/ForeignTaxCredit"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgray;height:4.5mm;width:8.3mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 10b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4.5mm">b</div>
            <div class="styLNDesc" style="width:99mm;">
              <span style="float:left;">Personal credits from Form 1040 or 1040NR (see instructions) </span>
              <!--Dotted Line-->
              <div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
            </div>
            <div class="styLNRightNumBox" >10b</div>
            <div class="styLNAmountBox" >
              <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3800Data/PersonalTaxCreditsAmt" />      
          </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.2mm;height:4.5mm;background-color:lightgrey;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 10c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Add lines 10a and 10b </span>
              <!--Dotted Line-->
              <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
            </div>
            <div class="styLNRightNumBox">10c</div>
            <div class="styLNAmountBox" >
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TotalTaxCredits"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 11 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;">11</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="height:6mm;padding-top:3mm;"><b>Net income tax.</b> Subtract line 10c from line 9. If zero, skip lines 12 through 15 and enter -0- on line 16a</span>
                      <!--Dotted Line-->
              <div class="styDotLn" style="float:right;padding-right:1mm;"></div>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:6mm;">11</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:6mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/NetIncomeTax"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 12 -->
          <!--     Extra Space   -->
          <!--<div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px; background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>-->
          <!-- extra space -->
          <div class="styLNLeftNumBox" >12</div>
          <div class="styLNDesc" style="width:99mm;">
            <span style="float:left;">
              <span style="font-weight:bold;"> Net regular tax.</span> Subtract line 10c from line 7. 
              If zero or less, enter -0- </span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm; ">12</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3800Data/NetRegularTax"/>
            </xsl:call-template>
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px"/>
          <!-- Part II, Line 13 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-top:4mm;" >13</div>
            <div class="styLNDesc" style="width:99mm;padding-top:4mm;">
              <span style="float:left;">
                <span style="font-family:arial;">
              Enter 25% (.25) of the excess, if any, of line 12 over $25,000 (see instructions)</span>
              </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
            </div>
            <!--<div class="styLNRightNumBox" style="background-color: lightgrey; width:8mm;height:4mm;"/>-->
              <div class="styLNRightNumBox" style="padding-top:0mm;height:4mm;">
							<div style="background-color: lightgrey; width:7.75mm;height:4.5mm;"/>
							<div class="width:7.75mm;height:4mm;">13</div>
						</div>
            <div class="styLNAmountBox" style="height:8.5mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/ExcessNetRegularTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.2mm;height:8.5mm;background-color:lightgrey;border-right-width:1px"/>
          </div>
   
          
          <!-- Part II, Line 14 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">14</div>
            <div class="styLNDesc" style="width:82mm;">
             Tentative minimum tax: 
                <li>Individuals. Enter the amount from Form 6251, line 33<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;"></span>
              </li>
               <li>Corporations. Enter the amount from Form 4626, line 12<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;"></span>
              </li>
              <li>Estates and trusts. Enter the amount from Schedule I 
              <span style="padding-left:4mm;">(Form 1041), line 54
              <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">............</span>
              </span>
              </li>
              
             
            </div>
             <div class="styLNDesc" style="width:3mm; ">
              <img src="{$ImagePath}/3800_Bracket_Lger.gif" height="75mm" alt="Curly Bracket Image"/>
            </div>
            <span style="width:14mm; height:14mm;letter-spacing:2.3mm; font-weight:bold; float:left;padding-bottom:0mm;padding-top:8.5mm;">  
                            ....
                    </span>
           <!--<div class="styLNRightNumBox" style="background-color:yellow;">14</div>-->
           <div class="styLNRightNumBox" style="padding-top:0mm;height:8mm;">
							<div style="background-color: lightgrey; width:7.75mm;height:8.5mm;"/>
							<div class="width:7.75mm;height:4mm;">14</div>
						</div>
            <div class="styLNAmountBox" style="height:12.5mm;padding-top:8mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TentativeMinimumTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="height:23mm;;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:23mm;width:10mm;"/>
            <!--<div class="styLNAmountBoxNBB" style="padding-top:6.5mm;"/>-->
           
<!--<div class="styLNRightNumBoxNBB" style="padding-top:3mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="padding-top:3mm;background-color:red"/>
           <div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;border-right-width:1px"/>-->
          </div>
          <!-- Part II, Line 15.-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >15</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Enter the greater of line 13 or line 14 </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">15</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedExcessNetRegularTax"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 16a -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >16a</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Subtract line 15 from line 11. If zero or less, enter -0- </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">16a</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedNetIncomeTax"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 16b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4.5mm;">b</div>
            <div class="styLNDesc" style="width:139mm;">
              For a corporation electing to accelerate the research credit, enter the bonus depreciation amount
              <span style="float:left;">attributable to the research credit (see instructions) </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">16b</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/ElectionToAccelResearchCr"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 16c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Add lines 16a and 16b </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">16c</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TotAdjNetIncmAndElectAccelAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 17a -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >17a</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Enter the <b>smaller</b> of line 6 or line 16c
               
                <!--Pen and ink image -->
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@sec383Or384Indicator"/>
                </xsl:call-template>
              </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">17a</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Part II, Line 17a Row 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;">
              <span class="styBoldText">C corporations:</span> See the line 17a instructions if there has been an ownership change, acquisition, or reorganization.  
                 </div>
            <div class="styLNRightNumBox" style="height:7mm;border-bottom-width:0px;background-color:lightgrey;padding-top:4mm;"/>
            <div class="styLNAmountBox" style="height:7mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:4mm;"/>
          </div>
          <!--Part II, Line 17b Row 1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:139mm;">
              Enter the smaller of line 6 or line 16a. If you made an entry on line 16b, go to line 17c; otherwise, 
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!--Part II, Line 17b Row 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:3mm;padding-left:4.5mm;"/>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">skip line 17c (see instructions) 
				<!--Pen and ink image -->
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrAdjNetAmt/@sec383Or384Indicator"/>
                </xsl:call-template>
              </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">17b</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrAdjNetAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Part II, Line 17c Row 1 -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
            <span class="styLNDesc" style="width:139mm;">
              Subtract line 17b from line 17a. This is the refundable amount for a corporation electing to accelerate
               the research credit. Include this amount on Form 1120 Schedule J, Part II, line 19c (or the applicable line of your return)
               <span style="padding-left:4mm;font-weight:bold;letter-spacing:3.3mm;">............................</span>
            </span>
          <div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;height:5mm;padding-top:0mm;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;height:5mm;padding-top:0mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:5mm;padding-top:2mm;" >17c</div>
            <div class="styLNAmountBoxNBB" style="height:5mm;padding-top:2mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/RefundableAmtForACorporation"/>
              </xsl:call-template>
            </div>
            </div>
          
          
          
          <!--Page 2 Footer -->
          <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
            <div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12392F</div>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2011)</div>
          </div>
          <!-- Page 3 Header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 3800 (2011)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </div>
          </div>
          <!--  Begin Part II Title -->
          <div class="styBB" style="width:187mm; ">
            <div class="styPartName" style="background-color:black;">Part II</div>
            <div class="styPartDesc">
              <span style="width:8px;"/>Allowable Credit <span style="font-weight:normal;"><i>(Continued)</i>  </span>
            </div>
          </div>
          <!--Part II Continue, Note Line -->
          <div class="styBB" style="width:187mm;border-bottom:1px;">
            <div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
              <div style="width:186mm;">
                <span class="styBoldText">Note.</span> If you are not filing Form 8844, skip lines 18 through 25 and enter -0- on line 26.</div>
              </div>
          </div>
          
      
          <!-- Part II, Line 18 -->
              <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          
          
          <!-- extra space -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >18</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Multiply line 14 by 75% (.75) (see instructions) </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">18</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TentativeMinimunTaxTimesPctAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 19 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >19</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Enter the greater of line 13 or line 18 </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">19</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/GreaterExcessOrTimesPctAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 20 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >20</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Subtract line 19 from line 11. If zero or less, enter -0- </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">20</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/NetIncmTaxLessGreaterExcessAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 21 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >21</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Subtract line 17b from line 20. If zero or less, enter -0- </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">21</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SubSmllrFromNetLessGreaterAmt"/>
              </xsl:call-template>
            </div>
          </div>
       <!-- Part II, Line 22 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >22</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Combine the amounts from line 3 of all Parts III with box A, C, or D checked</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">22</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TotEmpwrZoneGenBusCreditsAmt"/>
              </xsl:call-template>
            </div>
          </div>
  <!-- Part II, Line 23 -->
          <!-- The following form element does not have a matching element in the schema -->
          <div style="width:187mm;">
            <!--     Extra Space   -->
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            <!-- extra space -->
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >23</div>
            <div class="styLNDesc" style="width:99mm;">
              Passive activity credit from line 3 of all Parts III with box B checked 
            
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">23</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/GBCFromPssvActyAllPartsAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.2mm;height:4.5mm;background-color:lightgrey;border-right-width:1px"/>
          </div>
              <!-- Part II, Line 24 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >24</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Enter the passive activity credit allowed from line 23 for 2011 (see instructions)</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">24</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/PassiveActyAllowedForTYAmt"/>
              </xsl:call-template>
            </div>
          </div>
        <!-- Part II, Line 25 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >25</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Add lines 22 and 24</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">25</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TotalPassiveActivityCreditAmt"/>
              </xsl:call-template>
            </div>
          </div>
           <!-- Part II, Line 26-->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >26</div>
            <div class="styLNDesc" style="width:139mm;">
              Empowerment zone and renewal community employment credit allowed. Enter the smaller of

              <span style="float:left;">line 21 or line 25  
              <!--  --><!-- Push Pin image --><!--
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCybkCrAmt"/>
                </xsl:call-template>-->
              </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:4mm;">26</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/EmpwrZoneAndComEmploymentCr"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 27 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >27</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Subtract line 13 from line 11. If zero or less, enter -0- </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">27</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/NetIncomeTaxLessPctExcessAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 28 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >28</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Add lines 17b and 26 </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">28</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SumSmllrAndEmpwrZnEmplmnCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 29 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >29</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Subtract line 28 from line 27. If zero or less, enter -0- </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">29</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/NetSmllrAndEmpwrZnEmplmnCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
           <!-- Part II, Line 30 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >30</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Enter the general business credit from line 5 of all Parts III with box A checked</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">30</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenBusCrFromNonPssvActyAmt"/>
              </xsl:call-template>
            </div>
          </div>
                <!-- Part II, Line 31 -->
          <!--     Extra Space   -->
            <!-- Part II, Line 26-->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >31</div>
            <div class="styLNDesc" style="width:139mm;">
             <span style="float:left;">Enter the total eligible small business credit from line 6 of all Parts III with box E checked</span> 
              <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:2mm;">31</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-top:2mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TotEligSmllBusCrNonPssvActyAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 32 -->
          <!-- The following form element does not have a matching element in the schema -->
          <!--<div style="width:187mm;">
            --><!--     Extra Space   --><!--
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            --><!-- extra space --><!--
          </div>-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >32</div>
            <div class="styLNDesc" style="width:99mm;">
              Passive activity credits from line 5 of all Parts III with box B checked and 
              <span style="float:left;">line 6 of all Parts III with box F check</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">32</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/GenBusEligSmllBusPssvActyCrAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.2mm;height:8mm;background-color:lightgrey;border-right-width:1px"/>
          </div>
              <!-- Part II, Line 33 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >33</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Enter the passive activity credits allowed from line 32 for 2011 (see instructions)</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">33</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/OtherSpecifiedAllwGenBusCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
        <!-- Part II, Line 34 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >34</div>
            <div class="styLNDesc" style="width:139mm;">
              Carryforward of business credit to 2011. Enter the amount from line 5 of Part III with box C checked 
              <span style="float:left;">and line 6 of Part III with box G checked 
                <!-- Push Pin image -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt"/>
                </xsl:call-template>
              </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:4mm;">34</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCfwdCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
           <!-- Part II, Line 35-->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >35</div>
            <div class="styLNDesc" style="width:139mm;">
              Carryback of business credit from 2012. Enter the amount from line 5 of Part III with box D checked 
              <span style="float:left;">and line 6 of Part III with box H checked 
              <!--  --><!-- Push Pin image --><!--
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCybkCrAmt"/>
                </xsl:call-template>-->
              </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:4mm;">35</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AllwGenAndEligSmllBusCybkCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
            <!-- Part II, Line 36 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >36</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Add lines 30, 31, 33, 34, and 35</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">36</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TotAllwGenAndEligSmllBusCrAmt"/>
              </xsl:call-template>
            </div>
          </div>  <!-- Part II, Line 37 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:139mm;"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >37</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Enter the <b>smaller</b> of line 29 or line 36 </span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">37</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrGenBusCrOrTotGenEligCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
          
          <!-- Part II, Line 38 -->
            <div style="width:187mm;">
            <!--     Extra Space   -->
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            <!-- extra space -->
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" >38</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="styBoldText">
                <b>Credit allowed for the current year.</b>
              </span> Add lines 28 and 37. 
                 <!-- Push Pin image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowed"/>
              </xsl:call-template>
              <br/>
             Report the amount from line 38 (if smaller than the sum of Part I, line 6 and Part II, lines 25 and 36, see instructions)
          as indicated below or on the applicable line of your return: 
         </div>
            <div class="styLNRightNumBox" style="height:10.9mm;border-bottom-width:0px;padding-top:1.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:10.9mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1.5mm;"/>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" />
            <div class="styLNDesc" style="width:115mm;">
              <li>Individuals. Form 1040, line 53, or Form 1040NR, line 50<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">........</span>
              </li>
              <li>Corporations. Form 1120, Schedule J, Part I, line 5c<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">..........</span>
              </li>
              <li>Estates and trusts. Form 1041, Schedule G, line 2b<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">...........</span>
              </li>
            </div>
            <div class="styLNDesc" style="width:5mm;">
              <img src="{$ImagePath}/3800_Bracket_Sm.gif" height="40mm" alt="Curly Bracket Image"/>
            </div>
            <span style="width:18.9mm;height:12mm;letter-spacing:3.3mm; font-weight:bold; float:left; padding-bottom:0mm;padding-top:4mm;padding-right:1mm;">  
                            ....
                    </span>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
            <div class="styLNRightNumBox" >38</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowed"/>
              </xsl:call-template>
            </div>
          </div>
       
          <!--Page 3 Footer -->
          <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
            <div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2011)</div>
          </div>
              <!-- Page 3 Header -->
          <div style="width:187mm;clear:both;padding-bottom:0mm;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 3800 (2011)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
            </div>
          </div>

                             
                                                                      <!--    Start Blank Page 3-->
           <xsl:choose>
				<xsl:when test="$Form3800Data/GenBusCrOrEligSmllBusCrGrp">
										
 
                                                             <!-- ********    CheckBox I  ******** -->
                              <br/> <br/>
                                
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp">
                <xsl:call-template name="PartIIITemplate"/>
             </xsl:for-each>
        <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>     
          
                                                              <!-- ********    CheckBox A  ******** -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrFromNnpssvActyGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>
               
                                                              <!-- ********    CheckBox B WORK ON ******** -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrFromPassiveActyGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>
             
                
                                                              <!-- ********    CheckBox C  ******** -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrCarryforwardsGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>    
             
                                                               <!-- ********    CheckBox D  ******** -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/GeneralBusCrCarrybacksGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>    
             
                                                                 <!-- ********    CheckBox E  *WORK on******* -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrFromNnpssvActyGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>    
             
                                                                   <!-- ********    CheckBox F  ******** -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrFromPssvActyGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>    
             
                                                                   <!-- ********    CheckBox G  ******** -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrCarryforwardsGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>    
             
                                                                   <!-- ********    CheckBox H  ******** -->
            <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/EligSmllBusCrCarrybacksGrp">
                <xsl:call-template name="PartIIITemplate"/>
                 <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend"/>
             </xsl:for-each>    
            </xsl:when>
            <xsl:otherwise>
             <xsl:call-template name="PartIIIemptyTemplate"/>
               </xsl:otherwise>
           	</xsl:choose>
         <!--Page 3 Footer -->
          <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
            <div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2011)</div>
          </div>
         
         
          
          
          <!--ADDITIONAL DATA SECTION-->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
        Additional Data        
      </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
         <!-- <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@sec383Or384Indicator"/>
                </xsl:call-template>
                
                 <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Section 41(G) Indicator Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrAdjNetAmt/@sec383Or384Indicator"/>
                </xsl:call-template>-->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form3800Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 17a - sec383 or sec384 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrTotAdjAmt/@sec383Or384Indicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 17b - sec383 or sec384 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3800Data/SmllrCYNotAllwTMTOrAdjNetAmt/@sec383Or384Indicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="PartIIITemplate">
    
          <!--     Checkbox Iiiiiiiii  -->
	   <div style="width:187mm">

                                                               <!--     Checkbox Aaaaaaaa  -->
			<!-- <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp">-->
			<!-- <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp">-->
			
			    <div class="styBB" style="width:187mm; ">
                   <div class="styPartName" style="background-color:black;">Part III</div>
                  <div class="styPartDesc">
                   <span style="width:8px;"/>General Business Credits or Eligible Small Business Credits <span style="font-weight:normal">(see instructions)</span> 
                  </div>
               </div> 
                        <!--Part II Continue, Note Line -->
               
               <div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
                   <div     style="width:140mm;">Complete a separate Part III for each box checked below. (see instructions)</div>
                                  
                          
                                <div style="height:1mm;width:187mm;float:left;">
                  <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">A</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="GeneralBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit From a Non-Passive Activity
							</label>
						</span>
						
						<span style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">E</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromNnpssvActyGrp/EligSmllBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit From a Non-Passive Activity
                      </label>
                     </span>
        
                    <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">B</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromPassiveActyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromPassiveActyInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromPassiveActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit From a Passive Activity
							</label>
						</span>
                      <span style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">F</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromPssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromPssvActyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromPssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromPssvActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit From a Passive Activity
                      </label>
                     </span>
                     
                 <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">C</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarryforwardsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarryforwardsInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit Carryforwards
							</label>
						</span>
                      <span style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">G</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarryforwardsInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarryforwardsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarryforwardsInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarryforwardsInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit Carryforwards
                      </label>
                      
                     </span>
                     
                                     
                     
                          <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">D</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit Carrybacks
							</label>
						</span>
                      <span   style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-top:.15mm">H</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit Carrybacks
                      </label> 
                     </span>
                     <span class="styLNDesc"  style="width:180mm;padding-left:1mm;"><b>I</b><span style="width:3.5mm;"/>  If you are filing more than one Part
                      III with box A, B, E, or F checked, complete and attach first an additional Part III combining</span>
                      <span class="styLNDesc"  style="width:180mm;padding-left:6mm;"> amounts from all Parts III with boxes A, B, E, or F checked.
                          Check here if this is the consolidated Part III   
                       <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;" >...
                     </span><img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                     <span style="width:5mm"/>
                    <input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="ConsolidatedSectionInd"/>
									<xsl:with-param name="BackupName">IRS3800ConsolidatedSectionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							
                      <!--start here III-->
                      </span>
                      
						</div>
 
 
 
			
 <!--<div  style="width:187mm;">
            <div class="styNameBox" style="width:122.5mm;height:14mm;font-weight:normal;border-top-width:1px;border-bottom-width:1px;">
              <div class="styPartDesc" style="width:115mm;text-align:center;font-weight:normal;background-color:yellow"><b>(a)</b> Description of credit</div>
              <div class="styPartDesc" style="width:115mm;font-weight:normal;background-color:lightblue;">
							<b>Note:</b> On any line where the credit is from more than one source and one of the sources is a pass-through entity, a separate Part III
							is needed for each pass-through entity.
							</div> 
            </div>
            <div class="styNameBox" style="width:32mm;height:14mm;border-top-width:1px;background-color:lightblue;">
                <div class="styPartDesc" style="width:30mm;text-align:center;border-right-width:0px;font-weight:normal"><b>(b)</b></div>
                <div class="styPartDesc" style="width:31mm;border-right-width:0px;font-weight:normal;font-size:9px;background-color:yellow">
                If claiming the credit from a pass-through entity, enter the EIN
                </div>
            </div>
            <div class="styNameBox" style="width:32mm;height:14mm;border-top-width:1px;border-right-width:0px;background-color:red">
                <div class="styPartDesc" style="width:30mm;text-align:center;border-right-width:0px;font-weight:normal;background-color:pink"><b>(c)</b></div>
                <div class="styPartDesc" style="width:31mm;border-right-width:0px;font-weight:normal;text-align:center;background-color:yellow">
                Enter the appropriate amount
                </div>       
            </div>
          </div>-->
          <div style="width:187mm;">

<div class="styNameBox" style="text-align:center;width:123.2mm;height:14mm;font-weight:normal;font-size:8pt;

border-top-width:1px;border-bottom-width:1px;">

<b>(a)</b> Description of credit

<br/>

<div style="text-align:left;">

<b>Note:</b> On any line where the credit is from more than one source and one

of the sources is a pass-through entity, a separate Part III

is needed for each pass-through entity.

</div>

</div>

<div class="styNameBox" style="text-align:center;width:32mm;height:14mm;

border-top-width:1px;font-size:8pt;">

<b>(b)</b>

<br/>

If claiming the credit from a pass-through entity, enter the EIN

</div>

<div class="styNameBox" style="font-size:8pt;text-align:center;width:31mm;

height:14mm;border-top-width:1px;border-right-width:0px;">

<b>(c)</b>

<br/>

Enter the appropriate amount

</div>

</div>

 
					<!-- Schedule C Line 1a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1a</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Investment (Form 3468, Part II only) (attach Form 3468) 
                      <!--Dotted Line -->
                        <!-- Push Pin image -->
                        <span style="float:none;">
                       <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/CurrentYearInvestmentCredit"/>
                                    </xsl:call-template></span>
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1a</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center">
							<xsl:if test="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearInvestmentCreditGrp/CurrentYearInvestmentCredit"/>
								</xsl:call-template></div>
						
						</div>
					</div>
						<!-- Schedule C Line 1b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="border-top:0px solid black;">1b</div>
							<div class="styLNAmountBoxNBB" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
							<div class="styLNAmountBoxNBB" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
						</div>
					</div>
				<!-- Schedule C Line 1c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Increasing research activities (Form 6765)
                      <!--Dotted Line -->
                     <!-- Push Pin image -->
                         <span style="float:none;">
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/CYIncreasingResearchCr"/>
                                    </xsl:call-template></span>
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">..........</span>
                        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:1px;">1c</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							 <xsl:if test="BusinessCreditsGrp/CYIncreasingResearchCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYIncreasingResearchCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							  
                                 
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYIncreasingResearchCrGrp/CYIncreasingResearchCr"/>
								</xsl:call-template></div>
							
						</div>
					</div>
							<!-- Schedule C Line 1d-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Low-income housing (Form 8586, Part I only) 
                 <!-- Push Pin image -->
                  <span style="float:none;">
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/CYLowIncomeHousingCr"/>
                                    </xsl:call-template></span>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">........</span>
                   		</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1d</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							     <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowIncomeHousingCrGrp/CYLowIncomeHousingCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
						<!-- Schedule C Line 1e-->
						
						
						<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                Disabled access (Form 8826) (do not enter more than $5,000 in column (c) of Parts III with box A, B, E, or F checked, combined)
                              <!-- Push Pin image -->
								 <span style="float:none;">
							     <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/CurrentYearDisabledAccessCr"/>
                                    </xsl:call-template></span>
                      <!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">.......</span>
							
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;text-align:center;">1e</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;">
							 	<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearDisabledAccessCrGrp/CurrentYearDisabledAccessCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 1e -->
							<!-- Schedule C Line 1f-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Renewable electricity, refined coal, and Indian coal production (Form 8835) 
                                 <!-- Push Pin image -->
				                   <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/CYRenewableElectricityCredit"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;"></span>
                    		</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1f</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								<xsl:if test="BusinessCreditsGrp/CYRenewableElectricityCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYRenewableElectricityCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYRenewableElectricityCrGrp/CYRenewableElectricityCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 1g-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Indian employment (Form 8845)
                <!-- Push Pin image -->
				                   <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/CurrentYearIndianEmplmnCr"/>
                                    </xsl:call-template>
                                
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">............</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1g</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								<xsl:if test="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
						
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearIndianEmplmnCrGrp/CurrentYearIndianEmplmnCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 1h-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Orphan drug (Form 8820)
                	<!-- Push Pin image -->
						   <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/CurrentYearOrphanDrugCredit"/>
                                    </xsl:call-template>
                                    
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..............</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1h</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								<xsl:if test="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
					
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearOrphanDrugCreditGrp/CurrentYearOrphanDrugCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 1i-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                New markets (Form 8874) 
                 <!-- Push Pin image -->
					                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/CurrentYearNewMarketsCredit"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..............</span>
   
                     
                                  
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1i</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
						<xsl:if test="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearNewMarketsCreditGrp/CurrentYearNewMarketsCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
	<!-- Schedule C Line1j-->
		<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">j</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                Small employer pension plan startup costs (Form 8881) (do not enter more than $500 in column (c) of Parts III with box A, B, E, or F checked,
                 combined)
                      <!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;"></span>
										<!-- Push Pin image -->
						 <span style="width:3mm;"/>
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/CYSmallEmployerPensionPlanCr"/>
                                    </xsl:call-template>
                                   
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;">1j</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;">
			
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYSmallEmployerPensionPlanGrp/CYSmallEmployerPensionPlanCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
			<!-- Schedule C Line 1k-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">k</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Employer-provided child care facilities and services (Form 8882)
                  	<!-- Push Pin image -->
							
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/CYEmplrProvChildCareFcltsCr"/>
                                    </xsl:call-template>
                                     
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1k</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							<xsl:if test="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
						
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEmplrProvChildCareFcltsCrGrp/CYEmplrProvChildCareFcltsCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>		
															<!-- Schedule C Line 1l-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">l</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Biodiesel and renewable diesel fuels  (attach Form 8864) 
                  <!-- Push Pin image -->
				
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/CurrentYearBiodieselFuelCredit"/>
                                    </xsl:call-template>
                                     
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.....</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1l</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
								<xsl:if test="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/CurrentYearBiodieselFuelCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>		
															<!-- Schedule C Line 1m-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">m</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Low sulfur diesel fuel production (Form 8896) 
                   	<!-- Push Pin image -->
								
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/CYLowSulfurDieselCredit"/>
                                    </xsl:call-template>
                              
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
                   
                      	</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1m</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
								<xsl:if test="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
									
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYLowSulfurDieselCreditGrp/CYLowSulfurDieselCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>		
															<!-- Schedule C Line 1n-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">n</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Distilled spirits (Form 8906) 
                     <!-- Push Pin image -->
						
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/DistilledSpiritsCredit"/>
                                    </xsl:call-template>
                                  
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.............</span>
                 
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1n</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							<xsl:if test="BusinessCreditsGrp/DistilledSpiritsCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/DistilledSpiritsCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DistilledSpiritsCreditGrp/DistilledSpiritsCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>		
																<!-- Schedule C Line 1o-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">o</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Nonconventional source fuel (Form 8907)
                 	<!-- Push Pin image -->
						            <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/CYNonconventionalFuelCredit"/>
                                    </xsl:call-template>
                                 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.........</span>
                     
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1o</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							<xsl:if test="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYNonconventionalFuelCreditGrp/CYNonconventionalFuelCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1p-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">p</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
               Energy efficient home (Form 8908)
                                   <!-- Push Pin image -->
			                         <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/CYEnergyEfficientHomeCredit"/>
                                    </xsl:call-template>
                                    <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">............</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1p</div>
							
							<div class="styLNAmountBox" style="border-bottom-width:0px;;border-top:1px solid black;text-align:center;">
							
							<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientHomeCreditGrp/CYEnergyEfficientHomeCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1q-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">q</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Energy efficient appliance (Form 8909) 
                                    			<!-- Push Pin image -->
								
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/CYEnergyEfficientApplianceCr"/>
                                    </xsl:call-template>
                                    
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..........</span>
  
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1q</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
									
							<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
						
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYEnergyEfficientApplianceGrp/CYEnergyEfficientApplianceCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1r-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">r</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Alternative motor vehicle (Form 8910) 
                <!-- Push Pin image -->
									 
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/CYAlternativeMotorVehicleCrdt"/>
                                    </xsl:call-template>
                                    
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1r</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
									
							<xsl:if test="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeMotorVehicleCrGrp/CYAlternativeMotorVehicleCrdt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
												
                    				<!-- Schedule C Line 1s-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">s</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Alternative fuel vehicle refueling property (Form 8911) 
                <!-- Push Pin image -->
								
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/CYAlternativeRefuelingCredit"/>
                                    </xsl:call-template>
                                     
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1s</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
										
							<xsl:if test="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYAlternativeRefuelingCrGrp/CYAlternativeRefuelingCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
					<!-- Schedule C Line 1t-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">t</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1t</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
						</div>
					</div>
																<!-- Schedule C Line 1u-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">u</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Mine rescue team training (Form 8923)
                 	<!-- Push Pin image -->
							
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MineRescueTeamTrainingCredit"/>
                                    </xsl:call-template>
                                   
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..........</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1u</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
										
							<xsl:if test="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/MineRescueTeamTrainingCrGrp/MineRescueTeamTrainingCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
					<!-- End Schedule C Line 1v -->
				<!-- Schedule C Line 1v-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">v</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
              Agricultural chemicals security (Form 8931) (do not enter more than $2 million in column (c) of Parts III with box A, B, E, or F checked, combined)
                      <!--Dotted Line -->
                      	<!-- Push Pin image -->
									
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/AgriculturalChemicalsCredit"/>
                                    </xsl:call-template>
                                   
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">...</span>
							
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;">1v</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;text-align:center;">
									
							<xsl:if test="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AgriculturalChemicalsCreditGrp/AgriculturalChemicalsCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 1v -->
																<!-- Schedule C Line 1w-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">w</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Employer differential wage payments (Form 8932) 
                 <!-- Push Pin image -->
								
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/DifferentialWagePaymentsCredit"/>
                                    </xsl:call-template>
                                   
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
                     
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;text-align:center;">1w</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
									
							<xsl:if test="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/DifferentialWagePaymentsCrGrp/DifferentialWagePaymentsCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1x-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">x</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Carbon dioxide sequestration (Form 8933)
                  	<!-- Push Pin image -->
					              <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/CarbonDioxideCredit"/>
                                    </xsl:call-template>
                                  
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1x</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
									
							<xsl:if test="BusinessCreditsGrp/CarbonDioxideCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CarbonDioxideCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
						
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/CarbonDioxideCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1y-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">y</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Qualified plug-in electric drive motor vehicle (Form 8936) 
                               <!-- Push Pin image -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/QlfyPlugInElecDriveMtrVehCrAmt"/>
                                    </xsl:call-template>
                                   
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.....</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1y</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
											
							<xsl:if test="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/QlfyPlugInElecDriveMtrVehCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1z-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Qualified plug-in electric vehicle (Form 8834, Part I only) 
                  <!-- Push Pin image -->
						
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/AllowableQlfyElectricVehicleCr"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.....</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1z</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
											
							<xsl:if test="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AllowableQlfyElectricVehGrp/AllowableQlfyElectricVehicleCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
                     		<!-- Schedule C Line 1aa-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">aa</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                New hire retention (Form 5884-B) 
                <!-- Push Pin image -->
						
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/NewHireRetentionCreditAmt"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1aa</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
											
							<xsl:if test="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
					
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/NewHireRetentionCreditAmtGrp/NewHireRetentionCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																			<!-- Schedule C Line 1bb-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:4mm;">bb</div>
							<div class="styLNDesc" style="width:107mm;padding-top:1mm;"> 
                General credits from an electing large partnership (Schedule K-1 (Form 1065-B) 
                  <!-- Push Pin image -->
							
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/CYGenBusCrElectingLargePrtshp"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;border-bottom-width:0px;">.....................</span>
                    
                                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;height:8mm;padding-top:3mm;">1bb</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;height:8mm;padding-top:3mm;">
												
							<xsl:if test="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8mm;padding-top:3mm;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CYGenBusCrElectingLgePrtshpGrp/CYGenBusCrElectingLargePrtshp"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																				<!-- Schedule C Line 1zz-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">zz</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Other 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">....................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1zz</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
														
							<xsl:if test="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							<!-- Push Pin image -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/OtherCurrentYearCreditAmt"/>
                                    </xsl:call-template>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherCurrentYearCreditAmtGrp/OtherCurrentYearCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>		

 					<!-- Schedule C Line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">2</div>
							<div class="styLNDesc" style="width:107mm;"> 
                Add lines 1a through 1zz and enter here 
                      <!--Dotted Line -->
					<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearGeneralBusCr"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 2 -->
					<!-- Schedule C Line 3-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">3</div>
							<div class="styLNDesc" style="width:107mm;">
          Enter the amount from Form 8844
          <!-- Push Pin image -->
							

                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/EnterAmountFromF8844"/>
                                    </xsl:call-template>
          <!--Dotted Line -->
				<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">............</span>
				
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;">3</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;text-align:center;">
															
							<xsl:if test="BusinessCreditsGrp/EnterAmountFromF8844Grp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/EnterAmountFromF8844Grp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;">
								
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/EnterAmountFromF8844Grp/EnterAmountFromF8844"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
              					<!-- Schedule C Line 4a-->
										<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;border-bottom-width:0px;">4a</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Investment (Form 3468, Part III) (attach Form 3468) 
                                     <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/InvestmentCredit"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                     
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">4a</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
															
							<xsl:if test="BusinessCreditsGrp/InvestmentCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/InvestmentCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
					<!-- Push Pin image -->
					
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/InvestmentCreditGrp/InvestmentCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	

						<!-- Schedule C Line 4b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Work opportunity (Form 5884)
                <!-- Push Pin image -->
							<xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/WorkOpportunityCreditFrom5884"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.............</span>
                      
                      </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:px solid black;border-bottom-width:0px;">4b</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
																
							<xsl:if test="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/WorkOpportunityCrFrom5884Grp/WorkOpportunityCreditFrom5884"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				<!-- Schedule C Line4c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Alcohol and cellulosic biofuel fuels (Form 6478) 
                <!-- Push Pin image -->
								
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AlcoholAndCellulosicFuelCrGrp/AlcoholAndCellulosicFuelCredit"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">.........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">4c</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
																
							<xsl:if test="BusinessCreditsGrp/AlcoholAndCellulosicFuelCrGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AlcoholAndCellulosicFuelCrGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/AlcoholAndCellulosicFuelCrGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AlcoholAndCellulosicFuelCrGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/AlcoholAndCellulosicFuelCrGrp/AlcoholAndCellulosicFuelCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
							<!-- Schedule C Line 4d-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Low-income housing (Form 8586, Part II) 
                   	<!-- Push Pin image -->
						
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/LowIncomeHousingCredit"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">.........</span>
                   
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:0px solid black;text-align:center;">4d</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
															
							<xsl:if test="BusinessCreditsGrp/LowIncomeHousingCreditGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/LowIncomeHousingCreditGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
					
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/LowIncomeHousingCreditGrp/LowIncomeHousingCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
						<!-- Schedule C Line 4e-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;padding-top:1mm;"> 
               Renewable electricity, refined coal, and Indian coal production (Form 8835)
                <!-- Push Pin image -->
								
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/RnwblElecCoalCreditFromF8835"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;"></span>
								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:2mm;padding-top:1mm;">4e</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:2mm;padding-top:1mm;text-align:center;">
																
							<xsl:if test="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:5mm;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/RnwblElecCoalCrFromF8835Grp/RnwblElecCoalCreditFromF8835"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 4e -->
							<!-- Schedule C Line 4f-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Employer social security and Medicare taxes paid on certain employee tips (Form 8846) 
                	<!-- Push Pin image -->
								
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/CreditForEmployerSSMedicareTax"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">4f</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;text-align:center;">
																	
							<xsl:if test="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/CreditForEmployerSSMedicareTax"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 4g-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Qualified railroad track maintenance (Form 8900) 
                							<!-- Push Pin image -->
															
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/QualifiedRailroadTrackMaint"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4g</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
													
							<xsl:if test="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QualifiedRailroadTrackMaintGrp/QualifiedRailroadTrackMaint"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 4h-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Small employer health insurance premiums (Form 8941)
                									<!-- Push Pin image -->
																
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/SmallEmployerHIPCreditAmt"/>
                                    </xsl:call-template>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4h</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
														
							<xsl:if test="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SmallEmployerHIPCreditAmtGrp/SmallEmployerHIPCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 4i-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4i</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
						</div>
					</div>					
												<!-- Schedule C Line 4j-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4j</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
						</div>
					</div>					
													<!-- Schedule C Line 4z-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Other 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">4z</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
																
							<xsl:if test="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/EINOfPassThroughEntity !=''">
						         <xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/EINOfPassThroughEntity"/>
								  </xsl:call-template>
								</xsl:if>
								<xsl:if test="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/MissingEINReason !=''">
						         <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/MissingEINReason"/>
								  </xsl:call-template>
								</xsl:if>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
																	<!-- Push Pin image -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/OtherSpecifiedCreditAmt"/>
                                    </xsl:call-template>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/OtherSpecifiedCreditAmtGrp/OtherSpecifiedCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>			
										<!-- Schedule C Line 5-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm">5</div>
							<div class="styLNDesc" style="width:107mm;"> 
                Add lines 4a through 4z and enter here 
                      <!--Dotted Line -->
					<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">5</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey;">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;">
					<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/SumOfAllowableGeneralBusCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 5 -->
					<!-- Schedule C Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm">6</div>
							<div class="styLNDesc" style="width:107mm;p">
          Add lines 2, 3, and 5
          <!--Dotted Line -->
				<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey;">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/TotalBusinessCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					

   </div> 
   <!--</xsl:for-each>-->  
   </div>
  </xsl:template>
  
 <xsl:template name="PartIIIemptyTemplate">
    
          <!--     Checkbox Iiiiiiiii  -->
	   <div style="width:187mm">

                                                               <!--     Checkbox Aaaaaaaa  -->
			<!-- <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp">-->
			<!-- <xsl:for-each select="$Form3800Data/GenBusCrOrEligSmllBusCrGrp/ConsolidatedBusinessCreditsGrp">-->
			
			    <div class="styBB" style="width:187mm; ">
                   <div class="styPartName" style="background-color:black;">Part III</div>
                  <div class="styPartDesc">
                   <span style="width:8px;"/>General Business Credits or Eligible Small Business Credits <span style="font-weight:normal">(see instructions)</span> 
                  </div>
               </div> 
                        <!--Part II Continue, Note Line -->
               
               <div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
                   <div     style="width:140mm;">Complete a separate Part III for each box checked below. (see instructions)</div>
                                  
                          
                                <div style="height:1mm;width:187mm;float:left;">
                  <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">A</span>
							<input type="checkbox" class="styCkbox">
								
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit From a Non-Passive Activity
							</label>
						</span>
						
						<span style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">E</span>
							<input type="checkbox" class="styCkbox">
								
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromNnpssvActyGrp/EligSmllBusCrFromNnpssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromNnpssvActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit From a Non-Passive Activity
                      </label>
                     </span>
        
                    <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">B</span>
							<input type="checkbox" class="styCkbox">
								
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrFromPassiveActyGrp/GeneralBusCrFromPassiveActyInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrFromPassiveActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit From a Passive Activity
							</label>
						</span>
                      <span style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">F</span>
							<input type="checkbox" class="styCkbox">
								
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrFromPssvActyInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrFromPssvActyInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit From a Passive Activity
                      </label>
                     </span>
                     
                 <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">C</span>
							<input type="checkbox" class="styCkbox">
								
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrCarryforwardsInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarryforwardsInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit Carryforwards
							</label>
						</span>
                      <span style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">G</span>
							<input type="checkbox" class="styCkbox">
								
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarryforwardsInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarryforwardsInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit Carryforwards
                      </label>
                      
                     </span>
                     
                                     
                     
                          <span style="width:90mm;">
                  <span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">D</span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="GeneralBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800GeneralBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>General Business Credit Carrybacks
							</label>
						</span>
                      <span   style="width:90mm;">	
						<span class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;">H</span>
							<input type="checkbox" class="styCkbox">
								
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EligSmllBusCrCarrybacksInd"/>
									<xsl:with-param name="BackupName">IRS3800EligSmllBusCrCarrybacksInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Eligible Small Business Credit Carrybacks
                      </label> 
                     </span>
                     <span class="styLNDesc"  style="width:180mm;padding-left:1mm;"><b>I</b><span style="width:3.5mm;"/>  If you are filing more than one Part
                      III with box A, B, E, or F checked, complete and attach first an additional Part III combining</span>
                      <span class="styLNDesc"  style="width:180mm;padding-left:6mm;"> amounts from all Parts III with boxes A, B, E, or F checked.
                          Check here if this is the consolidated Part III   
                       <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;" >...
                     </span><img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                     <span style="width:5mm"/>
                    <input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="ConsolidatedSectionInd"/>
									<xsl:with-param name="BackupName">IRS3800ConsolidatedSectionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							
                      <!--start here III-->
                      </span>
                      
						</div>
 
 
 
			
 
          <div style="width:187mm;">

<div class="styNameBox" style="text-align:center;width:123.2mm;height:14mm;font-weight:normal;font-size:8pt;

border-top-width:1px;border-bottom-width:1px;">

<b>(a)</b> Description of credit

<br/>

<div style="text-align:left;">

<b>Note:</b> On any line where the credit is from more than one source and one

of the sources is a pass-through entity, a separate Part III

is needed for each pass-through entity.

</div>

</div>

<div class="styNameBox" style="text-align:center;width:32mm;height:14mm;

border-top-width:1px;font-size:8pt;">

<b>(b)</b>

<br/>

If claiming the credit from a pass-through entity, enter the EIN

</div>

<div class="styNameBox" style="font-size:8pt;text-align:center;width:31mm;

height:14mm;border-top-width:1px;border-right-width:0px;">

<b>(c)</b>

<br/>

Enter the appropriate amount

</div>

</div>

 
					<!-- Schedule C Line 1a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1a</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Investment (Form 3468, Part II only) (attach Form 3468) 
                      <!--Dotted Line -->
                        <!-- Push Pin image -->
                      
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1a</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								</div>
						
						</div>
					</div>
						<!-- Schedule C Line 1b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="border-top:0px solid black;">1b</div>
							<div class="styLNAmountBoxNBB" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
							<div class="styLNAmountBoxNBB" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
						</div>
					</div>
				<!-- Schedule C Line 1c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Increasing research activities (Form 6765)
                      <!--Dotted Line -->
                     <!-- Push Pin image -->
                         <span style="float:none;">
                                </span>
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">..........</span>
                        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:1px;">1c</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							  							</div>
							
						</div>
					</div>
							<!-- Schedule C Line 1d-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Low-income housing (Form 8586, Part I only) 
                 <!-- Push Pin image -->
                  <span style="float:none;">
                                </span>
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">........</span>
                   		</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1d</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							</div>
						</div>
					</div>					
						<!-- Schedule C Line 1e-->
						
						
						<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                Disabled access (Form 8826) (do not enter more than $5,000 in column (c) of Parts III with box A, B, E, or F checked, combined)
                              <!-- Push Pin image -->
								 <span style="float:none;">
							    </span>
                      <!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">.......</span>
							
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;text-align:center;">1e</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;">
							 	
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 1e -->
							<!-- Schedule C Line 1f-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Renewable electricity, refined coal, and Indian coal production (Form 8835) 
                                 <!-- Push Pin image -->
				             
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;"></span>
                    		</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1f</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
								
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 1g-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Indian employment (Form 8845)
               
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">............</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1g</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
						
								
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 1h-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Orphan drug (Form 8820)
                	<!-- Push Pin image -->
						  
                                    
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..............</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1h</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
					
								
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 1i-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                New markets (Form 8874) 
                
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..............</span>
   
                     
                                  
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1i</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
						
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							
								
							</div>
						</div>
					</div>					
	<!-- Schedule C Line1j-->
		<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">j</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                Small employer pension plan startup costs (Form 8881) (do not enter more than $500 in column (c) of Parts III with box A, B, E, or F checked,
                 combined)
                      <!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;"></span>
										<!-- Push Pin image -->
						 <span style="width:3mm;"/>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;">1j</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;">
							</div>
						</div>
					</div>
			<!-- Schedule C Line 1k-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">k</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Employer-provided child care facilities and services (Form 8882)
                  
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1k</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								</div>
						</div>
					</div>		
															<!-- Schedule C Line 1l-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">l</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Biodiesel and renewable diesel fuels  (attach Form 8864) 
                  <!-- Push Pin image -->
				
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CurrentYearBiodieselFuelCrGrp/CurrentYearBiodieselFuelCredit"/>
                                    </xsl:call-template>
                                     
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.....</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1l</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>		
															<!-- Schedule C Line 1m-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">m</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Low sulfur diesel fuel production (Form 8896) 
                   	<!-- Push Pin image -->
							                <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
                   
                      	</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1m</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
						</div>
					</div>		
															<!-- Schedule C Line 1n-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">n</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Distilled spirits (Form 8906) 
                                     <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.............</span>
                 
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1n</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
								</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
						</div>
					</div>		
																<!-- Schedule C Line 1o-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">o</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Nonconventional source fuel (Form 8907)
                 	                    <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.........</span>
                     
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1o</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1p-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">p</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
               Energy efficient home (Form 8908)
                                
                                    <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">............</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1p</div>
							
							<div class="styLNAmountBox" style="border-bottom-width:0px;;border-top:1px solid black;text-align:center;">
									</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1q-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">q</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Energy efficient appliance (Form 8909) 
                      
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..........</span>
  
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1q</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1r-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">r</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Alternative motor vehicle (Form 8910) 
               
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1r</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
							</div>
						</div>
					</div>	
												
                    				<!-- Schedule C Line 1s-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">s</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Alternative fuel vehicle refueling property (Form 8911) 
               
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1s</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>	
					<!-- Schedule C Line 1t-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">t</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">................</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1t</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">
								
							</div>
						</div>
					</div>
																<!-- Schedule C Line 1u-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">u</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Mine rescue team training (Form 8923)
                 	
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">..........</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1u</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
										
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>	
					<!-- End Schedule C Line 1v -->
				<!-- Schedule C Line 1v-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">v</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
              Agricultural chemicals security (Form 8931) (do not enter more than $2 million in column (c) of Parts III with box A, B, E, or F checked, combined)
                      <!--Dotted Line -->
                      	
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">...</span>
							
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-bottom-width:0px;">1v</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:8.5mm;padding-top:4mm;">
								
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 1v -->
																<!-- Schedule C Line 1w-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">w</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Employer differential wage payments (Form 8932) 
                 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
                     
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;text-align:center;">1w</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
								
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1x-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">x</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Carbon dioxide sequestration (Form 8933)
                  	
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1x</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
									</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
						
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CarbonDioxideCreditGrp/CarbonDioxideCredit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1y-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">y</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Qualified plug-in electric drive motor vehicle (Form 8936) 
                               <!-- Push Pin image -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="BusinessCreditsGrp/QlfyPlugInElecDriveMtrVehCrGrp/QlfyPlugInElecDriveMtrVehCrAmt"/>
                                    </xsl:call-template>
                                   
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.....</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1y</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;">
							
							</div>
						</div>
					</div>	
																<!-- Schedule C Line 1z-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Qualified plug-in electric vehicle (Form 8834, Part I only) 
                  
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.....</span>
                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1z</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
											
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>	
                     		<!-- Schedule C Line 1aa-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">aa</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                New hire retention (Form 5884-B) 
               
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1aa</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
												</div>
						</div>
					</div>	
																			<!-- Schedule C Line 1bb-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox">bb</div>
							<div class="styLNDesc" style="width:107mm;padding-top:1mm;"> 
                General credits from an electing large partnership (Schedule K-1 (Form 1065-B) 
                  
                                  
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;border-bottom-width:0px;"></span>
                    
                                    
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">1bb</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							
							</div>
						</div>
					</div>	
																				<!-- Schedule C Line 1zz-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">zz</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Other 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">....................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">1zz</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
														
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>		

 					<!-- Schedule C Line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">2</div>
							<div class="styLNDesc" style="width:107mm;"> 
                Add lines 1a through 1zz and enter here 
                      <!--Dotted Line -->
					<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">...........</span>
						</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">2</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;">
							
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 2 -->
					<!-- Schedule C Line 3-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm;">3</div>
							<div class="styLNDesc" style="width:107mm;">
          Enter the amount from Form 8844
          
          <!--Dotted Line -->
				<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">............</span>
				
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;">3</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;text-align:center;">
															
						
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;">
							
							</div>
						</div>
					</div>
              					<!-- Schedule C Line 4a-->
										<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;border-bottom-width:0px;">4a</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Investment (Form 3468, Part III) (attach Form 3468) 
                               
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                     
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">4a</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
															
							
							</div>
							
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
					
							</div>
						</div>
					</div>	

						<!-- Schedule C Line 4b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Work opportunity (Form 5884)
               
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">.............</span>
                      
                      </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:px solid black;border-bottom-width:0px;">4b</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:0px solid black;">
							
							</div>
						</div>
					</div>
				<!-- Schedule C Line4c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Alcohol and cellulosic biofuel fuels (Form 6478) 
                
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;float-right;">.........</span>
                      	
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">4c</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
																
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
								
							</div>
						</div>
					</div>
							<!-- Schedule C Line 4d-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">d</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Low-income housing (Form 8586, Part II) 
                  
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;">.........</span>
                   
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:0px solid black;text-align:center;">4d</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
					
							
							</div>
						</div>
					</div>					
						<!-- Schedule C Line 4e-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">e</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;padding-top:1mm;"> 
               Renewable electricity, refined coal, and Indian coal production (Form 8835)
                
                      <!--Dotted Line -->
							<span style="letter-spacing:4mm;font-weight:bold;padding-left:2.8mm;"></span>
								
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:2mm;padding-top:1mm;">4e</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:2mm;padding-top:1mm;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:5mm;">
							
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 4e -->
							<!-- Schedule C Line 4f-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">f</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Employer social security and Medicare taxes paid on certain employee tips (Form 8846) 
                
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">4f</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;text-align:center;">
						
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;height:8.5mm;padding-top:4mm;">
							
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessCreditsGrp/CrForEmployerSSMedicareTaxGrp/CreditForEmployerSSMedicareTax"/>
								</xsl:call-template>
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 4g-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">g</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Qualified railroad track maintenance (Form 8900) 
                		
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4g</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
													
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 4h-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">h</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Small employer health insurance premiums (Form 8941)
                		
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">......</span>
                      
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4h</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;text-align:center;">
														
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;">
							
							</div>
						</div>
					</div>					
											<!-- Schedule C Line 4i-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4i</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
						</div>
					</div>					
												<!-- Schedule C Line 4j-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">i</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Reserved for future use 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;border-bottom-width:0px;">4j</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;border-top:1px solid black;background-color:lightgrey">	</div>
						</div>
					</div>					
													<!-- Schedule C Line 4z-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">z</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;"> 
                Other 
                      <!--Dotted Line -->
                      <span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">................</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="border-top:1px solid black;">4z</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;text-align:center;">
							
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;border-top:1px solid black;">
																	<!-- Push Pin image -->
                                
							</div>
						</div>
					</div>			
										<!-- Schedule C Line 5-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm">5</div>
							<div class="styLNDesc" style="width:107mm;"> 
                Add lines 4a through 4z and enter here 
                      <!--Dotted Line -->
					<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">5</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey;">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;">
				
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 5 -->
					<!-- Schedule C Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="padding-left:2.25mm">6</div>
							<div class="styLNDesc" style="width:107mm;p">
          Add lines 2, 3, and 5
          <!--Dotted Line -->
				<span style="letter-spacing:4mm;font-weight:bold;padding-left:1.9mm;">........</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;background-color:lightgrey;">
								
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;">
									
							</div>
						</div>
					</div>
					

   </div> 
   <!--</xsl:for-each>-->  
   </div>
  </xsl:template>
  
</xsl:stylesheet>
