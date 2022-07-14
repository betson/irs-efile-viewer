<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8611Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8611" />


<xsl:template match="/">
<html>
<head>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8611"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8611Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8611">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 19mm">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 19mm">
      Form <span class="styFormNumber">8611</span>      
      <br/>
      (Rev. January 2008)
      
      <span class="styAgency">Department of the Treasury</span><br />
      <span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:125mm">
      <div class="styMainTitle">Recapture of Low-Income Housing Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold">
        <img src="{$ImagePath}/8611_Bullet.gif" alt="MediumBullet"/>  
        Attach to your return.
        <br/><br/>
        <div style="padding-top:1mm;">Note: 
        <span class="styItalicText"> Complete a separate Form 8611 for each building to<br/>which recapture applies.</span></div>
      </div>
    </div>
    <div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px">
    <div class="styOMB" style="height:9mm;padding-top:3mm">OMB No. 1545-1035</div>
    <div class="stySequence" style="height: 9mm;padding-top:3mm">Attachment<br/>Sequence No. <b>90</b></div>
  </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm; height: 8mm">
    <div class="styNameBox" style="width:141mm; height: 8mm;font-size:7pt;">
      <span class="styBoldText">A </span> Name(s) shown on return<br/>
      <div style="font-weight:normal;">
       <!-- <xsl:choose>
          <xsl:when test="normalize-space($FormData/BusinessName/BusinessNameLine1) != ''">
            <xsl:call-template name="PopulateText">
            	<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine1" />
            </xsl:call-template>
            <xsl:if test="normalize-space($FormData/BusinessName/BusinessNameLine2)!=''">
              <br />
              <xsl:call-template name="PopulateText">
              	<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine2" />
              </xsl:call-template>
            </xsl:if>            
          </xsl:when>  
          <xsl:otherwise>-->
            <xsl:call-template name="PopulateReturnHeaderFiler">
            	<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template><br/>  
            <xsl:call-template name="PopulateReturnHeaderFiler">
            	<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>    
          <!--</xsl:otherwise>
        </xsl:choose>-->
      </div>
    </div>
    <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;"><span class="BoldText">B Identifying number</span>
      <span style="width:4px;"></span>
      <div style="text-align:left; padding-top:2mm;font-weight:normal;">            
        <!--<xsl:choose>
          <xsl:when test="normalize-space($FormData/EINOfTaxpayer) != ''">
            <xsl:call-template name="PopulateEIN">
            	<xsl:with-param name="TargetNode" select="$FormData/EINOfTaxpayer" />
            </xsl:call-template>
          </xsl:when>  
          <xsl:when test="normalize-space($FormData/SSNOfTaxpayer) != ''">
            <xsl:call-template name="PopulateSSN">
            	<xsl:with-param name="TargetNode" select="$FormData/SSNOfTaxpayer" />
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
            <xsl:call-template name="PopulateSSN">
            	<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise> --> 
            <xsl:call-template name="PopulateReturnHeaderFiler">
            	<xsl:with-param name="TargetNode">EIN</xsl:with-param>
            </xsl:call-template>  
          <!--</xsl:otherwise>
        </xsl:choose>-->
      </div>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  
  <div style="width: 187mm; height: 13mm">
    <div class="styNameAddr" style="height: 13mm; padding-left:0px; width: 100mm; border-right-width: 1px;font-size:7pt">
    	<span class="styBoldText">C </span> Address of building (as shown on Form 8609)
    	<br/>
    		<xsl:if test="$FormData/USAddressOfBuilding">
                <xsl:call-template name="PopulateUSAddressTemplate">
                	<xsl:with-param name="TargetNode" select="$FormData/USAddressOfBuilding"/>
                </xsl:call-template>
          </xsl:if>
          <xsl:if test="$FormData/ForeignAddressOfBuilding">
               <xsl:call-template name="PopulateForeignAddressTemplate">
               	 <xsl:with-param name="TargetNode" select="$FormData/ForeignAddressOfBuilding"/>
                </xsl:call-template>
          </xsl:if>
    </div>
    <div class="styNameAddr" style="height: 13mm; width: 41mm; border-right-width: 1px;font-size:7pt">
    <span class="styBoldText">D </span> Building identification<br/>
    <span style="width: 3mm"></span>number (BIN)<br/><br/>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/BuildingIdentificationNumber"/>
      </xsl:call-template>
    </div>
    <div class="styNameAddr" style="height: 13mm; width: 46mm;font-size:7pt">
    	<span class="styBoldText">E </span> Date placed in service (from<br/>
    	<span style="width: 3mm"></span>Form 8609)<br/><br/>
      <span style="padding-left: 5mm;text-align:left; width: 42mm">
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/DatePlacedInService"/>
        </xsl:call-template>  
      </span>
    </div>
  </div>
  
  <div style="width: 187mm; height: 13mm">
    <div class="styNameAddr" style="height: 13mm; padding-left:0px; width: 141mm; border-right-width: 1px;font-size:7pt">
    <span class="styBoldText">F </span>
       If building is financed in whole or part with tax-exempt bonds, see instructions and furnish:<br/>
       <span class="styBoldText">(1) </span> Issuer's name<br/>
         <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/NameOfIssuer/BusinessNameLine1"/>
        </xsl:call-template>
        <xsl:if test="$FormData/NameOfIssuer/BusinessNameLine2"><br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/NameOfIssuer/BusinessNameLine2"/>
          </xsl:call-template>
        </xsl:if>
      </div>
    <div class="styNameAddr" style="height:13mm; width: 46mm;font-size:7pt">
    	<span class="styBoldText">(2)</span> Date of issue<br/><br/><br/>
      <span style="padding-left: 5mm;text-align: left; width: 42mm">
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/DateOfIssue"/>
        </xsl:call-template>
      </span>
    </div>
  </div>
  
  <div style="width: 187mm; height: 7mm">
    <div class="styNameAddr" style="height: 7mm; padding-left:0px; width: 141mm; border-right-width: 1px;font-size:7pt"><span class="styBoldText">(3) </span> Name of issue<br/>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/NameOfIssue"/>
      </xsl:call-template>
    </div>
    <div class="styNameAddr" style="height: 7mm; width: 46mm;font-size:7pt"><span class="styBoldText">(4) </span> CUSIP number<br/>
    <xsl:choose>
		<xsl:when test="$FormData/CUSIPNumber">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/CUSIPNumber"/>
                </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
                	<xsl:call-template name="PopulateText">
                	  <xsl:with-param name="TargetNode" select="$FormData/MissingCUSIPReason"/>
                	</xsl:call-template>
         </xsl:otherwise>
         </xsl:choose>
              </div>
  </div>
  
  <!--  Note -->
  <div class="styBB" style="width: 187mm">
    <div class="styGenericDiv" style="font-size: 8pt"><span class="styBoldText">Note: </span><span class="styItalicText">Skip lines 1–5 and go to line 8 if recapture is passed through from a flow-through entity (partnership, S corporation,       
    <br/><span style="width: 9mm"></span>estate, or trust).</span></div>
  </div>
  <!--  End Note  -->
  
  <!--  Line 1 --> 
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">1</div>
    <div style="float:left">
      Enter total credits reported on Form 8586 in prior years for this building    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .........
      </span>        
      <div class="styLNRightNumBox">1</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/PYTotalCreditsOnForm8586"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 1 -->
  
  <!--  Line 2 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">2</div>
    <div style="float:left">
      Credits included on line 1 attributable to additions to qualified basis (see instructions)  
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .....
      </span>        
      <div class="styLNRightNumBox">2</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditsIncluded"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 2 -->
  
  <!--  Line 3 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">3</div>
    <div style="float:left">
      Credits subject to recapture. Subtract line 2 from line 1    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .............
      </span>        
      <div class="styLNRightNumBox">3</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditsSubjectToRecapture"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 3 -->

  <!--  Line 4 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">4</div>
    <div style="float:left">
      Credit recapture percentage (see instructions)    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ................
      </span>        
      <div class="styLNRightNumBox">4</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/CreditRecapturePercentage"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 4 -->
  
  <!--  Line 5 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">5</div>
    <div style="float:left">
      Accelerated portion of credit. Multiply line 3 by line 4    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..............
      </span>        
      <div class="styLNRightNumBox">5</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AcceleratedPortionOfCredit"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 5 -->
  
  <!--  Line 6 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">6</div>
    <div style="float:left">
      Percentage decrease in qualified basis. Express as a decimal amount carried out to at least 3 places    
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">
      (see instructions)    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ........................
      </span>        
      <div class="styLNRightNumBox">6</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/PctDecreaseInQualifiedBasis"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 6 -->

  <!--  Line 7 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">7</div>
    <div style="float:left">
      Amount of accelerated portion recaptured (see instructions if prior recapture on building). Multiply  
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">
     line 5 by line 6. Section 42(j)(5) partnerships, go to line 16. All other flow-through entities (except 
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">
      electing large partnerships), enter the result here and enter each recipient’s share in the appropriate  
    </div>    
    <div style="float:right">        
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">
      box of Schedule K-1. Generally, flow-through entities other than electing large partnerships will stop  
    </div>    
    <div style="float:right">        
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">
      here. (<span class="styBoldText">Note: </span><span class="styItalicText">An estate or trust enters on line 8 only its share of recapture amount attributable to the</span> 
    </div>    
    <div style="float:right">        
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">
       <span class="styItalicText">credit amount reported on its  Form 8586.) </span>
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .................
      </span>        
      <div class="styLNRightNumBox">7</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AmtOfAccelPortionRecaptured"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 7 -->
  
  <!--  Line 8 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">8</div>
    <div style="float:left">
      Enter recapture amount from flow-through entity (see <span class="styBoldText">Note</span> above)   
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..........
      </span>        
      <div class="styLNRightNumBox">8</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RecaptureAmtFromFlowThruEntity"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 8 -->
  
  <!--  Line 9 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2.7mm; padding-top:0;">9</div>
    <div style="float:left">
      Enter the unused portion of the accelerated amount from line 7 (see instructions)    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ......
      </span>        
      <div class="styLNRightNumBox">9</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AccelPortionOfUnusedCredit"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 9 -->
  
  <!--  Line 10 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">10</div>
    <div style="float:left">
      Net recapture. Subtract line 9 from line 7 or line 8. If less than zero, enter -0-    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .......
      </span>        
      <div class="styLNRightNumBox">10</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/NetRecapture"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 10 -->
  
  <!--  Line 11 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">11</div>
    <div style="float:left">
      Enter interest on the line 10 recapture amount (see instructions)
      	<xsl:call-template name="LinkToLeftoverDataTableInline">          
      		<xsl:with-param name="Desc">Form 8611, Line 11 - Section 42j5 Indicator</xsl:with-param>    
              	<xsl:with-param name="TargetNode" select="$FormData/InterestOnLn10RecaptureAmount/@Section42j5Indicator"/>    
           </xsl:call-template>      
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .........
      </span>        
      <div class="styLNRightNumBox">11</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/InterestOnLn10RecaptureAmount"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 11 -->
  
  <!--  Line 12 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">12</div>
    <div style="float:left">
      Total amount subject to recapture. Add lines 10 and 11     
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .............
      </span>        
      <div class="styLNRightNumBox">12</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalSubjectToRecapture"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 12 -->

  <!--  Line 13 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">13</div>
    <div style="float:left">
     Unused credits attributable to this building reduced by the accelerated portion included on line 9 
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">
      (see instructions)
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ........................
      </span>        
      <div class="styLNRightNumBox">13</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/UnusedCrReducedByAccelPortion"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 13 -->
  
  <!--  Line 14 -->  
 
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">14</div>
    <div style="float:left">
     <span class="styBoldText">Recapture tax.</span> Subtract line 13 from line 12. If zero or less, enter -0-. Enter the result here and on the
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">appropriate line of your tax return (see instructions). If more than one Form 8611 is filed, add the
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">line 14 amounts from all forms and enter the total on the appropriate line of your return. Electing large
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left">partnerships, see instructions
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ....................
      </span>        
      <div class="styLNRightNumBox">14</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RecaptureTax"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 14 -->

  <!--  Line 15 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">15</div>
    <div style="float:left">
      <span class="styBoldText">Carryforward of the low-income housing credit attributable to this building.</span> Subtract line 12 from
    </div>    
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div class="styBB" style="width: 187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left"> line 13. If zero or less, enter -0- (see instructions)</div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..............
      </span>        
      <div class="styLNRightNumBoxNBB">15</div>
      <div class="styLNAmountBoxNBB">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CarryforwardCredit"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 15 -->
  
  <!--  Only Section -->
  <div class="styBB" style="width: 187mm; border-top-width: 0px">
    <div class="styPartDesc" style="padding-left:0px;padding-top:2mm;padding-bottom:2mm;">Only Section 42(j)(5) partnerships need to complete lines 16 and 17.</div>
  </div>
  <!--  End Only Section -->
  
  <!--  Line 16 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">16</div>
    <div style="float:left">
      Enter interest on the line 7 recapture amount (see instructions)
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ...........
      </span>        
      <div class="styLNRightNumBox">16</div>
      <div class="styLNAmountBox">
      	<xsl:call-template name="PopulateAmount">
          	<xsl:with-param name="TargetNode" select="$FormData/RecaptureAmount"/>
        	</xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 16 -->
  
  <!--  Line 17 -->  
  <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
    </div>
  </div>
  <div class="styBB" style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-top:0;">17</div>
    <div style="float:left">
      Total recapture. Add lines 7 and 16 (see instructions)
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..............
      </span>        
      <div class="styLNRightNumBoxNBB">17</div>
      <div class="styLNAmountBoxNBB">
      	<xsl:call-template name="PopulateAmount">
          	<xsl:with-param name="TargetNode" select="$FormData/TotalRecapture"/>
        	</xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 17 -->
 <!--Footer-->
  <div class="pageEnd" style="width:187mm;">
    <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
    <span style="width:105px;"></span>                      
    Cat. No. 63983Q 
    <span style="width:108px;"></span>  
    Form <span class="styBoldText">8611</span> (Rev. 1-2008)
  </div>
        
        <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
           <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Form 8611, Line 11 - Section 42j5 Indicator</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/InterestOnLn10RecaptureAmount/@Section42j5Indicator"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
        </table>
      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>