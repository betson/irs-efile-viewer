<?xml version="1.0" encoding="UTF-8"?>
<!-- This stylesheet was created by Sandy Cram and last modified on 11/06/2008 -->
<!-- This stylesheet was last modified by Sandy Cram on 1/8/2009  added shading for SRD -->
<!-- This stylesheet was last modified by Sandy Cram on 6/25/2009 
		changed all references from 2008 to 2009 per WR BSP-091509OTH -->
		<!-- This stylesheet was last modified by Sandy Cram on 8/31/2009 
		changed all references from 2008 to 2009 per WR BSP-091865OTH -->
		<!-- This stylesheet was last modified by Robert Jones on 8/10/2010 
		changed all references from 2009 to 2010 per WR BSP-101319OTH -->
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->
<!-- Last modified on 09/07/2012 by Robert Jones for UWR 58215 after getting the 2012 PDF's-->
<!-- Last modified on 11/18/2012 by Robert Jones for IBM Defect 34317-->
<!-- Last modified on 12/18/2012 by Robert Jones for Email from Tiwana H, TEGE dated 12/17/2012-->
<!-- Last modified on 1/24/2012 by Robert Jones Defect 34967 Part II whitespace at #2 entry, but it was suppose to be putting data below line num per attachment. NPF-->
<!-- Last modified on 10/16/2013 by Robert Jones for IBM Defect 38530 Various-->
<!-- Last modified on 11/14/2013 by Robert Jones Removed identifier column-->
<!-- Last modified on 5/29/2014 for UWR 107551 and pdf dated 2/25/14 by Robert Jones -->
<!-- Last modified on 6/26/2014 for IBM Defect 40581 by Robert Jones -->
<!-- Last modified on 7/31/2014 for IBM Defect 41157 by Robert Jones -->
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

<html>
<head>

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
<xsl:call-template name="DocumentHeaderLandscape"/>
<!--   END WARNING LINE   -->

<!--   BEGIN FORM HEADER   -->
<!--   BEGIN FORM HEADER   -->
<div class="sty990ScheduleIBB" style="width:256mm;height:18mm">
  <div class="sty990ScheduleIFN">
    <div class="sty990ScheduleIFNum" style="width:29mm;">Schedule I
      <br/>
      <span class="sty990ScheduleIFNum2">(Form 990)</span>
    </div>
    
    <div class="sty990ScheduleIAgency" style="padding-top: 8mm">Department of the Treasury
      <br/>Internal Revenue Service
    </div>
  </div>
  <div class="sty990ScheduleIFTBox" style="width:180mm;border-right-width:1px;height:18mm;padding-top:2mm">
    <div class="styMainTitle">Grants and Other Assistance to Organizations,<br />Governments and Individuals in the United States</div>
    <span class="sty990ScheduleIFST">    
Complete if the organization answered "Yes," to Form 990, Part IV, line 21 or 22.
        </span><br />
   <span class="sty990ScheduleIFST">
<img src="{$ImagePath}/990SchI_Bullet.gif" alt="lBullet"/> 
 Attach to Form 990.</span>
 <span class="sty990ScheduleIFST">
 <br />
<img src="{$ImagePath}/990SchI_Bullet.gif" alt="lBullet"/> 
 Information about Schedule I (Form 990) and its instructions is at <!--www.irs.gov/form990.-->
 <a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/form990</i>
            </a>.
 </span>
 </div>
  <div class="IRS990ScheduleI_FormYearBlock" style="height:18mm;float:right">
    <!-- OMB No. -->
    <div class="IRS990ScheduleI_OMB">OMB No. 1545-0047</div>
    <!-- Tax Year -->
<div class="IRS990ScheduleI_TaxYear" style="padding-top:0mm;padding-bottom:0;">
       <span>20<span class="styTYColor">14</span></span>
    
    <div class="sty990ScheduleIPartName" style="font-size:7pt;font-family:verdana;width:45mm;padding-top:0mm;padding-bottom:0mm;height:7mm">Open to Public <br/>Inspection</div>
</div>

 </div></div>
<!--   END FORM HEADER   -->

<!--   BEGIN TAXPAYER INFO   -->
<div style="width:256mm;float:left;clear:left;">
  <div class="sty990ScheduleIBusinessName" style="width:200mm;height:30px;">Name of the organization
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
  <div class="sty990ScheduleIIN" style="width:56mm;height:30px;"><span style="font-weight:bold;float:left; clear: none; margin-left: 1mm">Employer identification number</span><br/>
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
 <div class="styLNDescLandscape" style="border-top-width:1px;padding-top:1mm; ">
   
 Does the organization maintain records to substantiate the amount of the grants or assistance, the grantees' eligibility for the grants or assistance, and<br/> the selection criteria used to award the grants or assistance?

<span style="letter-spacing:3mm; font-weight:bold;">....................................</span> 
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
   <div class="styLNDescLandscape " style="padding-top:0mm ">
   Describe in Part IV the organization's procedures for monitoring the use of grant funds in the United States.
</div>
</div>
<!-- Begin Part II -->
<div class="styBB" style="width: 256mm;border-top-width:1px">
  <div class="sty990ScheduleIPartName">Part II</div>
  <div class="sty990ScheduleIPartDesc">Grants and Other Assistance to Domestic Organizations and Domestic Governments.<span style="font-weight:normal;padding-top:1mm"> Complete if the organization answered "Yes" to <br/>Form 990, Part IV, line 21,  for any recipient that received more than $5,000. Part II can be duplicated if additional space is needed.</span>    
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
   
   <div class="styGenericDiv" style="float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
			<xsl:with-param name="TargetNode" select="$FormData/RecipientTable"/>
								<xsl:with-param name="containerHeight" select="12"/>
								<xsl:with-param name="containerID" select=" 'p2TbCtnr' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						
   </div>     
   
   </div>

  <!--Part II  table -->
  <div class="styTableContainerLandscape" id="p2TbCtnr"> 
     
<!-- print logic -->
    <xsl:call-template name="SetInitialState"/> 
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;margin-left:0mm">
<thead class="styTableThead">
<!--<div style="width: 256mm;">-->
  <tr>
	
	<th class="sty990ScheduleILNCol" scope="col" style="border-style: solid; border-color: black;text-align: center;font-size: 7pt;   height: 15mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;width:42mm">
	<b>(a)</b> Name and address of organization<br/>or government</th>

<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;text-align: center;font-size: 7pt; height: 15mm; border-bottom-width: 1px; border-top-width:1px; padding-top:1mm;font-weight:normal;vertical-align:top;width:24mm"><b>(b)</b> EIN</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;text-align: center; height: 15mm; width:20mm;border-bottom-width: 1px;    border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top;width:30mm"><b>(c)</b> IRC section<br/>if applicable</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-right: 0px;     font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(d)</b> Amount of cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 15mm;width:32mm;  margin-top: 0mm;      padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b> Amount of non-cash<br/>assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-top: 1mm;     padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b> Method of valuation<br/>(book, FMV, appraisal,<br/>other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-top: 1mm;   padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(g)</b> Description of<br/>non-cash assistance</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: left; height: 15mm; width: 32m;padding-top: 1mm;   padding-right: 0px; padding-bottom: 0px; padding-left: 2mm; float: none; clear: none;font-size:7pt;font-weight:normal;vertical-align:top"><b>(h)</b> Purpose of grant<br/>or assistance</th>
		</tr>
	</thead>
        <tfoot/>
        <tbody>
	
<!--   END HEADER   -->

<!--   BEGIN LINE 1   -->

	<xsl:if test="($Print != $Separated) or count($FormData/RecipientTable) &lt;= 12">
          <xsl:for-each select="$FormData/RecipientTable">
            <tr>
            <td class="sty990ScheduleILNCol" style="border-style: solid; border-color: black;padding-top: 1mm;width:42mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">(<xsl:number value="position()" format="1"/>)
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
   <td class="sty990ScheduleICol" style="border-style: solid; border-color: black;padding-top: 1mm;width:24mm;font-size:7pt;padding-left: 2.5mm;text-align:center;vertical-align:top"> 
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="RecipientEIN"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="border-style: solid; border-color: black;padding-top: 1mm;width:32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IRCSectionDesc"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top;text-align:left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered-->
              <td class="sty990ScheduleICol" style="border-style: solid; border-color: black; padding-top: 1mm;width: 32mm;font-size:7pt;text-align:left;vertical-align:top">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
                </xsl:call-template> 
             
               
 		</td>  
  
  		 <td class="sty990ScheduleICol" style="border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;padding-right:4mm;text-align:left;vertical-align:top">
   		 <xsl:call-template name="PopulateText">
     		 <xsl:with-param name="TargetNode" select="PurposeOfGrantTxt"/>
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </xsl:if>

        <!--<xsl:if test="count($FormData/RecipientTable) &lt; 1 or             (($Print = $Separated) and (count($FormData/RecipientTable) &gt; 12)) ">-->
        <xsl:if test="count($FormData/RecipientTable) &lt; 1 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated)) ">
          <tr>
            <td class="sty990ScheduleILNCol" style="border-bottom-width:1px;width">
       <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/RecipientTable"/>
              </xsl:call-template>
              <span style="width:3px"/>
           </td>
              <td class="sty990ScheduleICol">
              <span style="width:3px"/>
           </td>  <td class="sty990ScheduleICola">
              <span style="width:3px"/>
           </td><td class="sty990ScheduleIColB">
              <span style="width:3px"/>
           </td>
		 <td class="sty990ScheduleIColC">
              <span style="width:3px"/>
           </td>
		<td class="sty990ScheduleICol">
              <span style="width:3px"/>
           </td>
		<td class="sty990ScheduleICol">
              <span style="width:3px"/>
            </td>
		<td class="sty990ScheduleICol">
              <span style="width:3px;"/>
           </td>
		</tr>
        </xsl:if>
        
        
								<xsl:if test="count($FormData/RecipientTable) &lt; 2 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 3 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 4 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 5 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 6 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 7 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 8 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 9 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 10 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 11 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/RecipientTable) &lt; 12 or ((count($FormData/RecipientTable) &gt; 12) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIITableFillerRow"/>
								</xsl:if>
			</tbody>
        </table>   
</div>  
</div>
  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/RecipientTable"/>
    
    <xsl:with-param name="containerHeight" select="12"/>
    <xsl:with-param name="containerID" select="'p2TbCtnr'"/>
  </xsl:call-template> 


<!--   END LINE 1   -->

<!-- Line 2 -->
       <div style="width:256mm;padding-top:1mm">
        <div class="styLNLeftNumBox">2</div>
        <div class="styLNDescLandscape" style="width:216mm">Enter total number of section 501(c)(3) and government organizations listed in the line 1 table
          <!--Dotted Line-->
         <span class="styNoAudioRead" style="font-weight:bold;">
             <span style="letter-spacing:4mm; font-weight:bold; "> ................ </span>  <span style="letter-spacing:2mm; font-weight:bold; ">  
         </span>
          </span>
   <img src="{$ImagePath}/990SchI_Bullet.gif" alt="Bullet Image"/>
   </div>
    <div class="styFixedUnderline" style="width:30mm;text-align:right;padding-right:1mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/Total501c3OrgCnt"/>
          </xsl:call-template>
        </div>
          
      </div>      
 
     

      
  <div class="styBB" style="width:256mm;">
        <div class="styLNLeftNumBox">3</div>
        <div class="styLNDescLandscape" style="width:216mm;">Enter total number of other organizations listed in the line 1 table
          <!--Dotted Line-->
         <span class="styNoAudioRead" style="font-weight:bold;">
            <span style="letter-spacing:4mm; font-weight:bold; ">  
        ........................  </span>   <span style="letter-spacing:2mm; font-weight:bold; ">  
      .    </span>          
        
          </span>
    <img src="{$ImagePath}/990SchI_Bullet.gif" alt="Bullet Image"/>
   </div>
    <div class="styFixedUnderline" style="width:30mm;text-align:right;padding-right:1mm;">
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
  <span class="styBoldText"> Schedule I (Form 990) 2014</span> 
</div>
</div>
<!--     END FORM FOOTER   -->
  <div class="pageEnd"/>
<br/>      

  
  <div class="styBB" style="width:256mm; float: none; clear:none;border-bottom-width:1px">  
    <div style="float:left">Schedule I (Form 990) 2014</div>
    <div style="float:right">Page <span style="font-weight:bold;font-size:8pt;padding-right:4mm">2</span></div>                    
  </div>  

<!--   BEGIN HEADER   -->
<div class="styBB" style="width: 256mm;">
  <div class="sty990ScheduleIPartName">Part III</div>
 <div class="sty990ScheduleIPartDesc">Grants and Other Assistance to Domestic Individuals.
       <span style="font-weight:normal;">Complete if the organization answered "Yes" to Form 990, Part IV, line 22.<br/>Part III can be duplicated if additional space is needed.
</span> </div>

<!--==============================Part III Table ======================================-->

<xsl:variable name="table2RowCount" select="count($FormData/GrantsOtherAsstToIndivInUSGrp)"/>
 

  <span style="width:1mm;text-align:right;float:right; clear: none;padding-left:4mm">
    <xsl:call-template name="SetDynamicTableToggleRowCount">
       <xsl:with-param name="DataRowCount" select="$table2RowCount"/>
       <xsl:with-param name="containerHeight" select="7"/>
       <xsl:with-param name="containerID" select=" 'p3TbCtnr' "/>
     </xsl:call-template>
   </span>
 </div>

  <!--Part I-C  line 5 table -->
  <div class="styTableContainerLandscape" id="p3TbCtnr"> 
     
<!-- print logic -->
    <xsl:call-template name="SetInitialState"/> 
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;margin-left:0mm">
<thead class="styTableThead">

<!--<div style="width: 256mm;">-->
  <tr>
			
	<th class="sty990ScheduleILNCol" scope="col" style="border-style: solid; border-color: black;width:60mm;text-align: center;font-size: 7pt; height: 14mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top"><b>(a)</b>Type of grant or assistance</th>

 	 <th class="sty990ScheduleIColA" scope="col" style="border-style: solid; border-color: black;text-align: center; height: 14mm; width:24mm;border-bottom-width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(b)</b>Number of<br/>recipients</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 14mm; width:32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(c)</b>Amount of<br/>cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 14mm;width:31mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(d)</b>Amount of<br/>non-cash assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 14mm; width:40mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b>Method of valuation (book,<br/>FMV, appraisal, other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-style: solid; border-color: black;border-top-width:1px;text-align: center; height: 14mm; width:59mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b>Description of non-cash assistance</th>
	</tr>
	</thead>
        <tfoot/>
        <tbody>

		
		
<!--   END HEADER   -->

<!--   Part III Table  -->

	<xsl:if test="($Print != $Separated) or count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt;= 7">
          <xsl:for-each select="$FormData/GrantsOtherAsstToIndivInUSGrp">
            <tr>
              <td class="sty990ScheduleILNCol" style="border-style: solid; border-color: black;padding-top: 1mm;width:60mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top;">(<xsl:number value="position()" format="1"/>) 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="GrantTypeTxt"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="border-style: solid; border-color: black;padding-top: 1mm;width:24mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientCnt"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="border-style: solid; border-color: black;padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="border-style: solid; border-color: black;padding-top: 1mm;width: 31.75mm;font-size:7pt;vertical-align:top;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="border-style: solid; border-color: black;padding-top: 1mm;width: 40mm;font-size:7pt;text-align:left;vertical-align:top;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered--> 
  		 <td class="sty990ScheduleICol" style="border-style: solid; border-color: black;padding-top: 1mm;width: 59mm;font-size:7pt;padding-right:3mm;text-align:left;vertical-align:top;">
   		 <xsl:call-template name="PopulateText">
     		 <xsl:with-param name="MaxSize" select="17"/>
     		 <xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </xsl:if>

      
<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 1 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 7) and ($Print = $Separated))">
          <tr>
                 <td class="sty990ScheduleILNCol">
       <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$FormData/GrantsOtherAsstToIndivInUSGrp"/>
              </xsl:call-template>
              <span style="width:3px"/>
           </td>
            <td class="sty990ScheduleIColA">
              <span style="width:3px"/>
           </td>
		<td class="sty990ScheduleIColB">
              <span style="width:3px"/>
           </td>
		<td class="sty990ScheduleIColC">
              <span style="width:3px"/>
            </td>
		<td class="sty990ScheduleICol">
              <span style="width:3px;"/>
           </td>
<td class="sty990ScheduleICol">
              <span style="width:3px;"/>
           </td>		
		</tr>
       </xsl:if>
 
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 2 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 3 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 4 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 5 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 6 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrantsOtherAsstToIndivInUSGrp) &lt; 7 or ((count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>       
       </tbody>
     </table>   

</div>
 <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/GrantsOtherAsstToIndivInUSGrp"/>
   
    <xsl:with-param name="containerHeight" select="7"/>
    <xsl:with-param name="containerID" select="'p3TbCtnr'"/>
  </xsl:call-template>
  
<div class="styGenericDiv" style="width: 256mm;border-bottom-width:1px;">
  <div class="styPartName" style="width:18mm;">Part IV</div>
  <div class="styPartDesc" style="width:238mm;font-weight:bold;">
Supplemental Information. <span style="font-weight:normal;">Provide the information required in Part I, line 2, Part III, column (b), and any other additional information.</span>
</div>
</div>

<span style="float:right"> 
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>              
              <xsl:with-param name="containerHeight" select="15"/>
              <xsl:with-param name="containerID" select="'SUPctn'"/>
          </xsl:call-template>  </span>   
       


<div class="styTableContainer" style="width: 256mm; border-bottom-width:1px" id="SUPctn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black;width:256mm" cellspacing="0">
  <thead>
    
    <tr class="styDepTblHdr">
         
       <!--   <th class="styDepTblCell" scope="col" style="width:35mm;border-right-width:1px;border-left-width:0px;text-align:left">Identifier</th>-->

          <th class="styDepTblCell" scope="col" style="width:45mm;border-right-width:1px;border-left-width:0px;text-align:left">Return Reference</th>

          <th class="styDepTblCell" scope="col" style="width:166mm;border-right-width:1px;border-left-width:0px;text-align:left">Explanation</th>
                     

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

<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
            <xsl:with-param name="containerHeight" select="15"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>

<!--Page Footer-->
<div class="pageEnd" style="width:256mm">
  <div style="width:85mm;text-align:right;font-weight:bold; padding-right:4mm; float: right; clear: none;">
  <span class="styBoldText"> Schedule I (Form 990) 2014</span> 
</div>
  
</div>  
<!--END Page Footer-->



  
  <br/><br/>
  <div class="styLeftOverTitleLineLandscape" id="LeftoverData">
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
 <span class="styRepeatingDataTitle" style="width:228mm">Form 990,Schedule I, Part II, Grants and Other Assistance to Domestic Organizations and Domestic Governments.</span>
 <table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">
 
	<th class="sty990ScheduleILNCol" scope="col" style="text-align: center;font-size: 7pt; height: 15mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;width:42mm"><b>(a)</b> Name and address of organization<br/>or government</th>

<th class="sty990ScheduleICol" scope="col" style="text-align: center;font-size: 7pt; height: 15mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;width:24mm"><b>(b)</b> EIN</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="text-align: center; height: 15mm; width:20mm;border-bottom-width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top;width:30mm"><b>(c)</b> IRC Code section<br/>if applicable</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(d)</b> Amount of cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-top-width:1px;text-align: center; height: 15mm;width:32mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b> Amount of non-cash<br/>assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b> Method of valuation<br/>(book, FMV, appraisal,<br/>other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(g)</b> Description of<br/>non-cash assistance</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: left; height: 15mm; width: 32m;padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 2mm; float: none; clear: none;font-size:7pt;font-weight:normal;vertical-align:top"><b>(h)</b> Purpose of grant<br/>or assistance</th>
		</tr>
		
 </thead>
    <tfoot/>
	
	
          <xsl:for-each select="$FormData/RecipientTable">
            <tr>
             <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>  <td class="sty990ScheduleILNCol" style="padding-top: 1mm;width:42mm;font-size:7pt;padding-left: 2.5mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template>
               <xsl:if test="RecipientBusinessName/BusinessNameLine2Txt">
                      <br/>
 <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientBusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template>
 </xsl:if>
  <xsl:choose>
                  <xsl:when test="USAddress">                    
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="USAddress"/>
                      </xsl:call-template>                    
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="ForeignAddress"/>
                      </xsl:call-template>
                  </xsl:otherwise>  
                </xsl:choose></td>

   <td class="sty990ScheduleICol" style="padding-top: 1mm;width:24mm;font-size:7pt;padding-left: 2.5mm;text-align: center;"> 
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="RecipientEIN"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="padding-top: 1mm;width:32mm;font-size:7pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IRCSectionDesc"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 32mm;font-size:7pt;text-align: left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered-->
              <td class="sty990ScheduleICol" style=" padding-top: 1mm;width: 32mm;font-size:7pt;text-align: left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
                </xsl:call-template> 
             
               
 		</td>  
  
  		 <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 32mm;font-size:7pt;padding-right:4mm;text-align: left;">
   		 <xsl:call-template name="PopulateAmount">
     		 <!--<xsl:with-param name="MaxSize" select="12"/>-->
     		 <xsl:with-param name="TargetNode" select="PurposeOfGrantTxt"/>
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </table></xsl:if>

<br/>



<!-- SRD for Part III -->
 <xsl:if test="($Print = $Separated) and count($FormData/GrantsOtherAsstToIndivInUSGrp) &gt;= 7">
<span class="styRepeatingDataTitle">Form 990, Schedule I, Part III, Grants and Other Assistance to Domestic Individuals.</span>
 <table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">
			
	<th class="sty990ScheduleILNCol" scope="col" style="width:60mm;text-align: center;font-size: 7pt; height: 14mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top"><b>(a)</b>Type of grant or assistance</th>

 	 <th class="sty990ScheduleIColA" scope="col" style="text-align: center; height: 14mm; width:24mm;border-bottom-  width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(b)</b>Number of<br/>recipients</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:   32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(c)</b>Amount of<br/>cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-top-width:1px;text-align: center; height: 14mm;width:   31mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(d)</b>Amount of<br/>non-cash assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:    40mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:   none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b>Method of valuation (book,<br/>FMV, appraisal, other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:    59mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:   none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b>Description of non-cash assistance</th>
	</tr>
	 </thead>
    <tfoot/>
	
          <xsl:for-each select="$FormData/GrantsOtherAsstToIndivInUSGrp">
            <tr>
             <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>  
            <td class="sty990ScheduleILNCol" style="padding-top: 1mm;width:60mm;font-size:7pt;padding-left: 2.5mm;"> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="GrantTypeTxt"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="padding-top: 1mm;width:24mm;font-size:7pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientCnt"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="padding-top: 1mm;width: 32mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 40mm;font-size:7pt;text-align: left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered--> 
  		 <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 59mm;font-size:7pt;padding-right:3mm;text-align: left;">
   		 <xsl:call-template name="PopulateText">
     		<xsl:with-param name="TargetNode" select="NonCashAssistanceDesc"/>
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </table></xsl:if>

<!-- END Left Over Table -->
</form>
</body>
</html>
</xsl:template>
<xsl:template name="IRS990SchIPartIITableFillerRow">
		<tr>
			<td class="styTableCellText">
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:32mm;border-right-width:0px">
				<span style="width:4px;border-right-width:0px;"/>
			</td>
			
		</tr>
	</xsl:template>
	
	<xsl:template name="IRS990SchIPartIIITableFillerRow">
		<tr>
			<td class="styTableCellText">
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			
			<td class="styTableCell" style="border-right-width:0px">
				<span style="width:4px;border-right-width:0px;"/>
			</td>
			
		</tr>
	</xsl:template>
</xsl:stylesheet>