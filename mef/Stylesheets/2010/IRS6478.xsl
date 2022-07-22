<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS6478Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form6478Data" select="$RtnDoc/IRS6478"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form6478Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching   -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Author" content="Ravi Venigalla"/>
        <meta name="Description" content="TY 2007 IRS Form 6478"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!-- Form 6478 CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS6478Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form6478" id="Form6478">
          <!-- Standard Warning Lines -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:21mm;">
            Form <span class="styFormNumber">6478</span>
              <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form6478Data"/>
              </xsl:call-template>
              <br/>
              <div style="padding-top:1.5mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:13mm;">
              <div class="styMainTitle" style="padding-top:1.5mm;">
          	  Alcohol and Cellulosic Biofuel Fuels Credit          
          	 </div>
              <br/>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:5mm;">
                <img src="{$ImagePath}/6478_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
              Attach to your tax return.
          </div>
            </div>
            <!-- This can be taken out later -->
            <div class="styTYBox" style="width:30mm;height:21mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0231</div>
              <div class="styTY" style="height:7.5mm;font-size:24pt;">
               20<span class="styTYColor">10</span>
              </div>
              <div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:7.5pt;">83</b>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Name and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:130mm;height:8mm;font-size:7pt;">
                Name(s) shown on return
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style="width:50mm;height:4mm;font-size:7pt;padding-left:2mm;">
              Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <!-- Start Caution -->
          <div class="styBB" style="width: 187mm; font-size: 8pt;padding-top:1mm;">
            <div style="width:187mm;height:6mm;padding-bottom:1mm;">
              <span class="styBoldText" style="vertical-align: top;">Caution.</span>
             <span class="styNormalText" style="width: 170mm; padding-left: 2mm;"> You cannot claim any amounts on Form 6478 that you claimed (or will claim)
          	 on Form 720 (Schedule C), </span>
               <span class="styNormalText" style="width: 187mm;">Form 8849, or Form 4136.</span>
            </div>
          </div>
          <!-- End Caution -->
          <!--Table header Begin -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" align="center" style="width:101.75mm;height:11mm;font-size:7pt;text-align:center;padding-top:4mm;">
              Type of Fuel
            </div>
            <div class="styNameBox" align="center" style="width:32mm;height:11mm;font-size:7pt;text-align: center;padding-top:.5mm;">
              <span class="styBoldText">(a)</span>
              <br/>Number of Gallons <br/>Sold or Used
            </div>
            <div class="styNameBox" align="center" style="width:21mm;height:11mm;font-size:7pt;text-align: center;padding-top:2mm;">
              <span class="styBoldText">(b)</span>
              <br/>Rate      
            </div>
            <div class="styNameBox" align="center" style="width:32mm;height:11mm;font-size:7pt;border-right-width:0px;text-align: center;padding-top:2mm;">
              <span class="styBoldText">(c)</span>
              <br/>Column(a) x Column(b)</div>
          </div>
          <!--  Start line 1 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
               <span style="float:left">Qualified ethanol fuel production (see instructions for election)
               </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
            </div>
            <div class="styLNAmountBox" style="width:5mm;padding-right:1mm;"><b>1</b></div>
            <div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="8"/>
                <xsl:with-param name="TargetNode" select="$Form6478Data/QualifiedEthanolFuelProduction"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;">
          $ .10
            </div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/QualifiedEthanolFuelCredit"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 1 -->
          <!-- start line 1 extention -->
          <!-- End line 1 extention -->
          <!--  Start line 2 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
              Alcohol 190 proof or greater <b>and</b> alcohol 190 proof or greater in  
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-bottom-width:0px;"/>
          </div>
          <!--  End line 2 -->
          <!-- start line 2 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:88.7mm;">
              <span style="float:left">fuel mixtures </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
            </div>
            <div class="styLNAmountBox" style="width:5mm;padding-right:1mm;"><b>2</b></div>
            <div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="8"/>
                <xsl:with-param name="TargetNode" select="$Form6478Data/Alc190PrfOrHghrUsedGallons"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;">  
          $ .45*
            </div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/Alc190PrfOrHghrUsedCrAMT"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 2 extention -->
          <!--  Start line 3 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
              Alcohol less than 190 proof but at least 150 proof <b>and</b> alcohol   
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
            <div class="styLNAmountBox" style="width:21mm;text-align:center;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-bottom-width:0px;"/>
          </div>
          <!-- End line 3 -->
          <!-- start line 3 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
              <span style="float:left">less than 190 proof but at least 150 proof in fuel mixtures</span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
            </div>
            <div class="styLNAmountBox" style="width:5mm;padding-right:1mm;"><b>3</b></div>
            <div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="8"/>
                <xsl:with-param name="TargetNode" select="$Form6478Data/Alc150To189PrfUsedGallons"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;">  
          $ .3333*
            </div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/Alc150To189PrfUsedCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 3 extention -->
         <!--  Start line 4 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
              Qualified cellulosic biofuel production for fuel that is alcohol 
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
            <div class="styLNAmountBox" style="width:21mm;text-align:center;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-bottom-width:0px;"/>
          </div>
          <!-- End line 4 -->
          <!-- start line 4 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
              <span style="float:left">(see instructions for election) </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">............</div> 
            </div>
            <div class="styLNAmountBox" style="width:5mm;padding-right:1mm;"><b>4</b></div>
            <div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="8"/>
                <xsl:with-param name="TargetNode" select="$Form6478Data/QualCellBiofuelProdWAlcGlln"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;">  
          $ .41**    
            </div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/QualCellBiofuelProdWAlcCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 4 extention -->
          <!--  Start line 5 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
             Qualified cellulosic biofuel production for fuel that is not alcohol
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
            <div class="styLNAmountBox" style="width:21mm;text-align:center;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="border-bottom-width:0px;"/>
          </div>
          <!-- End line 5 -->
          <!-- start line 5 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
              <span style="float:left">(see instructions for election)  </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
            </div>
            <div class="styLNAmountBox" style="width:5mm;padding-right:1mm;"><b>5</b></div>
            <div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="8"/>
                <xsl:with-param name="TargetNode" select="$Form6478Data/QualCellBiofuelNoAlcGallon"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;">  
          $ 1.01    
            </div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/QualCellBiofuelNoAlcCrAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 5 extention -->
          <!--  Start line 6 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
            <div class="styLNDesc" style="width:88.7mm;height:4mm;">
                 <span style="float:left">Reserve for future use </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
             </div>
            <div class="styLNAmountBox" style="width:5mm;padding-right:1mm;"><b>6</b></div>
            <div class="styLNAmountBox" style="width:32mm;padding-right:1mm;background-color:lightgrey;">
            </div>
            <div class="styLNAmountBox" style="width:21mm;text-align:center;background-color:lightgrey;">  
            </div>
            <div class="styLNAmountBox" style="background-color:lightgrey;">
            </div>
          </div>
          <!-- End line 6 -->
          <!-- start line 6 extention -->
          <!-- End line 6 extention -->
          <!-- start line 7 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Add the amounts in column (c) on lines 1 through 5. Include this amount in your income for 2010 (see </span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 7 -->
          <!-- start line 7 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">instructions) </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">..............................</div>
            </div>
            <div class="styLNRightNumBox">7</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/OtherIncomeAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 7 extension -->
          <!-- start line 8 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Alcohol and cellulosic biofuel fuels credit from a partnership, S corporation, cooperative, estate, or trust </span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 8 -->
          <!-- start line 8 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">(see instructions)</span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
            </div>
            <div class="styLNRightNumBox">8</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/AlcoholFuelCreditAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 8 extension -->
           <!-- start line 9 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Add lines 7 and 8. Partnerships and S corporations, report this amount on Schedule K. All others, go to</span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 9 -->
          <!-- start line 9 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">line 10</span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">................................</div>
            </div>
            <div class="styLNRightNumBox">9</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/EthanolAlcoholOtherCreditAmt"/>
              </xsl:call-template>
            </div>
          </div>
         <!-- end line 9 extension-->
         <!-- start line 10 -->
         <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">10</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Alcohol and cellulosic biofuel fuels credit included on line 9 from passive activities (see instructions)</span>
               <div class="styDotLn" style="float:right;padding-right:1mm;">.</div>
            </div>
            <div class="styLNRightNumBox">10</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/AlcoholCreditFrmPassiveActyAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Text is aligned center as it is in center aligned in the PDF -->
          <!-- End line 10 -->
          <!-- start line 11 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">11</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Subtract line 10 from line 9</span>
               <div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
            </div>
            <div class="styLNRightNumBox">11</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/NetAlcoholCreditsAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Text is aligned center as it is in center aligned in the PDF -->
          <!-- End line 11 -->
          <!-- start line 12 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">12</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Alcohol and cellulosic biofuel fuels credit allowed for 2010 from a passive activity (see instructions)</span>
               <div class="styDotLn" style="float:right;padding-right:1mm;">.</div>
            </div>
            <div class="styLNRightNumBox">12</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/AlcoholPassiveCreditAllowedAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Text is aligned center as it is in center aligned in the PDF -->
          <!-- End line 12 -->
          <!-- start line 13 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">13</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Carryforward of any alcohol and cellulosic biofuel fuels credit that originated in a tax year that began </span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 13 -->
          <!-- start line 13 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">after 2004</span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">...............................</div>
            </div>
            <div class="styLNRightNumBox">13</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/AlcoholFuelCreditCfwdAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 13 extension-->
          <!-- start line 14 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">14</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Carryback of the alcohol and cellulosic biofuel fuels credit from 2011 (see instructions)</span>
               <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
            </div>
            <div class="styLNRightNumBox">14</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/AlcoholFuelCreditCybkAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Text is aligned center as it is in center aligned in the PDF -->
          <!-- End line 14 -->
          <!-- start line 15 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">15</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Add lines 11 through 14. Cooperatives, estates, and trusts, go to line 16. All others, report this amount </span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 15 -->
          <!-- start line 15 extention -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">on Form 3800, line 29c</span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
            </div>
            <div class="styLNRightNumBox">15</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/TotCYCreditForAlcoholAsFuelAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 15 extension-->
          <!-- start line 16 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">16</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions)</span>
               <div class="styDotLn" style="float:right;padding-right:1mm;">.</div>
            </div>
            <div class="styLNRightNumBox">16</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/AllocatedToBeneficiariesAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 16 -->
          <!-- start line 17 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">17</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
              <span style="float:left">Cooperatives, estates, and trusts. Subtract line 16 from line 15. Report this amount on Form 3800, line </span>
            </div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
            <div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
            <!-- Text is aligned center as it is in center aligned in the PDF -->
          </div>
          <!-- End line 17 -->
          <!-- start line 17 extention -->
          <div class="styBB" style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left">29c </span>
              <!--Dotted Line-->
               <div class="styDotLn" style="float:right;padding-right:1mm;">.................................</div>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;">17</div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6478Data/EstatesTrustsCooperativesAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Start asterisk line -->
          <div style="width:187mm;border-top-width:1px">
            <div class="styLNDesc" style="width:187mm;">
              <span style="width:6px;"/>
           *<span/>Only the rate for ethanol is shown. See instructions for the rate for alcohol other than ethanol.
           <br/>
            </div>
          </div>
          <!-- end asterisk line -->
          <!-- Start asterisk line -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNDesc" style="width:187mm;">
              <span style="width:6px;"/>
           **<span/>Only the rate for alcohol other than ethanol is shown. See instructions for the rate for ethanol.
           <br/>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <br/>
          </div>
          <!-- end asterisk line -->
          <!-- end line 17 extension-->
          <!-- Start Page footer -->
          <div class="styFooter" style="width:187mm; font-size:7pt; border-top:1 solid black; padding-top:1mm;">
            <div style="float:left; font-size:8.5pt">
              <b>For Paperwork Reduction Act Notice, see instructions.</b>
            </div>
            <div style="float:right;font-size:6pt">
              Cat. No. 13605J
                <span style="width:30mm"/>
                Form <b style="font-size:9pt">6478<span style="font-size:6pt"> (2010)</span>
              </b>
            </div>
          </div>
          <p style="page-break-before:always"/>
          <!-- end Page footer -->
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
              <xsl:with-param name="TargetNode" select="$Form6478Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
