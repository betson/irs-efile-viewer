<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5735Style.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS5735" />

<xsl:template match="/">
<!-- Updated 6/14/11 RLW R7_D2-->
<!-- Updated 8/18/11 RLW IBM#29780-->
<html>
<head>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching  -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 5735"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS5735Style"></xsl:call-template>    
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form5735">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height:15mm;">
    <div class="styFNBox" style="width:31mm;font-size: 7pt; height: 19mm">
      Form <span class="styFormNumber" style="font-size: 16pt">5735
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span>  
      </span>      
      <br/>
      (Rev. March 2007)

      <br/>
      <div class="styAgency" style="padding-top: 2mm">Department of the Treasury</div><div class="styAgency">Internal Revenue Service</div>
    </div>
    <div class="styFTBox" style="width:125mm">
      <div class="styMainTitle" style="height:8mm;">American Samoa Economic Development Credit<br/> <span style="font-size:11pt"></span></div>
      <div class="styFST" style="height:4mm;font-size:7pt;margin-left:3mm;font-weight:bold">
        <div style="padding-top: .5mm">
          <img src="{$ImagePath}/5735_Bullet_Sm.gif" alt="SmallBullet"/> 
          See the separate instructions.
        </div>
        <div style="padding-top: .5mm">
          <img src="{$ImagePath}/5735_Bullet_Sm.gif" alt="SmallBullet"/> 
          Attach to the corporation's tax return.
        </div>
      </div>
    </div>
    <div class="styTYBox" style="width:31mm; height: 19mm">        
      <div style="padding-top:8mm; font-size:7pt">OMB No. 1545-0217</div>
    </div>
  </div>
  <!--  End title of Form  -->
  
  <!--  For calendar year line  -->
  <div class="styBB" style="width: 187mm">
    <div class="styBoldText">For calendar year
      <span style="width: 8mm">
	   <xsl:if test="normalize-space($FormData/CalendarYear) != ''">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/CalendarYear" />
          </xsl:call-template>
        </xsl:if>   
      </span>, or other tax year beginning
        <span style="width: 17mm">
	   <xsl:if test="normalize-space($FormData/TaxPeriodBeginDate) != ''">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/TaxPeriodBeginDate" />
            </xsl:call-template>
          </xsl:if>
        </span>and ending 
        <span style="width: 17mm">
	   <xsl:if test="normalize-space($FormData/TaxPeriodEndDate) != ''">
            <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/TaxPeriodEndDate" />
            </xsl:call-template>
          </xsl:if>
        </span>
    </div>
  </div>
  <!--  End For calendar year line  -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
          <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name<br/>
          <div>
        <xsl:choose>
          <xsl:when test="normalize-space($FormData/Name) != ''">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/Name/BusinessNameLine1" /></xsl:call-template>
            <xsl:if test="normalize-space($FormData/Name/BusinessNameLine2)!=''">
              <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/Name/BusinessNameLine2" /></xsl:call-template>
            </xsl:if>            
          </xsl:when>  
          <xsl:otherwise>
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
    <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;"><span class="BoldText">Employer identification number</span>
      <div style="text-align:left; padding-top:3mm;font-weight:normal;">    
        <xsl:choose>
          <xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
            <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber" /></xsl:call-template>
          </xsl:when>  
          <xsl:otherwise>  
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </div>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  
  
    
<div class="styBB" style="width:187mm;">
    <span class="styBoldText">Caution:</span>
    <span class="styNormalText" style="font-style:italic;">
     The corporation must have been an existing credit claimant with respect to American Samoa and
     must have elected the application of section 936 for its last tax year beginning before January 1, 2010, to
    qualify for the American Samoa economic development credit.</span>
  </div>

  
  <!--  Part I -->
  <div class="styBB" style="width: 187mm;  float: none; clear:none">
    <div class="styPartName" style="width: 15mm; height: 3.75mm">Part I</div>
    <div class="styPartDesc" style="width: 120mm">Gross Income in Applicable Period  
    <span class="styNormalText">(See instructions)</span>
    </div>


    <!-- button display logic -->
    <div style="float:right; clear: none; width: 4mm">
       <xsl:call-template name="SetDynamicTableToggleButton">
        <xsl:with-param name="TargetNode" select="$FormData/GrossIncomeInApplicablePeriod"/>
        <xsl:with-param name="containerHeight" select="3"/>
        <xsl:with-param name="headerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'APctn' "/>
      </xsl:call-template>
       <!-- end button display logic -->
     </div>
  </div>
  <!--  End Part I -->  
  
  <div class="styIRS5735TableContainer" id="APctn">
    <!-- print logic -->
      <xsl:call-template name="SetInitialState"/>
    <!-- end -->  
   <table class="styTable" cellspacing="0">
     <thead class="styTableThead" style="border-color:black;">
    <tr>
      <th class="styTableCellHeader" colspan="2" style="width: 92mm;">
      <span class="styNormalText" >Tax year. Use a separate line for each tax year ending with<b> or </b>within the 
      corporation's applicable period. Start with the earliest such tax year.</span></th>
     
      <th class="styTableCellHeader" colspan="2" style="width: 110mm; border-right-width: 0px;">
      <span class="styNormalText">Periods in which trade or business was actively conducted in <br/> American 
      samoa (dates are inclusive)</span></th>
      </tr>
    <tr>
      <th class="styTableCellHeader" style="width: 45mm;"><b>(a)</b><br/>
      <span class="styNormalText" style="font-size:7pt">Beginning</span></th>
      <th class="styTableCellHeader" style="width: 45mm"><b>(b)</b><br/>
      <span class="styNormalText" style="font-size:7pt">Ending</span></th>
      <th class="styTableCellHeader" style="width: 45mm"><b>(c)</b><br/>
      <span class="styNormalText" style="font-size:7pt">From</span>
      </th>
      <th class="styTableCellHeader" style="width: 45mm;border-right-width: 0px"><b>(d)</b><br/>
      <span class="styNormalText" style="font-size:7pt">To</span></th>
    </tr>
    </thead>
    <tfoot/>
    <tbody style="border-color:black;">
      <xsl:if test="count($FormData/GrossIncomeInApplicablePeriod) != 0">
      <xsl:for-each select="$FormData/GrossIncomeInApplicablePeriod">
       <xsl:if test="($Print != $Separated) or (count($FormData/GrossIncomeInApplicablePeriod) &lt;=3)">
          <tr>
            <td class="styTableCell" style="text-align: center;font-size:7pt;width: 45mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxYearBeginning" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="text-align: center;font-size:7pt;width: 45mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxYearEnding" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <!--td class="styTableCell" style="text-align: left;font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfUSPossession" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td -->
            <td class="styTableCell" style="text-align: center;font-size:7pt;width: 45mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PeriodFrom" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="border-right-width: 0px; text-align: center;font-size:7pt;width: 45mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PeriodTo" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
          </tr>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
      
      <!-- ************************************************** working area  **************************************** --> 
      <xsl:if test="(count($FormData/GrossIncomeInApplicablePeriod) &lt; 1) or 
      (($Print = $Separated) and (count($FormData/GrossIncomeInApplicablePeriod) &gt; 3))">
        <tr>
        <xsl:choose>
        	<xsl:when test="count($FormData/GrossIncomeInApplicablePeriod) &lt; 1">
	          <td class="styTableCell"><span class="styTableCellPad"></span></td>
	          <td class="styTableCell"><span class="styTableCellPad"></span></td>
	          <td class="styTableCell"><span class="styTableCellPad"></span></td>
	          <td class="styTableCell" style="border-right-width: 0px">
	          <span class="styTableCellPad"></span></td>
	       </xsl:when>
	       <xsl:otherwise>
	          <td class="styTableCell">
	          	<xsl:call-template name="PopulateAdditionalDataTableMessage">
	          		<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeInApplicablePeriod/TaxYearBeginning"/>
	          		<xsl:with-param name="LongMessage" />
	          	</xsl:call-template>
	          </td>
	          <td class="styTableCell"><span class="styTableCellPad"></span></td>
	          <td class="styTableCell"><span class="styTableCellPad"></span></td>
	          <td class="styTableCell" style="border-right-style:none;"><span class="styTableCellPad"></span></td>
	          <!--<td class="styTableCell" style="border-right-width: 0px"><span class="styTableCellPad"></span></td>-->	       
	       </xsl:otherwise>
	</xsl:choose>
        </tr>        
       </xsl:if>
       
      <xsl:if test="(count($FormData/GrossIncomeInApplcblPeriod) &lt; 2) or (($Print = $Separated) and 
      (count($FormData/GrossIncomeInApplcblPeriod) &gt; 3))">      
        <tr>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="border-right-width: 0px"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      
      <xsl:if test="(count($FormData/GrossIncomeInApplcblPeriod) &lt; 3) or (($Print = $Separated) and (count($FormData/GrossIncomeInApplcblPeriod) &gt; 3))">
        <tr>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
           <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="border-right-width: 0px"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      
    </tbody>
  </table>
  </div>
  
  <!-- Set Initial Height of Above Table -->
  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/GrossIncomeInApplcblPeriod"/>
    <xsl:with-param name="containerHeight" select="3"/>
      <xsl:with-param name="headerHeight" select="2"/>
    <xsl:with-param name="containerID" select=" 'APctn' "/>
  </xsl:call-template>
  <!-- End Set Initial Height of Above Table -->
  
  <!-- ***************************************************************************************************************** --> 

  <div class="styBB" style="width: 187mm; text-align: center">
    <div class="styBoldText" style="width:183mm;float:left;clear:none;">Gross income during periods shown in columns (c) and (d)</div>
      <!-- button display logic -->
    <div style="float:right; clear: none">
       <xsl:call-template name="SetDynamicTableToggleButton">
        <xsl:with-param name="TargetNode" select="$FormData/GrossIncomeDuringPeriods"/>
        <xsl:with-param name="containerHeight" select="4"/>
        <xsl:with-param name="headerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'GIctn' "/>
      </xsl:call-template>
       <!-- end button display logic -->
     </div>
  </div>
  <!--  End Part I -->  
  
  <div class="styIRS5735TableContainer" style="border-bottom-width: 0px" id="GIctn">
    <!-- print logic -->
      <xsl:call-template name="SetInitialState"/>
    <!-- end -->    
     <table class="styTable" cellspacing="0">
     <thead class="styTableThead" style="border-color:black">
    <tr>
      <th class="styTableCellHeader" colspan="4" style="width: 200; text-align:center;padding-left:20mm">
      <span style="font-weight:normal">Gross income from the active conduct of a trade or business in American Samoa
      </span></th>
 
      <th class="styTableCellHeader" colspan="4" style="width: 185mm; border-right-width: 0px;">
       <span style="font-weight:normal">All other gross income</span></th>
      </tr>
    <tr><!--Line 2e-->
      <th class="styTableCellHeader" style="width: 120mm;" colspan="2"><b>(e)</b><br/>
      <span class="styNormalText">From sources in American Samoa</span></th>
      <th class="styTableCellHeader" style="width: 120mm;"><b>(f)</b><br/>
      <span class="styNormalText">From all other sources<br/> outside the U.S.</span></th>
      <th class="styTableCellHeader" style="width: 100mm;"><b>(g)</b><br/>
      <span class="styNormalText">From sources in the U.S.</span></th>
      <th class="styTableCellHeader" style="width: 120mm;"><b>(h)</b><br/><span class="styNormalText">From sources in American
Samoa</span></th>
      <th class="styTableCellHeader" style="width: 120mm;"><b>(i)</b><br/><span class="styNormalText">From all other sources
outside the U.S.</span></th>
      <th class="styTableCellHeader"  style="border-right-width: 0px;width: 120mm;"><b>(j)</b><br/><span class="styNormalText">From sources in the U.S.</span></th>
    </tr>
    </thead>
    <tfoot/>
    <tbody style="border-color:black">
      <xsl:if test="count($FormData/GrossIncomeDuringPeriods) != 0">
        <xsl:for-each select="$FormData/GrossIncomeDuringPeriods">
        <xsl:if test="($Print != $Separated) or (count($FormData/GrossIncomeDuringPeriods) &lt;=3)">
          <tr>
            <td class="styTableCell" colspan="2">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GrossIncmFromSourcesAmericanSm" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="padding-left:4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GroIncmFromOtherSrcsOutsideUS" />
              </xsl:call-template>
      
            </td>
            <td class="styTableCell">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GrossIncomeFromSourcesUS" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <!--td class="styTableCell" ">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GrossQlfyPossSourceInvstIncome" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td -->
            <td class="styTableCell">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OtherGrossIncmFromSrcsAmerSm" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OthGroIncmFromOthSrcsOutsideUS" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="border-right-width: 0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OtherGrossIncomeFromSourcesUS" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
          </tr>
         </xsl:if>
        </xsl:for-each>
      </xsl:if>  
      <!--xsl:if test="(count($FormData/GrossIncmDuringPrdInColmDAndE) &lt; 1) or 
      (($Print = $Separated) and (count($FormData/GrossIncmDuringPrdInColmDAndE) &gt; 3))">
        <tr>
	       <xsl:choose>
	        	<xsl:when test="count($FormData/GrossIncmDuringPrdInColmDAndE) &lt; 1">
		          <td class="styTableCell" colspan="2"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell" style="border-right-width: 0px"><span class="styTableCellPad"></span></td>
		       </xsl:when>
		       <xsl:otherwise>
		          <td class="styTableCell" colspan="2">
		          	<xsl:call-template name="PopulateAdditionalDataTableMessage">
		          		<xsl:with-param name="TargetNode" 
		          		select="$FormData/GrossIncmDuringPrdInColmDAndE/GrossIncomeFromSourcesInUSPoss"/>
		          	</xsl:call-template>
		          </td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell"><span class="styTableCellPad"></span></td>
		          <td class="styTableCell" style="border-right-width: 0px"><span class="styTableCellPad"></span></td>
       
		       </xsl:otherwise>
		</xsl:choose>
        </tr>
      </xsl:if -->

      <!-- xsl:if test="(count($FormData/GrossIncmDuringPrdInColmDAndE) &lt; 2) or 
      (($Print = $Separated) and (count($FormData/GrossIncmDuringPrdInColmDAndE) &gt; 3))">      
        <tr>
          <td class="styTableCell" colspan="2"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="border-right-width: 0px"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if -->

      <!-- xsl:if test="(count($FormData/GrossIncmDuringPrdInColmDAndE) &lt; 3) or 
      (($Print = $Separated) and (count($FormData/GrossIncmDuringPrdInColmDAndE) &gt; 3))">         
        <tr>
          <td class="styTableCell" colspan="2"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="border-right-width: 0px"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if -->

	<xsl:choose>
		<xsl:when test="($Print != $Separated) or (count($FormData/GrossIncomeDuringPeriods) &lt;=3)">
	        <tr>
	          <td class="styTableCell" style="width: 2mm; border-right-width: 1px;">
	          <img src="{$ImagePath}/5735_Totals.gif" alt="SmallBullet"/>
	          </td>
	          <td class="styTableCell" style="padding-top: 7mm;">          
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" select="$FormData/TotalGroIncmFromSrcsAmericanSm" />
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="width: 31mm; padding-top: 6mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	              select="$FormData/TotalGroIncmFromOthSrcsOutsdUS" />
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="width: 31mm; padding-top: 6mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	              select="$FormData/TotalGrossIncomeFromSourcesUS" />
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <!--td class="styTableCell" style="width: 32mm; padding-top: 4mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	              select="$FormData/TotGroIncmDuringPrdInColmDandE/TotGroQlfyPossSourceInvstIncm" />
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td -->
	          <td class="styTableCell" style="padding-top: 6mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode"
	               select="$FormData/TotalOthGroIncmFromSrcsAmerSm" />
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="padding-top: 6mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	              select="$FormData/TotalOthGroIncmOthSrcsOutsdUS" />
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="border-right-width: 0px; padding-top: 6mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode"
	               select="$FormData/TotalOthGrossIncomeFromSrcsUS" />
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	        </tr>
	      </xsl:when>
	      <xsl:otherwise>
		<tr>
	          <td class="styTableCell" style="width: 2mm; border-right-width: 1px">
	          <img src="{$ImagePath}/5735_Totals.gif" alt="SmallBullet"/></td>
	          <td class="styTableCell" style="padding-top: 4mm">          
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="width: 31mm; padding-top: 4mm">
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="width: 31mm; padding-top: 4mm">
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="width: 32mm; padding-top: 4mm">
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="padding-top: 4mm;">
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="padding-top: 4mm;border-right-width: 0px;">
	            <span class="styTableCellPad"></span>
	          </td>
	          <!--<td class="styTableCell" style="width:34mm;border-right-width: 0px; padding-top: 4mm">
	            <span class="styTableCellPad"></span>
	          </td>-->
	        </tr>	      
	      </xsl:otherwise>
       </xsl:choose>
    </tbody>
  </table>

  <!-- Set Initial Height of Above Table -->
  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/GrossIncmDuringPrdInColmDAndE"/>
    <xsl:with-param name="containerHeight" select="4"/>
      <xsl:with-param name="headerHeight" select="2"/>
    <xsl:with-param name="containerID" select=" 'GIctn' "/>
  </xsl:call-template>
  <!-- End Set Initial Height of Above Table -->
</div>  
 <!-- ***************************************************************************************************************** --> 
  <!--  Line 1  -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:3mm;">1</div>
    <div class="styLNDesc" style="width:139mm;">
      <span style="float:left;">Total gross income in applicable period. Enter the total of columns (e) through (j)</span>
      <span  class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
    </div>
    <div class="styLNRightNumBox">1</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalGrossIncomeApplicablePrd" />
      </xsl:call-template>
    </div>
  </div>
  <!--  Line 1  -->
  
  <!--  Line 2  -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:3mm;">2</div>
    <div class="styLNDesc" style="width:139mm;">Gross income in applicable period from sources in American
     Samoa. Enter the total of columns (e)and (h)</div>
    <div class="styLNRightNumBox">2</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GroIncomePrdFromAmericanSamoa" />
      </xsl:call-template>
    </div>
  </div>
  <!--  Line 2  -->
  
  <!--  Line 3 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox"  style="padding-left:3mm;">3</div>
    <div class="styLNDesc" style="width:139mm;">
       <span style="float:left">Divide line 2 by line 1. If less than 80%, <b>stop here.</b>
       The American Samo economic development credit is </span>
       <span style="float:left">not allowed</span>
       <span  class="styDotLn" style="float:right;padding-right:2mm;">.............................</span>
    </div>
    <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">3</div>
    <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/IncmFromSrcsAmerSmaPctTotIncm" />
      </xsl:call-template>
    </div>
  </div>
  <!--  Line 3  -->
  
  <!--  Line 4 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:3mm;">4</div>
    <div class="styLNDesc" style="width:139mm;">
      <span style="float:left;white-space:nowrap;">Gross income from the active conduct of a trade or business in America Samoa.Enter the total of (e),(f),</span>
      <span style="float:left;white-space:nowrap;">and (g)</span>
      <span  class="styDotLn" style="float:right;padding-right:2mm;">...............................</span>
    </div>
    <div class="styLNRightNumBox" style="height: 8mm;padding-top: 4mm">4</div>
    <div class="styLNAmountBox" style="height: 8mm;padding-top: 4mm">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/GroIncmFromWithinAmericanSamoa" />
      </xsl:call-template>
    </div>
  </div>
  <!--  Line 4  -->
  
  <!--  Line 5  -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBoxBB" style="height:8mm;padding-left:3mm;">5</div>
    <div class="styIRS5735LNDescBB" style="height:8mm;width:139mm;">
    <span style="float:left;">Divide line 4 by line 1. If less than 75%, 
     <b>stop here.</b>  The American Samoa economic development credit</span>
     <span style="float:left;">is not allowed</span>
     <span  class="styDotLn" style="float:right;padding-right:2mm;">.............................</span>
  </div>


    <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">5</div>
    <div class="styLNAmountBox" style="height:8mm;padding-top:4mm ">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$FormData/IncomeTrdBusAmerSmaPctTotIncm" />
      </xsl:call-template>
    </div>
  </div>
  <!--  Line 5  -->
  
  <!--  Part II -->
  <div class="styBB" style="width: 187mm">
    <div class="styPartName" style="width: 15mm">Part II</div>
    <div class="styPartDesc">American Samoa Economic Development Credit <span class="styNormalText">(See
   instructions)</span></div>
  </div>
  <!--  End Part II -->

  <!--  Line 6  -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:3mm;">6</div>
    <div class="styLNDesc" style="width:139mm;">
         <span style="float:left;">Enter 60% of qualified compensation</span>
         <span  class="styDotLn" style="float:right;padding-right:2mm;">......................</span>
    </div>
    <div class="styLNRightNumBox">6</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SixtyPctQualifiedCompensation" />
      </xsl:call-template>
    </div>
  </div>
  <!--  End Line 6  -->
  
  <!--  Line 7  -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:3mm;">7</div>
    <div class="styLNDesc" style="width:139mm;">
         <span style="float:left;">Enter 15% of the depreciation deduction for short-life qualified tangible property</span>
         <span  class="styDotLn" style="float:right;padding-right:2mm;">........</span>
         </div>
    <div class="styLNRightNumBox">7</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/FifteenPctDeprecTangibleProp" />
      </xsl:call-template>
    </div>
  </div>
  <!--  End Line 7  -->
  
  <!--  Line 8 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:3mm;">8</div>
    <div class="styLNDesc" style="width:139mm;">
     <span style="float:left;">Enter 40% of the depreciation deduction for medium-life qualified tangible property</span>
     <span  class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;">8</div>
    <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/FortyPercentDeprecTangibleProp" />
      </xsl:call-template>
    </div>
  </div>
  <!--  End Line 8  -->
  
  <!--  Line 9 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:3mm;">9</div>
    <div class="styLNDesc" style="width:139mm;">
      <span style="float:left;">Enter 65% of the depreciation deduction for long-life qualified tangible property</span>
      <span  class="styDotLn" style="float:right;padding-right:2mm;">........</span>
    </div>
    <div class="styLNRightNumBox" style="height: 4mm;">9</div>
    <div class="styLNAmountBox" style="height: 4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/SixtyFivePctDeprecTangibleProp" />
      </xsl:call-template>
    </div>
  </div>
  <!--  End Line 9  -->
  <!--  Line 10 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox">10</div>
    <div class="styLNDesc" style="width:139mm;">
     <span style="float:left;">Tentative credit. Add lines 6 through 9</span>
     <span  class="styDotLn" style="float:right;padding-right:2mm;"> .....................</span>
    </div>
    <div class="styLNRightNumBox" style="height: 4mm;">10</div>
    <div class="styLNAmountBox" style="height: 4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TentativeCredit" />
      </xsl:call-template>
    </div>
  </div>
  <!--  End Line 10  -->
  
<!--  Line 11 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox">11</div>
    <div class="styLNDesc" style="width:139mm;">
       <span style="float:left;">Total U.S. income tax against which credit is allowed</span>
       <span  class="styDotLn" style="float:right;padding-right:2mm;"> .................</span>
    </div>
    <div class="styLNRightNumBox" style="height: 4mm;">11</div>
    <div class="styLNAmountBox" style="height: 4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalUSIncomeTax" />
      </xsl:call-template>
    </div>
  </div>
  <!--  End Line 11  -->
  
  
  <!--  Line 12  -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBoxBB" style="height:8mm;">12</div>
    <div class="styIRS5735LNDescBB" style="height:8mm;width:139mm;">
    <b>American Samoa economic development credit.</b>Enter the <b>smaller </b>of line 10 or line 11. Enter
the result here and on Form 1120, Schedule J, line 5b, or the corresponding line of other returns
(see instructions)
  
   </div>
    <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">12</div>
    <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AmericanSamoaEconomicDevCredit" />
      </xsl:call-template>

    </div>
  </div>
  <!--  End Line 12  -->
  
    
	<!--End of form-->

    <div style="width:187mm;">
    <span class="styBoldText">For Paperwork Reduction Act Notice, see the separate instructions. </span> 
      <span style="width:14px;"></span>  
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>  
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>  
      <span style="width:14px;"></span>
       Cat. No. 12090G 
      <span style="width:14px;"></span>  
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>
      <span style="width:14px;"></span>
    Form <span class="styBoldText">5735</span> (Rev. 3-2007)
  </div>


  


 <!--************************************************************************************************ -->
      <div class="pageEnd"></div>
      
      <div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top: 4mm">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" 
          onclick="javascript:returnToWriteInImage();"/>
        </div>      
      </div>
      
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$FormData" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>    
  <!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->    
    <!-- Separated Data Table for columns A - D -->
  <!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->  
    
    <xsl:if test="($Print = $Separated) and (count($FormData/GrossIncomeInApplicablePeriod) &gt;=3)">
    <br/><br/>
	    <div class="styPartDesc" style="width: 120mm">Gross Income in Applicable Period 
	     <span class="styNormalText">(See instructions.)</span></div>

	<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
		 <thead class="styTableThead" style="border-color:black">
    <tr>
      <th class="styTableCellHeader" colspan="2" style="width: 92mm">
      <span class="styNormalText" >Tax year. Use a separate line for each tax year ending with <b>or </b>within the corporation's applicable period. Start with the earliest such tax year.</span></th>
     
      <th class="styTableCellHeader" colspan="2" style="width: 93mm; border-right-width: 0px">
      <span class="styNormalText">Periods in which trade or business was actively conducted in <br/> American 
      samoa (dates are inclusive)</span></th>
      </tr>
    <tr>
      <th class="styTableCellHeader" style="width: 45mm"><b>(a)</b><br/>
      <span class="styNormalText" style="font-size:7pt">Beginning</span></th>
      <th class="styTableCellHeader" style="width: 45mm;"><b>(b)</b><br/>
      <span class="styNormalText" style="font-size:7pt">Ending</span></th>
      <th class="styTableCellHeader" style="width: 45mm"><b>(c)</b><br/>
      <span class="styNormalText" style="font-size:7pt">From</span>
      </th>
      <th class="styTableCellHeader" style="width: 45mm;border-right-width: 0px"><b>(d)</b><br/><span class="styNormalText" style="font-size:7pt">To</span></th>
    </tr>
    </thead>
		    <tfoot/>
		    <tbody style="border-color:black">
		    
<!--  ************************************************************************************************************************  -->
    <xsl:if test="count($FormData/GrossIncomeInApplicablePeriod) != 0">
     <xsl:if test="($Print= $Separated) and (count($FormData/GrossIncomeInApplicablePeriod) &gt;=3)">
      <xsl:for-each select="$FormData/GrossIncomeInApplicablePeriod">
        <tr>
           			<!-- Define background colors to the rows -->
	              	<xsl:attribute name="class">
	                        <xsl:choose>
	                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
	                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
	                        </xsl:choose>
	                   </xsl:attribute>		          
     
            <td class="styTableCell" style="text-align: center;font-size:7pt;width: 45mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxYearBeginning" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="text-align: center;font-size:7pt;width: 45mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TaxYearEnding" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <!--td class="styTableCell" style="text-align: left;font-size:7pt">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfUSPossession" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td -->
            <td class="styTableCell" style="text-align: center;font-size:7pt;width: 45mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PeriodFrom" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="border-right-width: 0px; text-align: center;font-size:7pt;width: 45mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PeriodTo" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
          </tr>
         
        </xsl:for-each>
      </xsl:if> </xsl:if>
<!--  ************************************************************************************************************************  -->		    
		    	        
		       <thead class="styTableThead" style="border-color:black"> 	
		        <tr class="styDepTblHdr" style="border-bottom-width: 0px">
				<th class="styDepTblCell" colspan="5" style="border-bottom-width: 0px">		
					<div  style="width: 187mm; text-align: center">
						<div class="styBoldText">Gross income during periods shown in columns (d) and (e)</div>
					</div>
				</th>
			</tr>	          
			</thead>			
		    </tbody>
		  </table>
    </xsl:if>
    <!-- /Separated Data Table for columns A - D -->
    
    <!-- Separated Data Table for columns E - I -->
    <xsl:if test="($Print = $Separated)">
	     <table class="styDepTbl" style="font-size:7pt; width: 191.25mm" cellspacing="0">
	     <thead class="styTableThead" style="border-color:black">
	    <tr class="styDepTblHdr">
	      <th class="styDepTblCell" colspan="4" style="width: 92mm; text-align: center">
	      <span class="styNormalText">Gross income from the active conduct of a trade or business in a U.S. 
	      possession</span></th>
	    
	     
      <th class="styTableCellHeader" colspan="4" style="width: 185mm; border-right-width: 0px;">
      <span class="styNormalText">All other gross income</span></th>

	      </tr>
	    <tr class="styDepTblHdr">
	      <th class="styDepTblCell" colspan="2" style="width:22mm"><b>(e)</b><br/>
	      <span class="styNormalText">
	      From sources inAmerica Samoa</span></th>
	      <th class="styDepTblCell"><b>(f)</b><br/>
	      <span class="styNormalText">From all other sources<br/> outside the
	       U.S.</span></th>
	      <th class="styDepTblCell"><b>(g)</b><br/>
	      <span class="styNormalText">From sources in the U.S.</span>
	      </th>
	      <th class="styDepTblCell"><b>(h)</b><br/>
	      <span class="styNormalText">From sources in America samoa
	      </span></th>
	      <th class="styDepTblCell"><b>(i)</b><br/>
	      <span class="styNormalText">From all other sources outside the
	       U.S.</span></th>
	      <th class="styDepTblCell" style="border-right-width: 0px">
	      <b>(l)</b><br/><span class="styNormalText">From 
	      sources in the U.S.</span></th>
	    </tr>
	    </thead>
	    <tfoot/>
	    <tbody style="border-color:black;">
	    <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
	        <xsl:if test="count($FormData/GrossIncomeDuringPeriods) != 0">
	        <xsl:if test="($Print = $Separated) and (count($FormData/GrossIncomeDuringPeriods) &gt;=3)">
        <xsl:for-each select="$FormData/GrossIncomeDuringPeriods">        
          <tr>
                   <!-- Define background colors to the rows -->
	              	<xsl:attribute name="class">
	                        <xsl:choose>
	                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
	                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
	                        </xsl:choose>
	                   </xsl:attribute>	
            <td class="styTableCell" colspan="2" style="padding-left:4mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GrossIncmFromSourcesAmericanSm" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="padding-left:4mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GroIncmFromOtherSrcsOutsideUS" />
              </xsl:call-template>
      
            </td>
            <td class="styTableCell" style="padding-left:4mm;text-align:right">
              <xsl:call-template name="PopulateAmount" >
                <xsl:with-param name="TargetNode" select="GrossIncomeFromSourcesUS" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <!--td class="styTableCell">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="GrossQlfyPossSourceInvstIncome" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td -->
            <td class="styTableCell" style="padding-left:4mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OtherGrossIncmFromSrcsAmerSm" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="padding-left:4mm;text-align:right;width:33mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OthGroIncmFromOthSrcsOutsideUS" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
            <td class="styTableCell" style="padding-left:4mm;text-align:right;width:33mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OtherGrossIncomeFromSourcesUS" />
              </xsl:call-template>
              <span class="styTableCellPad"></span>
            </td>
          </tr>
       
        </xsl:for-each>
      </xsl:if>  </xsl:if>  
  
	    <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
	       
	      <thead class="styTableThead" style="border-color:black;"> 	
		   <tr class="styDepTblHdr" style="border-bottom-width: 0px;font-size:6pt;">
	          <td class="styTableCell" style="width: 2mm; border-right-width: 1px">
	          <img src="{$ImagePath}/5735_Totals.gif" alt="SmallBullet"/></td>
	          <td class="styTableCell" style="text-align:right;width: 24mm; padding-top: 4mm;">          
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode"
	               select="$FormData/TotalGroIncmFromSrcsAmericanSm" />
				              
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->	          
	          <td class="styTableCell" style="text-align:right;width: 31mm; padding-top: 4mm;">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	            select="$FormData/TotalGroIncmFromOthSrcsOutsdUS" />
   
			
			            
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="text-align:right;width: 31mm; padding-top: 4mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	              select="$FormData/TotalGrossIncomeFromSourcesUS" />
			
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="text-align:right;width: 32mm; padding-top: 4mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	              select="$FormData/TotalOthGroIncmFromSrcsAmerSm" />
		        
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="text-align:right;padding-top: 4mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	               select="$FormData/TotalOthGroIncmOthSrcsOutsdUS" />
		
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	          <td class="styTableCell" style="text-align:right;padding-top: 4mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode"
	               select="$FormData/TotalOthGrossIncomeFromSrcsUS" />
			
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td>
	        <!--  <td class="styTableCell" style="border-right-width: 0px; padding-top: 4mm">
	            <xsl:call-template name="PopulateAmount">
	              <xsl:with-param name="TargetNode" 
	              select="$FormData/TotalGrossIncomeApplicablePrd" />
			
	            </xsl:call-template>
	            <span class="styTableCellPad"></span>
	          </td> --> 
	        </tr>

</thead>
	
	    </tbody>
	  </table>	
	  
	  
    </xsl:if>
    <!-- /Separated Data Table for columns E - L -->

  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>