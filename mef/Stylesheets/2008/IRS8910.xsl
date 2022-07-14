<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8910Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8910" />


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
  <meta name="Description" content="Form IRS 8910"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">

 	<xsl:if test="not($Print) or $Print=''">

      <xsl:call-template name="IRS8910Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  

    </xsl:if>

  </style>      
 </head>
<body class="styBodyClass">
  <form name="Form8910">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 20mm">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 23mm">
      Form <span class="styFormNumber">8910</span>      
     <br/><br/><br/>
      <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 22mm;width:125mm">
      <div class="styMainTitle" style="height: 8mm">Alternative Motor Vehicle Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;">
        <div style="margin-left: 1.5mm;">
            <img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>
            Attach to your tax return.<br/> 
        </div>
    </div>
  </div>
  <div class="styTYBox" style="width:30mm;height:23mm; border-left-width: 1px">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-1998</div>
      <div class="styTY" style="height:10mm">20<span class="styTYColor">08</span></div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>152</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
     <div style="font-family:verdana;font-size:6pt;height:6mm">
       <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
       <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
     </div>
    </div>
    
    <div class="styEINBox" style=" padding-left:2mm; font-size:7pt;"><span class="BoldText">Identifying number</span>
      <div style="text-align:left;font-weight:normal; ">
      <br/>  
        <xsl:choose>
          <xsl:when test="normalize-space($FormData/IdentifyingNumber) != ''">
            <xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$FormData/IdentifyingNumber" /></xsl:call-template>
          </xsl:when>  
          <xsl:otherwise>  
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>  
          </xsl:otherwise>
        </xsl:choose>
      </div>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
  
  <!--  Part I -->
  <div class="styBB" style="width: 187mm;padding-top:4px;padding-bottom:4px;">
    <div class="styPartName">Part I</div>
    <div class="styPartDesc">Tentative Credit</div>
  </div>
  <!--  End Part I -->
 <div  style="width: 187mm"> 
  <xsl:if test="($Print != $Separated) or (count($FormData/IRS8910PartI) &lt;= 3)">
 <xsl:for-each select="$FormData/IRS8910PartI">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 3)=1">

 <div class="styIRS8910TableContainer" id="Spcctn">
   <!--print logic-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
   <table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt; font-family:verdana;">
    <tr style="height: 8mm">
      <th class="styTableCell"  style="width:4.5mm;border-color:black;border-bottom-width:1px;padding-left:0px;padding-right:0px;"></th>
        <th class="styTableCell" colspan="2" style="width: 83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px">        
            <span class="styNormalText" style="font-size:6pt;"> Use a separate column for each vehicle. If you need more columns,<br /> use additional Forms 8910 and include the totals on lines  8 and 12.
            </span>
        </th>
        <th class="styTableCell" style="width:32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center">(<xsl:number value="($pos)" format="a"/>) </th>
        <th class="styTableCell" style="width:32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center">(<xsl:number value="($pos + 1)" format="a"/>) </th>
        <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px; text-align: center">(<xsl:number value="($pos + 2)" format="a"/>)  </th>
      </tr>
    <tfoot/>
    <tbody>
<tr>
	
      <!--  Line 1   -->
      <td class="styTableCell"  style="width:5.25mm;text-align:right;font-weight:bold;padding-top:6mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><b>1</b>
      </td>
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align:left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;padding-top:6mm;">
       Year, make, and model of vehicle
       <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">....</span>   
        </td>
  
   
<td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:1px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px" >        

        <span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px">
  1
        </span>
                </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center;padding-left:0mm;padding-right:0mm">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="VehicleDescription/VehicleYear"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescription/VehicleMake"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescription/VehicleModel"/>
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleYear" />  
          </xsl:call-template>
          <br />
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleMake" />  
          </xsl:call-template>
          <br />
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleModel" />  
          </xsl:call-template>

        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleYear" /> 
           </xsl:call-template>
           <br />
            <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleMake" /> 
           </xsl:call-template>
          <br />
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleModel" /> 
           </xsl:call-template>
        </td>
        </tr> 
            
           <!-- Line 2  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">2
      </td> 
        <td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
   Enter date vehicle was placed in service (MM/DD/YY)
   
         </td>
         <td class="styLNRightNumBox">2</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDate" />
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/VehiclePlacedInServiceDate" />  
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:center;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/VehiclePlacedInServiceDate" />  <!-- [$pos + 2]/VehiclePlacedInServiceDate-->
          </xsl:call-template>
        </td>
        </tr>
        
        <!-- Line 3  -->
     <tr>
         <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">3
        </td> 
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
                Maximum credit allowable (see instructions)
                <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..</span>   
          </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">3</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="MaximumAllowedCredit" />
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/MaximumAllowedCredit" /> 
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/MaximumAllowedCredit" /> 
          </xsl:call-template>
        </td>
        </tr>
      <!--  Line 4   -->
      <tr>
       <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">4
      </td> 
        <td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
          Phaseout percentage (see instructions)
          <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">...</span>   
        </td>
        <td class="styLNRightNumBox">4</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="PhaseoutPercentage" />
          </xsl:call-template>
          %
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/PhaseoutPercentage" /> 
          </xsl:call-template>
        %
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/PhaseoutPercentage" />  
          </xsl:call-template>
         %
        </td>
        </tr>
         <!-- Line 5  -->
      <tr>
      <td  class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="top">5</td>
        <td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
              <b> Tentative credit. </b>Multiply line 3 by line 4
               <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..</span>       
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width:0px;">5</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">
          <span class="styTableCellPad"></span>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="TentativeCredit" />
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">
          <span class="styTableCellPad"></span>
	               <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/TentativeCredit" />  
		        </xsl:call-template>      
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
          <span class="styTableCellPad"></span>
	         <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/TentativeCredit" />  		         
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
 <xsl:if test="(count($FormData/IRS8910PartI)=0) or (($Print = $Separated) and (count($FormData/IRS8910PartI) &gt; 3))">
 <div class="styIRS8910TableContainer" id="Spcctn" >
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
  
  <!-- blank lines -->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
    <tr style="height: 8mm">
      <th class="styTableCell"  style="width:5.25mm;border-color:black;border-bottom-width:1px;"></th>
        <th class="styTableCell" colspan="2" style="width: 83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: left">        
            <span class="styNormalText" style="font-size:6pt;"> Use a separate column for each vehicle. If you need more columns, use additional Forms 8910 and include the total on lines 8 and 12.
            </span>
        </th>
        <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; text-align: center">   <!--(<xsl:number value="($pos)" format="a"/>) --> </th>
        <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; text-align: center">  <!--(<xsl:number value="($pos + 1)" format="a"/>) --> </th>
        <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: center">  <!--(<xsl:number value="($pos + 2)" format="a"/>) --> </th>
      </tr>
    </thead>
    <tfoot/>
    <tbody>
      <!--  Line 1   -->
      <tr>

      <td class="styTableCell" style="width:6mm;text-align:right;font-weight:bold;padding-top:6mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><b>1</b>
      </td>
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;padding-top:6mm;">
       Year, make, and model of vehicle
    
     <b>   <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
      </b>

        </td>
        <td class="styLNRightNumBox" style="border-top-width:1px">1</td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/IRS8910PartI) &gt; 3))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align:center;padding-top:5mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI/VehicleDescription"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"></span></td>
          </xsl:otherwise>
        </xsl:choose>         <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"></span></td>
        </tr>
  <!-- Line 2  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">2
      </td> 
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
   Enter date vehicle was placed in service (MM/DD/YY)
        </td>
         <td class="styLNRightNumBox">2</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
          <span class="styTableCellPad"></span>
          </td>
        </tr>
        
  <!-- Line 3  -->
     <tr>
         <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">3
        </td> 
        <td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
                Maximum credit allowable (see instructions)
              <b>
                <span class="styNBSP"></span>.
                 <span class="styNBSP"></span>.
              </b>
          </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">3</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
         </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
          <span class="styTableCellPad"></span>
         </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
          <span class="styTableCellPad"></span>
            </td>
        </tr>
      <!--  Line 4   -->
      <tr>
       <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">4
      </td> 
        <td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
          Phaseout percentage (see instructions)
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              </b>
        </td>
        <td class="styLNRightNumBox">4</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
       %
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          %
          </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
             %
             </td>
        </tr>
         <!-- Line 5  -->
      <tr>
      <td  class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="top">5</td>
        <td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
              <b> Tentative credit. </b>Multiply line 3 by line 4  
               <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..</span>       
<!--
              <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
             </b>
             -->
        </td>
         <td class="styLNRightNumBox" style="border-bottom-width:0px;">5</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">
          <span class="styTableCellPad"></span>
      </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">
          <span class="styTableCellPad"></span>
	              
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
          <span class="styTableCellPad"></span>
	</td>
        </tr> 
     </tbody>
  </table>
</div>
</xsl:if>
</div>
 <!--  Part II -->
  <div class="styBB" style="width: 187mm;padding-top:4px;padding-bottom:4px;border-top-width:1px">
    <div class="styPartName">Part II</div>
    <div class="styPartDesc">Credit for Business/Investment Use Part of Vehicle</div>
  </div>
  <div style="width:187mm"> <!-- Added by Doug Peterson-->
  <!--  End Part II header-->
   <xsl:if test="($Print != $Separated) or (count($FormData/BusinessInvestmentUse) &lt;= 3)">
  <xsl:for-each select="$FormData/BusinessInvestmentUse">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 3)=1">
 <div class="styIRS8910TableContainer" id="Spcctn">
   <!--print logic-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->


  <table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt;font-family:erdana">
     <thead class="styTableThead">
    </thead>
  <tfoot/>
<tbody>
       <!-- line 6  -->
             
      <tr>
      <!--
            <td class="styLNLeftNumBox" style="padding-left:3.6mm;width:5.5mm">7</td>
            -->

       <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width:0px;border-bottom-width:0px;">6
      </td>

        <td class="styTableCell" style="width:75mm; padding-left:2mm;text-align:left;border-color:black;border-left-width:0px;border-right-width: 0px;border-top-width:0px;border-bottom-width:0px;font-size:6pt;padding-top:.5mm;">
         Business/investment use percentage (see instructions)
             <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.</span>       

         <!--
            <b>
              <span class="styNBSP"></span>.
           </b>
           -->
       </td>
        <td class="styLNRightNumBox">6</td>
        <td class="styTableCell" style="border-color:black;border-left-width:1px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct" />
          </xsl:call-template>
        %
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUsePct" /> 
          </xsl:call-template>
          %
          </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUsePct" />  
          </xsl:call-template>
        %
        </td>
        </tr>
  <!-- Line 7  -->
      <tr>
      <!--
      <td class="styLNLeftNumBox" style="padding-left:3.6mm;width:5.5mm">7</td>
      -->

      <td  class="styTableCell" style="padding-left:.25mm;width:5.5mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center">7</td>

        <td class="styTableCell" style="width:75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
              Multiply line 5 by line 6<b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                 <span class="styNBSP"></span>.
             </b>
        </td>
         <td class="styLNRightNumBox" style="border-bottom-width:1px;">7</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
          <span class="styTableCellPad"></span>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmount" />
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
          <span class="styTableCellPad"></span>
	               <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUseAmount" />  
		        </xsl:call-template>      
        </td>
        <td class="styTableCell" style="border-color:black;border-left-width:0px;border-right-width:0px; border-top-width:0px; border-bottom-width:1px" valign="bottom">
          <span class="styTableCellPad"></span>
	         <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUseAmount" />  		         
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
 <xsl:if test="(count($FormData/BusinessInvestmentUse)=0) or (($Print = $Separated) and (count($FormData/BusinessInvestmentUse) &gt; 3))">
 <div class="styIRS8910TableContainer" id="Spcctn" >
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
    <!-- blank lines -->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <tfoot/>
    <tbody>
 <!-- line 6  -->
      <tr>
       <td  class="styTableCell" style="padding-left:.25mm;width:5.5mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">6
      </td> 
        <td class="styTableCell" style="width:75mm;text-align:left; border-color:black;border-left-width:0px;border-right-width: 0px;border-top-width:0px;border-bottom-width:0px;font-size:6pt;padding-top:.5mm;">
         Business/investment use percentage (See instructions)
       </td>
        <td class="styLNRightNumBox">6</td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/BusinessInvestmentUse) &gt; 3))">
            <td class="styTableCell" style="padding-left:1mm;width:32mm;border-color: black; border-left-width: 1px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse/BusinessInvestmentUsePct"/>
              </xsl:call-template>
              <span style="text-align:right;padding-left:7.5mm;width:auto">%</span>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="width:32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
              <span class="styTableCellPad"></span>
            %
            </td>
          </xsl:otherwise>
        </xsl:choose>
        <td class="styTableCell" style="width:32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
        %
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
          %
          </td>
        </tr>
         <!-- Line 7          -->
      <tr>
      <td  class="styBoldText" style="padding-left: 4mm;width:6mm;padding-top:.5mm;" >7</td>
        <td class="styTableCell" style="width:71mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
              Multiply line 5 by line 6<b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                 <span class="styNBSP"></span>.
             </b>
        </td>
         <td class="styLNRightNumBox" style="border-bottom-width:1px;border-left:width:0px;border-right-width:1px;">7</td>
        <td style="border-style:solid black;border-color:black;border-bottom: 1 solid black; border-left-width:1px;border-right-width:1 solid black; border-right-width:1px;border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

          <span class="styTableCellPad" style="border-color:black;border-left-width:1px;border-right-width:1px; border-top-width:0px; border-bottom-width:1px "></span>
   
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
          <span class="styTableCellPad"></span>
        </td>
        <td class="styTableCell" style="border-color:black;border-left-width:0px;border-right-width:0px; border-top-width:0px; border-bottom-width:1px" valign="bottom">
          <span class="styTableCellPad"></span>
        </td>
        </tr> 
        </tbody>
        </table>
        </div>
        </xsl:if>
      
  <!--  Line 8 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4mm">8</div>
    <div style="float:left;padding-top:.5mm;">
      Add columns (a) through (c) on line 7
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        ..................
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px">8</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInvestmentUseAmt"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>

  <!--  Line 9 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4mm">9</div>
    <div style="float:left;padding-top:.5mm;">
     Alternative motor vehicle credit from partnerships and S corporations
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        .........
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px">9</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/AlternativeMotorVehicleCredit"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!--  Line 10a -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">10</div>
    <div style="float:left;padding-top:.5mm;"><b>
   Business/investment use part of credit. </b>Add lines 8 and 9. Partnerships and S corporations, report
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 0px"></div>
      <div class="styLNAmountBox" style="border-bottom-width: 0px">
        </div>          
    </div>
  </div>
  <!-- end  Line 10a -->
   <!--  Line 10b -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm"></div>
    <div style="float:left;padding-top:.5mm;">
  this amount on Schedule K; all others, report this amount on Form 3800, line 1s
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">......  
       </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 0px">10</div>
      <div class="styLNAmountBox" style="border-bottom-width: 0px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/BusInvestmentUsePartOfCredit"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  </div>
  <!--  end Line 10b -->
  <!--   Part III header -->
  <div class="styBB" style="width: 187mm;padding-top:4px;padding-bottom:4px;border-top-width:1px">
    <div class="styPartName">Part III</div>
    <div class="styPartDesc">Credit for Personal Use Part of Vehicle</div>
  </div>
  <div style="width:187mm">
  
   <xsl:if test="($Print != $Separated) or (count($FormData/TentativeCreditForPersonalUse) &lt;= 3)">
  	<xsl:for-each select="$FormData/TentativeCreditForPersonalUse">
  		<xsl:variable name="pos" select="position()"/>
  		<xsl:if test="(position() mod 3)=1">
 			<div class="styIRS8910TableContainer" id="Spcctn">
   			<!--print logic-->
  				<xsl:call-template name="SetInitialState"/>
  			<!--end-->
  				<table class="styTable" cellspacing="0" border="0" cellpadding="0" style="font-size: 7pt;font-family:verdana">
     				<thead class="styTableThead">
    					</thead>
  					<tfoot/>
					<tbody>

      				<tr style="font-size: 7pt">
      					<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">11</td> 
        					<td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
             Subtract line 7 from line 5
                          	<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">......</span>
         					</td>
        					<td class="styLNRightNumBox">11</td>
           				<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">

          				<span class="styTableCellPad" ></span>
          				
          				<xsl:call-template name="PopulateAmount">
            					<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos]" />
          				</xsl:call-template>
        					</td>
         					<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">
         					<span class="styTableCellPad"></span>
         					<xsl:call-template name="PopulateAmount">
            					<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos + 1]" />
          				</xsl:call-template>
         					</td>
         					<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">
         					<span class="styTableCellPad"></span>
         					<xsl:call-template name="PopulateAmount">
            					<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos + 2]" />
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
 <xsl:if test="(count($FormData/TentativeCreditForPersonalUse)=0) or (($Print = $Separated) and (count($FormData/TentativeCreditForPersonalUse) &gt; 3))">
 <div class="styIRS8910TableContainer" id="Spcctn" >
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
       </thead>
    <tfoot/>
    <tbody>
 <!-- line 11 -->
    <tr style="font-size: 7pt">
    <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">11
        </td> 
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
             Subtract line 7 from line 5
             <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">........</span>       
       </td>
       <td class="styLNRightNumBox">11</td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/BusinessInvestmentUse) &gt; 3))">
            <td class="styTableCell" style="width:32mm;border-color: black; border-left-width:1px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
       <!-- separated but no data -->
            <td class="styTableCell" style="width:32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:0px; border-bottom-width:1px; text-align: center;">
              <span class="styTableCellPad"></span>
            </td>
     
          </xsl:otherwise>
        </xsl:choose>
       
   </tr> 
     </tbody>
    </table>
  </div>
  </xsl:if>
  </div> 
  <!--  Line 12 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">12</div>
    <div style="float:left;padding-top:.5mm;">
    Add columns (a) through (c) on line 11
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">..................
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px;">12</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotTentCreditForPersonalUse"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  <!-- End Line 12 -->
  
  <!--  Line 13 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm;height:3.8;">13</div>
    <div style="float:left;padding-top:.5mm;">
      Regular tax before credits:        
    </div>    
    <div style="float:right;">    
       
      <div class="styLNRightNumBox" style="border-bottom-width:0px;"></div>
      <div class="styLNAmountBox" style="border-bottom-width:0px;">
      
      </div>          
    </div>
  </div>
  <!-- End Line 13 -->
 
  <!--  Line 13a -->  
    <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:3.8mm;padding-left:2mm;"></div>
        <div style="float:left;padding-top:.5mm;">
     
        <div class="styGenericDiv" style="width:115mm;height:3.8mm;">
              <li style="height:3.8mm; ">Individuals. Enter the amount from Form 1040, line 44 (or Form 1040NR, line 41)</li>
              <li style="height:3.8mm; ">Other filers. Enter the regular tax before credits from your return</li>
       </div>
        <div class="styGenericDiv" style="height:4mm;">
	          <img src="{$ImagePath}/4684_Bracket.gif" width="4mm" height="25.5mm" alt="bracket image"/>
       </div>
       <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;height:8.2mm;"> ....
      </span> 
       </div>
       <div style="float:right;">
       <div class="styLNRightNumBox" style="width:8mm;height:8.2mm;vertical-align:bottom;padding-top:5mm;"> 
       13       
       </div>
      <div class="styLNAmountBox" style="height:8.2mm;padding-top:5mm;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/RegularTax"/>
          </xsl:call-template>
     </div>
     </div>
    </div>
   <!--  Line 14 -->  
  <div style="width: 187mm;">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm;height:4.5mm">14</div>
    <div style="float:left;padding-top:.5mm;">
       Credits that reduce regular tax before the alternative motor vehicle credit:
    </div> 
         <div style="float:right;">  
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-bottom-width:0px;padding-top:1mm;"></div>
      <div class="styLNAmountBoxNBB" style="padding-top:1mm;" >
    </div>          
    </div>
  </div>
        <!--  Line 14a -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 5mm">a</div>
    <div style="float:left;padding-top:.5mm;">Personal credits from Form 1040 or Form 1040NR (see instructions)
      </div>    
    <div style="float:right;">
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left"></span>
         <div class="styLNRightNumBox" style="height:5mm">14a</div>
        <div class="styLNAmountBox" style="height:5mm;">
        </div>
      <div class="styLNRightNumBoxNBB" style="height:5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:1mm; "></div>
      <div class="styLNAmountBoxNBB" style="height:5mm;border-bottom-width:0px;padding-top:1mm;">
     </div>          
    </div>
  </div>

   <!--  Line 14b -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 5mm">b</div>
    <div style="float:left;padding-top:.5mm;">Foreign Tax Credit</div>    
    <div style="float:right;">  
     <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">................</span> 
        <div class="styLNRightNumBox" style="height:4.5mm;">14b</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCredit"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;border-bottom-width:0px;padding-top:1mm;"></div>
      <div class="styLNAmountBoxNBB" style="border-bottom-width:0px;padding-top:1mm;"> </div>        
       </div>
  </div>

    <!--  Line 14c -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 5mm">c</div>
    <div class="styLNDesc" style="padding-top:.5mm;width:95mm;">
     Qualified electric vehicle credit (Form 8834, line 7)
        
      <span style="letter-spacing:4mm; font-weight:bold;">.....</span>
    </div>

    <div style="float:right;">
  
        <div class="styLNRightNumBox" style="height:4mm;">14c</div>
        <div class="styLNAmountBox" style="height:4mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QualifiedElectricVehicleCredit"/>
          </xsl:call-template>
        </div>
   
     <div class="styLNRightNumBox" style="border-bottom-width: 1px;background-color:lightgrey;"></div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
       </div>          
    </div>
  </div>
 
  <!--  Line 14d -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 5mm">d</div>
    <div style="float:left;padding-top:.5mm;">
    Add lines 14a through 14c
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        ..................
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px;">14d</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotCreditsThatReduceRegularTax"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  
  <!--  Line 15a  -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">15</div>
    <div style="float:left;padding-top:.5mm;">
     Net regular tax. Subtract line 14d from line 13. If zero or less, stop here; <span class="styBoldText">do not</span> file this form unless 
    </div>    
    <div style="float:right;">    
     <div class="styLNRightNumBox" style="border-bottom-width: 0px;"></div>
      <div class="styLNAmountBox" style="border-bottom-width: 0px">
      </div>          
    </div>
  </div>
 
  <!--  Line 15b --> 
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm"></div>
    <div style="float:left;padding-top:.5mm;">
      you are claiming a credit on line 10
          <span style="letter-spacing:4mm; font-weight:bold">    ..................
            </span>
    </div>    
    <div style="float:right;">    
       <div class="styLNRightNumBox" style="border-bottom-width: 1px;">15</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/NetRegularTax"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>

  
  <!--  Line 16 -->  
  <div style="width: 187mm;height:3.8mm;">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm;height:3.8mm;">16</div>
    <div style="float:left;padding-top:.5mm;">
  Tentative minimum tax (see instructions): 
    </div>    
    <div style="float:right;">    
      <div class="styLNRightNumBox" style="border-bottom-width:0px;"></div>
      <div class="styLNAmountBox" style="border-bottom-width: 0px">
    </div>          
    </div>
  </div>
  <!-- End Line 16-->
  <!--  Line 16a -->  
  <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:3.5mm;padding-left:2mm"></div>
        <div class="styLNDesc" style="width:134.2mm;height:3.5mm;">
             <li style="height:3.5mm;">Individuals. Enter the amount from Form 6251, line 33</li>
             <li style="height:3.5mm;">Other filers. Enter the tentative minimum tax from your alternative minimum tax form or schedule</li>
        </div>
        <div class="styLNDesc" style="width:2mm; height:3.5mm;">
			<img src="{$ImagePath}/4684_Bracket.gif" width="4mm" height="25.5mm" alt="bracket image"/>
	 </div>
        <div class="styLNDesc" style="width:3mm; height:3.8mm;"></div>
        <div class="styLNRightNumBox" style="width:7.75mm;height:8.25mm;padding-top:0mm;">
            <div class="styLNRightNumBoxNBB" style="width:7.75mm;padding-top:0.5mm;border-left-width:0px;">  </div>
            16
        </div>
        <div class="styLNAmountBox" style="height:8.25mm;">
          <br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TentativeMinimumTax"/>
           </xsl:call-template>
        </div>
     </div>
 
 <!--  Line 17a -->  
  <div style="width: 187mm;">  
    <div class="styLNLeftNumBox" style="padding-left:2mm">17</div>
    <div style="float:left;padding-top:.5mm;">
  Subtract line 16 from line 15. If zero or less, stop here; <b>do not</b> file this form unless you are claiming
    </div>    
    <div style="float:right;">    
       <div class="styLNRightNumBox" style="height:4.8mm;border-bottom-width:0px;background-color:lightgrey;"></div>
      <div class="styLNAmountBox" style="height:4.8mm;border-bottom-width:0px;">
      </div>          
    </div>
  </div>
  <!-- End Line 17a-->
  
  <!--  Line 17b -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm"></div>
    <div style="float:left;padding-top:.5mm;">
   a credit on line 10
           <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">     .......................
            </span>  
    </div>    
    <div style="float:right;">    
         <div class="styLNRightNumBox" style="border-bottom-width: 1px;">17</div>
      <div class="styLNAmountBox" style="border-bottom-width:1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/SubtractLine16FromLine15"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
 
  <!--  Line 18 -->  
  <div class="styBB" style="width: 187mm"> 
	
	 <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2mm">18</div>
	<div class="styLNDesc" style="width:139.2mm;height:4mm;padding-right:1mm;">
	<b>Personal use part of credit. </b>Enter the <b>smaller</b> of line 12 or 17 here and on Form 1040, line 55; Form 1040NR, line 50; or the appropriate line of your return. If line 17 is smaller than line 12, see instructions &#160;
      <!--Dotted Line-->
	<span style="letter-spacing:3.3mm;font-weight:bold;padding-right:1mm;skiplink:display:none;">............................
	</span>
	</div>
	<div class="styLNRightNumBox" style="height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;">
	<div class="styLNRightNumBoxNBB" style="height:6mm;padding-bottom:0mm;width:7.75mm;border-left-width:0px;background-color:lightgrey;">
      </div>
	  18
	  </div>
	<div class="styLNAmountBox" style="width:31mm;height:10.5mm;padding-top: 7mm;border-bottom:0px">
	<xsl:call-template name="PopulateAmount">
	<xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCredit"/>
	</xsl:call-template>
	</div>
	</div>
 
 <!-- End of page -->
        <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 37720F 
          <span style="width:80px;"></span>  
          Form <span class="styBoldText">8910</span> (2008)
        </div>
        <br/>
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
   
  <!-- Additional Data Table for Separated Data from Part I; displayed if more than 3 elements and Print is set to separated-->
  <xsl:if test="($Print = $Separated) and (count($FormData/IRS8910PartI) &gt; 3)">            
    <br />
    <br />
    <span class="styRepeatingDataTitle">Form IRS8910, Part I - Tentative Credit:</span>
    <xsl:for-each select="$FormData/IRS8910PartI">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 3)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
          <thead class="styTableThead">
            <tr style="height: 8mm" class="styDepTblHdr">
              <td class="styDepTblCell" colspan="2" style="width: 91mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">        
                <span class="styNormalText" style="padding-left: 5mm">
                  Use a separate column for each vehicle. If you need more<br/><span style="width: 5mm"></span>
                  columns, use additional Forms 8910 and include the totals <br/><span style="width: 5mm"></span>on line 8 and 12.
                </span>
              </td>
              <td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos)" format="a"/>)</td>
              <td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos + 1)" format="a"/>)</td>
              <td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos + 2)" format="a"/>)</td>
            </tr>
          </thead>
          <tfoot/>
          <tbody>
            <!--  Line 1   -->
            <!-- column 1 -->
            <tr class="styDepTblRow1" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span><span style="width: 1mm"></span>
                <span>Year, make, and model of vehicle</span>
              </td>
              <td class="styLNRightNumBox" style="border-top-width: 1px">1</td>
               <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="VehicleDescription/VehicleYear"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescription/VehicleMake"/>
          </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleDescription/VehicleModel"/>
          </xsl:call-template>
        </td>
        <!-- column 2 -->
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleYear" />  
          </xsl:call-template>
          <br />
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleMake" />  
          </xsl:call-template>
          <br />
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleModel" />  
          </xsl:call-template>

        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleYear" /> 
           </xsl:call-template>
           <br />
            <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleMake" /> 
           </xsl:call-template>
          <br />
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleModel" /> 
           </xsl:call-template>
        </td>
        </tr> 
            <!-- Line 2  -->
            <tr class="styDepTblRow2" style="height: 8mm; font-size: 7pt">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:2mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span><span style="width: 1mm"></span>
                <span>Enter date vehicle was placed in service <br /><span style="padding-left:4mm;"></span>
(MM/DD/YYYY)</span>
              </td>
              <td class="styLNRightNumBox">2</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDate" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/VehiclePlacedInServiceDate" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/VehiclePlacedInServiceDate" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
            </tr>

          <!-- Line 3  -->
            <tr class="styDepTblRow1" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
                <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span><span style="width: 1mm"></span>
                  <span>Maximum credit allowable (see instructions)
                  </span>
               </td>
               <td class="styLNRightNumBox" style="border-bottom-width: 1px">3</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MaximumAllowedCredit" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/MaximumAllowedCredit" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/MaximumAllowedCredit" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              </tr>
            <!--  Line 4   -->
            <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">4</span><span style="width: 1mm"></span>
                <span>Phaseout percentage (see instructions)</span>
              </td>
              <td class="styLNRightNumBox">4</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PhaseoutPercentage" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              %
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/PhaseoutPercentage" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              %
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/PhaseoutPercentage" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              %
              </td>
              </tr>

            <!-- Line 5  -->
            <tr class="styDepTblRow1" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">5</span><span style="width: 1mm"></span><b>Tentative credit.</b> Multiply  line 3 by line 4.
               </td>
               <td class="styLNRightNumBox" >5</td>
	
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TentativeCredit" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/TentativeCredit" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/TentativeCredit" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
             </tr>
           </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
    
      <!-- Additional Data Table for Separated Data from Part II; displayed if more than 3 elements and Print is set to separated-->
  <xsl:if test="($Print = $Separated) and (count($FormData/BusinessInvestmentUse) &gt; 3)">            
    <br />
    <br />
    <span class="styRepeatingDataTitle">Form IRS8910, Part II -Credit for Business/investment Use Part of Vehicle:</span>
    <xsl:for-each select="$FormData/BusinessInvestmentUse">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 3)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
       
          <tbody>
 <!-- line 6 -->         
           <tr class="styDepTblRow1" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">6</span><span style="width: 1mm"></span>Business/investment use percentage (see instructions)
               </td>
               <td class="styLNRightNumBox" >6</td>
	
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              %
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUsePct" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              %
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUsePct" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              
              %</td>
             </tr>
 <!-- line 7 -->            
              <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">7</span><span style="width: 1mm"></span>Multiple line 5 by line 6
               </td>
               <td class="styLNRightNumBox" >7</td>
	
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmount" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUseAmount" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUseAmount" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
             </tr>
           </tbody>
          </table>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
    
         <!-- Additional Data Table for Separated Data from Part III; displayed if more than 3 elements and Print is set to separated-->
  <xsl:if test="($Print = $Separated) and (count($FormData/TentativeCreditForPersonalUse) &gt; 3)">            
    <br />
    <br />
    <span class="styRepeatingDataTitle">Form IRS8910, Part III -Credit for Personal Use of Vehicle:</span>
    <xsl:for-each select="$FormData/TentativeCreditForPersonalUse">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 3)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
        
          <tbody>
 <!-- line 11 -->         
           <tr class="styDepTblRow1" style="height:8mm">
              <td class="styTableCell" valign="bottom" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;" >
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;text-align:bottom;">11</span><span style="width: 1mm;"></span>Subtract line 7 from line 5                                                                                                                                             
               </td>
               <td class="styLNRightNumBox" >11</td>
	
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos + 1]" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos + 2]" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
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