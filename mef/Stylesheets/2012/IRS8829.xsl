<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8829Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="FormData" select="$RtnDoc/IRS8829" />
<xsl:template match="/">
<html>
  <head>
    <title><xsl:call-template name="FormTitle">
    <xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="Form IRS8829" />        
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">    
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS8829Style"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>        
     </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
  <form name="Form8829">
      <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"  />  
      <!-- END WARNING LINE -->
<div class="styTBB" style="width:187mm;">
  <div class="styFNBox" style="width:30mm;font-size:7pt:height:20.3mm;">
    <div style="height:9.5mm;">
    Form <span style="width:1mm;"></span><span class="styFormNumber">8829</span>
    </div>
    <div style="height:6mm;padding-top:4mm;line-height:14.5px;">
      <span class="styAgency">Department of the Treasury</span>
      <span class="styAgency" style="width:30mm;">Internal Revenue Service <span style="padding-left:1mm;"> (99)</span></span>
    </div>
  </div>
  <div class="styFTBox" style="width:120mm;height:18mm;">
    <div class="styMainTitle" style="height:8mm;font-size:13pt;padding-top:1mm;">
      Expenses for Business Use of Your Home
    </div>
    <div class="styFST" style="height:4mm;font-size:7pt;">
      <img src="{$ImagePath}/8829_Bullet.gif" alt="Bullet Image" />
      File only with Schedule C (Form 1040). Use a separate Form 8829 for each <br/>
home you used for business during the year.
    </div>
    <div class="styFST" style="height:4mm;font-size:7pt;padding-top:1mm;">
      <img src="{$ImagePath}/8829_Bullet.gif" alt="Bullet Image" />
      See separate instructions. Also see <i>www.irs.gov/form8829.</i>
    </div>
  </div>
  <div class="styTYBox" style="width:32mm;height:21mm;">
    <div class="styOMB" style="height:4mm;padding-top:0mm;">
      OMB No. 1545-0074
    </div>
    <div class="styTY" style="height:6mm;font-size:21pt;padding-top:0mm;padding-bottom:0mm;line-height:100%;">
      20<span class="stytycolor">12</span>
    </div>
    <div class="styOMB" style="padding-top:2.5mm;height:6mm;text-align:left;padding-left:5mm;border-bottom-width:0px;line-height:110%;">
      Attachment <br />Sequence No. <span class="styBoldText">176</span>
    </div>
  </div>
</div>
<div style="width:187mm;" class="styBB">
  <div style="width:138mm;height:8mm;font-weight:normal;font-size:7pt;" class="styNameBox">
   Name(s) of proprietor(s)<br />
    <span>
        <xsl:call-template name="PopulateText">
		<xsl:with-param name="TargetNode" select="$FormData/NameOfProprietor"/>
		</xsl:call-template>
    </span>            
  </div>
  <div style="width:49mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;" class="styEINBox">
    Your social security number<br />
    <span style="font-weight:normal;">
         <xsl:call-template name="PopulateSSN">
		<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityNumber"/>
		</xsl:call-template>         
    </span>      
  </div>
</div>
<!-- Begin Part I -->
<div style="width:187mm;" class="styBB">
  <div class="styPartName" style="width:15mm;">Part I</div>
  <div class="styPartDesc" style="padding-left:3mm;">Part of Your Home Used for Business</div>
</div>
<!--Line 1-->
  <div style="width:187mm">        
    <div class="styLNLeftNumBoxSD" style="padding-top:1.0mm;">1</div>
    <div style="float:left;padding-top:1.0mm;width:137mm;">
      Area used regularly and exclusively for business, regularly for daycare, or for storage of inventory       
      <br/>or product samples (see instructions)  
      <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
    </div>
   <div style="float:right;">
    <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:1mm;"></div>
      <div class="styLNAmountBoxNBB" style="width:34mm;height:1mm;"></div>
      <div class="styLNRightNumBox" style="height:2mm;">1</div>
      <div class="styLNAmountBox" style="height:2mm;width:34mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/BusinessUseSquareFeetCnt"/>
        </xsl:call-template>
      </div>
    </div>        
  <!--Line 2-->
  <div style="width:187mm">        
    <div class="styLNLeftNumBoxSD">2</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Total area of home     
      <span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span>    
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">2</div>
      <div class="styLNAmountBox" style="width:34mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalAreaOfHomeCnt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
  <!--Line 3-->
  <div style="width:187mm">        
    <div class="styLNLeftNumBoxSD">3</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Divide line 1 by line 2. Enter the result as a percentage  
       <span style=" letter-spacing:3.2mm; font-weight:bold; ">................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">3</div>
      <div class="styLNAmountBox" style="width:34mm;">
           <xsl:if test="(count($FormData/BusinessSquareFeetPct) &lt;1) ">%
               </xsl:if>
        <xsl:call-template name="PopulatePercent">
          <xsl:with-param name="TargetNode" select="$FormData/BusinessSquareFeetPct"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
    <div style="width:187mm">        
    <div class="styLNLeftNumBox"></div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;width: 128mm; font-weight:bold;">
      For daycare facilities not used exclusively for business, go to line 4. All others go to line 7.  
    </div>
    <div style="float:right;">
     <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
      <div class="styLNAmountBoxNBB" style="width:34mm;"></div>
    </div>        
  </div>
  <!--Line 4-->
    <div style="width:187mm">        
    <div class="styLNLeftNumBoxSD">4</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Multiply days used for daycare during year by hours used per day          
        </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" style="height:4.5mm;" >4</div>  
      <div class="styLNAmountBox" style="height:4.5mm; ">
    <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/BusinessUseHoursCnt"/>
        </xsl:call-template><span style="width:1mm;"></span>hr.
      </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:4.5mm;"></div>
      <div class="styLNAmountBoxNBB"  style="width:34mm;height:4.5mm;">
      </div>
    </div>        
  </div>
<!--Line 5-->
      <div style="width:187mm">        
    <div class="styLNLeftNumBoxSD">5</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Total hours available for use during the year (366 days x 24 hours)<br/> (see instructions)    
      <span style=" letter-spacing:3.2mm; font-weight:bold; ">..................</span>      
        </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm;" >5</div>  
      <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
       <xsl:if test="(count($FormData/BusinessSquareFeetPct) &lt;1) ">8,784
               </xsl:if>
    <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalHoursAvailableCnt"/>
        </xsl:call-template><span style="width:1mm;"></span>hr.
      </div>
      <div class="styLNRightNumBox" style="padding-top:3.5mm;background-color:lightgrey;border-bottom-width:0px;height:7.5mm;"></div>
      <div class="styLNAmountBoxNBB"  style="padding-top:3.5mm;width:34mm;height:7.5mm;">
      </div>
    </div>        
  </div>
  <!--Line 6-->
    <div style="width:187mm">        
    <div class="styLNLeftNumBoxSD">6</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Divide line 4 by line 5. Enter the result as a decimal amount 
      <span style=" letter-spacing:3.2mm; font-weight:bold; ">.....</span>         
        </div>
    <div style="float:right;">
       <div class="styLNRightNumBox"  style="height:4.5mm;">6</div>
         
      <div class="styLNAmountBox" style="height:4.5mm; ">
      <xsl:choose>
		<xsl:when test="$FormData/BusinessHoursPct">
		   <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$FormData/BusinessHoursPct"/>
			</xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
		   <span style="padding-left:22px;font-weight:bold;float:left;text-align:left">.</span>
        </xsl:otherwise>
       </xsl:choose>
      </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:4.5mm;">
      </div>
      <div class="styLNAmountBoxNBB"  style="width:34mm;height:4.5mm;">
      </div>
    </div>        
  </div>
   <!--Line 7-->
 <div style="width:187mm" >        
    <div class="styLNLeftNumBoxSD">7</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Business percentage. For daycare facilities not used exclusively for business, multiply line 6 by
   </div>
    <div style="float:right;">
      <div class="styLNRightNumBoxNBB"></div>
      <div class="styLNAmountBoxNBB" style="width:34mm;">
      </div>
    </div>        
  </div>
  <div style="width:187mm" class="styBB">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left;">
     line 3 (enter the result as a percentage). All others, enter the amount from line 3 
      <span style=" letter-spacing:2.2mm; font-weight:bold;padding-left:3mm; ">
      <xsl:call-template name="SetFormLinkInline">
      
			<xsl:with-param name="TargetNode" select="$FormData/BusinessPct"/>
				</xsl:call-template>.....
                <img src="{$ImagePath}/8829_Bullet.gif" align="bottom"  alt="Bullet Image" />
      </span>
    </div>
    <div style="float:right">
           <div class="styLNRightNumBoxNBB">7</div>
      <div class="styLNAmountBoxNBB" style="width:34mm;">
       <xsl:if test="(count($FormData/BusinessSquareFeetPct) &lt;1) ">%
               </xsl:if>
   <xsl:call-template name="PopulatePercent">
          <xsl:with-param name="TargetNode" select="$FormData/BusinessPct"/>
        </xsl:call-template>
      </div>    
    </div>    
  </div>   
</div>
<!-- Begin Part II -->
<div style="width:187mm;" class="styBB">
  <div class="styPartName" style="width:15mm;">Part II</div>
  <div class="styPartDesc" style="padding-left:3mm;">
    Figure Your Allowable Deduction
  </div>
</div>
 <!--Line 8-->
  <div style="width:187mm">        
    <div class="styLNLeftNumBoxSD">8</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;width:137mm">
   Enter the amount from Schedule C, line 29, <b>plus</b> any gain derived from the business use of your home and shown on Schedule D or Form 4797, minus any loss from the trade or business not derived from the business use of your home and shown on Schedule D or Form 4797. See instructions.
   <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">.....</span>
    </div>
		<div style="width:7.8mm;float:left;border-left:1px solid black">
			<div class="styGenericDiv" style="height:6mm;width:7.8mm;background-color:lightgrey;"></div>
			<div class="styGenericDiv" style="font-weight:bold;padding-top:2mm;padding-bottom:0;text-align:center;height:7mm;width:7.8mm;">8</div>
		</div>
      <div class="styLNAmountBoxNBB" style="width:33mm;height:13mm;padding-top:9.5mm;padding-bottom:0">
		  <xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$FormData/HomeBusinessGainOrLossAmt"/>
		  </xsl:call-template>
      </div>
     
  </div>  
 
    <div class="styGenericDiv" style="width:187mm">
          <div class="styLNDesc" style="padding-left:8mm;width:60mm;height:6mm;">
               <b>See instructions for columns (a) and (b) before completing lines 9–21.</b>
          </div>
           <div class="styLNLeftNumBox" style="padding-left:0mm;height:7.5mm;width:4mm;"></div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;border-top-width:0px;border-left-width:0px;border-right-width:0px;height:7.5mm;"></div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px;padding-right:2mm;height:7.5mm; border-top-width:1px;border-right-width:0px;padding-top:1mm;border-bottom-width:0px;
">(a) Direct expenses
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:1px;border-right-width:0px;padding-right:2mm;height:7.5mm;padding-top:1mm;border-bottom-width:0px;">
 (b) Indirect expenses
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;border-top:1px solid black"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm;height:7.5mm;border-top:1px solid black "></div>
    </div>
   <!--Line 9-->
    <div class="styGenericDiv" style="width: 187mm">
         <span class="styLNLeftNumBoxSD">9</span>
         <div  class="styLNDesc" style="width:56mm;">
               Casualty losses (see instructions)
                       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..</span>
         </div>
         <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:1px;border-left-width:1px;border-right-width:0px;height:4.8mm;">9</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:1px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CasualtyLossesDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:1px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CasualtyLossesIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:4.8mm;"></div>
    </div>
    <!-- Line 10 -->
  <div class="styGenericDiv" style="width:187mm;">
         <div class="styLNLeftNumBox" style="height:7.5mm;">10</div>
     <div  class="styLNDesc" style="width:56mm;height:7.5mm;">
               Deductible mortgage interest (see instructions)
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">.........</span>
         </div>
      <div class="styLNRightNumBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:7.5mm;padding-top:3mm;">10</div>
 <div class="styLNAmountBox" style="width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px; height:7.5mm;padding-top:3.5mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/DeductibleMortgageIntDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px; height:7.5mm;padding-top:3.5mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/DeductibleMortgageIntIndrAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:7.5mm;"></div>
  </div>         
<!-- End Line 10 -->
     <!-- Line 11 -->
     
   <div class="styGenericDiv" style="width:187mm;">
         <div class="styLNLeftNumBox" style="height:4mm;">11</div>
         <div  class="styLNDesc" style="width:56mm;padding-top:0;margin-top:0">
               Real estate taxes (see instructions)
                       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..</span>
         </div>
         <div class="styLNRightNumBox" style=" border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:5mm;padding-top:1mm;margin-top:0">11</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:5mm;padding-top:1mm;margin-top:0">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RealEstateTaxesDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:5mm;padding-top:1mm;margin-top:0">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RealEstateTaxesIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;padding-top:0;margin-top:0"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:5mm;padding-top:0;margin-top:0"></div>
    </div>   
<!-- End Line 11 -->
     <!-- Line 12 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">12</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Add lines 9, 10, and 11
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">.....</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.8mm;">12</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/DirectDeductedExpnssSubtlAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/IndirectDeductedExpnssSubtlAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:4.8mm;"></div>
  </div>         
<!-- End Line 12 -->
     <!-- Line 13 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">13</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Multiply line 12, column (b) by line 7
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;"></span>
         </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.9mm;"></div>
 <div class="styLNRightNumBox" style="font-weight:normal;width:29mm;border-left-width1px; border-top-width:0px;border-right-width:1px;background-color:lightgrey;height:4.9mm;"></div>
            <span class="styLNRightNumBox" style="border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;height:4.9mm;padding-top:1mm">13</span>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.9mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AllowableIndrDeductedExpnssAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.9mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:33mm;height:4.9mm;"></div>
  </div>         
<!-- End Line 13 -->
  <!-- Line 14 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox" >14</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Add line 12, column (a) and line 13
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px; background-color:lightgrey;"></div>
 <div class="styLNRightNumBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;background-color:lightgrey;">
            </div>
 <div class="styLNRightNumBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;background-color:lightgrey;">
            </div>
       <div class="styLNRightNumBox">14</div>
      <div class="styLNAmountBox" style="width:34mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/DirectAndIndirectExpnsSubtlAmt"/>
        </xsl:call-template>
      </div>
  </div>         
<!-- End Line 14 -->
  <!-- Line 15 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox" >15</span>
     <div  class="styLNDesc" style="width:56mm;height:7.5mm;">
               Subtract line 14 from line 8. If zero or less, enter -0-
              <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">........</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px; background-color:lightgrey;height:7.5mm;"></div>
 <div class="styLNRightNumBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;background-color:lightgrey;height:7.5mm;"></div>
 <div class="styLNRightNumBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;background-color:lightgrey;height:7.5mm;"></div>
       <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">15</div>
      <div class="styLNAmountBox" style="width:34mm;height:7.5mm;padding-top:3mm;">
<xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/HomeBusinessIncomeAmt"/>
        </xsl:call-template></div>
  </div>         
<!-- End Line 15 -->
     <!-- Line 16 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">16</span>
     <div  class="styLNDesc" style="width:56mm;height:8mm;">
               Excess mortgage interest (see <br/>instructions)
               <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">........</span>
         </div>
      <div class="styLNRightNumBox" style="border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:8mm;padding-top:4mm;">16</div>
 <div class="styLNAmountBox" style="padding-top:4mm;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/ExcessMortgageIntDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="width:36mm;border-left-width;1px; border-top-width:0px;border-right-width:0px;height:8mm;padding-top:4mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/ExcessMortgageIntIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm;height:8mm;"></div>
  </div>         
<!-- End Line 16 -->
     <!-- Line 17 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">17</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Insurance
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..........</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.8mm;">17</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/InsuranceDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/InsuranceIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm;height:4.8mm;"></div>
  </div>         
<!-- End Line 17 -->
     <!-- Line 18 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">18</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Rent
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">...........</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.8mm;">18</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
  <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RentDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
  <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RentIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm;height:4.8mm;"></div>
  </div>         
<!-- End Line 18 -->
     <!-- Line 19 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">19</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Repairs and maintenance
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">.....</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.9mm;">19</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.9mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RepairsAndMaintDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.9mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/RepairsAndMaintIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.9mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:4.9mm;"></div>
  </div>         
<!-- End Line 19 -->
     <!-- Line 20 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">20</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Utilities
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..........</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.9mm;">20</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.9mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/UtilitiesDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.9mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/UtilitiesIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.9mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:4.9mm;"></div>
  </div>         
<!-- End Line 20 -->
     <!-- Line 21 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">21</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Other expenses (see instructions)
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.8mm;">21</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesDirectAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesIndirectAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:4.8mm;"></div>
  </div>         
<!-- End Line 21 -->
     <!-- Line 22 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">22</span>
     <div  class="styLNDesc" style="width:56mm; ;">
               Add lines 16 through 21
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">.....</span>
         </div>
      <div class="styLNRightNumBox" style="padding-left:mm; border-bottom-width:1px;border-top-width:0px;border-left-width:1px;border-right-width:0px;height:4.8mm;">22</div>
 <div class="styLNAmountBox" style="font-weight:normal;width:37mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/DirectNondeductedSubtotalAmt"/>
        </xsl:call-template>
            </div>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/IndirectNondeductedSubtotalAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:34mm; height:4.8mm;"></div>
  </div>         
<!-- End Line 22 -->
     <!-- Line 23 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">23</span>
     <div  class="styLNDesc" style="width:93.1mm;">
               Multiply line 22, column (b) by line 7
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..........</span>
         </div>
            <span class="styLNRightNumBox" style="border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:1px;height:4.8mm;">23</span>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AllwblIndrNondeductedExpnssAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:33mm; height:4.8mm;"></div>
  </div>         
<!-- End Line 23 -->
      <!-- Line 24 -->
  <div class="styGenericDiv" style="width: 187mm;">
         <span class="styLNLeftNumBox">24</span>
     <div  class="styLNDesc" style="width:93.1mm;">
               Carryover of operating expenses from 2011 Form 8829, line 42
             <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">..</span>
         </div>
            <span class="styLNRightNumBox" style="border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:1px;height:4.8mm;">24</span>
 <div class="styLNAmountBox" style="font-weight:normal;width:36mm;border-left-width1px; border-top-width:0px;border-right-width:0px;height:4.8mm;">
 <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/OperatingExpensesCarryoverAmt"/>
        </xsl:call-template>
            </div>
             <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.8mm;"></div>
             <div class="styLNAmountBoxNBB" style="width:33mm; height:4.8mm;"></div>
  </div>         
<!-- End Line 24 -->
<!-- Line 25 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">25</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Add line 22 column (a), line 23, and line 24  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">..................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">25</div>
      <div class="styLNAmountBox" style="width:34mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/NondeductibleNetExpensesAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 25 --> 
   <!-- Line 26 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">26</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Allowable operating expenses. Enter the <b>smaller</b> of line 15 or line 25  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">..........</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">26</div>
      <div class="styLNAmountBox" style="width:34mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AllowableOperatingExpensesAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 26 -->
<!-- Line 27 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">27</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Limit on excess casualty losses and depreciation. Subtract line 26 from line 15 
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">.......</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">27</div>
      <div class="styLNAmountBox" style="width:34mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CsltyLossesAndDeprecLimitAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 27 -->
<!--  Line 28 -->
  <div style="width:187mm">        
    <div class="styLNLeftNumBox">28</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Excess casualty losses (see instructions) 
         <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">..........</span>
        </div>
    <div style="float:right;">
         <div class="styLNRightNumBox" style="height:4.8mm;">28</div>  
      <div class="styLNAmountBox" style="height:4.8mm;">
       <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/ExcessCasualtyLossesAmt"/>
        </xsl:call-template>
      </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:4.8mm;"></div>
      <div class="styLNAmountBoxNBB"  style="width:34mm;height:4.8mm;">
      </div>
    </div>        
  </div>
  <!-- End Line 28 -->
  <!--  Line 29 -->
  <div style="width:187mm">        
    <div class="styLNLeftNumBox">29</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Depreciation of your home from line 41 below
         <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">........</span>
            </div>
    <div style="float:right;">
         <div class="styLNRightNumBox" style="height:4.8mm;">29</div>  
      <div class="styLNAmountBox" style="height:4.8mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AllowableHomeDepreciationAmt"/>
        </xsl:call-template>
      </div>
      <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:4.8mm;"></div>
      <div class="styLNAmountBoxNBB"  style="width:34mm;height:4.8mm;">
      </div>
    </div>        
  </div>
  <!-- End Line 29 -->
 <!--  Line 30 -->
  <div style="width:187mm">        
    <div class="styLNLeftNumBox">30</div>
    <div style="float:left;padding-top:0mm;padding-bottom:.5mm;width:90mm;height:6mm;">
      Carryover of excess casualty losses and depreciation from 2011 Form 8829, line 43 
      <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">................</span>
        </div>
    <div style="float:right;">
         <div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;" >30</div>  
      <div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CyovExCsltyLossesAndDeprecAmt"/>
        </xsl:call-template>
      </div>
  <div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:6.7mm;"></div>
      <div class="styLNAmountBoxNBB"  style="width:34mm;height:6.5mm;">
      </div>
    </div>        
  </div>
  <!-- End Line 30 -->
     <!-- Line 31 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">31</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Add lines 28 through 30  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">.........................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">31</div>
      <div class="styLNAmountBox" style="width:34mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CasualtyLossesAndDeprecNetAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 31 -->
       <!-- Line 32 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">32</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Allowable excess casualty losses and depreciation. Enter the <b>smaller </b> of line 27 or line 31  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">...</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">32</div>
      <div class="styLNAmountBox" style="width:34mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AllwblExCsltyLossesDeprecAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 32 -->
     <!-- Line 33 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">33</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Add lines 14, 26, and 32  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">.........................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox">33</div>
      <div class="styLNAmountBox" style="width:34mm;">
       <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalAllowableExpensesAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 33 -->
     <!-- Line 34 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">34</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Casualty loss portion, if any, from lines 14 and 32. Carry amount to <b>Form 4684</b> (see instructions) 
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; "></span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" >34</div>
      <div class="styLNAmountBox" style="width:34mm; ">
       <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CasualtyLossPortionAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 34 -->
 <!-- Line 35 -->
    <div style="width:187mm" class="styBB">        
    <div class="styLNLeftNumBox">35</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:0mm; width:137mm;height:6mm;">
      <b>Allowable expenses for business use of your home.</b> Subtract line 34 from line 33. Enter here and
on Schedule C, line 30. If your home was used for more than one business, see instructions
<span style=" letter-spacing:2.2mm; font-weight:bold; padding-left:2mm;padding-right:1mm;">...</span> 
 <img src="{$ImagePath}/8829_Bullet.gif" align="bottom" alt="Bullet Image" />
    </div>
    <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:1mm;"></div>
      <div class="styLNAmountBoxNBB" style="width:34mm;height:1mm;"></div>
      <div class="styLNRightNumBox" style="height:3mm;border-bottom-width:0px;">35</div>
      <div class="styLNAmountBox" style="height:3mm;width:34mm; border-bottom-width:0px;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AllowableHomeBusExpnssSchCAmt"/>
        </xsl:call-template>
         </div>
  </div>
<!-- End Line 35 -->
<!-- Begin Part III -->
<div style="width:187mm;" class="styBB">
  <div class="styPartName" style="width:15mm;">Part III</div>
  <div class="styPartDesc" style="padding-left:3mm;">
    Depreciation of Your Home  
  </div>
</div>
     <!-- Line 36 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">36</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      Enter the <b>smaller</b> of your home’s adjusted basis or its fair market value (see instructions)  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm;">
       <xsl:call-template name="SetFormLinkInline">
		<xsl:with-param name="TargetNode" select="$FormData/HomeAdjBasisOrFairMarketAmt"/>
		</xsl:call-template>
       ..</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" >36</div>
      <div class="styLNAmountBox" style="width:34mm; ">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/HomeAdjBasisOrFairMarketAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 36 -->
     <!-- Line 37 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox" style="height:4mm;">37</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;height:4mm;" >
     Value of land included on line 36  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">.......................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" style="height:4mm;">37</div>
      <div class="styLNAmountBox" style="width:34mm;height:4mm; ">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/ValueOfLandAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 37 -->
     <!-- Line 38 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">38</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
     Basis of building. Subtract line 37 from line 36  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">..................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" >38</div>
      <div class="styLNAmountBox" style="width:34mm; ">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/BasisOfBuildingAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 38 -->
       <!-- Line 39 -->
 <div  style="width:187mm;border-bottom-width:0px; ">        
    <div class="styLNLeftNumBox">39</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
     Business basis of building. Multiply line 38 by line 7  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" >39</div>
      <div class="styLNAmountBox" style="width:34mm; ">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/BusinessBasisOfBuildingAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 39 -->
         <!-- Line 40 -->
 <div style="width:187mm;border-bottom-width:0px;">        
    <div class="styLNLeftNumBox">40</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
     Depreciation percentage (see instructions)  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">..................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" >40</div>
      <div class="styLNAmountBox" style="width:34mm; ">
      <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$FormData/DepreciationPct"/>
        </xsl:call-template>
        <span style="text-align:right">
        %
        </span>
      </div>
      </div>        
  </div>
       <!-- Line 41 -->
 <div style="width:187mm;border-bottom-width:0px;">        
    <div class="styLNLeftNumBox">41</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
    Depreciation allowable (see instructions). Multiply line 39 by line 40. Enter here and on line 29 <br/>above
       <xsl:call-template name="SetFormLinkInline">
		<xsl:with-param name="TargetNode" select="$FormData/AllowableHomeDepreciationAmt"/>
		</xsl:call-template>
		   <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">..............................</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" style="border-bottom-width:0px;height:8mm;padding-top:4mm;">41</div>
     <div class="styLNAmountBox" style="width:34mm; border-bottom-width:0px;height:8mm;padding-top:4mm;">
      <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AllowableHomeDepreciationAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
  <!-- End Line 41 -->
 

<!-- Begin Part IV -->
<div class="styBB" style="width:187mm;border-top-width: 1px;" >
  <div class="styPartName" style="width:15mm;">Part IV</div>
  <div class="styPartDesc" style="padding-left:3mm;">
   Carryover of Unallowed Expenses to 2013 	 
  </div>
</div>
<div style="width:187mm;" class="styBB">
   <!-- Line 42 -->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">42</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
     Operating expenses. Subtract line 26 from line 25. If less than zero, enter -0-  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; ">.......</span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" >42</div>
      <div class="styLNAmountBox" style="width:34mm; ">
       <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/OperatingExpensesAmt"/>
        </xsl:call-template>
      </div>
    </div>        
  </div>
<!-- End Line 42 -->

    <!-- Line 43-->
 <div style="width:187mm">        
    <div class="styLNLeftNumBox">43</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
     Excess casualty losses and depreciation. Subtract line 32 from line 31. If less than zero, enter -0-  
       <span style=" letter-spacing:3.2mm; font-weight:bold; padding-left:3mm; "></span>
    </div>
    <div style="float:right;">
      <div class="styLNRightNumBox" style="border-bottom-width:0px;">43</div>
      <div class="styLNAmountBox" style="border-bottom-width:0px;width:34mm; ">
       <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/ExcessCsltyLossesAndDeprecAmt"/>
        </xsl:call-template>
      </div>
    </div>        
<!-- End Line 43 -->
</div>
</div>
<div style="width:187mm;clear:both;">
  <div style="width:110mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see your tax return instructions.</div>
  <div style="width:35mm;text-align:center;" class="styGenericDiv">Cat. No. 13232M</div>
  <div style = "float:right;" class="styGenericDiv">Form <span class="styBoldText">8829</span> (2012)</div>
</div>
  <p class="pageend"></p>
  <!-- Begininning of write-in data -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$FormData" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Line 2c - Form or schedule number</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$FormData/FormScheduleNumber"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
        
    
      
</form>
</body>  </html>
</xsl:template>





</xsl:stylesheet>
