<?xml version="1.0" encoding="UTF-8" ?>
<!-- File Created by Jonathan Chiu 10/11/07 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8302Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8302" />
<xsl:template match="/">
<html lang="EN-US">

<head>
  <title><xsl:call-template name="FormTitle">
  	<xsl:with-param name="RootElement" select="local-name($FormData)">
  </xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set  -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 8302" />  
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>
  <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8302Style"></xsl:call-template>    
      <xsl:call-template name="AddOnStyle"></xsl:call-template> 
  </xsl:if>
  </style>
<xsl:call-template name="GlobalStylesForm"/>
</head>

<body class="styBodyClass">
<form name="Form8302">
  <!--  Begin Header section 1 -->
  <xsl:call-template name="DocumentHeader"></xsl:call-template>
  <div class="styBB" style="width:187mm;border-bottom-width:2px;">
    <div class="styFNBox" style="width:32mm;height:18mm;border-right-width:2px;">
      Form <span class="styFormNumber" style="font-size:18pt">8302</span>      
      <br />
      <span style="font-size:7pt;">(Rev. October 2003)</span><br />
      <span class="styAgency">Department of the Treasury</span><br />
      <span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:122mm;height:18mm;">
      <br />
      <div class="styMainTitle" style="height:8mm;">Electronic Deposit of Tax Refund of $1 Million or More</div>
      <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
        <span style="text-align:center;font-weight:bold;">
          <img src="{$ImagePath}/8302_Bullet_Md.gif" alt="MediumBullet"/> 
            Attach to your income tax return (other than Forms 1040, 1120, 1120-A, or <br />
            1120S), Form 1045, or Form 1139.
        </span>
      </div>
    </div>
    <div class="styTYBox" style="width:32mm;height:18mm;border-left-width:2px;">
      <div class="styOMB" style="height:11mm;border-bottom:0px;padding-top:7mm;padding-left:1mm;">
        OMB No. 1545-1763
      </div>
    </div>
  </div>
  <!--  End Header section 1 -->  
  <!-- Begin address, ID number, name and location, phone number header -->
  <div style="width:187mm;border-bottom:1px;">
    <!-- Name on tax return -->
    <div class="styTableCell" style="float:left;width:138mm;height:10mm;text-align:left;">
      <span class="styIRS8302Info">Name(s) shown on income tax return</span><br/>
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
      </xsl:call-template>
      <br/>
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
      </xsl:call-template>
    </div>
    <!-- Identifying number -->
    <div class="styTableCell" style="float:left;width:49mm;height:10mm;text-align:left;padding-left:2mm;border-right:0px;">
      <span class="styIRS8302Info" style="font-weight:bold;">Identifying number</span>
      <br/><br/>
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">EIN</xsl:with-param>
      </xsl:call-template>
    </div>
    <!-- Name and location of bank -->
    <div class="styTableCell" style="float:left;width:138mm;height:10mm;text-align:left;">
      <span class="styIRS8302Info">Name and location (City, State) of bank</span><br />
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/BankName/BusinessNameLine1" />
      </xsl:call-template>
      <br/>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/BankName/BusinessNameLine2"/>
      </xsl:call-template>
      <br />
      <xsl:call-template name="PopulateUSAddressTemplate">
                <xsl:with-param name="TargetNode" select="$FormData/BankUSAddress"/>
                </xsl:call-template>
    </div>
    <!-- Taxpayer's phone number -->
    <div class="styTableCell" style="float:left;width:49mm;height:10mm;text-align:left;padding-left:2mm;border-right:0px;word-wrap:break-word">
      <span class="styIRS8302Info">Taxpayer's phone number</span><br />
      <xsl:choose>
        <xsl:when test="$FormData/BankUSAddress"><br /><br /><br /><br /></xsl:when>
        <xsl:otherwise><br /><br /><br /><br /><br /></xsl:otherwise>
      </xsl:choose>
      <xsl:call-template name="PopulatePhoneNumber">
        <xsl:with-param name="TargetNode" select="$FormData/TaxpayerPhoneNumber" />
      </xsl:call-template>
    </div> 
  </div>  
  <!-- End address, ID number, name and location, phone number header -->
  <!-- Begin data form -->
  <!-- Line 1 -->
  <div style="width:187mm">
    <div class="styIRS8302Num" style="width:4mm;">1</div>
    <div class="styIRS8302LB" style="width:180mm">
      <span style="font-weight:bold;">Method of deposit (one box must be checked)</span>
      <span style="width:4mm;" />
      <!-- populate checkbox -->
      <span>
        <xsl:call-template name="PopulateSpan">
          <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit" />
        </xsl:call-template>
        <input type="checkbox" class="styCkbox" style="width:4mm;">
          <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit"></xsl:with-param>
            <xsl:with-param name="BackupName">IRS8302DirectDeposit</xsl:with-param>
            <xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          </xsl:call-template>
        </input>
      </span>
      <span style="width:1mm;"/>
      <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit" />
          <xsl:with-param name="BackupName">IRS8302DirectDeposit</xsl:with-param>
        </xsl:call-template>
        Direct Deposit
      </label>
      <span style="width:4mm;" />
      <span>
        <xsl:call-template name="PopulateSpan">
          <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit" />
        </xsl:call-template>       
        <input type="checkbox" class="styCkbox" style="width:4mm;">
          <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit"></xsl:with-param>
            <xsl:with-param name="BackupName">IRS8302DirectDeposit</xsl:with-param>
            <xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          </xsl:call-template>
        </input>
      </span>
      <span style="width:1mm;" />
      <label>
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit" />
          <xsl:with-param name="BackupName">IRS8302DirectDeposit</xsl:with-param>
        </xsl:call-template>
        Fedwire
      </label>  
    </div>
  </div>
  <!-- Line 2 -->
  <div style="width:187mm">
    <div class="styIRS8302Num" style="width:4mm;">2</div>
    <div class="styIRS8302LB" style="width:180mm;">
      <span style="font-weight:bold;">Routing number (must be nine digits).</span>
      <span style="width:1mm;" />
      The first two digits must be between 01 and 12 or 21 through 32.
      <br />
      <span style="font-size:2pt;"><br /></span>
      <!-- call routing number -->
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/RoutingNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
      </xsl:call-template>
      <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left" />
    </div>
  </div>
  <!-- Line 3 & 4 -->
  <div style="width:187mm;">
    <!-- Line 3 -->
    <div class="styIRS8302Num" style="width:4mm;">3</div>
    <div class="styIRS8302LB" style="width:127mm;">
      <span style="font-weight:bold;">Account number (include hyphens but omit spaces and special symbols):</span>
      <br />
      <span style="font-size:2pt;"><br /></span>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$FormData/AccountNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
      </xsl:call-template>
      <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left" />
    </div>
    <!-- Line 4 -->
    <div class="styIRS8302Num" style="width:4mm;">4</div>
    <div class="styIRS8302LB" style="width:50mm;">
      <span style="font-weight:bold;">Type of account (one <br/> box must be checked):</span>
      <br/>
      <span style="font-size:2pt;"><br /></span>
      <span>
        <xsl:call-template name="PopulateSpan">
          <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit" />
        </xsl:call-template>
        <input type="checkbox" class="styCkbox" style="width:4mm;">
           
          <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$FormData/AccountType" />
            <xsl:with-param name="BackupName">IRS8302AccountType</xsl:with-param>
            <xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          </xsl:call-template>
          
        </input>
      </span>
      <span style="width:1mm;"/>
      <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/AccountType" />
          <xsl:with-param name="BackupName">IRS8302AccountType</xsl:with-param>
        </xsl:call-template>
        Checking
      </label>
      <span style="width:4mm;" />
      <span>
        <xsl:call-template name="PopulateSpan">
          <xsl:with-param name="TargetNode" select="$FormData/DirectDeposit" />
        </xsl:call-template>
        <input type="checkbox" class="styCkbox" style="width:4mm;">
          <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$FormData/AccountType"></xsl:with-param>
            <xsl:with-param name="BackupName">IRS8302AccountType</xsl:with-param>
            <xsl:with-param name="Checkbox1or2Type">yes</xsl:with-param>
          </xsl:call-template>
        </input>
      </span>
      <span style="width:1mm;" />
      <label>
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/AccountType" />
          <xsl:with-param name="BackupName">IRS8302AccountType</xsl:with-param>
        </xsl:call-template>
        Savings
      </label>
    
    </div>
  </div>
  <div class="styBB" style="width:187mm;height:3mm;" />
<div style="width:187mm;height:3mm;" />
  <div class="pageEnd"></div>
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
    </table>
    <!-- END Left Over Table -->
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>