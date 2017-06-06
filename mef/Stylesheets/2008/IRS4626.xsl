<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:import href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS4626Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS4626"/>
  <xsl:template match="/">
     <html>
       <head>
          <title>
            <xsl:call-template name="FormTitle">
               <xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param>
            </xsl:call-template>
          </title>
          <!-- No Browser Caching -->
          <meta http-equiv="Pragma" content="no-cache" />
          <meta http-equiv="Cache-Control" content="no-cache" />
          <meta http-equiv="Expires" content="0" />
          <!-- No Proxy Caching -->
          <meta http-equiv="Cache-Control" content="private" />
          <!-- Define Character Set -->
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
          <meta name="Description" content="IRS Form 4626" />
          <!-- javascript include -->
          <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
          <xsl:call-template name="InitJS"></xsl:call-template>
          <style type="text/css">
            <xsl:if test="not($Print) or $Print=''">
               <xsl:call-template name="IRS4626Style"/>
               <xsl:call-template name="AddOnStyle"/>
             </xsl:if>
          </style>
          <xsl:call-template name="GlobalStylesForm"/>
        </head>
        <body class="styBodyClass">
        <!-- Standard Warning Line -->
        <xsl:call-template name="DocumentHeader"></xsl:call-template>
        <!-- BEGIN FORM HEADER -->
        <div class="styBB" style="width:187mm;">
          <!-- Form Name -->
          <div class="styFNBox" style="font-size:7pt;width:28mm;height:16mm;">
            Form <span class="styFormNumber">4626</span>
            <br />
            <span class="styAgency">Department of the Treasury</span>
            <br />
            <span class="styAgency">Internal Revenue Service</span>
          </div>
          <!-- Form Title Box -->
          <div class="styFTBox" style="padding-top:2mm;width:126mm;height:16mm;">
          <!-- Form Title -->
            <span class="styMainTitle">Alternative Minimum Tax—Corporations</span>
            <!-- Form Subtitle -->
            <br />
            <div style="font-weight:bold; padding-top: 2mm">
               <img src="{$ImagePath}\4626_Bullet.gif" alt="Right arrow" border="0"/> See separate instructions.
               <br/>
               <img src="{$ImagePath}\4626_Bullet.gif" alt="Right arrow" border="0"/> Attach to the corporation's tax return.
            </div>
          </div>
          <!-- Tax Year Box -->
          <div class="styTYBox" style="height:16mm;width:32mm;">
          <!-- OMB No. -->
            <div class="styOMB" style="font-size:7pt;width:32mm;">OMB No. 1545-0175</div>
            <!-- Tax Year -->
            <div class="styTY" style="text-align:center;">
               <span>20<span class="styTYColor">08</span></span>
            </div>
          </div>
        </div>
       <!-- Name and Address -->
       <div class="STyBB" style="width:187mm;">
          <div class="styNameBox" style="height:8mm;width:140mm;font-size:7pt;">
            Name<br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styEINBox" style="height:8mm;padding-left:2mm;text-align:left;font-size:7pt;width:46mm;">
            <span style="font-weight:bold;">Employer identification number<br/><br /></span>
            <span style="text-align:left;font-weight:normal;">
               <xsl:call-template name="PopulateReturnHeaderFiler">
                 <xsl:with-param name="TargetNode">EIN</xsl:with-param>
               </xsl:call-template>          
            </span>
          </div>
       </div>
       <!-- Form body -->
       <!-- Part I - Header -->
       <div class="styBB" style="width:187mm;">
         <span class="styPartName" style="width:16mm;">Part I</span>
         <span class="styPartDesc" style="width:150mm;">
              Alternative Minimum Tax Computation
         </span>
       </div>
       <!-- notes line -->
       <div class="IRS4626_LineContainer">
          <div class="styLNLeftNumBoxSD"></div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="font-weight:bold;width:9mm;">Note:</span>
            <span style="font-style:italic;">See the instructions to find out if the corporation is a small corporation exempt from the </span>
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB"></div>
       </div>
       <div class="IRS4626_LineContainer">
          <div class="styLNLeftNumBoxSD"></div>
          <div class="styLNDesc" style="width:139mm;"><!--span style="width:9mm;"></span-->
            <span style="font-style:italic;">alternative minimum tax (AMT) under section 55(e).</span>
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
          <div class="styLNAmountBoxNBB"></div>
       </div>
       <!-- actual line -->
       <div class="IRS4626_LineContainer">
          <div class="styLNLeftNumBoxSD">1</div>
          <div class="styLNDesc" style="width:139mm;">Taxable income or (loss) before net operating loss deduction
            <span class="IRS4626_DotSpacing">....................</span>
          </div>
          <div class="styLNRightNumBox">1</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeLossBeforeNOLDed"/>
            </xsl:call-template>
          </div>
       </div>
       <!-- line 2 -->
       <!-- actual line -->
       <div class="IRS4626_LineContainer">
          <div class="styLNLeftNumBoxSD">2</div>
          <div class="styLNDesc" style="font-weight:bold;width:139mm;">Adjustments and preferences:</div>
          <div class="styLNRightNumBoxNBB"></div>
          <div class="styLNAmountBoxNBB"></div>
       </div>
       <!-- line 2 sub a -->
       <div class="IRS4626_LineContainer">
          <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">a</div>
          <div class="styLNDesc" style="width:139mm;">Depreciation of post-1986 property
            <span class="IRS4626_DotSpacing">...............................</span>   
       </div>
       <div class="styLNRightNumBox">2a</div>
       <div class="styLNAmountBox">    
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/DepreciationOfPost1986Property"/>
        </xsl:call-template>
       </div>
     </div>
<!-- line 2 sub b -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">b</div>
       <div class="styLNDesc" style="width:139mm;">Amortization of certified pollution control facilities
           <span class="IRS4626_DotSpacing">.........................</span>   
       </div>
       <div class="styLNRightNumBox">2b</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmortzCertPollutionCtrlFacilit"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub c -->
   <div class="IRS4626_LineContainer">
        <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">c</div>
        <div class="styLNDesc" style="width:139mm;">Amortization of mining exploration and development costs
           <span class="IRS4626_DotSpacing">.....................</span>   
        </div>
        <div class="styLNRightNumBox">2c</div>
        <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmortzMiningExplortnDevCosts"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub d -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">d</div>
       <div class="styLNDesc" style="width:139mm;">Amortization of circulation expenditures (personal holding companies only)
   <span class="IRS4626_DotSpacing">..............</span>   
   </div>
       <div class="styLNRightNumBox">2d</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmortzCirculationExpenditures"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub e -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">e</div>
       <div class="styLNDesc" style="width:139mm;">Adjusted gain or loss
           <span class="IRS4626_DotSpacing">.....................................</span>   
      </div>
       <div class="styLNRightNumBox">2e</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AdjustedGainOrLoss"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub f -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">f</div>
       <div class="styLNDesc" style="width:139mm;">Long-term contracts
           <span class="IRS4626_DotSpacing">.....................................</span>   
      </div>
       <div class="styLNRightNumBox">2f</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/LongTermContracts"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub g -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">g</div>
       <div class="styLNDesc" style="width:139mm;">Merchant marine capital construction funds
           <span class="IRS4626_DotSpacing">............................</span>   
      </div>
       <div class="styLNRightNumBox">2g</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MerchantMarineCapConstFunds"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub h -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">h</div>
       <div class="styLNDesc" style="width:139mm;">Section 833(b) deduction (Blue Cross, Blue Shield, and similar type organizations only)
           <span class="IRS4626_DotSpacing">........</span>   
      </div>
       <div class="styLNRightNumBox">2h</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Section833bDeduction"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub i -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">i</div>
       <div class="styLNDesc" style="width:139mm;">Tax shelter farm activities (personal service corporations only)
           <span class="IRS4626_DotSpacing">...................</span>   
       </div>
       <div class="styLNRightNumBox">2i</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TaxShelterFarmActivities"/>
      </xsl:call-template>
       </div>
     </div>
<!-- line 2 sub j -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">j</div>
       <div class="styLNDesc" style="width:139mm;">Passive activities (closely held corporations and personal service corporations only)
  <span class="IRS4626_DotSpacing">.........</span>   
   </div>
       <div class="styLNRightNumBox">2j</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/PassiveActivities"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub k -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">k</div>
       <div class="styLNDesc" style="width:139mm;">Loss limitations
           <span class="IRS4626_DotSpacing">.......................................</span>   
      </div>
       <div class="styLNRightNumBox">2k</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/LossLimitations"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub l -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">l</div>
       <div class="styLNDesc" style="width:139mm;">Depletion
           <span class="IRS4626_DotSpacing">..........................................</span>   
      </div>
       <div class="styLNRightNumBox">2l</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Depletion"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub m -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">m</div>
       <div class="styLNDesc" style="width:139mm;">Tax-exempt interest income from specified private activity bonds
           <span class="IRS4626_DotSpacing">..................</span>   
      </div>
       <div class="styLNRightNumBox">2m</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TxExemptIntIncmFrSpcfdActyBond"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub n -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">n</div>
       <div class="styLNDesc" style="width:139mm;">Intangible drilling costs
           <span class="IRS4626_DotSpacing">....................................</span>   
      </div>
       <div class="styLNRightNumBox">2n</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/IntangibleDrillingCosts"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 2 sub o -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">o</div>
       <div class="styLNDesc" style="width:139mm;">Other adjustments and preferences
           <span class="IRS4626_DotSpacing">...............................</span>   
      </div>
       <div class="styLNRightNumBox">2o</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsAndPreferences"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 3 -->
   <!-- actual line -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD">3</div>
       <div class="styLNDesc" style="width:139mm;">Pre-adjustment alternative minimum taxable income (AMTI). Combine lines 1 through 2o
           <span class="IRS4626_DotSpacing">.......</span></div>
       <div class="styLNRightNumBox">3</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/PreadjustmentAMTI"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 4 -->
   <!-- actual line -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD">4</div>
       <div class="styLNDesc" style="width:139mm;font-weight:bold">Adjusted current earnings (ACE) adjustment:</div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
       <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
   </div>
<!-- line 4 sub a -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">a</div>
       <div class="styLNDesc" style="width:99mm;">ACE from line 10 of the ACE worksheet in the instructions
       	<span class="IRS4626_DotSpacing">.......</span>  
       </div>
       <div class="styLNRightNumBox">4a</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AdjustedCurrentEarnings"/>
      </xsl:call-template>
       </div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
       <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
   </div>
<!-- line 4 sub b -->
<!-- triple lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">b</div>
       <div class="styLNDesc" style="width:99mm;">Subtract line 3 from line 4a. If line 3 exceeds line 4a, enter the difference
       </div>
       <div class="styLNRightNumBoxNBB"></div>
       <div class="styLNAmountBoxNBB"></div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB"></div>
     </div>
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="width:99mm;">as a negative amount (see instructions)
           <span class="IRS4626_DotSpacing">................</span>   
       </div>
       <div class="styLNRightNumBox">4b</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ACEMinusPreadjustmentAMTI"/>
      </xsl:call-template>
       </div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
       <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
   </div>
<!-- line 4 sub c -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">c</div>
       <div class="styLNDesc" style="width:99mm;">Multiply line 4b by 75% (.75). Enter the result as a positive amount
           <span class="IRS4626_DotSpacing">...</span>   
       </div>
       <div class="styLNRightNumBox">4c</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ACEMinusPreadjustmentAMTIRdcd"/>
      </xsl:call-template>
       </div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
       <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
   </div>
<!-- line 4 sub d -->
<!-- five lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">d</div>
       <div class="styLNDesc" style="width:99mm;">Enter the excess, if any, of the corporation's total increases in AMTI from
       </div>
       <div class="styLNRightNumBoxNBB"></div>
       <div class="styLNAmountBoxNBB"></div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB"></div>
     </div>
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="width:99mm;">prior year ACE adjustments over its total reductions in AMTI from prior
       </div>
       <div class="styLNRightNumBoxNBB"></div>
       <div class="styLNAmountBoxNBB"></div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB"></div>
     </div>
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="width:99mm;">year ACE adjustments (see instructions).
         <span style="font-weight:bold"> Note:</span>
        <span style="font-style:italic"> You</span>
        <span style="font-weight:bold;font-style:italic"> must</span>
        <span style="font-style:italic"> enter an amount </span>
       </div>
       <div class="styLNRightNumBoxNBB"></div>
       <div class="styLNAmountBoxNBB"></div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB"></div>
     </div>
   <div class="IRS4626_LineContainer" style="height:6mm;">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="width:99mm;">
        <span style="font-style:italic">on line 4d (even if line 4b is positive)</span>
           <span class="IRS4626_DotSpacing">..................</span>   
       </div>
       <div class="styLNRightNumBox" >4d</div>
       <div class="styLNAmountBox" style="border-right-width:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ExcessAMTI"/>
      </xsl:call-template>
       </div>
       <div class="styLNRightNumBoxNBB" style="height:6mm;border-left-width:1px;background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB" style="height:6mm;"></div>
   </div>
<!-- line 4 sub e -->
<!-- five lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">e</div>
       <div class="styLNDesc" style="width:139mm;">ACE adjustment.</div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
       <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
   </div>
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="width:139mm;">
          <span style="float:left;"> <img src="{$ImagePath}\4626_Bullet_Round.gif" alt="Arrow to right" border="0"/> If line 4b is zero or more, enter the amount from line 4c </span>
  </div>
       <div class="styLNRightNumBoxNBB" style="position:relative;padding-top:1mm;background-color:lightgrey;">
         <img src="{$ImagePath}\4626_SMBracket.gif" alt="Bracket" style="position:absolute; left:-18mm;top:3mm; "/>
       </div>
       <div class="styLNAmountBoxNBB" style=""></div>
   </div>
   <div class="IRS4626_LineContainer" style="height:6mm;">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="border-right-width:0px;width:139mm; "><img src="{$ImagePath}\4626_Bullet_Round.gif" alt="Arrow to right" border="0"/>
        If line 4b is less than zero, enter the <span style="font-weight:bold;">smaller </span>of line 4c or line 4d as a negative amount
            <span class="IRS4626_DotSpacing" style="padding-left:10.5mm;">....</span>
      </div>
      <div class="styLNRightNumBox" style="height:6mm;border-bottom-width:0px;border-left-width:1px;"><span style="border-bottom:1 solid black;width:7.75mm;">4e</span></div>
      <div class="styLNAmountBoxNBB" style="height:6mm;border-bottom-width:0px;">
        <span style="border-bottom:1 solid black;width:31.75mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ACEAdjustment"/>
          </xsl:call-template>
        </span>
       </div>
   </div>
<!-- line 5 -->
<!-- single lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD">5</div>
       <div class="styLNDesc" style="width:139mm;">
         Combine lines 3 and 4e. If zero or less, stop here; the corporation does not owe any AMT
          <span class="IRS4626_DotSpacing">.......</span>  
     </div>
        <div class="styLNRightNumBox">5</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/PreadjustmentAMTIPlusACEAdj"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 6 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD">6</div>
       <div class="styLNDesc" style="width:139mm;">Alternative tax net operating loss deduction (see instructions)
           <span class="IRS4626_DotSpacing">...................</span>   
     </div>
       <div class="styLNRightNumBox">6</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AltTaxNetOperatingLossDed"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 7 -->
<!-- triple lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD">7</div>
       <div class="styLNDesc" style="width:139mm;">
         <span style="font-weight:bold">Alternative minimum taxable income. </span>
        Subtract line 6 from line 5. If the corporation held a residual
     </div>
       <div class="styLNRightNumBoxNBB"></div>
       <div class="styLNAmountBoxNBB"></div>
   </div>
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD"></div>
       <div class="styLNDesc" style="width:139mm;">interest in a REMIC, see instructions
      <xsl:call-template name="LinkToLeftoverDataTableInline">
        <xsl:with-param name="TargetNode" select="$FormData/ResidualInterest/@note"/>
        <xsl:with-param name="Desc">Line 7 - Note on Residual Interests</xsl:with-param>
      </xsl:call-template>
           <span class="IRS4626_DotSpacing">..............................</span>   
     </div>
       <div class="styLNRightNumBox">7</div>
       <div class="styLNAmountBox">
    <xsl:if test="$FormData/ResidualInterest">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ResidualInterest"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$FormData/AlternativeMinTaxableIncome">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncome"/>
      </xsl:call-template>
    </xsl:if>
       </div>
   </div>
<!-- line 8 -->
<!-- triple lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD">8</div>
       <div class="styLNDesc" style="width:139mm;">
         <span style="font-weight:bold">Exemption phase-out </span>
        (if line 7 is $310,000 or more, skip lines 8a and 8b and enter -0- on line 8c):
     </div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB"></div>
   </div>
<!-- line 8 sub a -->
<!-- triple lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">a</div>
       <div class="styLNDesc" style="width:99mm;">Subtract $150,000 from line 7 (if completing this line for a member of a
       </div>
       <div class="styLNRightNumBoxNBB"></div>
       <div class="styLNAmountBoxNBB"></div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB"></div>
     </div>
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="width:99mm;">controlled group, see instructions). If zero or less, enter -0-
        <span class="IRS4626_DotSpacing">......</span>
      </div>
       <div class="styLNRightNumBox">8a</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/QualifiedAMTIExemption"/>
      </xsl:call-template>
       </div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
       <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
   </div>
<!-- line 8 sub b -->
<!-- double lines -->
      <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">b</div>
       <div class="styLNDesc" style="width:99mm;">Multiple line 8a by 25% (.25)
           <span class="IRS4626_DotSpacing">....................</span>   
      </div>
       <div class="styLNRightNumBox">8b</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ReducedAMTIExemption"/>
      </xsl:call-template>
       </div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
       <div class="styLNAmountBoxNBB" style="height:4.5mm;"></div>
   </div>
<!-- line 8 sub c -->
<!-- triple lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox" style="padding-left:4.3mm;">c</div>
       <div class="styLNDesc" style="width:139mm;">
        Exemption. Subtract line 8b from $40,000 (if completing this line for a member of a controlled
     </div>
       <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
       <div class="styLNAmountBoxNBB"></div>
   </div>
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftLtrBox"></div>
       <div class="styLNDesc" style="width:139mm;">group, see instructions). If zero or less, enter -0-
          <span class="IRS4626_DotSpacing">.........................</span>   
     </div>
       <div class="styLNRightNumBox">8c</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/Exemption"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 9 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBoxSD">9</div>
       <div class="styLNDesc" style="width:139mm;">Subtract line 8c from line 7. If zero or less, enter -0-
           <span class="IRS4626_DotSpacing">.......................</span>   
     </div>
       <div class="styLNRightNumBox">9</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AMTIMinusExemption"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 10 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">10</div>
       <div class="styLNDesc" style="width:139mm;">
         If the corporation had qualified timber gain, complete Part II and enter the amount from line 24 here.
         Otherwise, multiply line 9 by 20% (.20)
           <span class="IRS4626_DotSpacing">.............................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">10</div>
       <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AdjustedAMTI"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 11 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">11</div>
       <div class="styLNDesc" style="width:139mm;">Alternative minimum tax foreign tax credit (AMTFTC) (see instructions)
           <span class="IRS4626_DotSpacing">...............</span>   
     </div>
       <div class="styLNRightNumBox">11</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AltMinimumTaxForeignTaxCredit"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 12 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">12</div>
       <div class="styLNDesc" style="width:139mm;">Tentative minimum tax.  Subtract line 11 from line 10
           <span class="IRS4626_DotSpacing">.......................</span>   
     </div>
       <div class="styLNRightNumBox">12</div>
       <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TentativeMinimumTax"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 13 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">13</div>
       <div class="styLNDesc" style="width:139mm;">Regular tax liability before applying all credits except the foreign tax credit 
            <span class="IRS4626_DotSpacing">.............</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">13</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/RegularTaxLiability"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 14 -->
<!-- quadruple lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">14</div>
       <div class="styLNDesc" style="width:139mm;">
         <span style="font-weight:bold">Alternative minimum tax. </span>
        Subtract line 13 from line 12. If zero or less, enter -0-. Enter here and on
     </div>
       <div class="styLNRightNumBoxNBB"></div>
       <div class="styLNAmountBoxNBB"></div>
   </div>
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox"  style="border-bottom-width:1px"></div>
       <div class="styLNDesc" style="width:139mm;border-bottom-width:1px">Form 1120, Schedule J, line 3, or the appropriate line of the corporation's income tax return
           <span class="IRS4626_DotSpacing">......</span>   
     </div>
       <div class="styLNRightNumBoxNBB">14</div>
       <div class="styLNAmountBoxNBB">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTax"/>
      </xsl:call-template>
       </div>
   </div>
  <!-- Page 1 Break and Footer-->
  <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;">  
    <div style="float:left;">
      <span class="styBoldText">For Paperwork Reduction Act Notice, see the instructions. </span> 
      <span style="width:30mm;"></span>                        
       Cat. No. 12955I
    </div>
    <div style="float:right;">
      <span style="width:70px;"></span>  
      Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2008)
    </div>    
  </div>
  <!-- END Page 1 Break and Footer-->
  <!-- Page 2 -->
  <!-- Page 2 Header -->
  <div style="width:187mm;border-bottom:solid 1px;">
    <div style="float:left;">Form 4626 (2008)</div>
    <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span></div>
  </div>
  <!-- Part 2 - Header -->
  <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
    <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">Part II</span>
      <span class="styPartDesc" style="width:170mm;">
        <span style="width:2mm;"/>Alternative Tax for Corporations with Qualified Timber Gain. <i style="font-weight:normal;">Complete Part II </i><span style="font-weight:bold;">only </span><i style="font-weight:normal;">if the </i><br/>
        <span style="width:2mm;"/><i style="font-weight:normal;">corporation had qualified timber gain under section 1201(b). See instructions.</i>
      </span>
    </div>
<!-- line 15 -->
<!-- quadruple lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">15</div>
       <div class="styLNDesc" style="width:139mm;">
           Enter qualified timber gain from Schedule D (Form 1120), line 15, as refigured for the AMT, if
            necessary. If you are filing Form 1120-RIC, see instructions for the amount to enter
            <span class="IRS4626_DotSpacing">...............</span> 
        </div>
       <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">15</div>
       <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
         <xsl:call-template name="PopulateAmount">
           <xsl:with-param name="TargetNode" select="$FormData/QualifiedTimberGainSchDF1120"/>
          </xsl:call-template>
       </div>
   </div>
<!-- line 16 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">16</div>
       <div class="styLNDesc" style="width:139mm;">Enter the amount from Schedule D (Form 1120), line 13, as refigured for the AMT, if necessary
         <span class="IRS4626_DotSpacing">.....</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">16</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmountFromSchDF1120Line13"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 17 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">17</div>
       <div class="styLNDesc" style="width:139mm;">Enter the amount from Part I, line 9
       <span class="IRS4626_DotSpacing">...............................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">17</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/EnterAmountFromPartILine9"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 18 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">18</div>
       <div class="styLNDesc" style="width:139mm;">Enter the <span style="font-weight:bold;">smallest</span> of the amount on line 15, line 16, or line 17
       <span class="IRS4626_DotSpacing">....................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">18</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TheSmallestOfLine15Or16Or17"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 19 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">19</div>
       <div class="styLNDesc" style="width:139mm;">Multiply line 18 by 15% (.15)
         <span class="IRS4626_DotSpacing">..................................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">19</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine18By15Pct"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 20 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">20</div>
       <div class="styLNDesc" style="width:139mm;">Subtract line 18 from line 17
         <span class="IRS4626_DotSpacing">..................................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">20</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SubtractLine18FromLine17"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 21 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">21</div>
       <div class="styLNDesc" style="width:139mm;">Multiply line 20 by 20% (.20)
         <span class="IRS4626_DotSpacing">..................................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">21</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine20By20Pct"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 22 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">22</div>
       <div class="styLNDesc" style="width:139mm;">Enter the total of line 19 and line 21
         <span class="IRS4626_DotSpacing">...............................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">22</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/EnterTotalOfLine19AndLine21"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 23 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">23</div>
       <div class="styLNDesc" style="width:139mm;">Multiply line 17 by 20% (.20)
         <span class="IRS4626_DotSpacing">..................................</span>   
     </div>
       <div class="styLNRightNumBox" style="height:4mm;">23</div>
       <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine17By20Pct"/>
      </xsl:call-template>
       </div>
   </div>
<!-- line 24 -->
<!-- double lines -->
   <div class="IRS4626_LineContainer">
       <div class="styLNLeftNumBox">24</div>
       <div class="styLNDesc" style="width:139mm;">Enter the <span style="font-weight:bold;">smaller</span> of line 22 or line 23 here and on Part I, line 10
         <span class="IRS4626_DotSpacing">..................</span>   
     </div>
       <div class="styLNRightNumBoxNBB" style="height:4mm;">24</div>
       <div class="styLNAmountBoxNBB" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/EnterSmallerOfLine22OrLine23"/>
      </xsl:call-template>
       </div>
   </div>
<!-- Page 2 Break and Footer-->
  <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:2 solid black;">  
    <div style="float:left;">
      <span class="styBoldText"></span> 
      <span style="width:30mm;"></span>                        
    </div>
    <div style="float:right;">
      <span style="width:70px;"></span>  
      Form <span class="styBoldText" style="font-size:8pt;">4626</span> (2008)
    </div>    
  </div>
<!-- END Page 1 Break and Footer-->
<!--Begin ADDITIONAL DATA SECTION -->
<div class="styLeftOverTitleLine" id="LeftoverData">
  <div class="styLeftOverTitle">
    Additional Data        
  </div>
  <div class="styLeftOverButtonContainer">
    <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
  </div>      
</div>  
<table class="styLeftOverTbl">
  <xsl:call-template name="PopulateCommonLeftover">
    <xsl:with-param name="TargetNode" select="$FormData" />
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
  <xsl:call-template name="PopulateLeftoverRow">
    <xsl:with-param name="Desc">Line 7 - Note on Residual Interests</xsl:with-param>
    <xsl:with-param name="TargetNode" select="$FormData/ResidualInterest/@note"/>
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
