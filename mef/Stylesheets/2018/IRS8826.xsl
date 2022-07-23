<?xml version="1.0"?>
<!-- Last modified on 11/19/2013 by Robert Jones for ETA PDF Review various including the link  -->
<!-- Last modified on 1/14/2015 by Harold Nadel for KISAM #IM01963330 changed font to 8pt for the name and identifying numbers so they would both be the same font.  -->
<!-- Last modified on 05/24/2017 by Harold Nadel for UWR # 194393 and UWR # 195664 -->
<!--10/03/2017 - Changes made for KISAM #IM03114873 1) updated revision date where needed, 2) The product page url under the title of the form was changed to improve 		 effectiveness. 3) updated the reference to Form 3800. by Harold Nadel   -->

<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8826Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8826"/>


<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8826"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8826Style"/>
      <xsl:call-template name="AddOnStyle"/>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8826">    
    <xsl:call-template name="DocumentHeader"/>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: auto">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm">
      Form <span class="styFormNumber">8826</span>      
      <br/>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span>  
      <br/>
       <span class="styAgency">(Rev. September 2017)</span>

      <br/>
      <span class="styAgency">Department of the Treasury</span><br/><span class="styAgency">Internal Revenue Service<br/></span>
    </div>
    <div class="styFTBox" style="height: auto;width:125mm">
      <div class="styMainTitle" style="height:auto; padding-left:3mm;padding-top:2mm;">Disabled Access Credit</div><br/><br/>
      <div class="styFST" style="font-size:7pt;;font-weight:bold; padding-top:2mm;">
        <img src="{$ImagePath}/8826_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return.
      </div><br/>
	 <div class="styFBT" style="padding-top:1mm;"> 
	 <img src="{$ImagePath}/8826_Bullet.gif" alt="MediumBullet"/>
			 Go to <i>www.irs.gov/Form8826</i> for the latest information
		<!--<img src="{$ImagePath}/8826_Bullet.gif" alt="bullet image"/> Information about Form 8826 and its instructions is at <a href="http://www.irs.gov/form8826" title="Link to IRS.gov"><i>www.irs.gov/form8826</i></a>. -->
	 </div>	      
    </div>
    <div class="styTYBox" style="width:30mm;height:23mm;">
      <div class="styOMB" style="height:auto;">OMB No. 1545-1205</div>
     <br/><br/><br/><br/>
     <div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;padding-top:1mm;">Attachment<br/>
            Sequence No. <span class="styBoldText">86</span>
							</div>
      <!--<div class="stySequence">Attachment<br/>Sequence No. <b>86</b></div> -->
    </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification numbers  -->
  <div class="styTBB" style="width:187mm">
  
    <div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/>
     <div style="font-family:verdana;font-size:8pt;height:7mm">
 		  <xsl:choose>
		    <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
              <xsl:call-template name="PopulateFilerName">
                             <xsl:with-param name="TargetNode" select="$FormData"/>
                   </xsl:call-template> 
		     <!-- <br/>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">Name</xsl:with-param>
		              </xsl:call-template>-->
		            </xsl:when>
                    <xsl:otherwise>
                  <xsl:call-template name="PopulateFilerName">
                             <xsl:with-param name="TargetNode" select="$FormData"/>
                   </xsl:call-template> 
		     <!-- <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
		              </xsl:call-template>
		              <br/> 
		              <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
		              </xsl:call-template>-->		
		  </xsl:otherwise>
                  </xsl:choose>
     </div>      
    </div>    
    <div class="styEINBox" style=" padding-left:2mm;font-size:8pt;"><span class="BoldText">Identifying number</span>
      <br/><br/>
	<span style="font-weight:normal;">
		<xsl:choose>
		  <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
                    <xsl:call-template name="PopulateFilerTIN">
                            <xsl:with-param name="TargetNode" select="$FormData"/>
                     </xsl:call-template>
 		     <!--<xsl:call-template name="PopulateReturnHeaderFiler">
		        <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
		     </xsl:call-template>-->
		  </xsl:when>
		  <xsl:otherwise>
                    <xsl:call-template name="PopulateFilerTIN">
                            <xsl:with-param name="TargetNode" select="$FormData"/>
                     </xsl:call-template>
		     <!--<xsl:call-template name="PopulateReturnHeaderFiler">
		       <xsl:with-param name="TargetNode">EIN</xsl:with-param>
		     </xsl:call-template>-->
		  </xsl:otherwise>
		</xsl:choose>
      </span>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
 
  
  <!--  Line 1 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"/>
      <div class="styLNAmountBoxNBB"/>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">1</div>
    <div style="float:left">
      Total eligible access expenditures (see instructions)    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..............
      </span>        
      <div class="styLNRightNumBox">1</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalEligibleAccessExpendAmt"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 1 -->
  
   <!--  Line 2 -->    
     <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"/>
      <div class="styLNAmountBoxNBB"/>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">2</div>
    <div style="float:left">Minimum amount </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .......................
      </span>        
         <div class="styLNRightNumBox">2</div>
      <div class="styLNAmountBox" style="color:darkblue;text-align:center">
        $250.00
            
    </div>
    </div>
  </div>
  <!--  Line 2 -->
  
  <!--  Line 3 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"/>
      <div class="styLNAmountBoxNBB"/>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">3</div>
    <div style="float:left">
      Subtract line 2 from line 1. If zero or less, enter -0-    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..............
      </span>        
      <div class="styLNRightNumBox">3</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/EligExpendAndMinDifferenceAmt"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 3 -->

  <!--  Line 4 --> 
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"/>
      <div class="styLNAmountBoxNBB"/>          
    </div>
  </div>
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">4</div>
    <div style="float:left">
      Maximum amount    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .......................
      </span>        
      <div class="styLNRightNumBox">4</div>
      <div class="styLNAmountBox" style="color:darkblue;text-align:center">
        $10,000.00
      </div>          
    </div>
  </div>
  <!--  Line 4 -->
  
  <!--  Line 5 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"/>
      <div class="styLNAmountBoxNBB"/>          
    </div>
  </div>

    <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">5</div>
    <div style="float:left">
      Enter the <span class="styBoldText">smaller</span> of line 3 or line 4    
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..................
      </span>        
      <div class="styLNRightNumBox">5</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/SmallerFromDifferenceOrMaxAmt"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 5 -->
  
  <!--  Line 6 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"/>
      <div class="styLNAmountBoxNBB"/>          
    </div>
  </div>

  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">6</div>
    <div style="float:left">
      Multiply line 5 by 50% (.50)  
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .....................
      </span>        
      <div class="styLNRightNumBox">6</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/ShareOfCreditAmt"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 6 -->
  
  
  <!--  Line 7 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"/>
      <div class="styLNAmountBoxNBB"/>          
    </div>
  </div>

  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">7</div>
    <div style="float:left">
      Disabled access credit from partnerships and S corporations  
    </div>    
    <div style="float:right">    
      <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ...........
      </span>        
      <div class="styLNRightNumBox">7</div>
      <div class="styLNAmountBox">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/PrtshpandSCorpDisabledAcsCrAmt"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 7 -->
    
  <!--  Line 8 -->  
 
  <!--  Line 8a -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">8</div>
    <div style="float:left">
     Add lines 6 and 7, but do not enter more than $5,000. Partnerships and S corporations, report this
    </div>    
    <div style="float:right">    
           
      <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px"/>
      <div class="styLNAmountBox" style="border-bottom-width:0px">        
      </div>          
    </div>
  </div>
  <!--  Line 8a -->
  
    <!--  Line 8b -->  
  <div class="styBB" style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm"/>
    <div style="float:left">
     amount on Schedule K. All others, report this amount on Form 3800, Part III, line 1e.
    <span style="letter-spacing:4mm; font-weight:bold; float:none">  
        ......
      </span>     
    </div>    
    <div style="float:right">    
      <div class="styLNRightNumBox" style="border-bottom-width:0px">8</div>
      <div class="styLNAmountBox" style="border-bottom-width:0px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/PrtshpandSCorpReportAmt"/>
        </xsl:call-template>
      </div>                  
     </div>
  </div>
  <!--  Line 8b -->

  <!--  Line 8 -->
 
        <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:120px;"/>                      
          Cat. No. 12774N 
          <span style="width:85px;"/>  
          Form <span class="styBoldText">8826</span> (Rev. 09-2017)
        </div> 
        <br class="pageEnd"/>
        
        <!-- BEGIN Left Over Table -->  
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