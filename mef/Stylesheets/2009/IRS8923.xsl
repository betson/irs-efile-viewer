<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8923Style.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8923" />

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
  <meta name="Description" content="Form IRS 8923"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">
    
      <xsl:call-template name="IRS8923Style"></xsl:call-template>    
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8923">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 21mm">
    <div class="styFNBox" style="padding-top: 1mm;width:31mm;font-size: 7pt;height: 21mm">Form <span class="styFormNumber">8923</span>      
      <br/>
      <div class="styAgency" style="padding-top: 1mm">(February 2007)</div>     
      <div class="styAgency" style="padding-top: 1mm">Department of the Treasury<br />Internal Revenue Service</div>
    </div>
    
    <div class="styFTBox" style="padding-top: 1mm; width:123mm">
      <div class="styMainTitle">Mine Rescue Team Training Credit</div>     
      
      <div class="styFST" style="padding-top: 2mm; height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold"><br/>
        <img src="{$ImagePath}/8923_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return.               
      </div>      
    </div>
     <div class="styTYBox " style="padding-top: 3mm;width:31mm;font-size:6pt;height:22mm;border-left-width: 1px">OMB No. 1545-2067
     </div>
     </div>    
          
  <!--  End title of Form -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:140mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/>
      <div style="font-family:verdana;font-size:6pt;">
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template> 
     </div>
    </div>
    
    <div class="styEINBox" style="padding-left:2mm;font-size:7pt;"><span class="BoldText">Identifying number</span>    
      <div class="styNormalText" style="text-align:left; padding-top:2mm;">
      <!-- if EIN exists -->
    <xsl:if test="$FormData/NameOnReturnEIN">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$FormData/NameOnReturnEIN"/>
              </xsl:call-template>
            </xsl:if>
            <!-- Else if SSN exists -->
            <xsl:if test="$FormData/NameOnReturnSSN">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$FormData/NameOnReturnSSN"/>
              </xsl:call-template>
            </xsl:if>
      </div>   
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  
 <!--  Line 1 -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="height: 8mm; padding-top: 3mm">1</div>
    <div class="styIRS8923MedLNDesc" style="height: 6mm; padding-top: 3mm;width:138mm">Total training program costs of qualified mine rescue team employees paid or incurred during the tax year (up to $50,000 per qualified employee)<span class="styBoldText">
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
        <span class="styNBSP"></span>.
      </span>
    </div>
  <div class="styLNRightNumBox" style="height:8mm; padding-top: 7mm; border-bottom-width:1px">1</div>
    <div class="styLNAmountBox" style="height:8mm; padding-top: 7mm; border-bottom-width:1px">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalTrainingCosts"/>
      </xsl:call-template>
    </div>
    </div>

  <!--  Line 1 -->
  
  <!--  Line 2 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox">2</div>
    <div class="styIRS8923MedLNDesc" style="width:138mm">Multiply line 1 by 20% (.20) (see instructions for the adjustment you must make)
      <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.        
      </span>
    </div>
    <div class="styLNRightNumBox">2</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AllowableTrainingCosts"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  Line 2 -->
  
  <!--  Line 3 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox">3</div>
    <div class="styIRS8923MedLNDesc" style="width:138mm">Mine rescue team training credits from partnerships and S corporations
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
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MineRescueTrainingCredits"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  Line 3 -->

  <!--  Line 4 -->  
   <div class="styBB"  style="width: 187mm">
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="height: 10mm; padding-top: 3mm">4</div>
    <div class="styIRS8923MedLNDesc" style="height: 6mm; padding-top: 3mm;width:138mm">Add lines 2 and 3. Partnerships and S corporations, report this amount on Schedule K; all others, report this amount on the applicable line on Form 3800 (e.g., line 1v of the 2007 Form 3800)     
      <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="height:8mm; padding-top: 7mm; border-bottom-width:0px">4</div>
    <div class="styLNAmountBox" style="height:8mm; padding-top: 7mm; border-bottom-width:0px">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalCreditsandCosts"/>
      </xsl:call-template>
    </div>
  </div>
  </div>

  <!--  Line 4 -->  
          <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see page 2. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 37735E 
          <span style="width:110px;"></span>  
          Form <span class="styBoldText">8923</span> (2-2007)
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