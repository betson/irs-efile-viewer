<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8824Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="Form8824Data" select="$RtnDoc/IRS8824" />

<xsl:template match="/">
<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8824Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching  -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="Form IRS8824" />
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">

      <xsl:if test="not($Print) or $Print=''">

        <xsl:call-template name="IRS8824Style"></xsl:call-template>        
        <xsl:call-template name="AddOnStyle"></xsl:call-template>   
        
      </xsl:if>
   
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>

  <body class="styBodyClass">
  <form name="Form8824">
      <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"  />  
      <!-- END WARNING LINE -->
      <div class="styBB" style="width:187mm;">
        <div class="styFNBox" style="width:31mm;height:20mm;">
          Form <span class="styFormNumber">8824</span>
          <br/>
          <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8824Data" />
          </xsl:call-template>
          <br/>
          <br/>
          <span class="styAgency">Department of the Treasury</span><br/>
          <span class="styAgency">Internal Revenue Service</span>
        </div>
        <div class="styFTBox" style="width:125mm;padding-top:2mm">
          <div class="styMainTitle" >
            Like-Kind Exchanges 
            <br />
          </div>
          <br />
          <div class="styFST" style="font-size:7pt;">
            (and section 1043 conflict-of-interest sales)
          </div>
          <br />
           <div class="styFST" style="font-size:7pt;padding-top:1mm;">
            <img src="{$ImagePath}/8824_Bullet_Title.gif" alt="bullet image"/>
            Attach to your tax return.
          </div>
        </div>
        <div class="styTYBox" style="width:30mm;height:13mm;">
          <div class="styOMB" style="height:2mm;">
            OMB No. 1545-1190
          </div>
          <div class="styTaxYear" style="height:10mm;">
            20<span class="styTYColor">08</span>
          </div>
          <div class="styOMB" style="height:3mm;border-bottom-width:0px;text-align:left;padding-left:3mm;">Attachment <br/>Sequence No. 
          <span class="styBoldText">109</span></div>
        </div>
      </div>    
      <!-- Names and ID's -->

        <div class="styBB" style="width:187mm;">
          <div class="styNameBox" style="width:144mm;height:8mm;font-size:7pt;">
            Name(s) shown on tax return<br/>
           <div style="font-family:verdana;font-size:6pt;height:6.25mm;">
             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template> 
           </div>
          </div>
          <div class="styEINBox" style="width:42mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Identifying number<br/><br/>
            <span style="font-weight:normal;">  
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
            </span>              
          </div>
        </div>
      <!-- End of Names and ID's -->

    <!-- Like Kind Exchange information -->
    <div class="styBB" style="width:187mm;">
      <div class="styPartName">Part I</div>
      <div class="styPartDesc"><span style="width:8px;"></span>Information on the Like-Kind Exchange
      </div>
    </div>
	
    <div class="styBB" style="width:187mm;">
      <div style="width:187mm;">
        <div class="styLNLeftNumBox"></div>
        <div class="styGenericDiv"><br/>
          <span class="styBoldText">Note:</span>
          <span class="styItalicText"> If the property described on line 1 or line 2 is real or personal property located outside the United States, indicate the country.
          </span>
        </div>
      </div>
      <div style="width:187mm;height:8mm;">
        <div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:3mm">1</div>
        <div class="styGenericDiv" style="padding-top:3.5mm;">
          Description of like-kind property given up
          <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/><span style="width:4px;"></span>
        </div>
              <div class="styGenericDiv" style="padding-top:3.5mm;">
                     <span class="styFixedUnderline" style="float:none;clear:none;width:119mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form8824Data/DescOfLikeKindPropertyGivenUp" />
            </xsl:call-template>
          </span>
        </div>
      </div>

      <div style="width:187mm;height:6mm;">
        <div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:3mm">2</div>
        <div class="styGenericDiv" style="padding-top:3.5mm;">
          Description of like-kind property received
          <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/><span style="width:4px;"></span>
        </div>
              <div class="styGenericDiv" style="padding-top:3.5mm;">
                     <span class="styFixedUnderline" style="float:none;clear:none;width:119mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form8824Data/DescOfLikeKindPropertyReceived" />
            </xsl:call-template>
          </span>
        </div>
      </div>
<div style="width:187mm;"></div>

      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">3</div>
        <div class="styLNDesc" style="width:137.9mm;height:4mm;">
          Date like-kind property given up was originally acquired (month, day, year)
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:6px;"></span>
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
          </span>
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">3
        </div>
        <div class="styLNAmountBox" style="height:4.5mm;text-align:left;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DateLikeKindPropertyGivenUpAcq" />
          </xsl:call-template>
        </div>
      </div>

      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.5mm;">4</div>
        <div class="styLNDesc" style="width:137.9mm;height:4mm;">
          Date you actually transferred your property to other party (month, day, year)
          <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:15px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:15px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:15px;"></span>.
            <span style="width:16px;"></span>.
          </span>
        </div>
        <div class="styLNRightNumBox" style="height:4mm;">4
        </div>
        <div class="styLNAmountBox" style="height:4mm;text-align:left;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DatePropActuallyTransferred" />
          </xsl:call-template>
        </div>
      </div>
<!-- line 5 -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.5mm;">5</div>
        <div class="styLNDesc" style="width:137.9mm;height:4mm;">Date like-kind property you received was identified by written notice to another party (month,
day, year). See instructions for 45-day written notice requirement
            <!--Dotted Line-->
          <span class="styBoldText">
            <span style="width:4px;"></span>
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:16px;"></span>.
          </span>
        </div>
        <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5
        </div>
        <div class="styLNAmountBox" style="height:8mm;text-align:left;padding-top:4mm;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DateLikeKindPropRcvdIdentified" />
          </xsl:call-template>
        </div>
      </div>
<!-- line 6 -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.5mm;">6</div>
        <div class="styLNDesc" style="width:137.9mm;height:4mm;">
          Date you actually received the like-kind property from other party (month, day, year). See instructions                          <!--Dotted Line-->
        </div>
        <div class="styLNRightNumBox" style="height:4mm;">6
        </div>
        <div class="styLNAmountBox" style="height:4mm;text-align:left;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DatePropertyActuallyReceived" />
          </xsl:call-template>
        </div>
      </div>
      
  <div style="width:187mm;">
    <div class="styGenericDiv" style="width:160mm;padding-top:4mm;">
      <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.5mm;">7</div>Was the exchange of the property given up or received made with a related party, either directly or indirectly
(such as through an intermediary)? See instructions. If “Yes,” complete Part II. If “No,” go to Part III
        <span class="styBoldText">
            <span style="width:15px;"></span>.
            <span style="width:16px;"></span>.
            <span style="width:15px;"></span>.
            <span style="width:16px;"></span>.
          </span>

    </div>
    <br />
    <div class="styGenericDiv" style="width:17mm;float:left;clear:none;height:3.5mm; padding-top:4mm;">
        <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
          </xsl:call-template>
          <input type="checkbox" class="styCkbox"> 
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
            </xsl:call-template>
          </input>
        </span>
          <label style="font-weight:bold;">
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
            </xsl:call-template>
            Yes
          </label>
      </div>
      <div class="styGenericDiv" style="width:10mm;float:left;clear:none;height:3.5mm;padding-top:4mm;">
        <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
          </xsl:call-template>
        <input type="checkbox" class="styCkbox"> 
          <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
          </xsl:call-template>
        </input>
        </span>
        <label style="font-weight:bold;">
          <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
          </xsl:call-template>
          No
        </label>
      </div>
  </div>
      
    </div>    
      

  <!-- End of like kind exchange information -->

    <!-- Start of Exchange information -->

  <div class="styBB" style="width:187mm;">
    <div class="styPartName">Part II</div>
    <div class="styPartDesc"><span style="width:8px;"></span>Related Party Exchange Information
    </div>
  </div>

    <div class="styGenericDiv" style="width:187mm;height:10mm;">
      <div class="styLNLeftNumBox" style="height:10mm;width:8mm;border-bottom-width:0px;padding-left: 2.5mm">8</div>
      <div class="styIRS8824RelatedNameBox" style="width:100mm;height:10mm;font-size:7pt;">
        Name of related party<br /> 
        <div style="font-family:verdana;font-size:6pt;">       
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartyName/BusinessNameLine1" />
          </xsl:call-template>
        <xsl:if test="$Form8824Data/RelatedPartyName/BusinessNameLine2" >
          <br /><xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartyName/BusinessNameLine2" />
          </xsl:call-template>
        </xsl:if>
        </div>      
      </div>
      <div class="styIRS8824RelatedNameBox" style="width:30mm;height:10mm;font-size:7pt;font-weight:normal;padding-left:2mm;">
        Relationship to you<br/><br />
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form8824Data/RelationshipToYou" />
        </xsl:call-template>
      </div>
      <div class="styIRS8824RelatedEINBox" style="width:48mm;height:10mm;font-size:7pt;font-weight:normal;padding-left:2mm;">
        Related party's identifying number<br/><br/>
        
               <xsl:if test="$Form8824Data/RelatedPartyEIN != ' ' ">            
                  <span>  
                      <xsl:call-template name="PopulateEIN">
                       <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartyEIN"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
              
             <xsl:if test="$Form8824Data/RelatedPartySSN !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateSSN">
                       <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySSN"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
                  
             <xsl:if test="$Form8824Data/MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$Form8824Data/MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
 
        
      </div>
    </div>
    <div class="styGenericDiv" style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;width:8mm;"></div>
      <div class="styIRS8824RelatedNameBox" style="width:178mm;height:8mm;font-size:7pt;border-right-width:0px;">
        Address (no., street, and apt., room, or suite no., city or town, state, and ZIP code)<br />
           <xsl:if test="$Form8824Data/USRelatedPartyAddress != ' ' ">
               <xsl:call-template name="PopulateUSAddressTemplate">
                <xsl:with-param name="TargetNode" select="$Form8824Data/USRelatedPartyAddress" />
                </xsl:call-template>
           </xsl:if>
           <xsl:if test="$Form8824Data/ForeignRelatedPartyAddress != ' ' ">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="$Form8824Data/ForeignRelatedPartyAddress" />
                </xsl:call-template>
           </xsl:if>

      </div>
    </div>
<div style="width:187mm;"></div>    

<div class="styBB" style="width:187mm;">
  <div style="width:187mm;">
    <div class="styGenericDiv" style="width:160mm;">
      <div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.5mm">9</div>
        During this tax year (and before the date that is 2 years after the last transfer of property that was part of the
        exchange),  did the related party directly or indirectly (such as through an intermediary) sell or dispose of any
        part of the like-kind property received from you in the exchange?
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <br />
      <br />
        <div class="styGenericDiv" style="width:17mm;">
        <span>  
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
          </xsl:call-template>
          <input type="checkbox" class="styCkbox"> 
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
            </xsl:call-template>
          </input>
        </span>
          <label style="font-weight:bold;">
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
            </xsl:call-template>
            Yes
          </label>
        </div>
        <div class="styGenericDiv" style="width:10mm;">  
        <span>  
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
          </xsl:call-template>
          <input type="checkbox" class="styCkbox">   
            <xsl:call-template name="PopulateNoCheckbox">  
              <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />  
            </xsl:call-template>  
          </input>  
        </span>
          <label style="font-weight:bold;">  
            <xsl:call-template name="PopulateLabelNo">  
              <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />  
            </xsl:call-template>  
            No  
          </label>  
        </div>  
    </div>
    
    <div style="width:187mm;"></div>  

  <div style="width:187mm;">
    <div class="styGenericDiv" style="width:160mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">10</div>
      During this tax year (and before the date that is 2 years after the last transfer of property that was part of the
      exchange), did you sell or dispose of any part of the like-kind property you received?
      <!--Dotted Line-->
      <span class="styBoldText">
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <br />
      <div class="styGenericDiv" style="width:17mm;">
        <span>  
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
          </xsl:call-template>
          <input type="checkbox" class="styCkbox"> 
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
            </xsl:call-template>
          </input>
        </span>
        <label style="font-weight:bold;">
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
          </xsl:call-template>
          Yes
        </label>
      </div>
      <div class="styGenericDiv" style="width:10mm;">
        <span>  
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
          </xsl:call-template>
          <input type="checkbox" class="styCkbox"> 
            <xsl:call-template name="PopulateNoCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
            </xsl:call-template>
          </input>
        </span>
        <label style="font-weight:bold;">
          <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
          </xsl:call-template>
          No
        </label>
      </div>
  </div>

  <div style="width:187mm;height:8mm;padding-top:2mm;">
    <div class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;"></div>
    <div class="styLNDesc" style="width:178mm;padding-top:2mm;">
      <span class="styItalicText">
        If both lines 9 and 10 are "No" and this is the year of the exchange, go to Part III. If both lines 9 and 10 are "No" and  this is 
        <span class="styBoldText">not</span> the year of the exchange, stop here. If either line 9 or line 10 is "Yes," complete Part III and report on this year’s tax return the deferred gain or (loss) from line 24 <span class="styBoldText">unless</span> one of the exceptions on line 11 applies. 
      </span>
    </div>
  </div>

  <div style="width:187mm;"></div>  

  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">11</div>
    <div class="styLNDesc" style="height:4mm;width:175mm;">
      If one of the exceptions below applies to the disposition, check the applicable box:
    </div>
  </div>

  <div style="width:187mm;">
    <div class="styLNLeftLtrBoxDD" style="height:4mm;padding-top:3mm;">a</div>
    <div class="styLNDesc" style="height:4mm;width:165mm;padding-top:3mm">
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasAfterDeathRltdParties" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasAfterDeathRltdParties" />
        </xsl:call-template> 
        The disposition was after the death of either of the related parties.
      </label>
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftLtrBoxDD" style="height:4mm;padding-top:3mm">b</div>
    <div class="styLNDesc" style="height:4mm;width:165mm;padding-top:3mm">
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasInvoluntaryConversion" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasInvoluntaryConversion" />
        </xsl:call-template> 
        The disposition was an involuntary conversion, and the threat of conversion occurred after the exchange.
      </label>
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftLtrBoxDD" style="height:4mm;padding-top:3mm">c</div>
    <div class="styLNDesc" style="height:4mm;width:170mm;padding-top:3mm">
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeDisposNotTaxAvoidance" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeDisposNotTaxAvoidance" />
        </xsl:call-template> 
        You can establish to the satisfaction of the IRS that neither the exchange nor the disposition had tax avoidance as
        its principal purpose. If this box is checked, attach an explanation (see instructions).
        <!-- set the push pin image -->
      </label>  
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeDisposNotTaxAvoidance" />
      </xsl:call-template>
    </div>
  </div>
</div>
<!-- End of Exchange Information -->

  <!--footer -->
  <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
    <div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see page 5.</div>
    <div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12311A</div>
    <div style = "float:right;" class="styGenericDiv">Form <span class="styBoldText">8824</span> (2008)</div>
  </div>

 <!-- header -->
  <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;" class="styBB">
    <div style="width:90mm;" class="styGenericDiv">Form 8824 (2008)</div>
    <div style="width:55mm;text-align:center;" class="styGenericDiv"></div>
    <div style = "float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span></div>
  </div>

    <!-- Begin Second page Name and ID section -->

    <div class="styBB" style="width:187mm;clear:both;">
      <div class="styNameBox" style="width:144mm;height:8mm;">
        Name(s) shown on tax return. Do not enter name and social security number if shown on other side.<br/>
      </div>
      <div class="styEINBox" style="width:42mm;height:4mm;padding-left:2mm;">
        Your social security number<br/><br/>
      </div>
    </div>
<!-- End Second page Name and ID section -->

<!-- Start of Part III -->
  <div class="styBB" style="width:187mm;">
    <div class="styPartName">Part III</div>
    <div class="styPartDesc"><span style="width:8px;"></span>
      Realized Gain or (Loss), Recognized Gain, and Basis of Like-Kind Property Received
    </div>
  </div>
  <div style="width:187mm;height:8mm;padding-top:0mm;">
    <div class="styLNLeftNumBox" style="height:4mm; "></div>
    <div class="styLNDesc" style="width:178mm;">
      <span class="styBoldText">Caution:</span> 
      <span class="styItalicText">
        If you transferred
        <span class="styBoldText">and</span> received
        <span class="styBoldText">(a)</span> more than one group of like-kind properties
        or <span class="styBoldText">(b)</span> cash or other (not like-kind)
        property, see <span class="styBoldText">Reporting of multi-asset exchanges</span>
        in the instructions.
      </span>
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"></div>
    <div class="styLNDesc" style="width:178mm;">
        <span class="styBoldText">Note:</span>
      <span class="styItalicText">
        Complete lines 12 through 14
        <span class="styBoldText">only</span>
        if you gave up property that was not like-kind.
        Otherwise, go to line 15.
      </span>
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
    <div class="styLNDesc" style="width:98mm;height:4.5mm;">
      Fair market value (FMV) of other property given up
      <!--Dotted Line-->
      <span class="styBoldText">
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="height:4.5mm;">12</div>
    <div class="styLNAmountBox" style="height:4.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form8824Data/FMVOfOtherPropertyGivenUp" />
      </xsl:call-template>
    </div>
    <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
    <div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px"></div>
  </div>

  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
    <div class="styLNDesc" style="width:98mm;height:4.5mm;">
      Adjusted basis of other property given up
      <!--Dotted Line-->
      <span class="styBoldText">
        <span style="width:2px;"></span>
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="height:4.5mm;">13</div>
    <div class="styLNAmountBox" style="height:4.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form8824Data/AdjBasisOfOtherPropertyGivenUp" />
      </xsl:call-template>
    </div>
    <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"></div>
    <div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px"></div>
  </div>
  <div class="styBB" style="width:187mm;">
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">14</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        Gain or (loss) recognized on other property given up. Subtract line 13 from line 12. Report the
        gain or (loss) in the same manner as if the exchange had been a sale
        <!--Dotted Line-->
        <span class="styBoldText">
          <span style="width:7px;"></span>
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">14
      </div>
      <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/GainLossOnOtherPropertyGivenUp" />
        </xsl:call-template>
      </div>
      
    </div>

    <div style="width:187mm;">
    		<div class="styGenericDiv" style="width:145.9mm;padding-left:8mm;padding-bottom:0mm;height:7mm;">
		<b>Caution: </b><i>If the property given up was used previously or partly as a home, see <b>Property used
		as home </b>in the instructions.</i>
		</div>
		<div class="styLNRightNumBoxNBB" style="height:7mm;"/>
      	<div class="styLNAmountBoxNBB" style="height:7mm;"/>
	</div>
	<div style="width:187mm;">
     	<div class="styLNLeftNumBox" style="height:8mm;">15</div>
      	<div class="styLNDesc" style="width:137.9mm;height:7mm;">
      	  Cash received, FMV of other property received, plus net liabilities assumed by other party, reduced
       	 (but not below zero) by any exchange expenses you incurred (see instructions)      
        	<!--Dotted Line-->
       	 <span class="styBoldText">
           <span style="width:7px;"></span>
           <span style="width:16px;"></span>.
           <span style="width:16px;"></span>.
           <span style="width:16px;"></span>.
           <span style="width:16px;"></span>.
           <span style="width:16px;"></span>.
           <span style="width:16px;"></span>.
           </span>
         </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">15
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/CashFMVAndNetLiabRedByExpenses" />
        </xsl:call-template>
      </div>
    </div>
    
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">16</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        FMV of like-kind property you received
        <span class="styBoldText">
          <span style="width:7px;"></span>
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">16
      </div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/FMVOfLikeKindPropertyReceived" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">17</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        Add lines 15 and 16
        <span class="styBoldText">
          <span style="width:11px;"></span>
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">17
      </div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/AmountRealized" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">18</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        Adjusted basis of like-kind property you gave up, net amounts paid to other party, plus any
        exchange expenses <span class="styBoldText">not</span> used on line 15 (see instructions)
        <span class="styBoldText">
          <span style="width:5px;"></span>
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">18
      </div>
      <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/AdjBasisOfLikeKindPropGivenUp" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">19</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        <span class="styBoldText">Realized gain or (loss).</span> Subtract line 18 from line 17
        <span class="styBoldText">
          <span style="width:6px;"></span>
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">19
      </div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/RealizedGainOrLoss" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">20</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        Enter the smaller of line 15 or line 19, but not less than zero
        <span class="styBoldText">
          <span style="width:8px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">20
      </div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/SmallerGainOrLoss" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">21</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        Ordinary income under recapture rules. Enter here and on Form 4797, line 16 (see instructions)
        <span class="styBoldText">
          <span style="width:8px;"></span>
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">21
      </div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/OrdinaryIncmUndRecaptureRules" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">22</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        Subtract line 21 from line 20. If zero or less, enter -0-. If more than zero, enter here and on Schedule
        D or Form 4797, unless the installment method applies (see instructions)
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">22
      </div>
      <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/SmallerGainLossLessOrdnryIncm" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">23</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        <span class="styBoldText">Recognized gain.</span> Add lines 21 and 22
        <span class="styBoldText">
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:16px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">23
      </div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/RecognizedGain" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">24</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        Deferred gain or (loss). Subtract line 23 from line 19. If a related party exchange, see instructions
        <span class="styBoldText">
          <span style="width:14px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">24
      </div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/DeferredGainOrLoss" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;">25</div>
      <div class="styLNDesc" style="width:137.9mm;height:4mm;">
        <span class="styBoldText">Basis of like-kind property received.</span>
        Subtract line 15 from the sum of lines 18 and 23
        <span class="styBoldText">
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
          <span style="width:15px;"></span>.
        </span>
      </div>
      <div class="styLNRightNumBoxNBB" style="height:4mm;">25
      </div>
      <div class="styLNAmountBoxNBB" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form8824Data/BasisOfLikeKindPropertyRcvd" />
        </xsl:call-template>
      </div>
    </div>
  </div>    
 <!-- End of Part III -->  
  
 


 
<!-- Begin Section IV -->
  <div class="styBB" style="width:187mm;clear:both;float:none;">
    <div class="styPartName">Part IV</div>
    <div class="styPartDesc"><span style="width:8px;"></span>
      Deferral of Gain From Section 1043 Conflict-of-Interest Sales    
    </div>
  </div>  
  <div style="width:187mm;height:8mm;padding-top:1mm;clear:both;float:none;">
    <div class="styLNLeftNumBox" style="height:4mm;"></div>
    <div class="styLNDesc" style="width:178mm;">
      <span class="styItalicText">
        <span class="styBoldText">Note:</span> This part is to be used  
        <span class="styBoldText">only</span> by officers or employees of the executive branch of the Federal Government or judicial
	  officers of the Federal Government for reporting nonrecognition of gain under section 1043 on the sale of property to comply with the conflict-of-interest 
        requirements. This part can be used        
        <span class="styBoldText">only</span> if the cost of the replacement property is more than the basis of the divested property.</span>
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;padding-top:3mm;">26</div>
    <div class="styLNDesc" style="width:118mm;height:4mm;padding-top:3mm;">
      Enter the number from the upper right corner of your certificate of divestiture. (<span class="styBoldText">Do not</span> attach a
      copy of your certificate. Keep the certificate with your records.)
      <span class="styBoldText">
        <span style="width:8px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <br />
    <div class="styGenericDiv" style="width:60mm;float: right; clear:none;">
      <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image" /><span style="width:4px;"></span>
                 <span class="styFixedUnderline" style="float:none;clear:none;width:25mm;">
      </span>
      &#8212;  <!-- em dash -->
                 <span class="styFixedUnderline" style="float:none;clear:none;width:25mm;">
      </span>
    </div>
  </div>

  <div style="width:187mm;height:6mm;padding-top:3mm;">
    <div class="styLNLeftNumBox">27</div>
    <div class="styGenericDiv" style="padding-top:.5mm;">
      Description of divested property
      <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/><span style="width:4px;"></span>
    </div>
    <div class="styGenericDiv">
                 <span class="styFixedUnderline" style="float:none;clear:none;width:131mm;">
      </span>
    </div>
  </div>
  <div style="width:187mm;height:6mm;padding-top:3mm;">
    <div class="styLNLeftNumBox">28</div>
    <div class="styGenericDiv" style="padding-top:.5mm;">
      Description of replacement property
      <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/><span style="width:4px;"></span>
    </div>
    <div class="styGenericDiv">
                 <span class="styFixedUnderline" style="float:none;clear:none;width:127mm;">
      </span>
    </div>
  </div>
  <div class="styBB" style="width:187mm;clear:both;padding-top:3mm;">
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">29</div>
    <div class="styLNDesc" style="width:137.9mm;height:4mm;">
      Date divested property was sold (month, day, year)
      <!--Dotted Line-->
      <span class="styBoldText">
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;">29
    </div>
    <div class="styLNAmountBox" style="height:4mm;text-align:left;">
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">30</div>
    <div class="styLNDesc" style="width:98mm;padding-top:3mm;height:7mm;">
      Sales price of divested property (see instructions)
      <!--Dotted Line-->
      <span class="styBoldText">
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">30</div>
    <div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
    </div>
    <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-top:3mm;"></div>
    <div class="styLNAmountBoxNBB" style="height:7mm;border-bottom-width:0px;padding-top:3mm;"></div>
  </div>
  
  <div style="width:187mm;height:4mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">31</div>
    <div class="styLNDesc" style="width:98mm;padding-top:3mm;height:7mm;">
      Basis of divested property
      <!--Dotted Line-->
      <span class="styBoldText">
        <span style="width:10px;"></span>
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">31</div>
    <div class="styLNAmountBox" style=";padding-top:3mm;height:7mm;">
    </div>
    <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:3mm;height:7mm;"></div>
    <div class="styLNAmountBox" style="border-bottom-width:0px;padding-top:3mm;height:7mm;"></div>
  </div>
  <div style="width:187mm;height:4mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm">32</div>
    <div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
      <span class="styBoldText">Realized gain.</span> Subtract line 31 from line 30
      <span class="styBoldText">
        <span style="width:8px;"></span>
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="padding-top:3mm;">32
    </div>
    <div class="styLNAmountBox" style="padding-top:3mm;">
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">33</div>
    <div class="styLNDesc" style="width:98mm;padding-top:3mm;height:7mm;">
      Cost of replacement property purchased within 60 days after date
      of sale
      <!--Dotted Line-->
      <span class="styBoldText">
      </span>
    </div>
    <div class="styLNRightNumBox" style="padding-top:3mm;">33</div>
    <div class="styLNAmountBox" style="padding-top:3mm;">
    </div>
    <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:3mm;height:7mm;"></div>
    <div class="styLNAmountBox" style="border-bottom-width:0px;padding-top:3mm;height:7mm;"></div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm;">34</div>
    <div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
      Subtract line 33 from line 30. If zero or less, enter -0-
      <span class="styBoldText">
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="padding-top:3mm;">34
    </div>
    <div class="styLNAmountBox" style="padding-top:3mm;">
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm;">35</div>
    <div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
      Ordinary income under recapture rules. Enter here and on Form 4797, line 10 (see instructions)
      <span class="styBoldText">
        <span style="width:10px;"></span>
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="padding-top:3mm;">35
    </div>
    <div class="styLNAmountBox" style="padding-top:3mm;">
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:10mm;padding-top:3mm;">36</div>
    <div class="styLNDesc" style="width:137.9mm;height:10mm;padding-top:3mm;">
      Subtract line 35 from line 34. If zero or less, enter -0-. If more than zero, enter here and on
      Schedule D or Form 4797 (see instructions)
      <span class="styBoldText">
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:15px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">36
    </div>
    <div class="styLNAmountBox" style="height:10mm;padding-top:6mm;">
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm;">37</div>
    <div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
      <span class="styBoldText">Deferred gain.</span> Subtract the sum of lines 35 and 36 from line 32
      <span class="styBoldText">
        <span style="width:12px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="padding-top:3mm;">37
    </div>
    <div class="styLNAmountBox" style="padding-top:3mm;">
    </div>
  </div>
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="padding-top:3mm;">38</div>
    <div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
      <span class="styBoldText">Basis of replacement property.</span>
      Subtract line 37 from line 33
      <span class="styBoldText">
        <span style="width:11px;"></span>
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:17px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
      </span>
    </div>
    <div class="styLNRightNumBoxNBB" style="padding-top:3mm;">38
    </div>
    <div class="styLNAmountBoxNBB" style="padding-top:3mm;">
    </div>
  </div>  
</div>




  

<!-- Footer -->

    
<div style="width:187mm;padding-top:1mm;">
  <div style="float:left;">
  </div>
  <div style="float:right;">
    <span style="width:80px;"></span>  
    Form <span class="styBoldText">8824</span> (2008)
  </div>
</div>



<!-- Introducing page end -->

<p class="pageend"></p>

  

<!-- Begininning of write-in data -->

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
        <xsl:with-param name="TargetNode" select="$Form8824Data" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
  

  

  

  

  

  

  

  </form>

</body>

</html>

</xsl:template>

</xsl:stylesheet>

