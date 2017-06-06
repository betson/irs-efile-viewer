<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5471ScheduleNStyle.xsl"/>

<xsl:output method="html" indent="yes" />

<xsl:strip-space elements="*" />

<xsl:param name="Form5471ScheduleNData" select="$RtnDoc/IRS5471ScheduleN" />

<xsl:template match="/">

<html lang="EN-US">
<head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form5471ScheduleNData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 5471 Schedule N" />  
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>

  <style type="text/css">

<xsl:if test="not($Print) or $Print=''">

      <xsl:call-template name="IRS5471ScheduleNStyle"></xsl:call-template>    
      <xsl:call-template name="AddOnStyle"></xsl:call-template> 
 
</xsl:if>

  </style>

<xsl:call-template name="GlobalStylesForm"/>
</head>

<body class="styBodyClass">

<form name="Form5471ScheduleN">


      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      <div class="styTBB" style="width:187mm;">
        <div class="styFNBox" style="width:31mm;height:15.5mm;">
    			<span class="styFormNumber" style="font-size:9pt;font-family:arial;">SCHEDULE N<br/>
          	<span style="font-size:9pt;">(Form 5471)</span>
          	<xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData" />
            </xsl:call-template>
          	<br/>
          </span>
				<span style="font-size:6pt;">(Rev. December 2004)</span>
				<div style="line-height:120%;padding-top:1.5mm;">
   	    		<span class="styAgency">Department of the Treasury</span><br/>
		        <span class="styAgency">Internal Revenue Service</span>
	   	  </div>
     	 </div>
   	   <div class="styFTBox" style="width:125mm;height:15.5mm;">
    		   <div class="styMainTitle" style="height:9mm;">
	   	    	Return of Officers, Directors, and 10% or More<br/>Shareholders of a Foreign Personal Holding Company
	     	</div>
	   	    <div class="styFST" style="height:8mm;">
				  <span style="height:5mm;width:120mm;" />
				    <span style="">
	   	    	  <img src="{$ImagePath}/5471SchN_Bullet_Title.gif" alt="Bullet"/>Attach to Form 5471. See Instructions for Form 5471.          
	          </span>
    		 </div>
  	    </div>
        <div class="styTYBox" style="width:31mm;height:18.5mm;">
          <div class="styOMB" style="padding-left:1mm;height:2mm;border-bottom:none;"><br/><br/>OMB No. 1545-0704</div>
          
        </div>
      </div>
      <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:120mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name of person filing Form 5471<br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/NameOfPerson" />
				</xsl:call-template>
        </div>
        <div class="styEINBox" style="width:65mm;height:8mm;text-align:left;padding-left:2mm;font-size:7pt;font-weight:bold;">
         Identifying number<br/>
         <span style="font-weight:normal;">
         
         
			<xsl:if test="$Form5471ScheduleNData/IdentifyingEINNumber">
         <xsl:call-template name="PopulateEIN">
         	<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/IdentifyingEINNumber"/>
         </xsl:call-template>
       </xsl:if>
       
       <xsl:if test="$Form5471ScheduleNData/IdentifyingSSNNumber">
         <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/IdentifyingSSNNumber"/>
         </xsl:call-template>
       </xsl:if>
				
				
				</span>      
        </div>
      </div>
      <div class="styBB" style="width:187mm;height:8mm;">
	   <div class="styNameBox" style="width:187mm;height:8mm;font-size:7pt;font-weight:normal;border-right:none;">
          Name of foreign corporation<br/>
         <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/NameOfForeignCorporation/BusinessNameLine1" />
          </xsl:call-template>
          <xsl:if test="$Form5471ScheduleNData/NameOfForeignCorporation/BusinessNameLine2 !=''">
            <br/><xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/NameOfForeignCorporation/BusinessNameLine2" />
            </xsl:call-template>
          </xsl:if>
                    </div>
      </div>
      
      
		<div style="width:187mm;padding-left:12mm;font-size:9">
		  <span class="styBoldText">Important:</span>
		  <span style="width:4px;"></span>
		  <span class="styItalicText">All amounts must be stated in U.S. dollars translated from functional currency. See page 11 of the instructions for the <br/>relevant exchange rate.</span><br/>
		  <span class="styGenericDiv" >Enter the relevant functional currency and the exchange rate(s) used throughout this schedule <img src="{$ImagePath}/5471SchN_Bullet_Title.gif" alt="Bullet"/></span>
		</div>


		<!-- BEGIN Schedule Part I Title -->
		<div class="styBB" style="width:187mm;border-top-width:1px;">
		  <div class="styPartName" style="width: 21mm;">Part I</div>
		  <div class="styPartDesc" style="width: 166mm;">
		   Shareholder Information    <span style="width:2px;"></span>
		  </div>
		</div>
		<!-- END Schedule Part I Title -->
		<!-- Section A -->
		<div class="styBB" style="width:187mm;border-top-width:1px;" align="center">
		  <div class="styPartDesc" style="width: 180mm;font-size:7.50pt;">Section A—Outstanding Securities Convertible Into Stock of the Corporation or Options Granted by the Corporation
		  </div>
		  
		   <div class="styGenericDiv" style="width:3.2mm;float:right;">
              <!-- button display logic -->
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/OutstandingSecurities"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="headerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'OSCctn' "/>
              </xsl:call-template>
              <!-- end button display logic -->
            </div>
		</div>


      
  <!-- BEGIN Section A Table -->
  <div class="styTableContainer" id="OSCctn">
    <!-- print logic -->
      <xsl:call-template name="SetInitialState"/>
    <!-- end -->      
    <table class="styTable" cellspacing="0" style="font-size:7pt;">
      <thead class="styTableThead">
      <tr>
         <th class="styTableCellHeader" style="font-size: 6pt; text-align: center; width: 103mm" rowspan="2">
         <span class="styNormalText"> Description of securities (attach a complete, detailed statement of conversion privileges)</span></th>
         <th class="styTableCellHeader" style="font-size: 7pt; text-align: center; width: 20mm" rowspan="2">
         <span class="styNormalText"> Interest <br/>rate (%)</span></th>

         <th class="styTableCellHeader" style="font-size: 7pt;border-right-width: 0px;width:64mm;" colspan="3">
         <span class="styNormalText"> Face value</span></th>
      </tr>
      <tr>
         <th class="styTableCellHeader" style="width: 32mm; font-weight: normal">Beginning of year</th>
         <th class="styTableCellHeader" style="width: 32mm; font-weight: normal;border-right:none;">End of year</th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:if test="($Print != $Separated) or (count($Form5471ScheduleNData/OutstandingSecurities) &lt;= 4) "> 
          <xsl:for-each select="$Form5471ScheduleNData/OutstandingSecurities">
            <tr>
        
	    <td class="styTableCell" style="width:103mm;text-align:left;">
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="DescriptionOfSecurities" />
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="StatementConversionPrivileges" />
			</xsl:call-template>
			<!-- <span style="width:1px;"></span> -->
	    </td>
          
	    <td class="styTableCellCtr" style="width:20mm;">
			<xsl:call-template name="PopulatePercent">
			<xsl:with-param name="TargetNode" select="InterestRate" />
			</xsl:call-template>
	    </td>
	
     <td class="styTableCell" style="width:32mm;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="FaceValueBOY" />
			</xsl:call-template><span class="styTableCellPad"></span>
	  </td>
        
	  <td class="styTableCell" style="width:32mm;border-right:0;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="FaceValueEOY" />
			</xsl:call-template><span class="styTableCellPad"></span>
	  </td>

            </tr>
          </xsl:for-each>
        </xsl:if>

        <xsl:if test="count($Form5471ScheduleNData/OutstandingSecurities)&lt; 1 or ((count($Form5471ScheduleNData/OutstandingSecurities) &gt; 4) and ($Print = $Separated))">  
            <tr>
               <td class="styTableCell" style="width:103mm;text-align:left;">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/OutstandingSecurities"/>                      
                  </xsl:call-template>
                  
               <span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:20mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm;border-right:0;"><span style="width:1px;"></span></td>
            </tr>
        </xsl:if>
        <xsl:if test="count($Form5471ScheduleNData/OutstandingSecurities)&lt; 2  or ((count($Form5471ScheduleNData/OutstandingSecurities) &gt; 4) and ($Print = $Separated))">  
            <tr>
               <td class="styTableCell" style="width:103mm;"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:20mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm;border-right:0;"><span style="width:1px;"></span></td>
            </tr>
        </xsl:if>
        <xsl:if test="count($Form5471ScheduleNData/OutstandingSecurities)&lt; 3  or ((count($Form5471ScheduleNData/OutstandingSecurities) &gt; 4) and ($Print = $Separated))">  
            <tr>
               <td class="styTableCell" style="width:103mm;"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:20mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm;border-right:0;"><span style="width:1px;"></span></td>
            </tr>
        </xsl:if>
        <xsl:if test="count($Form5471ScheduleNData/OutstandingSecurities)&lt; 4  or ((count($Form5471ScheduleNData/OutstandingSecurities) &gt; 4) and ($Print = $Separated))">  
            <tr>
               <td class="styTableCell" style="width:103mm;"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:20mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:32mm;border-right:0;"><span style="width:1px;"></span></td>
            </tr>
        </xsl:if>  
      </tbody>
    </table>
  </div>
  <xsl:call-template name="SetInitialDynamicTableHeight">
       <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/OutstandingSecurities"/>
       <xsl:with-param name="containerHeight" select="3"/>
       <xsl:with-param name="headerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'OSCctn' "/>
   </xsl:call-template>
  <!-- END SECTION A Table -->
     
     
     	<div class="styBB" style="width:187mm;border-top-width:1px;" align="center">
		  <div class="styPartDesc" style="width: 180mm;font-size:7.50pt;">Section B—List of Holders of Convertible Securities or Options Granted by the Corporation
		</div>
	     	   <div class="styGenericDiv" style="width:3.2mm;float:right;">
              <!-- button display logic -->
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ListOfHolders"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" 'LOHctn' "/>
                 <xsl:with-param name="headerHeight" select="3"/>
              </xsl:call-template>
              <!-- end button display logic -->
            </div>
	
		</div>
     
      
  <!-- BEGIN Section B Table -->
  <div class="styTableContainer" id="LOHctn">
    <!-- print logic -->
      <xsl:call-template name="SetInitialState"/>
    <!-- end -->      
    <table class="styTable" cellspacing="0" style="font-size:7pt;">
      <thead class="styTableThead">
      <tr>
         <th class="styTableCellHeader" style="font-size: 6pt; text-align: left; width: 42mm" rowspan="3">
         <span class="styNormalText"> Name and address of each holder<br/> of convertible securities or options<br/> (designate nonresident aliens)</span></th>
     
         <th class="styTableCellHeader" style="font-size: 7pt; text-align: center; width: 19mm" rowspan="3">
         <span class="styNormalText"> Class <br/>of <br/>securities</span></th>
       
         <th class="styTableCellHeader" style="font-size: 7pt; text-align: center; width: 104mm" rowspan="1" colspan="4">
         <span class="styNormalText"> Securities held</span></th>

         <th class="styTableCellHeader" style="font-size: 6pt;border-right-width: 0px;width:22mm;" rowspan="3">
         <span class="styNormalText"> Explanation and date of <br/>any change in holdings of <br/>securities during the year</span></th>
         
      </tr>
      <tr>
         <th class="styTableCellHeader" style="width: 52mm; font-weight: normal" colspan="2">Beginning of year</th>
         <th class="styTableCellHeader" style="width: 52mm; font-weight: normal;" colspan="2">End of year</th>
      </tr>
      <tr>
         <th class="styTableCellHeader" style="width: 26mm; font-weight: normal">Number</th>
         <th class="styTableCellHeader" style="width: 26mm; font-weight: normal">Face value</th>         
         <th class="styTableCellHeader" style="width: 26mm; font-weight: normal">Number</th>
         <th class="styTableCellHeader" style="width: 26mm; font-weight: normal">Face value</th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:if test="($Print != $Separated) or (count($Form5471ScheduleNData/ListOfHolders) &lt;= 3) "> 
          <xsl:for-each select="$Form5471ScheduleNData/ListOfHolders">
            <tr>
        
	    <td class="styTableCell" style="width:42mm;text-align:left;font-size:6pt;">
 			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="NameOfEachHolder" />
			</xsl:call-template><br/>
			<!-- 
			<xsl:call-template name="PopulateUSAddressTemplate">
			<xsl:with-param name="TargetNode" select="USAddressOfEachHolder" />
			</xsl:call-template>
			-->
			<xsl:if test="USAddressOfEachHolder">
         <xsl:call-template name="PopulateUSAddressTemplate">
         	<xsl:with-param name="TargetNode" select="USAddressOfEachHolder"/>
         </xsl:call-template>
       </xsl:if>
       <xsl:if test="ForeignAddressOfEachHolder">
         <xsl:call-template name="PopulateForeignAddressTemplate">
            <xsl:with-param name="TargetNode" select="ForeignAddressOfEachHolder"/>
         </xsl:call-template>
       </xsl:if>
			<!-- <span style="width:1px;"></span> -->
	    </td>
	    
	    <td class="styTableCell" style="width:19mm;text-align:left;font-size:6pt;" valign="top">
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="ClassOfSecurities" />
			</xsl:call-template>
	    </td>
          
	    <td class="styTableCell" style="width:26mm;font-size:6pt;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldBOYNumber" />
			</xsl:call-template>
	    </td>          
    
      <td class="styTableCell" style="width:26mm;font-size:6pt;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldBOYFaceValue" />
			</xsl:call-template>
	  </td>
	           
	    <td class="styTableCell" style="width:26mm;font-size:6pt;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldEOYNumber" />
			</xsl:call-template>
	    </td>
	
     <td class="styTableCell" style="width:26mm;font-size:6pt;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldEOYFaceValue" />
			</xsl:call-template>
	  </td>
        
	  <td class="styTableCell" style="width:22mm;border-right:0;text-align:left;font-size:6pt;" valign="top">
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="ExplanationOfChangesDuringYear" />
			</xsl:call-template>
	  </td>

            </tr>
          </xsl:for-each>
        </xsl:if>

        <xsl:if test="count($Form5471ScheduleNData/ListOfHolders)&lt; 1 or ((count($Form5471ScheduleNData/ListOfHolders) &gt; 3) and ($Print = $Separated))">  
            <tr>
               <td class="styTableCell" style="width:42mm;text-align:left;">
                    <xsl:choose>											
			<xsl:when test="($Print = $Separated) and (count($Form5471ScheduleNData/ListOfHolders) &gt; 3)">

                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/OutstandingSecurities"/>                      
                  </xsl:call-template>
                  
                </xsl:when>
			<xsl:otherwise>

               <span class="styTableCellPad"></span>
			</xsl:otherwise>
	          </xsl:choose>
	          </td>
               <td class="styTableCell" style="width:19mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:22mm;border-right:0;"><span style="width:1px;"></span></td>
            </tr>
        </xsl:if>
        <xsl:if test="count($Form5471ScheduleNData/ListOfHolders)&lt; 2  or ((count($Form5471ScheduleNData/ListOfHolders) &gt; 3) and ($Print = $Separated))">  
            <tr>
               <td class="styTableCell" style="width:42mm"><span class="styTableCellPad"></span></td>            	
               <td class="styTableCell" style="width:19mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:22mm;border-right:0;"><span style="width:1px;"></span></td>
            </tr>
        </xsl:if>
        <xsl:if test="count($Form5471ScheduleNData/ListOfHolders)&lt; 3  or ((count($Form5471ScheduleNData/ListOfHolders) &gt; 3) and ($Print = $Separated))">  
            <tr>
               <td class="styTableCell" style="width:42mm"><span class="styTableCellPad"></span></td>            	
               <td class="styTableCell" style="width:19mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:26mm"><span class="styTableCellPad"></span></td>
               <td class="styTableCell" style="width:22mm;border-right:0;"><span style="width:1px;"></span></td>
            </tr>
        </xsl:if>
      </tbody>
    </table>
  </div>
  <xsl:call-template name="SetInitialDynamicTableHeight">
       <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ListOfHolders"/>
       <xsl:with-param name="containerHeight" select="3"/>
        <xsl:with-param name="containerID" select=" 'LOHctn' "/>
        <xsl:with-param name="headerHeight" select="3"/>
   </xsl:call-template>
  <!-- END SECTION B Table -->

     
     
     
     
  	<!-- BEGIN Schedule Part II Title -->
	<div class="styBB" style="width:187mm;border-top-width:1px;">
		  <div class="styPartName" style="width: 21mm;">Part II</div>
		  <div class="styPartDesc" style="width: 166mm;">Income Information<span style="width:2px;"></span>
		  </div>
	</div>
	<!-- END Schedule Part II Title -->
	
	<!-- Section A -->
	<div class="styBB" style="width:187mm;border-top-width:1px;" align="center">
		  <div class="styPartDesc" style="width: 180mm;font-size:7.50pt;">Section A—Undistributed Foreign Personal Holding Company Income</div>
	</div>


  <!-- Part II, Section A, Line 1 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">1</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Gross income as defined in section 555 (attach schedule)
    		 <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/GrossIncome" />
       </xsl:call-template>
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> ............</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/GrossIncome" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">1</div>
  
  </div>
  <!-- End Line -->
     
  <!-- Part II, Section A, Line 2 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">2</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Deductions allowable under section 161 (attach schedule)
    		 <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/DeductionsAllowable" />
       </xsl:call-template>
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> ............</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/DeductionsAllowable" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">2</div>
  
  </div>
  <!-- End Line -->   
     
  <!-- Part II, Section A, Line 3 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">3</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Taxable income or (loss) (subtract line 2 from line 1)
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> ...............</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/TaxableIncome" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">3</div>
  
  </div>
  <!-- End Line -->   
  
  <!-- Part II, Section A, Line 4 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">4</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Adjustments to taxable income or (loss) (see page 12 of instructions):
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;border-bottom:none">
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;background-color:lightgrey;border-bottom:none"></div>
  
  </div>
  <!-- End Line -->      
  <!-- Part II, Section A, Line 4a -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.50mm;" />a</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Taxes (see instructions)
    	<xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/Taxes" />
       </xsl:call-template>
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> ......................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/Taxes" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">4a</div>
  
  </div>
  <!-- End Line -->      
  <!-- Part II, Section A, Line 4b -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.50mm;" />b</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Charitable contributions
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> ........................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/CharitableContributions" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">4b</div>
  
  </div>
  <!-- End Line -->       
  <!-- Part II, Section A, Line 4c -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.50mm;" />c</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Special deductions disallowed
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> ......................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/SpecialDeductionsDisallowed" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">4c</div>
  
  </div>
  <!-- End Line -->       
  <!-- Part II, Section A, Line 4d -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.50mm;" />d</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Net operating loss
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> .........................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/NetOperatingLoss" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">4d</div>
  
  </div>
  <!-- End Line -->       
  <!-- Part II, Section A, Line 4e -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.50mm;" />e</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Expenses and depreciation applicable to property of the taxpayer
    		 <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ExpensesDeprecationApplicable" />
       </xsl:call-template>
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> ..........</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ExpensesDeprecationApplicable" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">4e</div>
  
  </div>
  <!-- End Line -->          
  <!-- Part II, Section A, Line 4f -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.50mm;" />f</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Taxes and contributions to pension trusts
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> ...................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/TaxesAndContributions" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">4f</div>
  
  </div>
  <!-- End Line -->    
  <!-- Part II, Section A, Line 4g -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.50mm;" />g</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Total adjustments (combine lines 4a through 4f)
     	<span style="letter-spacing:3.8mm;font-weight:bold;"> .................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;border-bottom-width:2px;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/TotalAdjustments" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;border-bottom-width:2px;">4g</div>
  
  </div>
  <!-- End Line -->    
  <!-- Part II, Section A, Line 5 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">5</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Combine line 3 and line 4g
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> .......................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/CombineLine3AndLine4g" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">5</div>
  
  </div>
  <!-- End Line -->     
  <!-- Part II, Section A, Line 6 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">6</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Deduction for dividends paid during tax year. Enter the amount from Section B, line 12, below
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> ....</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/DeductionForDividends" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">6</div>
  
  </div>
  <!-- End Line -->     
  <!-- Part II, Section A, Line 7 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">7</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Subtract line 6 from line 5
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> .......................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/SubtractLine6From5" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">7</div>
  
  </div>
  <!-- End Line -->       
  <!-- Part II, Section A, Line 8 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">8</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Deduction allowed under section 563(c) for dividends paid after close of tax year (see instructions). Attach designation required by Rev. Proc. 90-26, 1990-1 C.B. 512
    		<xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/DeductionsAllowed" />
       </xsl:call-template>
    		
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> .........</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:8mm;float:right;">
    		<br/>
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/DeductionsAllowed" />
    		</xsl:call-template>
    </div>
    <div style="float:right;">
    		<!-- <div class="styLNRightNumBox" style="height:1mm;background-color:lightgrey;padding-bottom:none;padding-top:none;"></div>
   		<div class="styLNRightNumBox" style="background-color:white;padding-top:none;padding-bottom:none">8</div> -->
   		<table cellpadding="0" cellspacing="0" style="width:8mm;border-left:1px solid black;">
				<tr><td style="background-color:lightgrey;height:4mm;"></td></tr>
				<tr><td style="background-color:white;height:4mm;font-weight:bold;font-size:7pt;text-align:center;border-bottom:1px solid black;">8</td></tr>
			</table>
    </div> 
  </div>
  <!-- End Line -->       
  <!-- Part II, Section A, Line 9 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">9</div>
  
    <div class="styLNDesc" style="height:4mm;">
    		Undistributed foreign personal holding company income (subtract line 8 from line 7)
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> ......</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;border-bottom:none;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/PersonalHoldingCompanyIncome" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;border-bottom:none;">9</div>
  
  </div>
  <!-- End Line --> 
    
  	<!-- Section B -->
	<div class="styBB" style="width:187mm;border-top-width:1px;" align="center">
		  <div class="styPartDesc" style="width: 180mm;font-size:7.50pt;">Section B—Deduction for Dividends Paid During Tax Year <span style="font-weight:normal;">(see instructions)</span></div>
	</div>
	
  <!-- Part II, Section B, Line 10 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">10</div>
  
    <div class="styLNDesc" style="height:4mm;width:100mm;">
    		Taxable dividends paid during tax year:
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;text-align:center;">
    		Amount
    </div>
    
    <div class="styLNRightNumBox" style="height:4mm;float:right;background-color:lightgrey"></div>
    
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;text-align:center;" >
		Date paid
    </div>
  
  </div>
  <!-- End Line -->   
  <!-- Part II, Section B, Line 10a -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:3mm;" />a</div>
  
    <div class="styLNDesc" style="height:4mm;width:100mm;">
    		Cash
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> ......................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">

    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/CashAmount" />
    		</xsl:call-template>

    </div>
    
    <div class="styLNRightNumBox" style="height:4mm;float:right;">10a</div>
    
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;text-align:center;">
    
    		<xsl:call-template name="PopulateMonthDayYear">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/CashDatePaid" />
    		</xsl:call-template>
    </div>
  
  </div>
  <!-- End Line -->  
    <!-- Part II, Section B, Line 10b -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:3mm;" />b</div>
  
    <div class="styLNDesc" style="height:4mm;width:100mm;">
    		Property other than cash or the corporation’s own securities (indicate nature of property)
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> .................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:8mm;float:right;">
    <br/>
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/PropertyOtherThanCashAmount" />
    		</xsl:call-template>
    </div>
    
    <div class="styLNRightNumBox" style="height:8mm;float:right;"><br/>10b</div>
    
    <div class="styLNAmountBox" style="width:32mm;height:8mm;float:right;text-align:center;">
    <br/>
    		<xsl:call-template name="PopulateMonthDayYear">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/PropertyOtherThanCashDatePaid" />
    		</xsl:call-template>
    </div>
  
  </div>
  <!-- End Line -->    
  <!-- Part II, Section B, Line 10c -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;"><span style="width:3mm;" />c</div>
  
    <div class="styLNDesc" style="height:4mm;width:100mm;">
    		Obligations of the corporation (bonds, notes, scrip, etc.)
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> ......</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ObligationsAmount" />
    		</xsl:call-template>
    </div>
    
    <div class="styLNRightNumBox" style="height:4mm;float:right;">10c</div>
    
    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;text-align:center;">
    		<xsl:call-template name="PopulateMonthDayYear">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ObligationsDatePaid" />
    		</xsl:call-template>
    </div>
  
  </div>
  <!-- End Line -->  
    <!-- Part II, Section B, Line 11 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
  
    <div class="styLNDesc" style="height:4.5mm;">
    		Consent dividends (attach schedule)
    		<xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ConsentDividends" />
       </xsl:call-template>
    		<span style="letter-spacing:3.8mm;font-weight:bold;"> ..................</span>
    </div>
  
    <div class="styLNAmountBox" style="width:32mm;height:4.5mm;float:right;border-bottom-width:2px">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/ConsentDividends" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4.5mm;float:right;border-bottom-width:2px;">11</div>
  
  </div>
  <!-- End Line --> 
  <!-- Part II, Section B, Line 12 -->
  <div style="width:187mm;">
    <div class="styLNLeftNumBox" style="height:4mm;">12</div>
  
    <div class="styLNDesc" style="height:4mm;font-size:6pt;">
    		Deduction for dividends paid during tax year (add lines 10a through 11). Enter here and on line 6 above
    		
    		<xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/DeductionPaidDuringTaxYear" />
       </xsl:call-template>
    		<span style="letter-spacing:3.8mm;font-weight:bold;font-size:7pt;"> ....</span>
    </div>
  

    <div class="styLNAmountBox" style="width:32mm;height:4mm;float:right;">
    		<xsl:call-template name="PopulateAmount">
    			<xsl:with-param name="TargetNode" select="$Form5471ScheduleNData/DeductionPaidDuringTaxYear" />
    		</xsl:call-template>
    </div>
    <div class="styLNRightNumBox" style="height:4mm;float:right;">12</div>
  
  </div>
  <!-- End Line -->   
  
      <div style="width:187mm; border-top:1 solid Black; font-size:7pt">    
        <div style="font-weight:bold; float:left; padding-top:0.5mm">
          For Paperwork Reduction Act Notice, see the Instructions for Form 5471.
        </div>    
        <div style="float:right">
          <span style="margin-right:7mm; font-size:7pt;margin-left:3mm;">Cat. No. 61925Q</span>          
          <b>Schedule N (Form 5471)</b> (Rev. 12-2004)        </div>      
      </div>  
  
        <p style="page-break-before:always" />           
  

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
        <xsl:with-param name="TargetNode" select="$Form5471ScheduleNData" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>          
    </table>
    <!-- END Left Over Table -->
        
        
       <!-- Separated Data for Section A -->
       <xsl:if test="($Print = $Separated) and (count($Form5471ScheduleNData/OutstandingSecurities) &gt; 4)">
       <br/><br/>
        <span class="styRepeatingDataTitle">Form 5471 Schedule N - Part I - Section A - Outstanding Securities Convertible Into Stock of the Corporation or Options Granted by the Corporation</span><br/>               	  


    <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
      <thead class="styTableThead">
      <tr class="styDepTblHdr">
         <th scope="col" class="styDepTblCell" style="font-size: 7pt; text-align: center; width: 103mm;font-weight: normal" rowspan="2">
         Description of securities (attach a complete, detailed statement of conversion privileges)</th>
         <th scope="col" class="styDepTblCell" style="font-size: 7pt; text-align: center; width: 20mm;font-weight: normal" rowspan="2">
         Interest rate (%)</th>

         <th scope="col" class="styDepTblCell" style="font-size: 7pt;border-right-width: 0px;width:64mm;font-weight: normal" colspan="3">
         Face value</th>
      </tr>
      <tr class="styDepTblHdr">
         <th scope="col" class="styDepTblCell" style="width: 32mm; font-weight: normal">Beginning of year</th>
         <th scope="col" class="styDepTblCell" style="width: 32mm; font-weight: normal;border-right:none;">End of year</th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
		    <xsl:for-each select="$Form5471ScheduleNData/OutstandingSecurities">
		        <tr>
	                   <!-- Define background colors to the rows -->
	              	<xsl:attribute name="class">
	                        <xsl:choose>
	                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
	                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
	                        </xsl:choose>
	                   </xsl:attribute>
		           
      <td class="styDepTblCell" style="width:103mm;text-align:left;">
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="DescriptionOfSecurities" />
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="StatementConversionPrivileges" />
			</xsl:call-template>
			<!-- <span style="width:1px;"></span> -->
	    </td>
          
	    <td class="styDepTblCell" style="width:20mm;text-align:center;">
			<xsl:call-template name="PopulatePercent">
			<xsl:with-param name="TargetNode" select="InterestRate" />
			</xsl:call-template>
	    </td>
	
     <td class="styDepTblCell" style="width:32mm;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="FaceValueBOY" />
			</xsl:call-template><span class="styDepTblPad"></span>
	  </td>
        
	  <td class="styDepTblCell" style="width:32mm;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="FaceValueEOY" />
			</xsl:call-template><span class="styDepTblPad"></span>
	  </td>		          
		       
		          
		          
		          
		        </tr>
      		</xsl:for-each>
   	     </tbody>
          </table>
          <br/>
       </xsl:if>
       <!-- /Separated Data for Section A -->
  
  
   
   

  
  
   <!-- Seperated Data for Section B -->
   <xsl:if test="($Print = $Separated) and (count($Form5471ScheduleNData/ListOfHolders) &gt; 3)">
       <br/><br/>
    <span class="styRepeatingDataTitle">Form 5471 Schedule N - Part I - Section B - List of Holders of Convertible Securities or Options Granted by the Corporation</span><br/>        
    <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
      <thead class="styTableThead">
      <tr class="styDepTblHdr">
         <th class="styDepTblCell" style="font-size: 7pt; text-align: center; width: 42mm;font-weight: normal" rowspan="3"> Name and address of each holder of convertible securities or options (designate nonresident aliens)</th>
         <th class="styDepTblCell" style="font-size: 7pt; text-align: center; width: 19mm;font-weight: normal" rowspan="3">Class of securities</th>
         <th class="styDepTblCell" style="font-size: 7pt; text-align: center; width: 104mm;font-weight: normal" rowspan="1" colspan="4"> Securities held</th>
         <th class="styDepTblCell" style="font-size: 7pt;border-right-width: 0px;width:22mm;font-weight: normal" rowspan="3"> Explanation and date of any change in holdings of securities during the year</th>
         
      </tr>
      <tr class="styDepTblHdr">
         <th class="styDepTblCell" style="width: 52mm; font-weight: normal" colspan="2">Beginning of year</th>
         <th class="styDepTblCell" style="width: 52mm; font-weight: normal;" colspan="2">End of year</th>
      </tr>
      <tr class="styDepTblHdr">
         <th class="styDepTblCell" style="width: 26mm; font-weight: normal">Number</th>
         <th class="styDepTblCell" style="width: 26mm; font-weight: normal">Face value</th>         
         <th class="styDepTblCell" style="width: 26mm; font-weight: normal">Number</th>
         <th class="styDepTblCell" style="width: 26mm; font-weight: normal">Face value</th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
    		    <xsl:for-each select="$Form5471ScheduleNData/ListOfHolders">
    		        <tr>
    	                   <!-- Define background colors to the rows -->
    	              	<xsl:attribute name="class">
    	                        <xsl:choose>
    	                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
    	                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
    	                        </xsl:choose>
	                   </xsl:attribute>
                    
	    <td class="styDepTblCell" style="width:42mm;text-align:left;font-size:6pt;">
 			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="NameOfEachHolder" />
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateUSAddressTemplate">
			<xsl:with-param name="TargetNode" select="USAddressOfEachHolder" />
			</xsl:call-template>
			<!-- <span style="width:1px;"></span> -->
	    </td>
	    
	    <td class="styDepTblCell" style="width:19mm;text-align:left;font-size:6pt;" valign="top">
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="ClassOfSecurities" />
			</xsl:call-template>
	    </td>
          
	    <td class="styDepTblCell" style="width:26mm;font-size:6pt;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldBOYNumber" />
			</xsl:call-template>
	    </td>          
    
      <td class="styDepTblCell" style="width:26mm;font-size:6pt;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldBOYFaceValue" />
			</xsl:call-template>
	  </td>
	           
	    <td class="styDepTblCell" style="width:26mm;font-size:6pt;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldEOYNumber" />
			</xsl:call-template>
	    </td>
	
     <td class="styDepTblCell" style="width:26mm;font-size:6pt;text-align:right;">
			<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="SecuritiesHeldEOYFaceValue" />
			</xsl:call-template>
	  </td>
        
	  <td class="styDepTblCell" style="width:22mm;border-right:0;text-align:left;font-size:6pt;" valign="top">
			<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="ExplanationOfChangesDuringYear" />
			</xsl:call-template>
	  </td>

            </tr>
          </xsl:for-each>
      </tbody>
    </table>
           </xsl:if>
  <!-- END SECTION B Table -->
		       
		          
		          
		          
		       

  
  
  
  
  
  
  
  
  
  
  
          </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>

