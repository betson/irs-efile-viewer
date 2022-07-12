<?xml version="1.0" encoding="UTF-8" ?>

<!-- This stylesheet was created by Sandy Cram and last modified on 11/06/2008 -->
<!-- This stylesheet was last modified by Sandy Cram on 1/8/2009  added shading for SRD -->
<!-- This stylesheet was last modified by Sandy Cram on 6/25/2009 
		changed all references from 2008 to 2009 per WR BSP-091509OTH -->
		<!-- This stylesheet was last modified by Sandy Cram on 8/31/2009 
		changed all references from 2008 to 2009 per WR BSP-091865OTH -->
		<!-- This stylesheet was last modified by Robert Jones on 8/10/2010 
		changed all references from 2009 to 2010 per WR BSP-101319OTH -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleIStyle.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleI" />

<xsl:template match="/">

<html>
<head>

<title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="private"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Form 990 Schedule I"/>
<META name="GENERATOR" content="IBM WebSphere Studio"/>

<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
<xsl:call-template name="InitJS"></xsl:call-template>
<style type="text/css">
<xsl:if test="not($Print) or $Print=''">
    <!-- Form 990ScheduleI CSS Styles are located in the template called below -->
    <xsl:call-template name="IRS990ScheduleIStyle"></xsl:call-template>
    <xsl:call-template name="AddOnStyle"></xsl:call-template>
</xsl:if>
</style>

<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="IRS990ScheduleI">
<!--   BEGIN WARNING LINE  -->
<xsl:call-template name="DocumentHeaderLandscape"></xsl:call-template>
<!--   END WARNING LINE   -->

<!--   BEGIN FORM HEADER   -->
<!--   BEGIN FORM HEADER   -->
<div class="sty990ScheduleIBB" style="width:256mm;height:18mm">
  <div class="sty990ScheduleIFN" >
    <div class="sty990ScheduleIFNum" style="width:29mm;">Schedule I
      <br/>
      <span class="sty990ScheduleIFNum2">(Form 990)</span>
    </div>
    
    <div class="sty990ScheduleIAgency" style="padding-top: 8mm">Department of the Treasury
      <br/>Internal Revenue Service
    </div>
  </div>
  <div class="sty990ScheduleIFTBox" style="width:180mm;border-right-width:1px;height:18mm;padding-top:4mm">
    <div class="styMainTitle">Grants and Other Assistance to Organizations,<br />Governments and Individuals in the United States</div>
    <span class="sty990ScheduleIFST">
    
Complete if the organization answered "Yes," to Form 990, Part IV, line 21 or 22.
        </span><br />
   <span class="sty990ScheduleIFST">
<img src="{$ImagePath}/990SchI_Bullet.gif" alt="lBullet"/> 
 Attach to Form 990</span>
 </div>
  <div class="IRS990ScheduleI_FormYearBlock" style="height:18mm;float:right">
    <!-- OMB No. -->
    <div class="IRS990ScheduleI_OMB">OMB No. 1545-0047</div>
    <!-- Tax Year -->
<div class="IRS990ScheduleI_TaxYear" style="padding-top:0mm;padding-bottom:0;">
       <span>20<span class="styTYColor">10</span></span>
    
    <div class="sty990ScheduleIPartName" style="font-size:7pt;font-family:verdana;width:45mm;padding-top:0mm;padding-bottom:0mm;height:7mm">Open to Public <br />Inspection</div>
</div>

 </div></div>
<!--   END FORM HEADER   -->

<!--   BEGIN TAXPAYER INFO   -->
<div style="width:256mm;float:left;clear:left;">
  <div class="sty990ScheduleIBusinessName" style="width:200mm;height:30px;">Name of the organization
  <br/>
    <span style="font-family: verdana, arial, sans-serif;font-size: 7pt;">
      <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
    </xsl:call-template>
    <br />
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
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
   
 Does the organization maintain records to substantiate the amount of the grants or assistance, the grantees' eligibility for the grants or assistance, and<br /> the selection criteria used to award the grants or assistance?

<span style="letter-spacing:3mm; font-weight:bold;">....................................</span> 
</div>
<span style="float:right;"> 
<span style="padding-top:4mm;">
       <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/RecordsMaintained" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/RecordsMaintained" />
        <xsl:with-param name="BackupName">Form990ScheduleIRecoredMaintainedYes</xsl:with-param>
      </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/RecordsMaintained" />
        </xsl:call-template>            
        Yes
      </label>
      <span style="width:4mm;padding-top:4mm;"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$FormData/RecordsMaintained" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$FormData/RecordsMaintained" />
        <xsl:with-param name="BackupName">Form990ScheduleIRecoredMaintainedNo</xsl:with-param>
       </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold;">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/RecordsMaintained" />
        </xsl:call-template>            
        No
      </label></span> 
</div>

   <div style=" width: 256mm; ">
   <div class="styLNLeftNumBox" >2</div>
   <div class="styLNDescLandscape "  style="padding-top:0mm ">
   Describe in Part IV the organization's procedures for monitoring the use of grant funds in the United States.
</div>
</div>
<!-- Begin Part II -->
<div class="styBB" style="width: 256mm;border-top-width:1px;border-bottom-width:1px">
  <div class="styPartName">Part II</div>
  <div class="styPartDesc" style="width: 242mm;">Grants and Other Assistance to Governments and Organizations in the United States.<span style="font-weight:normal"> Complete if the organization answered "Yes" to <br />Form 990, Part IV, line 21 for any recipient that received more than $5,000. Check this box if no one recipient received more than $5,000. Use <br />Part IV and Schedule I-1 (Form 990) if additional space is needed </span>    
<span class="styNoAudioRead" style="font-weight:bold;"> </span>   
   
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
</label></span>

<!-- ================ Begin changes for Part II Table ==================================== -->
<xsl:variable name="table1RowCount" select="count($FormData/RecipientTable)"/>
     
 <div class="styGenericDiv" style="width:2mm;float:right;clear:none">
  <!--<span style="width:4mm;text-align:right;float:right; clear: none;">-->
    <xsl:call-template name="SetDynamicTableToggleRowCount">
       <xsl:with-param name="DataRowCount" select="$table1RowCount"/>
       <xsl:with-param name="containerHeight" select="12"/>
       <xsl:with-param name="containerID" select=" 'p1TbCtnr' "/>
     </xsl:call-template>
   <!--</span>-->
   </div>     
   
   </div>

  <!--Part I  table -->
  <div class="styTableContainerLandscape" id="p1TbCtnr"> 
     
<!-- print logic -->
    <xsl:call-template name="SetInitialState"/> 
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;margin-left:0mm">
<thead class="styTableThead">
<!--<div style="width: 256mm;">-->
  <tr>
	
	<th class="sty990ScheduleILNCol" scope="col" style="text-align: center;font-size: 7pt; 
	height: 15mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;width:42mm">
	<b>(a)</b> Name and address of organization<br/>or government</th>

<th class="sty990ScheduleICol" scope="col" style="text-align: center;font-size: 7pt; height: 15mm; border-bottom-width: 1px; border-top-width:1px;
padding-top:1mm;font-weight:normal;vertical-align:top;width:24mm"><b>(b)</b> EIN</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="text-align: center; height: 15mm; width:20mm;border-bottom-width: 1px;
 	 border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top;width:30mm"><b>(c)</b> IRC Code section<br/>if applicable</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-right: 0px; 
 	 font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(d)</b> Amount of cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-top-width:1px;text-align: center; height: 15mm;width:32mm;  margin-top: 0mm;
    	padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b> Amount of non-cash<br/>assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-top: 1mm; 
  	padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b> Method of valuation<br/>(book, FMV, appraisal,<br/>other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-top: 1mm; 
	padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(g)</b> Description of<br />non-cash assistance</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: left; height: 15mm; width: 32m;padding-top: 1mm; 
	padding-right: 0px; padding-bottom: 0px; padding-left: 2mm; float: none; clear: none;font-size:7pt;font-weight:normal;vertical-align:top"><b>(h)</b> Purpose of grant<br/>or assistance</th>
		</tr>
	</thead>
        <tfoot></tfoot>
        <tbody>
	
<!--   END HEADER   -->

<!--   BEGIN LINE 1   -->

	<xsl:if test="($Print != $Separated) or count($FormData/RecipientTable) &lt;= 12">
          <xsl:for-each select="$FormData/RecipientTable">
            <tr>
            <td class="sty990ScheduleILNCol" style="padding-top: 1mm;width:42mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">(<xsl:number value="position()" format="1"/>)
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientNameBusiness/BusinessNameLine1"/>
                </xsl:call-template>
           
      <xsl:if test="RecipientNameBusiness/BusinessNameLine2">
                      <br />
 <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientNameBusiness/BusinessNameLine2"/>
                </xsl:call-template>
 </xsl:if>
  <xsl:choose>
                  <xsl:when test="AddressUS">                    
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="AddressUS" />
                      </xsl:call-template>                    
                  </xsl:when>
                  <xsl:otherwise><br />
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="AddressForeign" />
                      </xsl:call-template>
                  </xsl:otherwise>  
                </xsl:choose>
              </td>
   <td class="sty990ScheduleICol" style="padding-top: 1mm;width:24mm;font-size:7pt;padding-left: 2.5mm;text-align:center;vertical-align:top"> 
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EINOfRecipient"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="padding-top: 1mm;width:32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IRCSection"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfCashGrant"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfNonCashAssistance"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top;text-align:left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MethodOfValuation"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered-->
              <td class="sty990ScheduleICol" style=" padding-top: 1mm;width: 32mm;font-size:7pt;text-align:left;vertical-align:top">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DescriptionOfNonCashAssistance"/>
                </xsl:call-template> 
             
               
 		</td>  
  
  		 <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 32mm;font-size:7pt;padding-right:4mm;text-align:left;vertical-align:top">
   		 <xsl:call-template name="PopulateText">
     		 <xsl:with-param name="TargetNode" select="PurposeOfGrant" />
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </xsl:if>

        <xsl:if  test="count($FormData/RecipientTable) &lt; 2 or
            (($Print = $Separated) and (count($FormData/RecipientTable) &gt; 12)) ">
          <tr>
            <td class="sty990ScheduleILNCol" style="border-bottom-width:1px">
       <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" 			 select="$FormData/RecipientTable" />
              </xsl:call-template>
              <span style="width:3px" />
           </td>
              <td class="sty990ScheduleICol" >
              <span style="width:3px" />
           </td>  <td class="sty990ScheduleICola" >
              <span style="width:3px" />
           </td><td class="sty990ScheduleIColB" >
              <span style="width:3px" />
           </td>
		 <td class="sty990ScheduleIColC" >
              <span style="width:3px" />
           </td>
		<td class="sty990ScheduleICol" >
              <span style="width:3px" />
           </td>
		<td class="sty990ScheduleICol" >
              <span style="width:3px" />
            </td>
		<td class="sty990ScheduleICol" >
              <span style="width:3px;" />
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
    <xsl:with-param name="TargetNode" select="$FormData/RecipientTable" />
    <xsl:with-param name="headerHeight" select="2" />
    <xsl:with-param name="containerHeight" select="12"/>
    <xsl:with-param name="containerID" select="'p1TbCtnr'" />
  </xsl:call-template> 


<!--   END LINE 1   -->

<!-- Line 2 -->
       <div style="width:256mm;padding-top:1mm">
        <div class="styLNLeftNumBox" >2</div>
        <div class="styLNDescLandscape" style="width:216mm">Enter total number of section 501(c)(3) and government organizations
          <!--Dotted Line-->
         <span class="styNoAudioRead" style="font-weight:bold;">
             <span style="letter-spacing:4mm; font-weight:bold; "> ......................... </span>  <span style="letter-spacing:2mm; font-weight:bold; ">  
         </span>
          </span>
   <img src="{$ImagePath}/990SchI_Bullet.gif" alt="Bullet Image"/>
   </div>
    <div class="styFixedUnderline" style ="width:30mm;text-align:right;padding-right:1mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/TotalNbrOf501C3AndGovtGrants" />
          </xsl:call-template>
        </div>
          
      </div>      
 
     

      
  <div class="styBB" style="width:256mm;">
        <div class="styLNLeftNumBox" >3</div>
        <div class="styLNDescLandscape" style="width:216mm;">Enter total number of other organizations
          <!--Dotted Line-->
         <span class="styNoAudioRead" style="font-weight:bold;">
            <span style="letter-spacing:4mm; font-weight:bold; ">  
        ................................  </span>   <span style="letter-spacing:2mm; font-weight:bold; ">  
      .    </span>          
        
          </span>
    <img src="{$ImagePath}/990SchI_Bullet.gif" alt="Bullet Image" />
   </div>
    <div class="styFixedUnderline" style ="width:30mm;text-align:right;padding-right:1mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/TotalNbrOfOtherOrganizations" />
          </xsl:call-template>
        </div>
         
      </div>      
 

<!--   BEGIN FORM FOOTER  -->
<!--Page Footer-->

<div class="sty990ScheduleIFormFooter" style="padding-top:1mm;">
  <div style="width:140mm;font-weight:bold; float: left; clear: none;">For Privacy Act and  Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
  <div style="width:19mm;font-weight:normal; float: left; clear: none;border-top-width:1px">Cat. No. 50055P</div>
  <div style="width:85mm;text-align:right;font-weight:bold; padding-right:4mm; float: right; clear: none;">
  <span class="styBoldText"> Schedule I (Form 990) 2010</span> 
</div>
</div>
<!--     END FORM FOOTER   -->
  <div class="pageEnd"></div>
<br/>      

  
  <div class="styBB" style="width:256mm; float: none; clear:none;border-bottom-width:1px">  
    <div style="float:left">Schedule I (Form 990) 2010</div>
    <div style="float:right">Page <span style="font-weight:bold;font-size:8pt;padding-right:4mm">2</span></div>                    
  </div>  

<!--   BEGIN HEADER   -->
<div class="styBB"  style="width: 256mm;border-top-width:1px">
  <div class="sty990ScheduleIPartName">Part III</div>
 <div class="sty990ScheduleIPartDesc" >Grants and Other Assistance to Individuals in the United States. 
       <span style="font-weight:normal;">Complete if the organization answered "Yes" to Form 990, Part IV, line 22.<br />Use Schedule I-1 (Form 990) if additional space is needed.
</span> </div>

<!--==============================Part III Table ======================================-->

<xsl:variable name="table2RowCount" select="count($FormData/Form990ScheduleIPartIII)"/>
 

  <span style="width:1mm;text-align:right;float:right; clear: none;padding-left:4mm">
    <xsl:call-template name="SetDynamicTableToggleRowCount">
       <xsl:with-param name="DataRowCount" select="$table2RowCount"/>
       <xsl:with-param name="containerHeight" select="7"/>
       <xsl:with-param name="containerID" select=" 'p2TbCtnr' "/>
     </xsl:call-template>
   </span>
 </div>

  <!--Part I-C  line 5 table -->
  <div class="styTableContainerLandscape" id="p2TbCtnr"> 
     
<!-- print logic -->
    <xsl:call-template name="SetInitialState"/> 
    <!-- end -->        
    <table cellspacing="0" style="font-size:7pt;margin-left:0mm">
<thead class="styTableThead">

<!--<div style="width: 256mm;">-->
  <tr>
			
	<th class="sty990ScheduleILNCol" scope="col" style="width:60mm;text-align: center;font-size: 7pt; height: 14mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top"><b>(a)</b>Type of grant or assistance</th>

 	 <th class="sty990ScheduleIColA" scope="col" style="text-align: center; height: 14mm; width:24mm;border-bottom-width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(b)</b>Number of<br/>recipients</th>

 	 <th class="sty990ScheduleIColB"  scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(c)</b>Amount of<br/>cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-top-width:1px;text-align: center; height: 14mm;width:31mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(d)</b>Amount of<br/>non-cash assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:40mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b>Method of valuation (book,<br/>FMV, appraisal, other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:59mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b>Description of non-cash assistance</th>
	</tr>
	</thead>
        <tfoot></tfoot>
        <tbody>

		
		
<!--   END HEADER   -->

<!--   Part III Table  -->

	<xsl:if test="($Print != $Separated) or count($FormData/Form990ScheduleIPartIII) &lt;= 7">
          <xsl:for-each select="$FormData/Form990ScheduleIPartIII">
            <tr>
              <td class="sty990ScheduleILNCol" style="padding-top: 1mm;width:60mm;font-size:7pt;padding-left: 2.5mm;">(<xsl:number value="position()" format="1"/>) 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TypeOfGrant"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="padding-top: 1mm;width:24mm;font-size:7pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NumberOfRecipients"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="padding-top: 1mm;width: 32mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfCashGrant"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfNonCashAssistance"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 40mm;font-size:7pt;text-align:left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MethodOfValuation"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered--> 
  		 <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 59mm;font-size:7pt;padding-right:3mm;text-align:left">
   		 <xsl:call-template name="PopulateText">
     		 <xsl:with-param name="MaxSize" select="17" />
     		 <xsl:with-param name="TargetNode" select="DescriptionOfNonCashAssistance" />
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </xsl:if>

      
<xsl:if  test="count($FormData/Form990ScheduleIPartIII) &lt; 3 or
            (($Print = $Separated) and (count($FormData/Form990ScheduleIPartIII) &gt; 7)) ">
          <tr>
                 <td class="sty990ScheduleILNCol" >
       <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" 			 select="$FormData/Form990ScheduleIPartIII" />
              </xsl:call-template>
              <span style="width:3px" />
           </td>
            <td class="sty990ScheduleIColA" >
              <span style="width:3px" />
           </td>
		<td class="sty990ScheduleIColB" >
              <span style="width:3px" />
           </td>
		<td class="sty990ScheduleIColC" >
              <span style="width:3px" />
            </td>
		<td class="sty990ScheduleICol" >
              <span style="width:3px;" />
           </td>
<td class="sty990ScheduleICol" >
              <span style="width:3px;" />
           </td>		
		</tr>
        </xsl:if>
 <xsl:if test="count($FormData/Form990ScheduleIPartIII) &lt; 2 or ((count($FormData/Form990ScheduleIPartIII) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleIPartIII) &lt; 3 or ((count($FormData/Form990ScheduleIPartIII) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleIPartIII) &lt; 4 or ((count($FormData/Form990ScheduleIPartIII) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleIPartIII) &lt; 5 or ((count($FormData/Form990ScheduleIPartIII) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleIPartIII) &lt; 6 or ((count($FormData/Form990ScheduleIPartIII) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleIPartIII) &lt; 7 or ((count($FormData/Form990ScheduleIPartIII) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchIPartIIITableFillerRow"/>
								</xsl:if>       
       </tbody>
     </table>   

</div>
 <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleIPartIII" />
    <xsl:with-param name="headerHeight" select="2" />
    <xsl:with-param name="containerHeight" select="7"/>
    <xsl:with-param name="containerID" select="'p2TbCtnr'" />
  </xsl:call-template>


<!--   END LINE 1   -->

<!-- Line 2 -->
 


<br/>      


<div class="styGenericDiv" style="width: 256mm;">
  <div class="styPartName" style="width:18mm;">Part IV</div>
  <div class="styPartDesc" style="width:238mm;font-weight:bold;">
Supplemental Information. 
<span style="font-weight:normal">
Complete this part to provide the information required in Part I, line 2, and any other additional information.
</span></div>

<span style="float:right"> 
            <xsl:call-template name="SetDynamicTableToggleButton" >
              <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleIPartIV" />              
              <xsl:with-param name="containerHeight" select="15" />
              <xsl:with-param name="containerID" select="'SUPctn'" />
          </xsl:call-template>  </span>   
       
 </div>

<div class="styTableContainer" style="width: 256mm; border-bottom-width:1px" id="SUPctn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black;width:256mm" cellspacing="0">
  <thead>
    
    <tr class="styDepTblHdr">
         
          <th class="styDepTblCell" scope="col" style="width:35mm;border-right-width:0px;border-left-width:0px;text-align:left">Identifier</th>

          <th class="styDepTblCell" scope="col" style="width:45mm;border-right-width:0px;border-left-width:0px;text-align:left">Return Reference</th>

          <th class="styDepTblCell" scope="col" style="width:166mm;border-right-width:0px;border-left-width:0px;text-align:left">Explanation</th>
                     

    </tr>
  </thead>
  <tfoot></tfoot>
  <tbody valign="top">
  <xsl:if test="($Print!=$Separated) or  (count($FormData/Form990ScheduleIPartIV) &lt;15)">
 
      <xsl:for-each select="$FormData/Form990ScheduleIPartIV">
          <tr>
      <td class="styTableCell" style="border-right-width: 1px; width:35mm;text-align:left " >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Identifier" />
            </xsl:call-template>
      </td>
       <td class="styTableCell" style="border-right-width: 1px; width:45mm;text-align:left " >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ReturnReference" />
            </xsl:call-template>
         </td>

     <td class="styTableCell" style="border-right-width: 0px; width:166mm;text-align:left " >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Explanation" />
            </xsl:call-template>
      </td>
</tr>     
     </xsl:for-each>
    </xsl:if>
  </tbody>
</table>
</div> 

<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleIPartIV"/>
            <xsl:with-param name="containerHeight" select="15"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>

<!--Page Footer-->
<div class="pageEnd" style="width:256mm">
  <div style="width:85mm;text-align:right;font-weight:bold; padding-right:4mm; float: right; clear: none;">
  <span class="styBoldText"> Schedule I (Form 990) 2010</span> 
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
          <xsl:with-param name="TargetNode" select="$FormData" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
  </table> 

<br/>
  <!-- Begin SRD for Part II -->
<xsl:if test="($Print = $Separated) and count($FormData/RecipientTable) &gt;= 8">	
 <span class="styRepeatingDataTitle" style="width:228mm">Form 990,Schedule I, Part II, Grants and Other Assistance to Governments and Organizations in the United States</span>
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
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(g)</b> Description of<br />non-cash assistance</th>
	
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
                  <xsl:with-param name="TargetNode" select="RecipientNameBusiness/BusinessNameLine1"/>
                </xsl:call-template>
               <xsl:if test="RecipientNameBusiness/BusinessNameLine2">
                      <br />
 <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RecipientNameBusiness/BusinessNameLine2"/>
                </xsl:call-template>
 </xsl:if>
  <xsl:choose>
                  <xsl:when test="AddressUS">                    
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="AddressUS" />
                      </xsl:call-template>                    
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="AddressForeign" />
                      </xsl:call-template>
                  </xsl:otherwise>  
                </xsl:choose></td>

   <td class="sty990ScheduleICol" style="padding-top: 1mm;width:24mm;font-size:7pt;padding-left: 2.5mm;"> 
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EINOfRecipient"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="padding-top: 1mm;width:32mm;font-size:7pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="IRCSection"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="padding-top: 5mm;width: 32mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfCashGrant"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="padding-top: 1mm;width: 32mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfNonCashAssistance"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 32mm;font-size:7pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MethodOfValuation"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered-->
              <td class="sty990ScheduleICol" style=" padding-top: 1mm;width: 32mm;font-size:7pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DescriptionOfNonCashAssistance"/>
                </xsl:call-template> 
             
               
 		</td>  
  
  		 <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 32mm;font-size:7pt;padding-right:4mm">
   		 <xsl:call-template name="PopulateAmount">
     		 <xsl:with-param name="MaxSize" select="17" />
     		 <xsl:with-param name="TargetNode" select="PurposeOfGrant" />
   		 </xsl:call-template>
  		</td>
       </tr>
      </xsl:for-each>
    </table></xsl:if>

<br />



<!-- SRD for Part III -->
 <xsl:if test="($Print = $Separated) and count($FormData/Form990ScheduleIPartIII) &gt;= 8">
<span class="styRepeatingDataTitle">Form 990, Schedule I, Part III, Grants and Other Assistance to Individuals in the United States</span>
 <table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;">
    <thead class="styTableThead">
    <tr class="styDepTblHdr">
			
	<th class="sty990ScheduleILNCol" scope="col" style="width:60mm;text-align: center;font-size: 7pt; height: 14mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top"><b>(a)</b>Type of grant or assistance</th>

 	 <th class="sty990ScheduleIColA" scope="col" style="text-align: center; height: 14mm; width:24mm;border-bottom-		width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(b)</b>Number of<br/>recipients</th>

 	 <th class="sty990ScheduleIColB" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width: 		32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top"><b>(c)</b>Amount of<br/>cash grant</th>
  <!--<span style="width:94.75mm; height: 8mm">-->
    	<th class="sty990ScheduleIColC" scope="col" style="border-top-width:1px;text-align: center; height: 14mm;width: 		31mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(d)</b>Amount of<br/>non-cash assistance</th>
  
  	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width: 			40mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: 		none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(e)</b>Method of valuation (book,<br/>FMV, appraisal, other)</th>
	
	<th class="sty990ScheduleICol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width: 			59mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: 		none; font-size: 7pt;font-weight:normal;vertical-align:top"><b>(f)</b>Description of non-cash assistance</th>
	</tr>
	 </thead>
    <tfoot/>
	
          <xsl:for-each select="$FormData/Form990ScheduleIPartIII">
            <tr>
             <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
               <xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>  
            <td class="sty990ScheduleILNCol" style="padding-top: 1mm;width:60mm;font-size:7pt;padding-left: 2.5mm;"> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TypeOfGrant"/>
                </xsl:call-template>
              </td>
                          
                 <!-- Address -->           
            <td class="sty990ScheduleIColA" style="padding-top: 1mm;width:24mm;font-size:7pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NumberOfRecipients"/>
                </xsl:call-template> 
              </td>      
  		<td class="sty990ScheduleIColB" style="padding-top: 1mm;width: 32mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfCashGrant"/>
                </xsl:call-template> 
              </td> 
<!-- Employer Identification Number -->
              <td class="sty990ScheduleIColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfNonCashAssistance"/>
                </xsl:call-template> 
              </td>  
              <!-- Amount Paid from Internal Funds -->
               <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 40mm;font-size:7pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MethodOfValuation"/>
                </xsl:call-template> 
              </td>      
    
								<!-- Amount of contributions received and delivered--> 
  		 <td class="sty990ScheduleICol" style="padding-top: 1mm;width: 59mm;font-size:7pt;padding-right:3mm">
   		 <xsl:call-template name="PopulateText">
     		<xsl:with-param name="TargetNode" select="DescriptionOfNonCashAssistance" />
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
			<td class="styTableCellText" >
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:32mm;border-right-width:0px">
				<span style="width:4px;border-right-width:0px;"/>
			</td>
			
		</tr>
	</xsl:template>
	
	<xsl:template name="IRS990SchIPartIIITableFillerRow">
		<tr>
			<td class="styTableCellText" >
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			
			<td class="styTableCell" style="border-right-width:0px">
				<span style="width:4px;border-right-width:0px;"/>
			</td>
			
		</tr>
	</xsl:template>
</xsl:stylesheet>
