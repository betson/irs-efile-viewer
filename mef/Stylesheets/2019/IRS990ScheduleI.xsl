<?xml version="1.0" encoding="UTF-8"?>

<!-- Last modified on 5/05/2015 for UWR 123023 IE11 changes by Robert Jones -->
<!-- Last modified on 6/5/2015 for IBM Defect 43116 by Robert Jones -->
<!-- Last modified on 6/5/2015 for IBM Defect 43117 by Robert Jones -->
<!-- Last modified on 7/22/2015 for IBM Defect 43947 Sep Print overlapping of data Part III by Robert Jones -->
<!-- Updated 8/05/2015 per UWR 161465 Tax Year by Robert L Jones -->
<!-- Updated 10/22/2015 per PDF REVIEW by Robert L Jones -->
<!-- Updated 10/27/2015 per IBM Defect 44999 by Robert L Jones -->
<!-- Updated 10/27/2015 per IBM Defect 44993 by Robert L Jones -->
<!-- Updated 10/27/2015 per IBM Defect 44991 Blank Form not looking like the pdf by Robert L Jones -->
<!-- Updated 11/19/2015 per IBM Defect 45349 Alignment by Robert L Jones -->
<!-- Updated 11/19/2015 per IBM Defect 44991 Missing right border and numbering by Robert L Jones -->
<!-- Updated 12/16/2015 per IBM Defect 44991 Blank form numbering by Robert L Jones -->
<!-- Updated 12/16/2015 per IBM Defect 45349 Header not extending all the way to right -  by Robert L Jones -->
<!-- Updated 4/22/2016 per UWR 177702 Tax Year by Robert L Jones -->
<!-- Updated 6/17/2016 per IBM Defect 46030 alignment issues at Part II and Part III Headers by Robert L Jones -->
<!-- Updated 9/14/2016 per Kisam alignment issues at Part II caused by Change in Sat Data to accomodate 75 char. Font from 7pt tp 6pt by Robert L Jones -->
<!-- Updated 9/14/2016 per Kisam IM0264870 alignment issues at Part II caused by Change in Sat Data to accomodate 75 char. Font from 6pt tp 7pt by Robert L Jones -->
<!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleIStyle.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleI"/>

<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="private"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Form 990 Schedule I"/>
<META name="GENERATOR" content="IBM WebSphere Studio"/>

<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
<xsl:call-template name="InitJS"/>
<style type="text/css">
<xsl:if test="not($Print) or $Print=''">
    <!-- Form 990ScheduleI CSS Styles are located in the template called below -->
    <xsl:call-template name="IRS990ScheduleIStyle"/>
    <xsl:call-template name="AddOnStyle"/>
</xsl:if>
</style>

<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="IRS990ScheduleI">
<!--   BEGIN WARNING LINE  -->
<div style="width: 256mm; height:8.5mm; background-color: #f6f6f6;">
<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
</div>
<!--   END WARNING LINE   -->

<!--   BEGIN FORM HEADER   -->
<!--   BEGIN FORM HEADER   -->
<div class="sty990ScheduleIBB" style="width:256mm;height:auto;">
  <div class="sty990ScheduleIFN" style="height:auto;">
    <div class="sty990ScheduleIFNum" style="width:29mm;">Schedule I
      <br/>
      <span class="sty990ScheduleIFNum2">(Form 990)</span>
    
    
    <div class="sty990ScheduleIAgency" style="padding-top: 8mm;float:left;height:auto;">Department of the Treasury
      <br/>Internal Revenue Service</div>
    </div>
  </div>
  <div class="sty990ScheduleIFTBox" style="width:180mm;border-right-width:1px;height:auto;padding-top:2mm">
    <div class="styMainTitle">Grants and Other Assistance to Organizations,<br />Governments and Individuals in the United States</div>
    <span class="sty990ScheduleIFST">    
Complete if the organization answered "Yes," on Form 990, Part IV, line 21 or 22.
        </span><br />
   <span class="sty990ScheduleIFST">
<img src="{$ImagePath}/990SchI_Bullet.gif" alt="lBullet"/> 
 Attach to Form 990.</span><br></br>
 <span class="sty990ScheduleIFST">
<img src="{$ImagePath}/990SchI_Bullet.gif" alt="lBullet"/> 
 Go to <!--www.irs.gov/form990.--><a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/Form990</i></a> for the latest information. 
 </span>
 </div>
  <div class="IRS990ScheduleI_FormYearBlock" style="height:auto;float:right">
    <!-- OMB No. -->
    <div class="IRS990ScheduleI_OMB" style="height:auto;padding-top:0mm">OMB No. 1545-0047</div>
    <!-- Tax Year -->
<div class="IRS990ScheduleI_TaxYear" style="padding-top:0mm;padding-bottom:0;height:auto;">
       <span>20<span class="styTYColor">19</span></span>
    
    <div class="sty990ScheduleIPartName" style="font-size:7pt;font-family:verdana;width:45mm;padding-top:0mm;padding-bottom:0mm;height:10.5mm">Open to Public <br/>Inspection</div>
</div>

 </div></div>
<!--   END FORM HEADER   -->

<!--   BEGIN TAXPAYER INFO   -->
<div style="width:256mm;float:left;clear:left;">
  <div class="sty990ScheduleIBusinessName" style="width:200mm;height:auto;">Name of the organization
  <br/>
    <span style="font-family: verdana, arial, sans-serif;font-size: 7pt;">
      <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
    </xsl:call-template>
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
    </xsl:call-template>
    </span>
  </div>
  <div class="sty990ScheduleIIN" style="width:56mm;height:auto;"><span style="font-weight:bold;float:left; clear: none; margin-left: 1mm">Employer identification number</span><br/>
      <span class="sty990ScheduleIINBox" style="font-weight:normal;font-size: 7pt; height:4mm;float:left; margin-left: 1mm; padding-top:2mm;">
              
           <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
    </xsl:call-template>
          
      </span>
  </div>
</div>
<!--   END TAXPAYER INFO   -->
<!--   BEGIN HEADER   -->
<div class="styBB" style="width: 256mm;border-top-width:1px;">
  <div class="styPartName">Part I</div>
  <div class="styPartDesc" style="width: 242mm;">General Information on Grants and Assistance</div>
  </div>

  
  <div style=" width: 256mm; ">
<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">1</div>
 <div class="styLNDescLandscape" style="border-top-width:1px;padding-top:1mm; height:auto;">
   
 Does the organization maintain records to substantiate the amount of the grants or assistance, the grantees' eligibility for the grants or assistance, and<br/> the selection criteria used to award the grants or assistance?

<span style="letter-spacing:3mm; font-weight:bold;">........................</span> 
</div>
<span style="float:right;"> 
<span style="padding-top:4mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
        <xsl:with-param name="BackupName">Form990GrantRecordsMaintainedIndYes</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm;"/>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
        <xsl:with-param name="BackupName">Form990GrantRecordsMaintainedIndNo</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
        </xsl:call-template>            
        No
      </label></span> 
</div>

   <div style=" width: 256mm; ">
   <div class="styLNLeftNumBox">2</div>
   <div class="styLNDescLandscape " style="padding-top:0mm; height:auto;">
   Describe in Part IV the organization's procedures for monitoring the use of grant funds in the United States.
</div>
</div>
<!-- Begin Part II -->
<div class="styBB" style="width: 256mm;border-top-width:1px">
  <div class="sty990ScheduleIPartName" style="height:auto;">Part II</div>
  <div class="sty990ScheduleIDescLine" style="height:auto;width:240mm;"><b><span style="width:2mm;"/>Grants and Other Assistance to Domestic Organizations and Domestic Governments.</b> Complete if the organization answered "Yes" on Form 990, Part IV, line 21,  for any recipient  
     <div class="sty990ScheduleIDescLine" style="padding-left:2.5mm;height:auto;width:240mm;"> that received more than $5,000. Part II can be duplicated if additional space is needed. </div>  
<!--<span class="styNoAudioRead" style="font-weight:bold;"> </span>   
   
      <span style="letter-spacing:4mm; font-weight:bold; ">  
        .........................    </span>          
     <img src="{$ImagePath}/990SchI_Bullet.gif" alt="lBullet"/> 
      <span style="width:1mm;padding-left:2mm">
      <input type="checkbox" class="styCkbox" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/NoGrantMoreThan5000" />
        <xsl:with-param name="BackupName">Form990ScheduleINoGrantMoreThan5000</xsl:with-param>
       </xsl:call-template>
      </input> 
      
 <label style="font-weight:bold;padding-top:7mm">
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$FormData/NoGrantMoreThan5000" />
</xsl:call-template> 
</label></span>-->

<!-- ================ Begin changes for Part II Table ==================================== -->
<!--<xsl:variable name="table1RowCount" select="count($FormData/RecipientTable)"/>
     
 
    <xsl:call-template name="SetDynamicTableToggleRowCount">
       <xsl:with-param name="DataRowCount" select="$table1RowCount"/>
       <xsl:with-param name="containerHeight" select="12"/>
       <xsl:with-param name="containerID" select=" 'p2TbCtnr' "/>
     </xsl:call-template>
   </span>-->
   </div>     
 <!--  <div class="styGenericDiv" style="float:right">
							 button display logic 
							<xsl:call-template name="SetDynamicTableToggleButton">
			<xsl:with-param name="TargetNode" select="$FormData/RecipientTable"/>
								<xsl:with-param name="containerHeight" select="12"/>
								<xsl:with-param name="containerID" select=" 'p2TbCtnr' "/>
							</xsl:call-template>
							 end button display logic -->
						
   
   
   </div>

  <!--Part II  table -->
  <div class="styTableLandscape" id="p2TbCtnr" style="display:table;width: 256mm;"> 
     
<!-- print logic -->
    <xsl:call-template name="SetInitialState"/> 
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;margin-left:0mm;width: 256mm;">

<!--<div style="width: 256mm;">-->
  <tr>
	
	<th class="sty990ScheduleILNCol" scope="col" style="border-style: solid; border-color: black;text-align: center;font-size: 7pt;   height: 17mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;width:42mm">
	<b>(a)</b> Name and address of organization<br/>or government</th>

<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;text-align: center;font-size: 7pt; height: 17mm; border-bottom-width: 1px; border-top-width:1px; padding-top:1mm;font-weight:normal;vertical-align:top;width:24mm"><b>(b)</b> EIN</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;text-align: center; height: 17mm; width:20mm;border-bottom-width: 1px;    border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top;width:30mm"><b>(c)</b> IRC section<br/>(if applicable)</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm; width:32mm; padding-right: 0px;     font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(d)</b> Amount of cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm;width:28mm;  margin-top: 0mm;      padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b> Amount of non-cash<br/>assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm; width:32mm; padding-top: 1mm;     padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b> Method of valuation<br/>(book, FMV, appraisal,<br/>other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm; width:36mm; padding-top: 1mm;   padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(g)</b> Description of<br/>noncash assistance</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: left; height: 17mm; width: 32m;padding-top: 1mm;   padding-right: 0px; padding-bottom: 0px; padding-left: 2mm; float: none; clear: none;font-size:7pt;font-weight:normal;vertical-align:top"><b>(h)</b> Purpose of grant<br/>or assistance</th>
		</tr>
	
<!--   END HEADER   -->

<!--   BEGIN LINE 1   -->

	<xsl:if test="($Print != $Separated) or count($FormData/RecipientTable) &lt;= 12">
          <xsl:for-each select="$FormData/RecipientTable">
            <tr>
            <td class="sty990ScheduleILNCol" style="height:auto;border-style: solid; border-color: black;border-right:1px;padding-top: 1mm;width:42mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">(<xsl:number value="position()" format="1"/>)
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template><br/>
           
      <xsl:if test="RecipientBusinessName/BusinessNameLine2Txt">
                     <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template><br/>
 </xsl:if>
  <xsl:choose>
                  <xsl:when test="USAddress">                    
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="USAddress"/>
                      </xsl:call-template>                    
                  </xsl:when>
                  <xsl:otherwise><br/>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="ForeignAddress"/>
                      </xsl:call-template>
                  </xsl:otherwise>  
                </xsl:choose>
              </td>
   <td class="sty990ScheduleICol" style="height:auto;border-style: solid; border-color: black;border-right:1px;padding-top: 1mm;width:24mm;font-size:7pt;padding-left: 2.5mm;text-align:center;vertical-align:top"> 
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="RecipientEIN"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width:30mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IRCSectionDesc"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 28mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-left:1mm;height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top;text-align:left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered-->
              <td class="sty990ScheduleICol" style="padding-left:1mm;height:auto;border-style: solid; border-color: black; padding-top: 1mm;width: 36mm;font-size:7pt;text-align:left;vertical-align:top">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
                </xsl:call-template> 
             
               
 		</td>  
  
  	 <td class="sty990ScheduleICol" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;padding-left:1mm;text-align:left;vertical-align:top;float:none;">
   		 <xsl:call-template name="PopulateText">
     		 <xsl:with-param name="TargetNode" select="PurposeOfGrantTxt"/>
   		 </xsl:call-template>
  		</td>
       </tr>
       	
       
      </xsl:for-each>
    </xsl:if>
 
        <xsl:if test="count($FormData/RecipientTable) &lt; 1 or             (($Print = $Separated) and (count($FormData/RecipientTable) &gt; 12)) ">
        <xsl:if test="position()=1">
           
       <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/RecipientTable"/>
              </xsl:call-template>
              </xsl:if>
           
        
        
								<xsl:if test="count($FormData/RecipientTable) &lt; 2 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(1)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 3 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(2)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 4 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(3)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 5 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(4)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 6 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(5)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 7 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(6)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 8 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(7)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 9 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(8)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 10 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(9)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 11 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(10)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 12 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(11)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 12 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"><xsl:with-param name="index">(12)</xsl:with-param></xsl:call-template>
								</xsl:if>
								   </xsl:if>
		 </table> 
 </div> 

<!--</div>-->
<!--  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/RecipientTable"/>
    
    <xsl:with-param name="containerHeight" select="12"/>
    <xsl:with-param name="containerID" select="'p2TbCtnr'"/>
  </xsl:call-template> -->


<!--   END LINE 1   -->

<!-- Line 2 -->
       <div style="width:256mm;padding-top:1mm">
        <div class="styLNLeftNumBox">2</div>
        <div class="styLNDescLandscape" style="height:auto;width:207mm">Enter total number of section 501(c)(3) and government organizations listed in the line 1 table
          <!--Dotted Line-->
         <span class="styNoAudioRead" style="font-weight:bold;">
             <span style="letter-spacing:4mm; font-weight:bold; "> ................. </span>  <span style="letter-spacing:2mm; font-weight:bold; ">  
         </span>
          </span>
   <img src="{$ImagePath}/990SchI_Bullet.gif" alt="Bullet Image"/>
   </div>
    <div class="styFixedUnderline" style="height:auto;width:40mm;text-align:right;padding-right:1mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/Total501c3OrgCnt"/>
          </xsl:call-template>
        </div>
          
      </div>      
 
     

      
  <div class="styBB" style="width:256mm;">
        <div class="styLNLeftNumBox">3</div>
        <div class="styLNDescLandscape" style="height:auto;width:207mm;">Enter total number of other organizations listed in the line 1 table
          <!--Dotted Line-->
         <span class="styNoAudioRead" style="font-weight:bold;">
            <span style="letter-spacing:4mm; font-weight:bold; ">  
        ........................  </span>   <span style="letter-spacing:2mm; font-weight:bold; ">  
      .    </span>          
        
          </span>
    <img src="{$ImagePath}/990SchI_Bullet.gif" alt="Bullet Image"/>
   </div>
    <div class="styFixedUnderline" style="height:auto;width:40mm;text-align:right;padding-right:1mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/TotalOtherOrgCnt"/>
          </xsl:call-template>
        </div>
         
      </div>      
 

<!--   BEGIN FORM FOOTER  -->
<!--Page Footer-->

<div class="sty990ScheduleIFormFooter" style="padding-top:1mm;">
  <div style="width:140mm;font-weight:bold; float: left; clear: none;">For Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
  <div style="width:19mm;font-weight:normal; float: left; clear: none;border-top-width:1px">Cat. No. 50055P</div>
  <div style="width:85mm;text-align:right;font-weight:bold; padding-right:4mm; float: right; clear: none;">
  <span class="styBoldText"> Schedule I (Form 990) 2019</span> 
</div>
</div>
<!--     END FORM FOOTER   -->
  <div class="pageEnd"/>
<br/>      

  
  <div class="styBB" style="width:256mm; float: none; clear:none;border-bottom-width:1px">  
    <div style="float:left">Schedule I (Form 990) 2019</div>
    <div style="float:right">Page <span style="font-weight:bold;font-size:8pt;padding-right:4mm">2</span></div>                    
  </div>  

<!--   BEGIN HEADER   -->
<div class="styBB" style="width: 256mm;display:table;">
  <div class="sty990ScheduleIPartName" style="height:auto;display:table;">Part III</div>
 <div class="sty990ScheduleIDescLine" style="height:auto;font-size:7pt;width:240mm;"><b><span style="width:2mm;"/>Grants and Other Assistance to Domestic Individuals.</b> Complete if the organization answered "Yes" on Form 990, Part IV, line 22. <br></br><span style="width:2.5mm;"/>Part III can be duplicated if additional space is needed.
 </div>

<!--==============================Part III Table ======================================-->

<xsl:variable name="table2RowCount" select="count($FormData/GrantsOtherAsstToIndivInUSGrp)"/>
 

  
   <!-- <xsl:call-template name="SetDynamicTableToggleRowCount">
       <xsl:with-param name="DataRowCount" select="$table2RowCount"/>
       <xsl:with-param name="containerHeight" select="7"/>
       <xsl:with-param name="containerID" select=" 'p3TbCtnr' "/>
     </xsl:call-template>-->
  
 </div>

  <!--Part I-C  line 5 table -->
  <div class="styTableLandscape" id="p3TbCtnr" style="display:table;width: 256mm;"> 
     
<!-- print logic -->
    <xsl:call-template name="SetInitialState"/> 
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;margin-left:0mm;width: 256mm;">
<thead class="styTableThead">

<!--<div style="width: 256mm;">-->
  <tr>
			
	<th class="sty990ScheduleILNCol" scope="col" style="border-style: solid; border-color: black;width:56mm;text-align: center;font-size: 7pt; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top"><b>(a)</b> Type of grant or assistance</th>

 	 <th class="sty990ScheduleIColA" scope="col" style="border-style: solid; border-color: black;text-align: center; width:40mm;border-bottom-width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(b)</b> Number of<br/>recipients</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; width:31mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(c)</b> Amount of<br/>cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; width:30mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(d)</b> Amount of<br/>noncash assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; width:39mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b> Method of valuation (book,<br/>FMV, appraisal, other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center;  width:60.25mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b> Description of noncash assistance</th>
	</tr>
	</thead>
       
</table>
		
		
		
<!--   END HEADER   -->

<!--   Part III Table  -->

	
<div class="styTableLandscape" style="width: 256mm; border-bottom-width:1px;display:table;">

<table class="styTable" style="font-size: 7pt; border-color:black;width:256mm;display:table;" cellspacing="0"><!--need this to keep seeadditionaldata msg at top line of table-->
	
	<xsl:if test="($Print != $Separated) or count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt;= 7">
	
          <xsl:for-each select="$FormData/GrantsOtherAsstToIndivInUSGrp">
            <tr>
            
              <td class="sty990ScheduleILNCol" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width:60mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top;">(<xsl:number value="position()" format="1"/>) 
              
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="GrantTypeTxt"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width:24mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientCnt"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 31mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-left:1mm;height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 40mm;font-size:7pt;text-align:left;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered--> 
  		 <td class="sty990ScheduleICol" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 69mm;font-size:7pt;padding-left:1mm;text-align:left;vertical-align:top;">
   		 <xsl:call-template name="PopulateText">
     		 <xsl:with-param name="MaxSize" select="17"/>
     		 <xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
      
    </xsl:if>

      <xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8)) ">
      
<xsl:if test="position()=1">
<tr>


          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/GrantsOtherAsstToIndivInUSGrp"/>
              </xsl:call-template>
       </tr>
           
       </xsl:if>
       
</xsl:if>

								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 2 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"><xsl:with-param name="index">(1)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 3 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"><xsl:with-param name="index">(2)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 4 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"><xsl:with-param name="index">(3)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 5 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"><xsl:with-param name="index">(4)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 6 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"><xsl:with-param name="index">(5)</xsl:with-param></xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 7 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"><xsl:with-param name="index">(6)</xsl:with-param></xsl:call-template>
								</xsl:if>      
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 8 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 8) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"><xsl:with-param name="index">(7)</xsl:with-param></xsl:call-template>
								</xsl:if>      
								 
       

 </table>
 </div>
</div>

 <!--<xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/GrantsOtherAsstToIndivInUSGrp"/>
   
    <xsl:with-param name="containerHeight" select="7"/>
    <xsl:with-param name="containerID" select="'p3TbCtnr'"/>
  </xsl:call-template>-->
  
<div class="styGenericDiv" style="width: 256mm;border-bottom-width:1px;border-top-width:1px;">
  <div class="styPartName" style="width:18mm; height:4.5mm;">Part IV</div>
  <div class="styPartDesc" style="width:238mm;font-weight:bold;height:4.5mm;">
Supplemental Information. <span style="font-weight:normal;">Provide the information required in Part I, line 2; Part III, column (b); and any other additional information.</span>
</div>
</div>

<span style="float:right"> 
         <!--   <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>              
              <xsl:with-param name="containerHeight" select="15"/>
              <xsl:with-param name="containerID" select="'SUPctn'"/>
          </xsl:call-template> --> </span>   
       


<div class="styTableContainer" style="width: 256mm; border-bottom-width:0px;display:table;" id="SUPctn">

<table class="styTable" style="font-size: 7pt; display:table;width: 256mm;" cellspacing="0">
  <thead>
    
    <tr class="styDepTblHdr">
         
       <!--   <th class="styDepTblCell" scope="col" style="width:35mm;border-right-width:1px;border-left-width:0px;text-align:left">Identifier</th>-->

          <th class="styDepTblCell" scope="col" style="width:45mm;border-right-width:1px;border-left-width:0px;text-align:left">Return Reference</th>

          <th class="styDepTblCell" scope="col" style="width:211mm;border-right-width:0px;border-left-width:0px;text-align:left">Explanation</th>
                     

    </tr>
  </thead>
  <tfoot/>
  <tbody valign="top">
  <xsl:if test="($Print!=$Separated) or  (count($FormData/SupplementalInformationDetail) &lt;15)">
 
      <xsl:for-each select="$FormData/SupplementalInformationDetail">
          <tr>
     <!-- <td class="styTableCell" style="border-right-width: 1px; width:35mm;text-align:left ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="IdentifierTxt"/>
            </xsl:call-template>
      </td>-->
       <td class="styTableCell" style="border-right-width: 1px; width:45mm;text-align:left ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
            </xsl:call-template>
         </td>

     <td class="styTableCell" style="border-right-width: 0px; width:201mm;text-align:left ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
            </xsl:call-template>
      </td>
</tr>     
     </xsl:for-each>
    </xsl:if>
  </tbody>
</table>
</div> 

<!--<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
            <xsl:with-param name="containerHeight" select="15"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>-->

<!--Page Footer-->
<div class="pageEnd" style="width:256mm">
  <div style="width:85mm;text-align:right;font-weight:bold; padding-right:4mm; float: right; clear: none;">
  <span class="styBoldText"> Schedule I (Form 990) 2019</span> 
</div>
  
</div>  
<!--END Page Footer-->


 <p style="page-break-before: always"/> 
  
  <br/><br/>
  <div class="styLeftOverTitleLineLandscape" id="LeftoverData" style="display:table;">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainerLandscape">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
      </div>
      
     <table class="styLeftOverTblLandscape">
        <xsl:call-template name="PopulateCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$FormData"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
  </table> 

<br/>

  <!-- Begin SRD for Part II -->
<xsl:if test="($Print = $Separated) and count($FormData/RecipientTable) &gt;= 12">	
 <span class="styRepeatingDataTitle" style="width:256mm">Form 990,Schedule I, Part II, Grants and Other Assistance to Domestic Organizations and Domestic Governments.</span>
 <table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">
 
	<th class="sty990ScheduleILNCol" scope="col" style="border-style: solid; border-color: black;text-align: center;font-size: 7pt;   height: 17mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;width:42mm">
	<b>(a)</b> Name and address of organization<br/>or government</th>

<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;text-align: center;font-size: 7pt; height: 17mm; border-bottom-width: 1px; border-top-width:1px; padding-top:1mm;font-weight:normal;vertical-align:top;width:24mm"><b>(b)</b> EIN</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;text-align: center; height: 17mm; width:20mm;border-bottom-width: 1px;    border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top;width:30mm"><b>(c)</b> IRC section<br/>if applicable</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm; width:32mm; padding-right: 0px;     font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(d)</b> Amount of cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm;width:28mm;  margin-top: 0mm;      padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b> Amount of non-cash<br/>assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm; width:32mm; padding-top: 1mm;     padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b> Method of valuation<br/>(book, FMV, appraisal,<br/>other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 17mm; width:36mm; padding-top: 1mm;   padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(g)</b> Description of<br/>non-cash assistance</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: left; height: 17mm; width: 32m;padding-top: 1mm;   padding-right: 0px; padding-bottom: 0px; padding-left: 2mm; float: none; clear: none;font-size:7pt;font-weight:normal;vertical-align:top"><b>(h)</b> Purpose of grant<br/>or assistance</th>
		</tr>
		
 </thead>
    <tfoot/>
	</table>
	<div class="styTableContainer" style="width: 256mm; border-bottom-width:1px;display:table;height:auto;">
	<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;height:auto;">
          <xsl:for-each select="$FormData/RecipientTable">
            <tr>
             <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
            <td class="sty990ScheduleILNCol" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width:42mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">(<xsl:number value="position()" format="1"/>)
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template><br/>
           
      <xsl:if test="RecipientBusinessName/BusinessNameLine2Txt">
                     <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template><br/>
 </xsl:if>
  <xsl:choose>
                  <xsl:when test="USAddress">                    
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="USAddress"/>
                      </xsl:call-template>                    
                  </xsl:when>
                  <xsl:otherwise><br/>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="ForeignAddress"/>
                      </xsl:call-template>
                  </xsl:otherwise>  
                </xsl:choose>
              </td>
   <td class="sty990ScheduleICol" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width:24mm;font-size:7pt;padding-left: 2.5mm;text-align:center;vertical-align:top"> 
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="RecipientEIN"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width:30mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IRCSectionDesc"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 28mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top;text-align:left;padding-left:.5mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered-->
              <td class="sty990ScheduleICol" style="height:auto;border-style: solid; border-color: black; padding-top: 1mm;width: 36mm;font-size:6pt;text-align:left;vertical-align:top;padding-left:.5mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
                </xsl:call-template> 
             
               
 		</td>  
  
  	 <td class="sty990ScheduleICol" style="height:auto;border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;padding-left:.5mm;text-align:left;vertical-align:top;float:none;">
   		 <xsl:call-template name="PopulateText">
     		 <xsl:with-param name="TargetNode" select="PurposeOfGrantTxt"/>
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </table>
    </div>
    </xsl:if>

<br/>



<!-- SRD for Part III -->
 <xsl:if test="($Print = $Separated) and count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt;= 7">
<span class="styRepeatingDataTitle">Form 990, Schedule I, Part III, Grants and Other Assistance to Domestic Individuals.</span>
 <table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">
			
	<th class="sty990ScheduleILNCol" scope="col" style="width:60mm;text-align: center;font-size: 7pt; height: 14mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top"><b>(a)</b>Type of grant or assistance</th>

 	 <th class="sty990ScheduleIColA" scope="col" style="text-align: center; height: 14mm; width:24mm;border-bottom-  width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(b)</b>Number of<br/>recipients</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:   32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(c)</b>Amount of<br/>cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-top-width:1px;text-align: center; height: 14mm;width:   31mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(d)</b>Amount of<br/>non-cash assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:    40mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:   none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b>Method of valuation (book,<br/>FMV, appraisal, other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:    69mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:   none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b>Description of non-cash assistance</th>
	</tr>
	 </thead>
    <tfoot/>
    </table>
    <div class="styTableContainer" style="width: 256mm; border-bottom-width:1px;display:table;height:auto;">
	<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;height:auto;">
          <xsl:for-each select="$FormData/GrantsOtherAsstToIndivInUSGrp">
            <tr>
             <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>  
            <td class="sty990ScheduleILNCol" style="padding-top: 1mm;width:60mm;font-size:7pt;padding-left: 2.5mm;height:auto;"> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="GrantTypeTxt"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="padding-top: 1mm;width:24mm;font-size:7pt;height:auto;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientCnt"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="padding-top: 1mm;width: 32mm;font-size:7pt;height:auto;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="padding-top: 1mm;width: 31mm;font-size:7pt;height:auto;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-left:.5mm;padding-top: 1mm;width: 40mm;font-size:7pt;text-align: left;height:auto;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered--> 
  		 <td class="sty990ScheduleICol" style="padding-left:.5mm;padding-top: 1mm;width: 69mm;font-size:7pt;padding-right:0mm;text-align: left;height:auto;">
   		 <xsl:call-template name="PopulateText">
     		<xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </table>
    </div>
    </xsl:if>

<!-- END Left Over Table -->

</form>
</body>
</html>
</xsl:template>
<xsl:template name="IRS990SchIPartIITableFillerRow">
<xsl:param name="index"/>
		<tr>
			<td class="styTableCell" style="width:42mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:1px;">
			 <xsl:value-of select="$index"/>
		        <span style="width:3px;border-right-width:1px;"/>
			</td>
			<td class="styTableCell" style="width:24mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:1px;">
				<span style="width:3px"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:1px;">
				<span style="width:3px"/>
			</td>
			<td class="styTableCell" style="width:32mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:1px;">
				<span style="width:3px"/>
			</td>
			<td class="styTableCell" style="width:28mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:1px;">
				<span style="width:3px"/>
			</td>
			<td class="styTableCell" style="width:32mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:1px;">
				<span style="width:3px"/>
			</td>
			<td class="styTableCell" style="width:36mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:1px;">
				<span style="width:3px"/>
			</td>
			<td class="styTableCell" style="width:32mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:0px;">
				<span style="width:3px;"/>
			</td>
			
		</tr>
	</xsl:template>
	
	<xsl:template name="IRS990SchIPartIIITableFillerRow">
	<xsl:param name="index"/>
		<tr>
			<td class="styTableCell" style="width:60mm;border-top-width:1px;height:7.5mm;text-align:left;">
			 <xsl:value-of select="$index"/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:24mm;border-top-width:1px;height:7.5mm;text-align:left;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:32mm;border-top-width:1px;height:7.5mm;text-align:left;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:31mm;border-top-width:1px;height:7.5mm;text-align:left;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:40mm;border-top-width:1px;height:7.5mm;text-align:left;">
				<span style="width:4px"/>
			</td>
			
			<td class="styTableCell" style="width:69mm;border-top-width:1px;height:7.5mm;text-align:left;border-right-width:0px;">
				<span style="width:4px;border-right-width:0px;"/>
			</td>
			
		</tr>
	</xsl:template>
</xsl:stylesheet>