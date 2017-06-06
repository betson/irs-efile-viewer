<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8847Style.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8847" />


<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8847"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8847Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8847">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;">
    <div class="styFNBox" style="width:31mm;height:21mm;">
      Form <span class="styFormNumber">8847</span>      
      <br/>
      	<span style="font-size:6pt;">(Rev. December 2006)</span>
	 <br/>
	 <div style="padding-top:2mm;">
      <span class="styAgency">Department of the Treasury</span><br />
      <span class="styAgency">Internal Revenue Service &nbsp; &nbsp; &nbsp; (99) </span>
    </div>
    </div>
    <div class="styFTBox" style="width:125mm;">
      <div class="styMainTitle" style="height:8mm;">Credit for Contributions to Selected Community <br/>Development Corporations<br/></div>
      <div class="styFST" style="padding-top: 1mm;height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold"><br/><br/>
        <img src="{$ImagePath}/8847_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return.
      </div>
    </div>
    <div class="styTYBox" style="width:31mm;height:21mm;">
    <div class="styOMB" style="height:auto;padding-top:6mm;">OMB No. 1545-1416</div>
    <!--div class="styTY" style="height:11mm">20<span class="styTYColor">05</span></div>-->
    <div class="stySequence" style="padding-top:3.5mm;">Attachment<br/>Sequence No. <b>100</b></div>
  </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:156mm;height:auto;font-size:7pt;">
      Name(s) shown on return<br/>
      <!-- Added per UWR 31342 to allow 1040/ssn filer to use this form -->
              <xsl:choose>
								    <xsl:when test="$RtnHdrData/ReturnType='1040'">
						<br/>
								      <xsl:call-template name="PopulateReturnHeaderFiler">
							            <xsl:with-param name="TargetNode">Name</xsl:with-param>
						              </xsl:call-template>
						            </xsl:when>
						            <xsl:otherwise>		    
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br/>  
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
      </xsl:call-template>
      </xsl:otherwise>
	</xsl:choose>
    </div>
    <div class="styEINBox" style="width:30mm;height:auto;padding-left:2mm;font-size:7pt;">
        Identifying number<br/><br/>
   		<div style="text-align:left; font-weight:normal;">  
   		  
        <xsl:choose>
          <xsl:when test="normalize-space($FormData/IdentifyingNumber) != ''">
            <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$FormData/IdentifyingNumber" />
            </xsl:call-template>
          </xsl:when>  
          <xsl:otherwise>  
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>  
          </xsl:otherwise>
        </xsl:choose>
        
      </div>    
    </div>
    
  </div>  
  <!--  End Name and Employer indentification number  -->
  
   <!-- Line 1 -->
   <div class="styBB" style="width:187mm">
    <div style="width:187mm;">
        <div class="styLNLeftNumBoxSD" style="height:8.5mm;padding-top:2mm;">1</div>
        <div class="styLNDesc" style="width:139mm;height:8.5mm;padding-top:2mm;">
          Total qualified community development corporation (CDC) contributions from Part I of Schedules A (Form 8847)          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">............................</span>  
        </div>        
        <div class="styLNRightNumBox" style="height:8.5mm;padding-top: 5.5mm">1</div>
        <div class="styLNAmountBox" style="height:8.5mm;padding-top:5.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotalQualifiedCDCContributions"/>
          </xsl:call-template>
        </div>
      </div>
 
  <!--  Line 2 -->
   <div style="width:187mm;">
        <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">2</div>
        <div class="styLNDesc" style="width:139mm;height:8mm;padding-right:1mm;padding-top: 4mm;">
          Multiply line 1 by 5% (.05)  
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">.......................</span>  
        </div>        
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">2</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine1By5Percent"/>
          </xsl:call-template>
        </div>
      </div>
   
  <!--  Line 3 -->
    <div style="width:187mm;">
        <div class="styLNLeftNumBoxSD" style="height:8mm;">3</div>
        <div class="styLNDesc" style="width:139mm;height:8mm;padding-right:1mm;">
          Credit for contributions to selected community development corporations from partnerships and S corporations          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">...........................</span>  
        </div>        
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">3</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ContriToSelComDev"/>
          </xsl:call-template>
        </div>
      </div>
  
  <!--  Line 4 -->  
   <div style="width:187mm;">
        <div class="styLNLeftNumBoxSD" style="height:8mm;">4</div>
        <div class="styLNDesc" style="width:139mm;height:8mm;padding-right:1mm;">
          Add lines 2 and 3. Partnerships and S corporations, report this amount on Schedule K; all others,
		report this amount on the applicable line of Form 3800 (e.g., line 1x of the 2006 Form 3800)
         <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">.....</span>  
        </div>        
        <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top: 4mm;">4</div>
        <div class="styLNAmountBoxNBB" style="height:8mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/AddLines2And3"/>
          </xsl:call-template>
        </div>
      </div>
    </div>
  
  <!--Page End -->
    <div style="width:187mm;">
          <span class="styBoldText" style="width:73mm;"></span> 
          <span style="width:105px;"></span>                      
          Cat. No.16149K 
          <span style="width:100px;"></span>  
          Form <span class="styBoldText">8847</span> (Rev. 12-2006)
        </div>
        <br class="pageEnd"/>
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