<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8826Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8826" />


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
  <meta name="Description" content="Form IRS 8826"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8826Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8826">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 20mm">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm">
      Form <span class="styFormNumber">8826</span>      
      <br/>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span>  
      <br/>
       <span class="styAgency">(Rev. December 2006)</span>

      <br/>
      <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 22mm;width:125mm">
      <div class="styMainTitle" style="height: 8mm">Disabled Access Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold"><br/><br/><br/>
        <img src="{$ImagePath}/8826_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return.
      </div>
    </div>
    <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-1205</div>
     <br/><br/><br/><br/>
      <div class="stySequence">Attachment<br/>Sequence No. <b>86</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification numbers  -->
  <div class="styTBB" style="width:187mm">
  
    <div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/>
     <div style="font-family:verdana;font-size:6pt;height:7mm">
 		  <xsl:choose>
		    <xsl:when test="$RtnHdrData/ReturnType='1040'">
		      <br/>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">Name</xsl:with-param>
		              </xsl:call-template>
		            </xsl:when>
                    <xsl:otherwise>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
		              </xsl:call-template>
		              <br/> 
		              <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
		              </xsl:call-template>		
		  </xsl:otherwise>
                  </xsl:choose>
     </div>      
    </div>    
    <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;"><span class="BoldText">Identifying number</span>
      <br/><br/>
	<span style="font-weight:normal;">
		<xsl:choose>
		  <xsl:when test="$RtnHdrData/ReturnType='1040'">
 		     <xsl:call-template name="PopulateReturnHeaderFiler">
		        <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
		     </xsl:call-template>
		  </xsl:when>
		  <xsl:otherwise>
		     <xsl:call-template name="PopulateReturnHeaderFiler">
		       <xsl:with-param name="TargetNode">EIN</xsl:with-param>
		     </xsl:call-template>
		  </xsl:otherwise>
		</xsl:choose>
      </span>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
 
  
  <!--  Line 1 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
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
          <xsl:with-param name="TargetNode" select="$FormData/TotEligibleAccessExpenditures"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 1 -->
  
   <!--  Line 2 -->    
     <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
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
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
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
          <xsl:with-param name="TargetNode" select="$FormData/DiffExpendituresAndMinAmount"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 3 -->

  <!--  Line 4 --> 
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
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
      <div class="styLNAmountBox"  style="color:darkblue;text-align:center">
        $10,000.00
      </div>          
    </div>
  </div>
  <!--  Line 4 -->
  
  <!--  Line 5 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
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
          <xsl:with-param name="TargetNode" select="$FormData/SmallerAmountFromDiffOrMax"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 5 -->
  
  <!--  Line 6 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
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
          <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine5by50Percent"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 6 -->
  
  
  <!--  Line 7 -->  
    <div style="width: 187mm">
    <div style="float:right">          
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB"></div>          
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
          <xsl:with-param name="TargetNode" select="$FormData/DisabledAccessCredits"/>
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
           
      <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px"></div>
      <div class="styLNAmountBox" style="border-bottom-width:0px">        
      </div>          
    </div>
  </div>
  <!--  Line 8a -->
  
  
  <!--  Line 8b -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm"></div>
    <div style="float:left">
     amount on Schedule K; all others, report this amount on the applicable line of Form 3800 (e.g., line
    </div>    
    <div style="float:right">    
           
      <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px"></div>
      <div class="styLNAmountBox" style="border-bottom-width:0px">
     
      </div>          
    </div>
  </div>
  <!--  Line 8b -->
   <!--  Line 8c -->  
  <div  class="styBB" style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm"></div>
    <div style="float:left">
   1g of the 2006 Form 3800)
    </div>    
    <div style="float:right"> 
    <span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .....................
      </span>        
           
      <div class="styLNRightNumBox" style="border-bottom-width:0px">8</div>
      <div class="styLNAmountBox" style="border-bottom-width:0px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AddLines6and7"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 8c -->
  <!--  Line 8 -->
 
        <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see page 2. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 12774N 
          <span style="width:115px;"></span>  
          Form <span class="styBoldText">8826</span> (Rev. 12-2006)
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