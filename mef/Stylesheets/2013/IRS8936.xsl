<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8936Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8936"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>
  <!--  No Browser Caching  -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching-->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8936"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
  <style type="text/css">
  <!--************************************************************************
     Notes: Part I, line 1 thru 5, Part II, 6 and 7, and Part 3, line 11
                is an unbound repeatable columns.
     ************************************************************************** -->
	<xsl:if test="not($Print) or $Print=''">
		  <xsl:call-template name="IRS8936Style"/>
		  <xsl:call-template name="AddOnStyle"/>  
    </xsl:if>
  </style>      
 </head>
<body class="styBodyClass">
  <form name="Form8936">    
    <xsl:call-template name="DocumentHeader"/>  
 <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 20mm">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height:20mm;">
      Form <span class="styFormNumber">8936</span>      
     <br/>
		<br/> 
		<span class="styAgency">Department of the Treasury</span><br/><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 20mm;width:125mm;padding-top:1mm;">
      <div class="styMainTitle" style="height: 8mm">Qualified Plug-in Electric Drive Motor Vehicle Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;">
        <div style="margin-left: 1.5mm;">
          (Including Qualified Two- or Three-Wheeled Plug-in Electric Vehicles)<br/>
            <img src="{$ImagePath}/8936_Bullet_Md.gif" alt="MediumBullet"/>          
            Attach to your tax return.<br/>
            <img src="{$ImagePath}/8858_Bullet_Sm.gif" alt="Bullet"/>
             Information about Form 8936 and its instructions is at <i><a href="http://www.irs.gov/form8936">www.irs.gov/form8936</a>.</i>  
             </div>
    </div>
  </div>
  <div class="styTYBox" style="width:30mm;height:20mm; border-left-width: 1px">
      <div class="styOMB" style="height:4mm;">OMB No. 1545-2137</div>
      <div class="styTY" style="height:10mm">20<span class="styTYColor">13</span></div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>125</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
   <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
  		 <xsl:choose>
			 <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
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
    <div class="styEINBox" style=" padding-left:2mm; font-size:7pt;"><span class="BoldText">Identifying number</span>
      <div style="text-align:left;font-weight:normal; ">
      <br/>
      <xsl:choose>
		  <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
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
      </div>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
   <!--  Note Line -->
  <div class="styBB" style="width: 187mm;">
         <div style="font-weight:bold">Note.</div>    
         <ul>
			<li>Use this form to claim the credit for certain plug&#8211;in electric vehicles.</li>
			<li>Claim the credit for certain alternative motor vehicles on Form 8910.</li>
		</ul>
  </div>
  <!--  End Note Line -->
  <!--  Part I -->
  <div class="styBB" style="width: 187mm">
    <div class="styPartName">Part I</div>
    <div class="styPartDesc">Tentative Credit</div>
  </div>
  <!--  End Part I -->
 <div style="width: 187mm;clear:all;"> 
  <xsl:if test="($Print != $Separated) or (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &lt;= 2)">
 <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 2)=1">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
   <table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt; font-family:verdana;clear:all;">
      <tr style="height: 8mm">   
        <th scope="col" class="PopulateTxt" colspan="3" style="width:83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1mm; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px;">        
    <span class="styNormalText" style="font-size:7pt"> Use a separate column for each vehicle. If you need more columns, use additional Forms 8936 and include the totals on lines 12 and 19.
            </span>
         </th>
        <th scope="col" class="styTableCell" style="width:47mm;font-weight:normal;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center"><b>(<xsl:number value="($pos)" format="a"/>)</b> 
          <span style="width:12mm;">Vehicle</span>     
            <xsl:number value="($pos)" format="1"/> 
        </th>
        <!--background-color:red;-->
        <th scope="col" class="styTableCell" style="width:48mm;font-weight:normal;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px; text-align: center;"><b>(<xsl:number value="($pos + 1)" format="a"/>)</b> 
                  <span style="width:12mm;"> Vehicle</span>
                  <xsl:number value="($pos + 1)" format="1"/>   
        </th>
      </tr>
    <tfoot/>
    <tbody>
    <tr>
      <!--  Line 1   -->
      <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;padding-top:6mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><b>1</b>
      </td>
      <td class="styTableCell" style="width: 77mm;padding-left:2mm; text-align:left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;padding-top:6mm;">
       <span style="float:left;">Year, make, and model of vehicle</span>
       <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>   
      </td>
       <td class="styIRS8936LNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:1px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px;">        
        <span class="styIRS8936LNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px;text-align:center;padding-right:.5mm">1</span>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; text-align: left;padding-left:0mm;padding-right:0mm">
       
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleYear"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleMake"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleModel"/>
          </xsl:call-template>
        </td>
       <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px; text-align:left ">
        
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleYear"/>  
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleMake"/>  
          </xsl:call-template>
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModel"/>  
          </xsl:call-template>
        </td>
      </tr> 
      <!-- Line 2  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">2
      </td>
         <td class="styTableCell" style="width: 77mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <span style="float:left">Vehicle identification number (see instructions)</span>
    <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>    
         </td> 
         <td class="styIRS8936LNRightNumBox">2</td>
      <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align:center;padding-left:6mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VIN"/>
          </xsl:call-template>
        </td>
    <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align:center;padding-left:6mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VIN"/>  
          </xsl:call-template>
        </td>
        </tr>
      <!-- Line 3  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">3
      </td> 
        <td class="styTableCell" style="width: 77mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
     <span style="float:left;">Enter date vehicle was placed in service (MM/DD/YY)</span>
    <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>    
         </td>
         <td class="styIRS8936LNRightNumBox">3</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;text-align:center;padding-left:6mm;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;text-align:center;padding-left:6mm;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehiclePlacedInServiceDt"/>  
          </xsl:call-template>
        </td>
        </tr>
        <!-- Line 4  -->
     <tr>
         <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:1px;border-color:black;padding-bottom:24px;">4
        </td> 
        <td class="styTableCell" style="width: 77mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
              If the vehicle is a two&#8211; or three&#8211;wheeled vehicle, enter the cost of the vehicle. If the vehicle has at least four 
              <span style="float:left;">wheels, enter the tentative credit (see instructions)</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>  
          </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width: 1px">4</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm;padding-top:14px;">
          <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="VehicleTentativeCreditAmt"/>
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm;padding-top:14px;">
          <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleTentativeCreditAmt"/> 
          </xsl:call-template>
        </td>
        </tr>
     </tbody>
  </table>
</div>
</xsl:if>
</xsl:for-each>
  </xsl:if>
  <!-- Display if there are no data elements, or Print is set to separated and there are more than 3 elements.  Be sure to test by commenting 
 out "if separated" statements in 3 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm -->
 <!-- start here greater than three -->
 <xsl:if test="(count($FormData/QlfyPlugInElecDriveMtrVehCrGrp)=0) or (($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
  <!-- blank lines -->
   <table class="styTable" cellspacing="0" style="font-size: 7pt;">
     <thead class="styTableThead">
    </thead>
    <tfoot/>
    <tbody>
    <!-- Header Line -->
       <tr>
			<td class="styBB" colspan="3" style="width:96.8mm;float:none;">Use a separate column for each vehicle. If you need more columns, use additional Forms 8936 and include the totals on lines 12 and 19.</td>
			<td class="styTableCellSmall" style="border-left:1px solid black;width:45mm;text-align:center;font-weight:bold;">
			        <span>(</span>
			       <xsl:number value="position()" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 1</span>
			       </td> 
			       <td class="styTableCellSmall" style="border-left:0px solid black;width:45mm;text-align:center;font-weight:bold;border-right-width: 0px;">
			        <span>(</span>
			       <xsl:number value="position() + 1" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 2</span>
			       </td> 
	    </tr>    
      <!--  Line 1   -->  
      <tr>
        <td class="styTableCell" style="width:5.25mm;padding-top:4mm;text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px;              padding-left:2mm;"><b>1</b>
      </td>
        <td class="styTableCell" style="width:77mm;padding-top:4mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;">
        <span style="float:left;">Year, make, and model of vehicle</span> 
         <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
        </td>
                <td class="styIRS8936LNRightNumBoxNBB" style="border-left-width:1px;height:8mm;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px">        
        <span class="styIRS8936LNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;border-bottom-width:0px;background-color:white;padding-left:0px;padding-right:0px;">1</span>
        </td>
  <!--      <td>
            <div class="styIRS8936LNRightNumBoxNBB" style="background-color:lightgrey;width:9.5mm;" > </div>
            <div class="styIRS8936LNRightNumBox" style="border-bottom-width:0px;height:3.5mm;">1</div>
        </td>-->
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align:center;padding-top:5mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp/VehicleDescriptionGrp"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center;"><span class="styTableCellPad"/></td>
          </xsl:otherwise>
        </xsl:choose>  
               <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center;">
               <span class="styTableCellPad"/></td>
              </tr>
  <!-- Line 2  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px;padding-left:2mm;">2</td> 
        <td class="styTableCell" style="width:77mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;">
          <span style="float:left;"> Vehicle identification number (see instructions)</span>
          <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>   
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-top-width:1px;border-bottom-width:0px;">2</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
         </tr>
     <!-- Line 3  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px;        padding-left:2mm;">3</td> 
        <td class="styTableCell" style="width:77mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;">
           <span style="float:left;">Enter date vehicle was placed in service (MM/DD/YY)</span>
           <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>   
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-top-width:1px;">3</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        </tr>
  <!-- Line 4  -->
     <tr>
         <td class="styTableCell" style="width:5.25mm;text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px;              padding-left:2mm;border-bottom-width:1px;border-color: black;padding-bottom:20px;">4</td> 
        <td class="styTableCell" style="width:77mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                If the vehicle is a two&#8211; or three&#8211;wheeled vehicle, enter the cost of the vehicle. If the vehicle has at least four  
                <span style="float:left;">wheels, enter the tentative credit (see instructions)</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
          </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width: 1px">4</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"/>
         </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
          <span class="styTableCellPad"/>
         </td>
        </tr>
     </tbody>
  </table>
</div>
</xsl:if>
</div>
 <!--  Part II -->
  <div style="width: 187mm;border-top-width:1px;padding-left:2mm;padding-top:1mm;height:8mm;">
        <b> Next:</b> If you did NOT use your vehicle for business or investment purposes and did not have a credit from a partnership or S corporation, skip Part II and go to
          Part III. All others, go to Part II.
  </div>
  <!-- <xsl:if test="($Print != $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt;= 7)">
         <p class="pageEnd"/>
   </xsl:if>-->
  <div class="styBB" style="width: 187mm;border-top-width:1px;float:none;">
    <div class="styPartName">Part II</div>
    <div class="styPartDesc">Credit for Business/Investment Use Part of Vehicle</div>
  </div>
  <div style="width:187mm;clear:all;display:block;"> <!-- Added by Doug Peterson-->
  <!--  End Part II header-->
  <!--   start here  Greater need -->
   <xsl:if test="($Print != $Separated) or (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &lt;= 2)">


  <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 2)=1">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
  <table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt;font-family:verdana;">
     <thead class="styTableThead">
    </thead>
  <tfoot/>
<tbody>
       <!-- line 5  -->
     <tr>
         <td class="styTableCell" style="width:5.25mm;text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px; padding-left:2.5mm;padding-top:4mm;">5</td>
        <td class="styTableCell" style="width:77mm; text-align:left;border-color:black;border-left-width:0px;border-right-width: 0px;border-top-width:0px;border-bottom-width:0px;font-size:7pt;padding-top:4mm;padding-left:2mm;">
Business/Investment use percentage (see instructions) 
             <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;"/> 
       </td>
        <td class="styIRS8936LNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;text-align:center;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px">        
        <span class="styIRS8936LNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px;">5</span>
        </td>
        <td class="styTableCell" style="padding-top:5mm;width:46.5mm;border-color:black;border-left-width:1px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
          </xsl:call-template>%
        <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="padding-top:5mm;width:49mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:center;">
          <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUsePct"/> 
          </xsl:call-template>%
             </td>
        </tr>
  <!-- Line 6  -->
      <tr>
      <td class="styTableCell" style="padding-left:2.5mm;width:5.5mm;text-align:left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;padding-bottom:24px;" valign="center">6</td>
        <td class="styTableCell" style="width:77mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;padding-left:2mm;">
            <span style="float:left;">Multiply line 4 by line 5. If the vehicle has at least four wheels, leave lines 7 through 10 blank and enter    </span> 
            <span style="float:left;">this amount on line 11</span>
            <span class="styDotLn" style="float:right;">...........</span>               
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width:1px;">6</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm;" valign="bottom">
          <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmt"/>
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm" valign="bottom">
          <span class="styTableCellPad"/>
	               <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseAmt"/>  
		        </xsl:call-template>      
        </td>
         </tr> 
   <!-- Line 7  -->
      <tr>
      <td class="styTableCell" style="padding-left:2.5mm;width:5.5mm;text-align:left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center;">7</td>
        <td class="styTableCell" style="width:77mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;padding-left:2mm;">
            <span style="float:left;">Section 179 expense deduction (see instructions)</span> 
            <span class="styDotLn" style="float:right;">..</span>               
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width:1px;">7</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm;" valign="bottom">
          <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="Section179ExpenseDeductionAmt"/>
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm" valign="bottom">
          <span class="styTableCellPad"/>
          	  <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/Section179ExpenseDeductionAmt"/>
		      </xsl:call-template>    
        </td>
         </tr> 
     <!-- Line 8  -->
      <tr>
      <td class="styTableCell" style="padding-left:2.5mm;width:5.5mm;text-align:left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center;">8</td>
        <td class="styTableCell" style="width:77mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;padding-left:2mm;">
            <span style="float:left;">Subtract line 7 from line 6</span> 
            <span class="styDotLn" style="float:right;">..........</span>               
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width:1px;">8</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm;" valign="bottom">
          <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="NetBusinessInvestmentUseAmt"/>
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm" valign="bottom">
          <span class="styTableCellPad"/>
          	  <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/NetBusinessInvestmentUseAmt"/>
		      </xsl:call-template>      
        </td>
         </tr> 
      <!-- Line 9  -->
      <tr>
      <td class="styTableCell" style="padding-left:2.5mm;width:5.5mm;text-align:left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center;">9</td>
        <td class="styTableCell" style="width:77mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;padding-left:2mm;">
            <span style="float:left;">Multiply line 8 by 10% (.10)</span> 
            <span class="styDotLn" style="float:right;">.........</span>               
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width:1px;">9</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm;" valign="bottom">
          <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="BusinessInvestmentUseRatioAmt"/>
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm" valign="bottom">
          <span class="styTableCellPad"/>
          	  <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseRatioAmt"/>
		      </xsl:call-template>   
        </td>
         </tr> 
     <!-- Line 10  -->
<!-- Line 10  -->
      <tr>
      <td class="styTableCell" style="padding-left:1mm;width:5.5mm;text-align:left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center;">10</td>
        <td class="styTableCell" style="width:77mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;padding-left:2mm;">
            <span style="float:left;">Maximum credit per vehicle</span> 
            <span class="styDotLn" style="float:right;">.........</span>               
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width:1px;">10</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm;" valign="bottom">
          <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="MaxCreditPerVehicleBusinessAmt"/>
		      </xsl:call-template>          
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm" valign="bottom">
          <span class="styTableCellPad"/>   
            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/MaxCreditPerVehicleBusinessAmt"/>
		    </xsl:call-template>  
        </td>
         </tr> 
     <!-- Line 11  -->
      <tr>
      <td class="styTableCell" style="padding-left:1mm;width:5.5mm;text-align:left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center;">11</td>
        <td class="styTableCell" style="width:77mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;padding-left:2mm;">
            <span style="float:left;">If the vehicle is a two- or three-wheeled vehicle, </span> 
            <span style="float:left;white-space:nowrap;">enter the <b>smaller</b> of line 9 or line 10</span> 
            <span class="styDotLn" style="float:right;">.......</span>               
        </td>
         <td class="styIRS8936LNRightNumBox" style="border-bottom-width:1px;">11</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm;" valign="bottom">
          <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="SmallerMaxCreditOrBusRatioAmt"/>
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm" valign="bottom">
          <span class="styTableCellPad"/> 
          	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/SmallerMaxCreditOrBusRatioAmt"/>
		      </xsl:call-template> 
        </td>
         </tr>     
<!--    	  </xsl:if>	-->
   </tbody>
  </table>
</div>

</xsl:if>
</xsl:for-each> 
  </xsl:if>     
  <!--Start here 5-->
  <!-- Display if there are no data elements, or Print is set to separated and there are more than 3 elements.  Be sure to test by commenting 
 out "if separated" statements in 2 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm -->
 <!-- start here greater than three -->
 <xsl:if test="(count($FormData/QlfyPlugInElecDriveMtrVehCrGrp)=0) or (($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
  <!-- blank lines -->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
    <tfoot/>
    <tbody>
    <!-- Header Line -->
       <tr>
      <!--start here-->
      <td class="styTableCell" style="     width:5mm;padding-left:2.5mm;text-align:left;font-weight:bold;padding-top:6mm;border-color:black;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><b>5</b>
     <!-- <div class="styLNLeftNumBoxSD" >7</div>-->
      </td>
        <td class="styTableCell" style="width: 80mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;padding-top:6mm;">
      Business/Investment use percentage (see instructions)
     </td>
     <td class="styIRS8936LNRightNumBoxNBB" style="border-left-width:1px;text-align:center;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px">        
        <span class="styIRS8936LNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px">5</span>
     </td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 2 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:46.5mm; text-align:center;padding-top:5mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp/BusinessInvestmentUsePct"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:49mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:6mm; text-align:right;"><span class="styTableCellPad" style="width:10px;">%</span></td>
          </xsl:otherwise>
        </xsl:choose>
         <td class="styTableCell" style="border-color: black; border-left-width: 0px;width:49mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:6mm; text-align:right;">
         <span class="styTableCellPad" style="width:10px;">%</span></td>
       </tr>
  <!-- Line 6  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;padding-bottom:6mm;padding-left:2.5mm;left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">6</td> 
        <td class="styTableCell" style="width: 77mm; float:left;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <div style="float:left;padding-top:.5mm;">
      Multiply line 4 by line 5. If the vehicle has at least four wheels, leave lines 7 through 10 blank and enter 
      <span style="float:left;">this amount on line 11</span>
      <span class="styDotLn" style="float:right;">...........</span>
    </div>   
   
        </td>
         <td class="styIRS8936LNRightNumBox">6</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        </tr>
   <!-- Line 7  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;padding-left:2.5mm;left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">7</td> 
        <td class="styTableCell" style="width: 77mm; float:left;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <div style="float:left;padding-top:.5mm;">
     <span style="float:left;"> Section 179 expense deduction (see instructions)</span>
     <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
    </div>   
   
        </td>
         <td class="styIRS8936LNRightNumBox">7</td>
         <td class="styTableCell" style="padding-left:10mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
         <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeductionAmt"/>
		      </xsl:call-template>     
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        </tr>   
    <!-- Line 8  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;padding-left:2.5mm;left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">8</td> 
        <td class="styTableCell" style="width: 77mm; float:left;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <div style="float:left;padding-top:.5mm;">
     <span style="float:left;">Subtract line 7 from line 6</span>
     <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
    </div>   
   
        </td>
         <td class="styIRS8936LNRightNumBox">8</td>
         <td class="styTableCell" style="padding-left:10mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">
            <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/NetBusinessInvestmentUseAmt"/>
		      </xsl:call-template>   
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        </tr>
  <!-- Line 9  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;padding-left:2.5mm;left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">9</td> 
        <td class="styTableCell" style="width: 77mm; float:left;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <div style="float:left;padding-top:.5mm;">
     <span style="float:left;">Multiply line 8 by 10% (.10)</span>
     <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
    </div>   
   
        </td>
         <td class="styIRS8936LNRightNumBox">9</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-left:10mm;">
            <span class="styTableCellPad"/>
             <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseRatioAmt"/>
		      </xsl:call-template>    
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        </tr> 
    <!-- Line 10  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;padding-left:1mm;left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">10</td> 
        <td class="styTableCell" style="width: 77mm; float:left;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <div style="float:left;padding-top:.5mm;">
     <span style="float:left;">Maximum credit per vehicle</span>
     <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
    </div>   
   
        </td>
         <td class="styIRS8936LNRightNumBox">10</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-left:10mm;">
            <span class="styTableCellPad"/>
              <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/MaxCreditPerVehicleBusinessAmt"/>
		      </xsl:call-template>      
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        </tr>
      <!-- Line 11  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;padding-left:1mm;padding-bottom:2mm;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">11</td> 
        <td class="styTableCell" style="width: 77mm; float:left;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <div style="float:left;padding-top:.5mm;">
    <span style="float:left;">If the vehicle is a two&#8211; or three&#8211;wheeled vehicle, enter</span>
    <span  style="float:left;">the <b>smaller</b> of line 9 or line 10</span> 
     <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
    </div>   
   
        </td>
         <td class="styIRS8936LNRightNumBox">11</td>
         <td class="styTableCell" style="padding-left:10mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">
            <span class="styTableCellPad"/>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/SmallerMaxCreditOrBusRatioAmt"/>
		      </xsl:call-template>      
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"/>
        </td>
        </tr>                           
 </tbody>
  </table>
</div>
</xsl:if>
<!--Line 12 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox">12</div>
    <!--<div class="styLNDesc" style="width:121.75mm;">-->
    <div class="styLNDesc" style="width:124.0mm;">
      <span style="float:left;">Add columns (a) and (b) on line 11 </span> 
      <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>   
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;width:8.5mm;">12</div>
    <div class="styIRS8936LNAmountBox" style="height:4mm;width:46.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInvestmentUseAmt"/>
      </xsl:call-template>
    </div>          
  </div>
  <!--  Line 13 -->
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox">13</div>
    <div class="styLNDesc" style="width:124.0mm;">
      <span style="float:left;">Qualified plug&#8211;in electric drive motor vehicle credit from partnerships and S corporations </span> 
      <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>   
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;width:8.5mm;">13</div>
    <div class="styIRS8936LNAmountBox" style="height:4mm;width:46.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehCrPrtshpSCorpAmt"/>
      </xsl:call-template>
    </div>          
  </div>  
  <!--  Line 14 -->
  <div  class="styBB" style="width: 187mm">  
    <div class="styLNLeftNumBox">14</div>
    <div class="styLNDesc" style="width:124mm;height:auto;">
      <b>Business/investment use part of credit. </b>Add lines 12 and 13. Partnerships and S corporations, 
      report this amount on Schedule K. All others, report this amount on Form 3800, line 1y
      <span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>    
    </div>    
    <div class="styLNRightNumBox" style="height:11mm;padding-top:4mm;border-bottom-width:0px;width:8.5mm">14</div>
    <div class="styIRS8936LNAmountBox" style="height:11mm;padding-top:4mm;;border-bottom-width:0px;width:46.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/BusinessInvstUsePartOfCrAmt"/>
      </xsl:call-template>
    </div>          
  </div>  
  </div>
  <!--  end Line 14 -->
 <!-- END PREPARER SIGNATURE SECTION -->
    <!-- Page Break and Footer-->
    <div class="styBB" style="width:187mm;padding:1mm;border-bottom-width:1px;">  
	      <div style="float:left;">
			  <span class="styBoldText">Note.</span>		              
             Complete Part III to figure any credit for the personal use part of the vehicle.            
             </div>
			<div style="float:right;">
            </div>
	</div>
	 <!-- End of page -->
      	<div style="width:187mm;border-top-width:1px;clear:all;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:122px;"/>                      
          Cat. No. 37751E
          <span style="width:125px;"/>  
          Form <span class="styBoldText">8936</span> (2013)
        </div>

        <div class="pageEnd"/>
  <!-- END Page Break and Footer-->
  <!--   Part III header -->
  		  <!--Begin Page 2 -->
		  <!-- Page Header -->
		  <div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
			<div style="float:left;">Form 8936 (2013)<span style="width:148mm;"/>
		  </div>
		  <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		</div>
  <div class="styBB" style="width: 187mm;border-top-width:1px">
    <div class="styPartName">Part III</div>
    <div class="styPartDesc">Credit for Personal Use Part of Vehicle</div>
  </div>
     <!-- Line 15 -->
  <div style="width: 187mm;clear:all;"> 
  <xsl:if test="($Print != $Separated) or (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &lt;= 2)">
 <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 2)=1">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
   <tfoot/>
    <tbody>  
	<!--  Line 15  -->
	  <tr>
			<td class="styBB" colspan="2" style="width:96.8mm;float:none;">
			</td>
			<td style="background-color:lightgrey;border-left:1px solid #000000;"><span style="width:5px;"></span></td>
			<td class="styTableCellSmall" style="border-left:1px solid black;border-right:1px solid #000000;border-bottom:1px solid black;text-align:center;font-weight:bold;padding-left:10mm;">
			        <span>(</span>
			       <xsl:number value="position()" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle  <xsl:number value="($pos)" format="1"/></span>
			         
			       </td> 
			       <td class="styTableCellSmall" style="border-bottom:1px solid black;width:45mm;text-align:center;font-weight:bold;border-right-width: 0px;padding-left:3mm;">
			        <span>(</span>
			       <xsl:number value="position() + 1" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle <xsl:number value="($pos + 1)" format="1"/></span>
			       </td> 
	  </tr> 
	  <tr>  
        <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;padding-bottom:8mm;border-color:black;       border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><b>15</b>
        </td>
        <td class="styTableCell" style="width:75mm;padding-left:2mm; text-align:left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;padding-top:2mm;">
		  If you skipped Part II, enter the amount from line 4. If you completed Part II, subtract line 6 from line 4.  If the vehicle has at least four wheels, leave lines 16 and 17 blank and enter this amount on line 18 
		  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>  
        </td>
        <td class="styIRS8936LNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px;">       
        <span class="styIRS8936LNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px;padding-bottom:3px;">15</span>
        </td>
        <td class="styTableCell" style="width:46.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-right:1mm;padding-top:10mm;">
          <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="TentativeCreditForPrsnlUseAmt"/>
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="width:46.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; padding-top:10mm;padding-left:2mm;">
          <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/TentativeCreditForPrsnlUseAmt"/> 
          </xsl:call-template>
        </td>
     </tr> 
<!--    <xsl:if test="(( position()=(count($FormData/QlfyPlugInElecDriveMtrVehCrGrp)-1)) and ((count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) mod 2)=0)) or (( position()=(count($FormData/QlfyPlugInElecDriveMtrVehCrGrp))) and ((count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) mod 2)=1))"> -->
    <!--Line 16 -->  
     <tr style="font-size: 7pt">
        <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">16
      </td>
         <td class="styTableCell" style="width:75mm;padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
         <span style="float:left">Multiply line 15 by 10% (.10)</span>
         <span  class="styDotLn" style="float:right;padding-right:1mm;">.........</span>    
         </td> 
         <td class="styIRS8936LNRightNumBox">16</td>
        <td class="styTableCell" style="text-align:right;border-color: black; border-left-width: 1px; border-right-width: 1px;  border-bottom-width:1px; padding-left:14mm;padding-top:1mm;">
			<div class="styLNAmountBox" style="height:4mm;border-width:0px;">	
			    <span class="styTableCellPad"/>		
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="TenativeCrPersonalUseRatioAmt"></xsl:with-param>
					</xsl:call-template>
			</div>   
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px; padding-left:16mm;padding-top:1mm;">
         	<div class="styLNAmountBox" style="height:4mm;border-width:0px;">		
         						<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/TenativeCrPersonalUseRatioAmt"></xsl:with-param>
					</xsl:call-template>
			</div>  
        </td>
    </tr>
    <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;padding-bottom:6mm;">17
      </td>
         <td class="styTableCell" style="width:75mm;padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
         <span style="float:left">Maximum credit per vehicle. If you skipped Part II, enter $2,500. If you completed Part II, subtract line 11</span>
         <span style="float:left">from line 10</span>
         <span  class="styDotLn" style="float:right;padding-right:1mm;">..............</span>    
         </td> 
         <td class="styIRS8936LNRightNumBox">17</td>
        <td class="styTableCell" style="text-align:right;border-color: black; border-left-width: 1px; border-right-width: 1px;  border-bottom-width:1px; padding-left:14mm;padding-top:5mm;">
			<div class="styLNAmountBox" style="height:4mm;border-width:0px;">	
			    <span class="styTableCellPad"/>		
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="MaxCreditPerVehiclePersonalAmt"></xsl:with-param>
					</xsl:call-template>
			</div>   
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px; padding-left:16mm;padding-top:5mm;">
         	<div class="styLNAmountBox" style="height:4mm;border-width:0px;">		
         						<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/MaxCreditPerVehiclePersonalAmt"></xsl:with-param>
					</xsl:call-template>
			</div>  
        </td>
        </tr>
         <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;padding-bottom:4mm;">18
      </td>
         <td class="styTableCell" style="width:75mm;padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
         <span style="float:left;">If the vehicle is a two– or three–wheeled vehicle, </span>
         <span style="float:left;white-space:nowrap;">enter the <b>smaller</b> of line 16 or line 17</span>
         <span  class="styDotLn" style="float:right;padding-right:1mm;">......</span>    
         </td> 
         <td class="styIRS8936LNRightNumBox">18</td>
        <td class="styTableCell" style="text-align:right;border-color: black; border-left-width: 1px; border-right-width: 1px;  border-bottom-width:1px; padding-left:14mm;padding-top:2mm;">
			<div class="styLNAmountBox" style="height:4mm;border-width:0px;">	
			    <span class="styTableCellPad"/>		
                    <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="SmallerMaxCrOrPrsnlRatioAmt"></xsl:with-param>
					</xsl:call-template>
			</div>   
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-bottom-width:1px; padding-left:16mm;padding-top:2mm;">
         	<div class="styLNAmountBox" style="height:4mm;border-width:0px;">		
         	                    <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/SmallerMaxCrOrPrsnlRatioAmt"></xsl:with-param>
					</xsl:call-template>
			</div>  
        </td>
        </tr>
<!--        </xsl:if>-->
    </tbody>
  </table>
</div>
</xsl:if>
</xsl:for-each>
  </xsl:if>
   <!-- Display if there are no data elements, or Print is set to separated and there are more than 2 elements.  Be sure to test by commenting 
 out "if separated" statements in 3 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm -->
 <!-- start here greater than three -->
 <xsl:if test="(count($FormData/QlfyPlugInElecDriveMtrVehCrGrp)=0) or (($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
  <!-- blank lines -->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
    </thead>
    <tfoot/>
    <tbody>
    <!--  Line 15   -->
      <tr>
			<td class="styBB" colspan="2" style="width:96.8mm;float:none;">
			</td>
			<td style="background-color:lightgrey;border-left:1px solid #000000;"><span style="width:5px;"></span></td>
			<td class="styTableCellSmall" style="border-left:1px solid black;border-bottom:1px solid black;width:45mm;text-align:center;font-weight:bold;">
			        <span>(</span>
			       <xsl:number value="position()" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 1</span>
			       </td> 
			       <td class="styTableCellSmall" style="border-left:0px solid black;border-bottom:1px solid black;width:45mm;text-align:center;font-weight:bold;border-right-width: 0px;">
			        <span>(</span>
			       <xsl:number value="position() + 1" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 2</span>
			       </td> 
	    </tr>    
    <tr>
      <td class="styTableCell" style="     width:6mm;text-align:left;padding-left:1mm;font-weight:bold;border-color:black;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;padding-bottom:8mm;"><b>15</b>
      </td>
      <td class="styTableCell" style="width: 82mm;padding-left:1.5mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width:0px; border-bottom-width:0px;padding-top:2mm;">
       If you skipped Part II, enter the amount from line 4. If you completed Part II, subtract line 6 from line 4. If the vehicle has at least four wheels, leave lines 16 and 17 blank and enter this amount on line 18
       <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>  
    </td>
    <td class="styIRS8936LNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px;">        
        <span class="styIRS8936LNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px">15</span>
    </td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:45mm; text-align:center;padding-top:10mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp/TentativeCreditForPrsnlUseAmt"/>
              </xsl:call-template>
              <span class="styTableCellPad" style="width:43mm;"/>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center;"><span class="styTableCellPad" style="width:43mm;"/></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px;width:46.5mm;border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"><span class="styTableCellPad"  style="width:43mm;"/></td>
        </tr>
    <!--  Line 16   -->
    <tr>
      <td class="styTableCell" style="     width:6mm;text-align:left;padding-left:1mm;font-weight:bold;border-color:black;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;padding-top:2mm;"><b>16</b>
      </td>
      <td class="styTableCell" style="width: 82mm;padding-left:1.5mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width:0px; border-bottom-width:0px;padding-top:2mm;">
       <span style="float:left;">Multiply line 15 by 10% (.10)</span>
       <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span> 
    </td>
    <td class="styIRS8936LNRightNumBox">        
        16
    </td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:46.5mm; text-align:center;">
            <span style="width:5px;"/>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"/></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px;width:46.5mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"><span class="styTableCellPad"/></td>
        </tr>
    <!--  Line 17   -->
    <tr>
      <td class="styTableCell" style="     width:6mm;text-align:left;padding-left:1mm;font-weight:bold;border-color:black;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;padding-bottom:2mm;"><b>17</b>
      </td>
      <td class="styTableCell" style="width: 82mm;padding-left:1.5mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width:0px; border-bottom-width:0px;padding-top:2mm;">
        <span style="float:left;white-space:nowrap;"> Maximum credit per vehicle. If you skipped Part II, enter</span>
        <span  style="float:left;white-space:nowrap;padding-right:6mm;">$2,500. If you completed Part II, subtract line 11 from</span>
        <span  style="float:left;white-space:nowrap;">line 10</span>
        <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span> 
    </td>
    <td class="styIRS8936LNRightNumBox"> 
       17
    </td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:46.5mm; text-align:center;">
            <span style="width:5px;"></span>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"/></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px;width:46.5mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"><span class="styTableCellPad"/></td>
        </tr>
        <!--  Line 18   -->
    <tr>
      <td class="styTableCell" style="     width:6mm;text-align:left;padding-left:1mm;font-weight:bold;border-color:black;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;padding-bottom:2mm;"><b>18</b>
      </td>
      <td class="styTableCell" style="width: 82mm;padding-left:1.5mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width:0px; border-bottom-width:0px;padding-top:2mm;">
        <span style="float:left;white-space:nowrap;">If the vehicle is a two- or three-wheeled vehicle,</span>
        <span style="float:left;white-space:nowrap;">enter the smaller of line 16 or line 17</span>
        <span class="styDotLn" style="float:right;padding-right:1mm;">........</span> 
    </td>
    <td class="styIRS8936LNRightNumBox">18</td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:46.5mm; text-align:center;">
                 <span style="width:5px;"></span>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px;width:46.5mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"/></td>
          </xsl:otherwise>
        </xsl:choose>
            <td class="styTableCell" style="border-color: black;border-left-width: 0px;width:46.5mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;"><span class="styTableCellPad"/></td>
        </tr>
 </tbody>
  </table>
</div>
</xsl:if>
</div>
  
  <!--  Line 19 -->
<div style="width: 187mm">  
    <div class="styLNLeftNumBox">19</div>
    <div class="styLNDesc" style="width:124.75mm;">
	  <span style="float:left;">Add columns (a) and (b) on line 18 </span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">..................</span> 
    </div>    
      <div class="styLNRightNumBox" style="height:4mm;width:9.0mm;">19</div>
      <div class="styIRS8936LNAmountBox" style="height:4mm;width:45.0mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCrForPrsnlUseAmt"/>
        </xsl:call-template>
      </div>          
    </div>  
  <!-- End Line 19 -->  
  <!--  Line 20--> 
<div style="width: 187mm">  
    <div class="styLNLeftNumBox">20</div>
    <div class="styLNDesc" style="width:124.75mm;">
	  <span style="float:left;">Enter the amount from Form 1040, line 46, or Form 1040NR, line 44 </span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">........</span> 
    </div>    
      <div class="styLNRightNumBox" style="height:4mm;width:9mm;">20</div>
      <div class="styIRS8936LNAmountBox" style="height:4mm;width:45.0mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
        </xsl:call-template>
      </div>          
    </div>
   <!-- Line 21   -->
   <div style="width187mm;">
	  <div class="styLNLeftNumBox">21</div>
      <div class="styLNDesc" style="width:124.75mm;">
        <span style="float:left;">Personal credits from Form 1040 or 1040NR (see instructions) </span> 
        <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span> 
      </div>
      <div class="styLNRightNumBox" style="height:4mm;width:9mm;">21</div>
	  <div class="styIRS8936LNAmountBox" style="height:4mm;width:45.0mm;">
		<xsl:call-template name="PopulateAmount">
		  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehOtherFormCreditsAmt"/>
		</xsl:call-template> 
	  </div>
    </div>
     <!--  Line 22--> 
<div style="width: 187mm;clear:all;">  
    <div class="styLNLeftNumBox">22</div>
    <div class="styLNDesc" style="width:124.75mm;">
	  <span style="float:left;">Subtract line 21 from line 20 </span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span> 
    </div>    
      <div class="styLNRightNumBox" style="height:4mm;width:9mm;">22</div>
      <div class="styIRS8936LNAmountBox" style="height:4mm;width:45.0mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehAdjPrsnlCreditAmt"/>
        </xsl:call-template>
      </div>          
    </div>
	<!-- Line 23  -->	
	<div class="styBB" style="width: 187mm">  
      <div class="styLNLeftNumBox">23</div>
      <div class="styLNDesc" style="width:124.75mm;">
	    <b> Personal use part of credit. </b> Enter the <b>smaller </b>of line 19 or line 22 here 
	    and on Form 1040,  line 53, or Form 1040NR, line 50. 
        Check box <b>c</b> on that line and enter "8936" in the space next to that box. If line 
        22 is smaller than line 19, see instructions 
	    <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span> 
      </div>    
      <div class="styLNRightNumBoxNBB" style="height:10mm;padding-top:7mm;width:9mm;">23</div>
      <div class="styLNAmountBoxNBB" style="height:10mm;padding-top:7mm;width:45mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCreditAmt"/>
        </xsl:call-template>
      </div>          
  </div>
 <!-- End of page -->
	  <!-- Page Break and Footer-->
		  <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1px solid black;border-top-width1px;clear:all;">
			<div style="width:100mm;float:left;">
			  <span style="width:90mm;"/>
			</div>
			<div style="float:right;">
			  <span style="width:80px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">8936</span> (2013)
            </div>
		  </div>
		  <br/>
  <!--   <br class="pageEnd"/>  -->
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
 <!-- Additional Data Table for Separated Data from Part I; displayed if more than 3 elements and Print is set to separated-->
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br/>
    <br/>
    <span class="styRepeatingDataTitle">Form IRS8936, Part I - Tentative Credit:</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
          <thead class="styTableThead">
            <tr style="height: 8mm" class="styDepTblHdr">
              <td class="styDepTblCell" colspan="2" style="width: 91mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">        
                <span class="styNormalText" style="padding-left: 5mm">
                  Use a separate column for each vehicle. If you need more columns, use additional Forms 8936 and include the totals on lines 12 and 19.
                </span>
              </td>
               <!--start here additional data-->
              <td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos)" format="a"/>)
                   <span style="width:12mm">Vehicle</span>
                   <xsl:number value="($pos)" format="1"/>
              </td>
              <td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos + 1)" format="a"/>)
                                                              <span style="width:12mm">Vehicle</span>
                                                              <xsl:number value="($pos + 1)" format="1"/>
              </td>
             </tr>
          </thead>
          <tfoot/>
          <tbody>
            <!--  Line 1   -->
            <!-- column 1 -->
            <tr class="styDepTblRow1" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm;">1</span><span style="width: 1mm"/>
                <span>Year, make, and model of vehicle</span>
              </td>
              <td class="styIRS8936LNRightNumBox" style="border-top-width: 1px">1</td>
               <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: left">
 <!--         <span class="styTableCellPad"></span>-->
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleYear"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleMake"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleModel"/>
          </xsl:call-template>
        </td>
        <!-- column 2 -->
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: left">
<!--          <span class="styTableCellPad"></span>-->
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleYear"/>  
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleMake"/>  
          </xsl:call-template>
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModel"/>  
          </xsl:call-template>
        </td>
            </tr> 
            <!-- Line 2  -->
            <tr class="styDepTblRow2" style="height: 8mm; font-size: 7pt">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:2mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span><span style="width: 1mm"/>
     Vehicle identification number (see instructions)
              </td>
              <td class="styIRS8936LNRightNumBox">2</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;padding-left:8mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="VIN"/>
                </xsl:call-template>
             </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;padding-left:8mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VIN"/>
                </xsl:call-template>
              </td>
             </tr>
               <!-- Line 3  -->
            <tr class="styDepTblRow1" style="height: 8mm; font-size: 7pt">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:2mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm;">3</span><span style="width: 1mm"/>
                <span>Enter date vehicle was placed in service <br/><span style="padding-left:4mm;"/>
(MM/DD/YYYY)</span>
              </td>
              <td class="styIRS8936LNRightNumBox">3</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-left:8mm;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-left:8mm;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
                </xsl:call-template>
              </td>
              </tr>
            <!-- Line 4 -->
            <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:2mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">4</span><span style="width: 1mm"/>If the vehicle is a two- or three-wheeled vehicle, 
              <span style="float:left;padding-left:5mm;">enter the cost of the vehicle. If the vehicle has at least</span> 
              <span style="float:left;padding-left:5mm;"> four wheels, enter the tentative credit (see instructions).</span>
               </td>
               <td class="styIRS8936LNRightNumBox">4</td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="VehicleTentativeCreditAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" align="right" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleTentativeCreditAmt"/>
                </xsl:call-template>
             <!--   <span class="styTableCellPad"></span>-->
              </td>
             </tr>
           </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
      <!-- Additional Data Table for Separated Data from Part II; displayed if more than 3 elements and Print is set to separated-->
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br/>  <br/>  <br/>
    <span class="styRepeatingDataTitle">Form IRS8936, Part II -Credit for Business/Investment Use Part of Vehicle:</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
          <tbody>
 <!-- line 5 -->         
           <tr class="styDepTblRow1" style="height: 8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">5</span>
              Business/Investment use percentage (see instructions)
               </td>
               <td class="styIRS8936LNRightNumBox">5</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
              %
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUsePct"/>
                </xsl:call-template>
                <span class="styTableCellPad"/>
              %
              </td>
            </tr>
 <!-- line 6  -->            
              <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
				  <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">6</span>
				  <span style="width: 1mm"/>Multiple line 4 by line 5. If the vehicle has at least four 
				  <span style="padding-left:5mm;">wheels, leave lines 7 through 10 blank and enter this </span>
				  <span style="padding-left:5mm;">amount on line 11</span>
               </td>
               <td class="styIRS8936LNRightNumBox">6</td>
             <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:10mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:10mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              </tr>
<!-- line 7 -->         
           <tr class="styDepTblRow1" style="height: 8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">7</span>
              <span style="width: 1mm"/>Section 179 expense deduction (see instructions)
               </td>
               <td class="styIRS8936LNRightNumBox">7</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>    
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Section179ExpenseDeductionAmt"/>
                </xsl:call-template>   
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>        
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/Section179ExpenseDeductionAmt"/>
                </xsl:call-template>   
              </td>
            </tr>
 <!-- line 8  -->            
              <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">8</span>
              <span style="width: 1mm"/>Subtract line 7 from line 6
               </td>
               <td class="styIRS8936LNRightNumBox">8</td>
             <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetBusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/NetBusinessInvestmentUseAmt"/>
                </xsl:call-template>
              </td>
              </tr>
   <!-- line 9 -->         
           <tr class="styDepTblRow1" style="height: 8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">9</span>
              Multiply line 8 by 10% (.10)
               </td>
               <td class="styIRS8936LNRightNumBox">9</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>    
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUseRatioAmt"/>
                </xsl:call-template>   
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>        
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseRatioAmt"/>
                </xsl:call-template>   
              </td>
            </tr>
           <!-- line 10  -->            
              <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt;padding-left:1mm;">10</span>
              <span style="width: 1mm"/>Maximum credit per vehicle
               </td>
               <td class="styIRS8936LNRightNumBox">10</td>
             <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="SmallerMaxCreditOrBusRatioAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/SmallerMaxCreditOrBusRatioAmt"/>
                </xsl:call-template>
              </td>
              </tr>
           <!-- line 11 -->         
           <tr class="styDepTblRow1" style="height: 8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 1mm;">11</span>
              <span style="width: 1mm"/>If the vehicle is a two- or three-wheeled vehicle, enter 
              <span style="padding-left:5mm;"/>the smaller of line 9 or line 10
               </td>
               <td class="styIRS8936LNRightNumBox">11</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>    
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUseRatioAmt"/>
                </xsl:call-template>   
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;padding-left:14mm;">
                <span class="styTableCellPad"/>        
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseRatioAmt"/>
                </xsl:call-template>   
              </td>
            </tr>
           </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
      <!-- Additional Data Table for Separated Data from Part III; displayed if more than 3 elements and Print is set to separated-->
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br/>
    <span class="styRepeatingDataTitle">Form IRS8936, Part III -Credit for Personal Use Part of Vehicle:</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
         <tbody>
          <thead class="styTableThead">
              <tr style="height: 8mm" class="styDepTblHdr">   
                 <th scope="col" class="PopulateTxt" style="width:83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1mm; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px;">        
              <span style="width:5px;"></span>
                 </th>
                 <th  scope="col" style="border-left:1px solid black;border-bottom:1px solid black;"><span style="width:5px;"></span></th>
                 <th scope="col" class="styTableCell" style="width:47mm;font-weight:normal;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center;color:#ffffff;">(<xsl:number value="($pos)" format="a"/>)
                      <span style="width:12mm;">Vehicle</span>     
                      <xsl:number value="($pos)" format="1"/> 
                 </th>       <!--background-color:red;-->
                 <th scope="col" class="styTableCell" style="width:48mm;font-weight:normal;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px; text-align: center;color:#ffffff;">(<xsl:number value="($pos + 1)" format="a"/>) 
                  <span style="width:12mm;"> Vehicle</span>
                  <xsl:number value="($pos + 1)" format="1"/>   
                 </th>
      </tr> 
       </thead>
       <!-- line 15 -->      
           <tr class="styDepTblRow1" style="height:8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;text-align:bottom;">15</span>
             If you skipped Part II, enter the amount from line 4. 
              <span style="float:left;padding-left:6mm;">If you completed Part II, subtract line 6 from line  4. If the vehicle has at least four wheels, leave lines 16 and 17 blank and enter this amount on line 18</span>  
               </td>
               <td class="styIRS8936LNRightNumBox">15</td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TentativeCreditForPrsnlUseAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/TentativeCreditForPrsnlUseAmt"/>
                </xsl:call-template>
              </td>
             </tr>
             <!-- line 16 -->         
           <tr class="styDepTblRow2" style="height:8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;text-align:bottom;">16</span>
                 <span style="padding-left:1mm;">Multiply line 15 by 10% (.10)</span> 
               </td>
               <td class="styIRS8936LNRightNumBox">16</td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TenativeCrPersonalUseRatioAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/TenativeCrPersonalUseRatioAmt"/>
                </xsl:call-template>
              </td>
             </tr>
    <!-- line 17 -->         
           <tr class="styDepTblRow1" style="height:8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px;border-bottom-width:0px;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;text-align:bottom;">17</span>
				  <span style="padding-left:1mm;">Maximum credit per vehicle. If you skipped Part II, </span>
				  <span style="padding-left:6mm;">enter $2,500. If you completed Part II, subtract </span><br/>
				  <span style="padding-left:6mm;">line 11 from line 10 </span>                                                                          
               </td>
               <td class="styIRS8936LNRightNumBox">17</td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MaxCreditPerVehiclePersonalAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/MaxCreditPerVehiclePersonalAmt"/>
                </xsl:call-template>
              </td>
             </tr>
     <!-- line 18 -->         
           <tr class="styDepTblRow2" style="height:8mm;">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px;border-bottom-width:0px;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;text-align:bottom;">18</span>
				  <span style="padding-left:1mm;">If the vehicle is a two- or three-wheeled vehicle, enter </span>
                  <span style="padding-left:6mm;">the smaller of line 16 or line 17</span>                                                                        
               </td>
               <td class="styIRS8936LNRightNumBox">18</td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="SmallerMaxCrOrPrsnlRatioAmt"/>
                </xsl:call-template>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;padding-left:14mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/SmallerMaxCrOrPrsnlRatioAmt"/>
                </xsl:call-template>
              </td>
             </tr>
           </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if> 
     </form>  
</body>
</html>
</xsl:template>    
</xsl:stylesheet>