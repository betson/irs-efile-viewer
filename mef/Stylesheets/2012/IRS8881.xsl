<?xml version="1.0" encoding="UTF-8"?>
<!-- Per UWR 36537 updated revision date to 11/2010 -->
<!-- Per UWR 31342 updated to recognize a 1040 filer -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8881Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="FormData" select="$RtnDoc/IRS8881" />

<xsl:template match="/">
<html lang="EN-US">
  <head>    
    <title>
      <xsl:call-template name="FormTitle">
        <xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param>
      </xsl:call-template>
    </title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>
    <!-- Define Character Set -->
    <meta http-equip="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 8881"/>
    
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    
    <style type="text/css">    
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS8881Style"></xsl:call-template>    
        <xsl:call-template name="AddOnStyle"></xsl:call-template>  
      </xsl:if>
    </style>        
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  
  <body class="styBodyClass">      
    <form name="Form8881">
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
        <!-- Begin Form number and Name -->
        <div class="styBB" style="width:187mm;">

        <div class="styFNBox" style="width:31mm;height:21mm;">
            Form <span class="styFormNumber">8881</span>
            <br/><span style="font-size:6pt;">(Rev. November 2010)</span>
      <br/>
            <div style="padding-top:2mm;">
              <span class="styAgency" >Department of the Treasury</span><br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
          </div>
          <div class="styFTBox" style="width:125mm;">
            <div class="styMainTitle" style="height:8mm;">Credit for Small Employer Pension Plan<br/>Startup Costs
            </div>
             <div class="styFST" style="height:5mm;font-size:7pt;"><br/><br/>
              <img src="{$ImagePath}/8881_Bullet.gif" alt="bullet image"/>
              Attach to your tax return.
            </div>    
          </div>
          <div class="styTYBox" style="width:31mm;height:21mm;">
            <div class="styOMB" style="height:10.25mm;padding-top:6mm;">OMB No. 1545-1810</div>
             <div class="stySequence" style="padding-top:3.5mm;">Attachment<br/>Sequence No.<b> 130</b></div>
           </div>
         </div>
         
         <!-- Names and Identifying number Lines  -->
        <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:156mm;height:8mm;font-weight:normal;font-size:7pt;">
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
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
              <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template> 
              </xsl:otherwise>
				  </xsl:choose>       
          </div>
          <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;">
           Identifying number<br/><br/>
              <span style="font-weight:normal;">  
              <xsl:choose>
								  <xsl:when test="$RtnHdrData/ReturnType='1040'">
									<xsl:call-template name="PopulateReturnHeaderFiler">
								      <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
                <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
                </xsl:otherwise>
			</xsl:choose>
              </span>          
          </div>
       </div>
      
    <!-- Line 1 -->      
      <div style="width:187mm"> 
      <div style="float:left;">       
        <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:1mm;">1</div>
        <div class="styLNDesc" style="width:99mm;height:8mm;padding-top:1mm;">
          Qualified startup costs incurred during the tax year. 
          <span style="font-weight:bold;">Do not </span>enter more than $1,000
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">.................</span>  
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">1</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
           <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/QualifiedStartupCostsIncurred"/>
           </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;padding-top: 4mm;"></div>
        <div class="styLNAmountBoxNBB" style="height:8mm;padding-top: 4mm;"></div>
      </div>
      </div>
    
      <!-- line 2 -->
      <div style="width:187mm">
       <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">2</div>
        <div class="styLNDesc" style="width:139mm;height:8mm;padding-right:1mm;padding-top: 4mm;">
          Enter one-half of line 1  
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$FormData/OnehalfOfQualifiedStartupCost" />
            <xsl:with-param name="TabOrder" select="2"/>
          </xsl:call-template>
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">.......................</span>  
        </div>
        </div>
	 <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">2</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/OnehalfOfQualifiedStartupCost"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>
        
      <!-- line 3 -->
      <div style="width:187mm">
        <div style="float:left;">      
        <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">3</div>
        <div class="styLNDesc" style="height:8mm;padding-right:1mm;padding-top: 4mm;">
          Credit for small employer pension plan startup costs from partnerships and S corporations  
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">...</span>  
        </div>
         </div>
		<div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">3</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/PensionPlanStartupCostsCredit"/>
          </xsl:call-template>
          </div>  
        </div>     
          </div> 
               
   <!-- line 4 -->
   <div style="width:187mm">
   <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top: 4mm;">4</div>
        <div class="styLNDesc" style="height:8mm;padding-right:1mm;padding-top: 4mm;">
         Add lines 2 and 3   
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">..........................</span>  
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">4</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/SumOfCostsAndCrFromPPStartup"/>
          </xsl:call-template>
          </div>  
        </div>
        </div> 
             
      <!-- line 5 -->
       <div style="width:187mm">
        <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:10mm;">5</div>
        <div class="styLNDesc" style="height:8mm;">
         Enter the <b>smaller</b> of line 4 or <b>$500</b>. Partnerships and S corporations, report this amount on
    		Schedule K; all others report this amount on the applicable line of Form 3800, (e.g., line 1m of
    		the 2006 Form 3800)   
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">.............................</span>  
        </div>
         </div>
           <div style="float:right;"> 
        <div class="styLNRightNumBoxNBB" style="height:11mm;padding-top:7mm;">5</div>
        <div class="styLNAmountBoxNBB" style="height:11mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCredit"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>         
  <!-- Page End -->
      <div style="width:187mm; border-top:1 solid Black; font-size:8pt">    
        <div style="font-weight:bold; float:left; padding-top:0.5mm">
         For Paperwork Reduction Act Notice, see instructions.
        </div>    
        <div style="float:right">
          <span style="margin-right:16mm; font-size:7pt">Cat. No. 33435N</span>          
          Form <b>8881</b> (Rev. 11-2010)
        </div>      
      </div>  
      
      <p style="page-break-before:always" />      

      <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
        </div>      
      </div>
   

      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$FormData" />        
        </xsl:call-template>
      </table>      
    </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
