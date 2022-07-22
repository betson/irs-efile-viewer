<?xml version="1.0" encoding="UTF-8"?>
<!-- Per UWR 36537 updated revision date to 11/2010 -->
<!-- Per UWR 31342 updated to recognize a 1040 filer -->
<!-- Per Defect #37824 data not populating. Schema was not available as we did changes from PDF's -->
<!-- Per Kisams 1375127 by Robert L Jones -->
<!-- Per Defect #39688 data not populating when 1040 filer attached. ReturnTypeCd not updated during IBM's xml Standardization - Robert L Jones -->
<!-- Per Defect #40997 Update Year - Robert L Jones -->
<!-- Per UWR 123023 IE11 changes by Robert L Jones -->
<!--Updated per IBM Defect  43156 on 06/02/2015 misalignment issues - RLJ -->
<!-- Last modified on 5/18/2017 by Robert Jones UWR 194393 and 195664 Return Headers for 1120, 1041, 1040 and 1040NR  -->
<!-- Last modified on 5/23/2017 by Robert Jones UWR 194393 and 195664 Return Headers for 1120, 1041, 1040 and 1040NR  -->
<!-- Last modified on 7/25/2017 by Robert Jones UWR 199977  -->



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
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>    
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

        <div class="styFNBox" style="width:30mm;height:21mm;">
            Form <span class="styFormNumber">8881</span>
            <br/><span style="font-size:6pt;">(Rev. December 2017)</span>
      <br/>
            <div style="padding-top:2mm;">
              <span class="styAgency" >Department of the Treasury</span><br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
          </div>
          <div class="styFTBox" style="width:125mm;">
            <div class="styMainTitle" style="height:8mm;">Credit for Small Employer Pension Plan<br/>Startup Costs
            </div>
             <div class="styFST" style="height:5mm;font-size:7pt;"><br/>
              <img src="{$ImagePath}/8881_Bullet.gif" alt="bullet image"/>
              Attach to your tax return.<br/>
             <img src="{$ImagePath}/8881_Bullet.gif" alt="bullet image"/>
              Go to
              <a href="http://www.irs.gov/form8881" title="Link to IRS.gov">
         <i>www.irs.gov/Form8881</i>
          </a>
          for the latest information.
            </div>    
          </div>
          <div class="styTYBox" style="width:31mm;height:21mm;">
            <div class="styOMB" style="height:10.25mm;padding-top:6mm;">OMB No. 1545-1810</div>
             <div class="stySequence" style="padding-top:3.5mm;">Attachment<br/>Sequence No.<b> 130</b></div>
           </div>
         </div>
         
         <!-- Names and Identifying number Lines  -->
        <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:155.3mm;height:auto;font-weight:normal;font-size:7pt;">
            Name(s) shown on return<br/>
            <!-- Added per UWR 31342 to allow 1040/ssn filer to use this form -->
             <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                         <xsl:call-template name="PopulateFilerName">
                                                            <xsl:with-param name="TargetNode" select="$FormData"/>
                                                         </xsl:call-template> 
          </div>
          <div class="styEINBox" style="width:31mm;height:auto;padding-left:2mm;font-size:7pt;">
           Identifying number<br/><br/>
              <span style="font-weight:normal;">  
            <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                     <xsl:call-template name="PopulateFilerTIN">
                                                       <xsl:with-param name="TargetNode" select="$FormData"/>
                                                     </xsl:call-template>     
              </span>          
          </div>
       </div>
      
    <!-- Line 1 -->      
      <div style="width:187mm"> 
      <div style="float:left;">       
        <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:1mm;">1</div>
        <div class="styLNDesc" style="width:99mm;height:8mm;padding-top:1mm;">
          Qualified startup costs incurred during the tax year. 
          <span style="font-weight:bold;">Do not </span> enter more than $1,000
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">.................</span>  
        </div>
        </div>
        <div style="float:right;"> 
        <div class="styLNRightNumBox" style="height:8mm;padding-top: 4mm;">1</div>
        <div class="styLNAmountBox" style="height:8mm;padding-top: 4mm;">
           <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/QualifiedStartupCostsIncurdAmt"/>
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
            <xsl:with-param name="TargetNode" select="$FormData/OnehalfOfQlfyStartupCostAmt" />
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
              <xsl:with-param name="TargetNode" select="$FormData/OnehalfOfQlfyStartupCostAmt"/>
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
              <xsl:with-param name="TargetNode" select="$FormData/PensionPlanStartupCostsCrAmt"/>
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
              <xsl:with-param name="TargetNode" select="$FormData/SumCostsAndCrFromPPStartupAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div> 
             
      <!-- line 5 -->
       <div style="width:187mm">
        <div style="float:left;">  
        <div class="styLNLeftNumBoxSD" style="height:9.5mm;padding-top:3mm;">5</div>
        <div class="styLNDesc" style="height:9.5mm;padding-top:3mm;border-bottom-width:1px;">
         Enter the <b>smaller</b> of line 4 or <b>$500</b>. Partnerships and S corporations, report this amount on
    		Schedule K. All others, report this amount on Form 3800, Part III, line 1j   
          <!--Dotted Line-->
          <span style="letter-spacing:3.4mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">...............</span>  
        </div>
         </div>
           <div style="float:right;"> 
        <div class="styLNRightNumBoxNBB" style="height:9.5mm;padding-top:3mm;">5</div>
        <div class="styLNAmountBoxNBB" style="height:9.5mm;padding-top:3mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCreditAmt"/>
          </xsl:call-template>
          </div>  
        </div>
        </div>   
       
  <!-- Page End -->
      <div style="width:187mm; border-top:1px solid Black; font-size:8pt">    
        <div style="font-weight:bold; float:left; padding-top:0.5mm">
         For Paperwork Reduction Act Notice, see instructions.
        </div>    
        <div style="float:right">
          <span style="margin-right:16mm; font-size:7pt">Cat. No. 33435N</span>          
          Form <b>8881</b> (Rev. 12-2017)
        </div>      
      </div> <br/> <br/>
      
     <!-- <p style="page-break-before:always" /> -->      

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
