<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8933Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8933"/>
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
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
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
    <xsl:call-template name="DocumentHeader"/>  
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
		<div style="height:
		.5mm;" class="styMainTitle">
		<br/>
		Carbon Dioxide Sequestration Credit
      </div>
		<div class="styFST" style="height:3mm;font-size:7pt;">
								<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
Attach to your tax return.    
</div>
							<div class="styFST" style="height:5mm;font-size:7pt;">
								<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
To claim this credit, the qualified facility must capture at least 500,000 metric tons of carbon dioxide during the tax year.    
</div>
							<div class="styFST" style="height:5mm;font-size:7pt;">
								<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
Information about Form 8933 and its instructions is at <i>www.irs.gov/form8933.</i>
							</div>
		</div>
		<div class="styTYBox" style="width:32mm;border-left:none;">
		<div class="styOMB" style="height:2mm;">OMB No. 1545-2132</div>
		<div class="styTaxYear">
          20<span class="styTYColor">14</span>
		</div>
		<div style="margin-left:3mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">165</span>
		</div>
		</div>
		</div>
		<!-- End Form Number and Name section -->
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:140mm;font-weight:normal;font-size:7pt;height: 12mm;">
      Name(s) shown on return<br/>
      <div style="font-family:verdana;font-size:6pt;padding-top:1mm;">
 					<xsl:choose>
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
						<br/>
						  <span>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						  </span>
						</xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							</xsl:otherwise>
					</xsl:choose>
     </div>
    </div>
    <div class="styEINBox" style="padding-left:2mm;font-size:7pt;clear:none;">
    <span class="BoldText">Identifying number</span>  
      <div class="styNormalText" style="text-align:left; padding-top:2mm;">
      <!-- if EIN exists -->
      <xsl:choose>
			 <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
							<br/>
				 <span style="font-weight:normal;">
					 <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</xsl:when>
						  <xsl:otherwise>
						  <br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
				</xsl:call-template>
			</span>
		</xsl:otherwise>
	</xsl:choose>
      </div>   
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  <!--Qualified carbon dixiode-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;height: 14mm; padding-top: 2mm"/>
   <div class="styIRS8933MedLNDesc" style="height: 14mm; padding-top: 2mm;width:138mm;"> 
   <b>Qualified carbon dioxide captured at a qualified facility, disposed of in secure geological<br/>
        storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery<br/>
 project.</b>
    </div>
    <div class="styLNRightNumBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 1a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 0mm;float:left;clear:none;">1a</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 4mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">Metric tons captured and disposed of (see instructions)
		<span class="styBoldText">
			<span class="styNBSP"/>.
			<span class="styNBSP"/>.
							  </span>
		  </div>
     		  <div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$FormData/MetricTonsCapturedDispQty"/>
		  </xsl:call-template>
		   <!--<span style="width:2mm;"/>-->
		</div>
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:7.9mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
  <!-- end Line 1a -->  
  <!--  Line 1b -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">b</div>
     <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
    <div class="styIRS8933MedLNDesc" style="height: 4mm; width:91.5mm;padding-left:.5mm;">Inflation–adjusted credit rate
    <span class="styBoldText">
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
      </div>
            <div class="styUnderlineAmount" style="height:4mm;width:41mm;">
     $21.51
          </div>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm; "/>
    <div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
    <div class="styLNAmountBox" style="height:6mm; padding-top:0mm;border-bottom-width:0px;">      
    </div>
  </div>
    <!--  end Line 1b --> 
  <!--  Line 1c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 1a by line 1b 
      <span class="styBoldText">
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
     </div>
    <div class="styLNRightNumBox">1c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MetricTonsCapturedDispAmt"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  end Line 1c -->
  <!--Qualified carbon dioxide-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;height: 14mm; padding-top: 2mm"/>
   <div class="styIRS8933MedLNDesc" style="height: 14mm; padding-top: 2mm;width:138mm;"> <b>Qualified carbon dioxide captured at a qualified facility, disposed of in secure geological <br/>storage, and used as a tertiary injectant in a qualified enhanced oil or natural gas recovery <br/>project.
    </b>
    </div>
    <div class="styLNRightNumBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>  
    <!--  Line 2a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 0mm;float:left;clear:none;">2a</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 4mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">Metric tons captured and used (see instructions)
		<span class="styBoldText">
			<span class="styNBSP"/>.
			<span class="styNBSP"/>.
			<span class="styNBSP"/>.
			<span class="styNBSP"/>.
		  </span>
		  </div>
     		  <div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$FormData/MetricTonsCapturedUsedQty"/>
		  </xsl:call-template>
		   <!--<span style="width:2mm;"/>-->
		</div>
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:7.9mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
  <!-- end Line 1a -->  
  <!--  Line 1b -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">b</div>
     <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
    <div class="styIRS8933MedLNDesc" style="height: 4mm; width:91.5mm;padding-left:.5mm;">Inflation–adjusted credit rate
    <span class="styBoldText">
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
      </div>
            <div class="styUnderlineAmount" style="height:4mm;width:41mm;">
     $10.75
      
    </div>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm; "/>
    <div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
    <div class="styLNAmountBox" style="height:6mm; padding-top:0mm;border-bottom-width:0px;">      
    </div>
  </div>
  <!--  end Line 2b --> 
  <!--  Line 2c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 2a by line 2b 
      <span class="styBoldText">
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
     </div>
    <div class="styLNRightNumBox">2c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MetricTonsCapturedUsedAmt"/>
      </xsl:call-template>
    </div>    
  </div>
  <!--  end Line 2c -->
  <!--  Line 3 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;height:6mm;padding-top: 4mm;">3</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:6mm;padding-top: 4mm; ">Carbon dioxide sequestration credit from partnerships and S corporations 
      <span class="styBoldText">
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.                
      </span>
     </div>
     <div class="styLNRightNumBox" style="height:0.5mm; padding-top: 0mm; border-bottom-width:0px;background-color:lightgrey;"/>
     <div class="styLNAmountBox" style="height:0.5mm; padding-top: 0mm; border-bottom-width:0px;">
          </div>
    <div class="styLNRightNumBox">3</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  end Line 3 -->
    <!--  Line 4 -->  
  <div class="styBB" style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;height:6mm;padding-top: 4mm;">4</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:6mm;padding-top: 4mm;">Add lines 1c, 2c, and 3. Partnerships and S corporations, report this amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1x
    <span class="styBoldText">
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        </span>
       </div>
    <div class="styLNRightNumBox" style="height:7mm; padding-top: 0mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:7mm; padding-top: 0mm; border-bottom-width:0px;">
    </div>
    <div class="styLNRightNumBox" style="height:4mm; padding-top: 0mm; border-bottom-width:0px;">4</div>
    <div class="styLNAmountBox" style="height:4mm; padding-top: 0mm; border-bottom-width:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalAmt"/>
      </xsl:call-template>
    </div>
      </div>      
  <!--  end Line 4 -->
          <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span> 
          <span style="width:135px;"/>                      
          Cat. No. 37748H 
          <span style="width:110px;"/>  
          Form <span class="styBoldText">8933</span> (2014)
        </div>
        <br/>
        <br class="pageEnd"/>
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
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>                   
        </table>
      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    
</xsl:stylesheet>