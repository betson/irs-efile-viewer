<?xml version="1.0" encoding="UTF-8" ?>
<!-- Last Modified by James Ganzy on 11/17/2010 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8908Style.xsl"/>


<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="Form8908" select="$RtnDoc/IRS8908" />

<xsl:template match="/">

<html>
  <head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8908)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 8908" />
  
 
  
  <xsl:call-template name="InitJS"></xsl:call-template>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  
  <style type="text/css">
   <xsl:if test="not($Print) or $Print=''">
      
      <xsl:call-template name="IRS8908Style"></xsl:call-template>  
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form8908">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>

    <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 20mm;">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm;">
      Form <span class="styFormNumber">8908</span>      
      <br/>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form8908"/>
        </xsl:call-template>  
      </span>  
      <br/>
      <br/>
      <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 22mm;width:125mm;padding-top:4mm;">
      <div class="styMainTitle" style="height: 8mm">Energy Efficient Home Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold">
        <img src="{$ImagePath}/8908_Bullet_Md.gif" alt="MediumBullet"/>  
        Attach to your tax return. <br/><br/>
        <br/>
      </div>
    </div>
    <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px;">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-1979</div>
      <div class="styTaxYear" style="height:10mm">20<span class="styTYColor">10</span></div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>153</b></div>
    </div>
  </div>
  <!--  End title of Form  -->

<div style="width:187mm;">
      <div class="styNameAddr" style="width:140mm;height:14mm;border-left-width:1px;padding-left:1px;border-left-width:0;font-size:7pt">
        Name(s) as shown on return<br/>
         <div  style="margin-left:2mm;font-size:7pt;">
          <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
          </xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
          </xsl:call-template><br />
         <xsl:call-template name="PopulateReturnHeaderFiler">
             <xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
        </xsl:call-template>
        </div>
     
      </div>
       <div class="styNameAddr" style="font-size:7pt;width:46mm;height:14mm;border-left-width:1px;padding-left:1px;">
      <span style="width:8px"></span>Identifying number
      <br/><span style="width:12px;padding-top:6.5mm;"></span>
        <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="EINChanged">true</xsl:with-param>
          <xsl:with-param name="TargetNode">EIN</xsl:with-param>
        </xsl:call-template> 
      </div>
      
</div>
      <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;">1a</div>
      <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient homes meeting the<br/>
       50% standard that were sold or leased to another person for use as a<br/><span  style="float:left;clear:none;">  
       residence during the tax year (see instructions)</span>
       
        <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>

      </div>
      <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;">1a</div>
      <div class="styLNAmountBox" style="height:10.5mm;padding-top:6.5mm;">
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalHomesMeeting50PctStandard"></xsl:with-param></xsl:call-template>
      </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;height:10.5mm;border-bottom-width:0px"></div>
      <div class="styLNAmountBoxNBB" style="height:10.5mm;"></div>
    </div>
        <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"></span>b</div>
      <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span  style="float:left;clear:none;">  
				  Multiply line 1a by $2,000
			</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;">1b</div>
      <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">

           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/MultiplyTotHomeStandardBy2000"></xsl:with-param></xsl:call-template>
      
      </div>

    </div>

        <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;">2a</div>
      <div class="styLNDesc" style="width:92mm;height:4.5mm;">Enter the total number of qualified energy efficient manufactured<br/>
       homes meeting the 30% standard that were sold or leased to another<br/><span  style="float:left;clear:none;">  
        person for use as a residence during the tax year (see instructions)</span>
       
        <!--Dotted Line-->
			<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.</span>
      </div>
      <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;">2a</div>
      <div class="styLNAmountBox" style="height:10.5mm;padding-top:6.5mm;">
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotManufacturedHmsMeetingStd"></xsl:with-param></xsl:call-template>
      
      </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;height:10.5mm;border-bottom-width:0px"></div>
      <div class="styLNAmountBoxNBB" style="height:10.5mm;"></div>
    </div>
        <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;"><span style="width:6px"></span>b</div>
      <div class="styLNDesc" style="width:132mm;height:4.5mm;">
			<span  style="float:left;clear:none;">  
				  Multiply line 2a by $1,000
			</span>   
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
      <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/MultiplyTotManfctrdHmsBy1000"></xsl:with-param></xsl:call-template>
     
      </div>

    </div>
   <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
      <div class="styLNDesc" style="width:132mm;height:4.5mm;">
		 <span  style="float:left;clear:none;">   
			  Energy efficient home credit from partnerships and S corporations
        </span>
       
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
       </div>
      <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
      <div class="styLNAmountBox" style="width:39mm;height:4.5mm;">
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/EnergyEfficientHomeCredit"></xsl:with-param></xsl:call-template>
     
      </div>

    </div>
   <div style="width:187mm;border-bottom:solid black 1;">
      <div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
      <div class="styLNDesc" style="width:132mm;height:5mm;">Add lines 1b, 2b, and 3. Partnerships and S corporations, report this amount on Schedule K; all<br/>
			<span  style="float:left;clear:none;">others, report this amount on Form 3800, line 1p</span>
        
        <!--Dotted Line-->
        <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
       </div>
      <div class="styLNRightNumBox" style="height:6.5mm;padding-top:4mm;border-bottom-width:0px">4</div>
      <div class="styLNAmountBox" style="width:39mm;height:6.5mm;padding-top:4mm;border-bottom-width:0px">
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8908/TotalCredit"></xsl:with-param></xsl:call-template>
     
      </div>

    </div>
       <div style="width:187mm"> 
          <span class="styBoldText" style="width:80mm">For Paperwork Reduction Act Notice, see page 2.</span>
          Cat. No. 37718T
          <span style="width:56mm;"></span> Form 
          <span class="styBoldText" style="font-size:8pt">8908</span> (2010)
       </div><br/>

      <div class="pageEnd"></div>
      
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
          <xsl:with-param name="TargetNode" select="$Form8908" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>    
    </form>
  </body>
</html>

</xsl:template>

</xsl:stylesheet>
