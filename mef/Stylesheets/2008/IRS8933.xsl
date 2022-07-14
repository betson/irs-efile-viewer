<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8933Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8933" />
<xsl:template match="/">
<html>
<head>  
  <title>
  <xsl:call-template name="FormTitle">
  <xsl:with-param name="RootElement" select="local-name($FormData)">
  </xsl:with-param></xsl:call-template>
  </title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8933"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8933Style">
      </xsl:call-template>    
      <xsl:call-template name="AddOnStyle">
      </xsl:call-template>  
    </xsl:if>
  </style>      
</head>
<body class="styBodyClass">
  <form name="Form8933">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;">
			<div class="styFNBox" style="width:31mm;height:20mm;border-right:none;vertical-align:bottom;">
							Form <span class="styFormNumber">8933</span>		
		<div class="styAgency" style="margin-top:1.8mm">
		<br/>						
        Department of the Treasury
      <br/>
        Internal Revenue Service
      </div>
		</div>
		<div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:20mm;">
		<div style="height:13.5mm;" class="styMainTitle">
		<br/>
		Carbon Dioxide Sequestration Credit
      </div>
		<div class="styFST" style="height:5mm;font-size:7pt;">
		<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
        Attach to your tax return.    
      </div>
		</div>
		<div class="styTYBox" style="width:32mm;border-left:none;">
		<div class="styOMB" style="height:2mm;">OMB No. 1545-2132</div>
		<div class="styTaxYear">
          20<span class="styTYColor">08</span>
		</div>
		<div style="margin-left:3mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">165</span>
		</div>
		</div>
		</div>
		<!-- End Form Number and Name section -->
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:140mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/>
      <div style="font-family:verdana;font-size:6pt;padding-top:1mm;">
        <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
        </xsl:call-template><br/>
        <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
        </xsl:call-template> 
     </div>
    </div>
    <div class="styEINBox" style="padding-left:2mm;font-size:7pt;clear:none;">
    <span class="BoldText">Identifying number</span>  
      <div class="styNormalText" style="text-align:left; padding-top:2mm;">
      <!-- if EIN exists -->
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">EIN</xsl:with-param>
        </xsl:call-template> 
   <!-- <xsl:if test="$FormData/NameOnReturnEIN">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$FormData/NameOnReturnEIN"/>
              </xsl:call-template>
            </xsl:if>-->
            <!-- Else if SSN exists -->
            <!--<xsl:if test="$FormData/NameOnReturnSSN">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$FormData/NameOnReturnSSN"/>
              </xsl:call-template>
            </xsl:if>-->
      </div>   
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  <!--Qualified carbon dixiode-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;height: 14mm; padding-top: 2mm"></div>
   <div class="styIRS8933MedLNDesc" style="height: 14mm; padding-top: 2mm;width:138mm;"> <b>Qualified carbon dioxide captured after October 3, 2008, at a qualified facility and disposed<br/> 
   of in secure geological storage and, if captured after February 17, 2009, not used as a <br/>
   tertiary injectant in a qualified enhanced oil or natural gas recovery project.</b>
    </div>
    <div class="styLNRightNumBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"></div>
    <div class="styLNAmountBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 1 -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 0mm;float:left;clear:none;">1</div>
    <div class="styIRS8933MedLNDesc" style="height: 4mm; padding-top: 0mm;width:91mm;padding-left:.5mm;">Metric tons captured and disposed of (see instructions)
    <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
      </span>
      </div>
      <div class="styUnderlineAmount" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TonsDisposedNumber"/>
      </xsl:call-template>
       <span style="width:2mm;"></span>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; ">x $20.00</div>
  <div class="styLNRightNumBox" style="height:4mm; border-bottom-width:1px">1</div>
    <div class="styLNAmountBox" style="height:4mm;  border-bottom-width:1px">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TonsDisposedAmount"/>
      </xsl:call-template>
    </div>
    </div>
  <!-- end Line 1 -->
  <!--Qualified carbon dioxide-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;height: 14mm; padding-top: 2mm"></div>
   <div class="styIRS8933MedLNDesc" style="height: 14mm; padding-top: 2mm;width:138mm;"> <b>Qualified carbon dioxide captured, after Qctober 3, 2008, at a qualified facility and used as
   <br/> as a tertiary injectant in a qualified enhanced oil or natural gas recovery project and, if <br/>
     captured after Febuary 17, 2009, disposed of in a secure geological storage.</b>
    </div>
    <div class="styLNRightNumBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"></div>
    <div class="styLNAmountBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
  <!--  Line 2 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;">2</div>
    <div class="styIRS8933MedLNDesc" style="height: 4mm; width:91mm;padding-left:.5mm;">Metric tons captured and used (see instructions)
    <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
          <span class="styNBSP"></span>.
      </span>
      </div>
      <div class="styUnderlineAmount" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TonsCapturedNumber"/>
      </xsl:call-template>
       <span style="width:2mm;"></span>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; ">x $10.00</div>
    <div class="styLNRightNumBox">2</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TonsCapturedAmount"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  end Line 2 -->
  <!--Blank Space-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;" ></div>
   <div class="styIRS8933MedLNDesc" style="width:138mm;"> </div>
   <div class="styLNRightNumBox" style="height:1mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:1mm; border-bottom-width:0px"/>
    </div>
    <!--end Blank space-->
  <!--  Line 3 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;">3</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Carbon dioxide sequestration credit from partnerships and S corporations 
      <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
      </span>
     </div>
    <div class="styLNRightNumBox">3</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount" >
        <xsl:with-param name="TargetNode" select="$FormData/CreditAmount"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  end Line 3 -->
  <!--Blank Space-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;"></div>
   <div class="styIRS8933MedLNDesc" style="width:138mm;"> </div>
   <div class="styLNRightNumBox" style="height:5mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:5mm; border-bottom-width:0px"/>
    </div>
    <!--end Blank space-->
  <!--  Line 4 -->  
   <div class="styBB"  style="width: 187mm;padding-top:0mm;">
    <div class="styLNLeftNumBox" style="width:6mm;">4</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;">Add lines 1, 2, and 3. Partnerships and S corporations, report this amount on Schedule K, all 
    <br/>others, report this amount on Form 3800, line 1x   
      <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
         <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
         <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
      </span>
    </div>
   <div class="styLNRightNumBox" style="height:6mm;padding-top:4mm;border-bottom-width:0px;"> 
    4</div>
    <div class="styLNAmountBox" style="height:6mm;padding-top:4mm;border-bottom-width:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalAmount"/>
      </xsl:call-template>
    </div>
    </div>
  <!--  End Line 4 -->  
          <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see back of form. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 37748H 
          <span style="width:110px;"></span>  
          Form <span class="styBoldText">8933</span> (2008)
        </div>
        <br/>
        <br class="pageEnd"/>
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
        </table>
      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>