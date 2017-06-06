<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8936Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8936" />
<xsl:template match="/">
<html>
<head>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!--  No Browser Caching  -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching-->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8936"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">
  <!--************************************************************************
     Notes: Part I, line 1 thru 5, Part II, 6 and 7, and Part 3, line 11
              is an unbound repeatable columns.
     ************************************************************************** -->
	  <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8936Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
 </head>
<body class="styBodyClass">
  <form name="Form8936">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
 <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 20mm">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height:22mm;">
      Form <span class="styFormNumber">8936</span>      
     <br/>
		<br/> 
		<span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 22mm;width:125mm;padding-top:3mm;">
      <div class="styMainTitle" style="height: 8mm">Qualified Plug-in Electric Drive Motor Vehicle Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;">
        <div style="margin-left: 1.5mm;">
            <img src="{$ImagePath}/8936_Bullet_Md.gif" alt="MediumBullet"/>
            Attach to your tax return.<br/> <br/>
             </div>
    </div>
  </div>
  <div class="styTYBox" style="width:30mm;height:21mm; border-left-width: 1px">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-2137</div>
      <div class="styTY" style="height:10mm">20<span class="styTYColor">11</span></div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>125</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
   <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
  		 <xsl:choose>
			 <xsl:when test="$RtnHdrData/ReturnType='1040'">
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
      </div>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
   <!--  Note Line -->
  <div class="styBB" style="width: 187mm;">
         <div style="font-weight:bold">Note.</div>    
         <li>Use this form to claim the credit for certain plug-in electric vehicles (other than two-or three-wheeled or low-speed four-wheeled <br/>
         <span style="width:5mm"/>vehicles).</li>
         <li>Claim the credit for certain two-or three-wheeled or low-speed four-wheeled plug-in electric vehicles on Form 8834.</li>
         <li>Claim the credit for certain alternative motor vehicles or plug-in electric vehicle conversions on Form 8910.</li>
  </div>
  <!--  End Note Line -->
  <!--  Part I -->
  <div class="styBB" style="width: 187mm">
    <div class="styPartName">Part I</div>
    <div class="styPartDesc"  >Tentative Credit</div>
  </div>
  <!--  End Part I -->
 <div  style="width: 187mm"> 
  <xsl:if test="($Print != $Separated) or (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &lt;= 2)">
 <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 2)=1">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
   <table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt; font-family:verdana;">
    <tr style="height: 8mm">
      <th scope="col" class="PopulateTxt"  style="border-color:black;border-bottom-width:1px;padding-left:0px;padding-right:0px;"></th>
        <th scope="col" class="PopulateTxt" colspan="2" style="width:83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1mm; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px;">        
    <span class="styNormalText" style="font-size:6pt"> Use a separate column for each vehicle. If you need more columns, use additional Forms 8936 and include the totals on lines 7 and 11.
            </span>
         </th>
        <th class="styTableCell" style="width:47mm;font-weight:normal;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center"><b>(<xsl:number value="($pos)" format="a"/>)</b> 
          <span style="width:12mm;">Vehicle</span>     
            <xsl:number value="($pos)" format="1"/> 
        </th>
        <!--background-color:red;-->
        <th class="styTableCell" style="width:48mm;font-weight:normal;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px; text-align: center;"><b>(<xsl:number value="($pos + 1)" format="a"/>)</b> 
                  <span style="width:12mm;"> Vehicle</span>
                  <xsl:number value="($pos + 1)" format="1"/>   
        </th>
      </tr>
    <tfoot/>
    <tbody>
<tr>
      <!--  Line 1   -->
      <td class="styTableCell"  style="width:5.25mm;text-align:center;font-weight:bold;padding-top:6mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><b>1</b>
      </td>
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align:left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;padding-top:6mm">
       Year, make, and model of vehicle
       <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">...... </span>   
        </td>
 <td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:1px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px" >        
        <span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px;text-align:center;padding-right:.5mm">1</span>
                </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: left;padding-left:0mm;padding-right:0mm">
       
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
       <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align:left ">
        
          <xsl:call-template name="PopulateYear">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescription/VehicleYear" />  
          </xsl:call-template>
          <br />
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescription/VehicleMake" />  
          </xsl:call-template>
          <br />
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescription/VehicleModel" />  
          </xsl:call-template>
        </td>
                </tr> 
           <!-- Line 2  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">2
      </td>
         <td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
  Vehicle identification number (see instructions)
    <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..</span>    
         </td> 
         <td class="styLNRightNumBox">2</td>
      <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: left;padding-left:0mm;padding-right:0mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="VehicleIdentificationNumber" />
          </xsl:call-template>
        </td>
    <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: left;padding-left:0mm;padding-right:0mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleIdentificationNumber" />  
          </xsl:call-template>
        </td>
        </tr>
               <!-- Line 3  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">3
      </td> 
        <td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
   Enter date vehicle was placed in service (MM/DD/YY)
         </td>
         <td class="styLNRightNumBox">3</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; ">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDate" />
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehiclePlacedInServiceDate" />  
          </xsl:call-template>
        </td>
        </tr>
        <!-- Line 4  -->
     <tr>
         <td class="styTableCell" style="width:5.25mm;text-align:center;font-weight:bold;border-right-width: 0px;border-bottom-width:1px;border-color:black">4
        </td> 
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
               <b> Tentative credit </b>(see instructions for amount to enter)
            <!--    <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">...</span>   -->
          </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">4</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-left:15mm">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="VehicleTentativeCreditAmt" />
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;;padding-left:16mm">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleTentativeCreditAmt" /> 
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
 <div class="styIRS8936TableContainer" id="Spcctn" >
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
  <!-- blank lines -->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
    <tr style="height: 8mm">
      </tr>
    </thead>
    <tfoot/>
    <tbody>
    <!-- Header Line -->
       <tr>
			<td class="styBB" colspan="3" style="width:96.8mm;">Use a separate column for each vehicle. If you need more columns, use additional Forms 8936 and include the totals on lines 7 and 11.</td>
			<td  class="styTableCellSmall" style="border-left:1 solid black;width:45mm;text-align:center;font-weight:bold;" >
			        <span>(</span>
			       <xsl:number value="position()" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 1</span>
			       </td> 
			       <td  class="styTableCellSmall" 
			       style="border-left:1 solid black;width:45mm;text-align:center;font-weight:bold;border-right-width: 0px;" >
			        <span>(</span>
			       <xsl:number value="position() + 1" format="a"/>
			         <span>)</span>
			         <span style="width:18mm;font-weight:normal;">Vehicle 2</span>
			       </td> 
			      		</tr>    
      <!--  Line 1   -->
      <tr>
        <td class="styTableCell" style="  width:5mm;;text-align:right;font-weight:bold;padding-top:3mm;border-color:black;border-right-width:0px;border-bottom-width:0px;"><b>1</b>
      </td>
        <td class="styTableCell" style="width: 75mm;padding-top:3mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;">
       Year, make, and model of vehicle
         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">...... </span>
        </td>
        <td>
           <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;width:9.5mm;" > </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;height:3.5mm;">1</div>
        </td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align:center;padding-top:5mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp/VehicleDescription"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"></span></td>
          </xsl:otherwise>
        </xsl:choose>  
               <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
               <span class="styTableCellPad"></span></td>
              </tr>
  <!-- Line 2  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">2</td> 
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
   Vehicle identification number (see instructions)
    <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.. </span>   
        </td>
         <td class="styLNRightNumBox" style="border-top-width:1px;border-bottom-width:0px;">2</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
         </tr>
     <!-- Line 3  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">3</td> 
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
   Enter date vehicle was placed in service (MM/DD/YY)
        </td>
         <td class="styLNRightNumBox" style="border-top-width:1px;">3</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
        </tr>
  <!-- Line 4  -->
     <tr>
         <td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;border-bottom-width:1px;border-color: black">4</td> 
        <td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                <b> Tentative credit</b>(see instructions for amount to enter)
          </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">4</td>
        <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
          <span class="styTableCellPad"></span>
         </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
          <span class="styTableCellPad"></span>
         </td>
        </tr>
     </tbody>
  </table>
</div>
</xsl:if>
</div>
 <!--  Part II -->
  <div style="width: 187mm;border-top-width:1px;padding-left:4mm;">
        <b> Next:</b> If you did NOT use your vehicle for business or investment purposes and did not have a credit from a partnership or S corporation, skip Part II and go to
          Part III. All others, go to Part II.
  </div>
  <div class="styBB" style="width: 187mm;border-top-width:1px">
    <div class="styPartName">Part II</div>
    <div class="styPartDesc">Credit for Business/Investment Use Part of Vehicle</div>
  </div>
  <div style="width:187mm"> <!-- Added by Doug Peterson-->
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
  <table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt;font-family:erdana">
     <thead class="styTableThead">
    </thead>
  <tfoot/>
<tbody>
       <!-- line 5  -->
     <tr>
             <td class="styTableCell" style="width:5.25mm;text-align:left;font-weight:bold;border-right-width:0px;border-bottom-width:0px;
             padding-left:2mm;">5</td>
        <td class="styTableCell" style="width:75mm; text-align:left;border-color:black;border-left-width:0px;border-right-width: 0px;border-top-width:0px;border-bottom-width:0px;font-size:6pt;padding-top:.5mm;">
Business/investment use percentage (see instructions) 
             <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;"></span> 
         <!--
            <b>
              <span class="styNBSP"></span>.
           </b>
           -->
       </td>
        <td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px" >        
        <span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px;">5</span>
                </td>
        <td class="styTableCell" style="padding-top:5mm;width:47mm;border-color:black;border-left-width:1px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px; text-align:center;">
                    <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct" />
          </xsl:call-template>%
        <span class="styTableCellPad"></span>
        </td>
        <td class="styTableCell" style="padding-top:5mm;width:48mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:center;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUsePct" /> 
          </xsl:call-template>%
             </td>
        </tr>
  <!-- Line 6  -->
      <tr>
      <td  class="styTableCell" style="padding-left:2mm;width:5.5mm;text-align:left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center">6</td>
        <td class="styTableCell" style="width:70mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;text-align:left;">
              Multiply line 4 by line 5 <b>
  <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">........ </span>   
             </b>
        </td>
         <td class="styLNRightNumBox" style="border-bottom-width:1px;padding-left:.5mm">6</td>
        <td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;;padding-left:15mm" valign="bottom">
          <span class="styTableCellPad"></span>
	            <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmt" />
		      </xsl:call-template>      
       </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:16mm" valign="bottom">
          <span class="styTableCellPad"></span>
	               <xsl:call-template name="PopulateAmount">
		            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseAmt" />  
		        </xsl:call-template>      
        </td>
         </tr> 
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
 <div class="styIRS8936TableContainer" id="Spcctn" >
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
      <td class="styTableCell" style="     width:5mm;padding-left:2mm;text-align:left;font-weight:bold;padding-top:4mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;"><b>5</b>
     <!-- <div class="styLNLeftNumBoxSD" >7</div>-->
      </td>
        <td class="styTableCell" style="width: 80mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;padding-top:6mm;">
      Business/investment use percentage (see instructions)
     </td>
        <td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:1px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px" >        
        <span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px">5</span>
                </td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 2 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;width:46.5mm; text-align:center;padding-top:5mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp/BusinessInvestmentUsePct"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"></span></td>
          </xsl:otherwise>
        </xsl:choose>
         <td class="styTableCell" style="border-color: black; border-left-width: 0px;width:40mm; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align:right;">
         <span class="styTableCellPad">%</span></td>
       </tr>
  <!-- Line 6  -->
      <tr style="font-size: 7pt">
      <td class="styTableCell" style="width:5.25mm;text-align:left;padding-left:2mm;left;font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">6</td> 
        <td class="styTableCell" style="width: 75mm;padding-left:2mm; float:left;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
    <div style="float:left;padding-top:.5mm;">
      Multiply line 4 by line 5
    </div>   
   <span class="styDotLn" style="padding-left:1mm;float:left;">..........</span>
        </td>
         <td class="styLNRightNumBox">6</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
            <span class="styTableCellPad"></span>
        </td>
        </tr>
 </tbody>
  </table>
</div>
</xsl:if>
<!--Line 7 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBoxSD" >7</div>
    <div class="styLNDesc" style="width:139mm;">
      <span style="float:left;">Add columns (a) and (b) on line 6 </span> 
      <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>   
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;">7</div>
    <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInvestmentUseAmt"/>
      </xsl:call-template>
    </div>          
  </div>
  <!--  Line 8 -->
  <div style="width: 187mm">  
    <div class="styLNLeftNumBoxSD" >8</div>
    <div class="styLNDesc" style="width:139mm;">
      <span style="float:left;">Qualified plug-in electric drive motor vehicle credit from partnerships and S corporations </span> 
      <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>    
    </div>    
    <div class="styLNRightNumBox" style="height:4mm;">8</div>
    <div class="styLNAmountBox" style="height:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehCrPrtshpSCorpAmt"/>
      </xsl:call-template>
    </div>          
  </div>  
  <!--  Line 9 -->
  <div style="width: 187mm">  
    <div class="styLNLeftNumBoxSD" >9</div>
    <div class="styLNDesc" style="width:139mm;">
      <b>Business/investment use part of credit. </b>Add lines 7 and 8. Partnerships and S corporations, 
      <span style="float:left;">report this amount on Schedule K. All others, report this amount on Form 3800, line 1y</span> 
      <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>    
    </div>    
    <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">9</div>
    <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;;border-bottom-width:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/BusInvestmentUsePartOfCredit"/>
      </xsl:call-template>
    </div>          
  </div>  
  </div>
  <!--  end Line 9 -->
 <!--   Part III header -->
  <div class="styBB" style="width: 187mm;border-top-width:1px">
    <div class="styPartName">Part III</div>
    <div class="styPartDesc">Credit for Personal Use Part of Vehicle</div>
  </div>
     <!-- Line 10 -->
  <div  style="width: 187mm"> 
  <xsl:if test="($Print != $Separated) or (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &lt;= 2)">
 <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
  <xsl:variable name="pos" select="position()"/>
  <xsl:if test="(position() mod 2)=1">
 <div class="styIRS8936TableContainer" id="Spcctn">
   <!--print logic-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
   <table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt; font-family:verdana;">
   <tfoot/>
    <tbody>
<tr>
	<!--  Line 10  -->
      <td class="styTableCell"  style="width:5.25mm;text-align:center;font-weight:bold;padding-top:3mm;border-color:black;
      border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"><b>10</b>
      </td>
     <td class="styTableCell" style="width:77mm;padding-left:2mm; text-align:left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;padding-top:6mm;">
       If you skipped Part II, enter the amount from line 4. If you
completed Part II, subtract line 6 from line 4   
        </td>
 <td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px;" >       
        <span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px;">10</span>
                </td>
        <td class="styTableCell" style="width:46mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:right;padding-left:0mm;padding-right:0mm;padding-top:8mm;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="TentativeCreditForPersonalUse"/>
          </xsl:call-template>
                 </td>
      <td class="styTableCell" style="width:47mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:right;padding-top:8mm;">
          <span class="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/TentativeCreditForPersonalUse" />  
          </xsl:call-template>
                 </td>
               </tr> 
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
 <div class="styIRS8936TableContainer" id="Spcctn" >
   <!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
  <xsl:call-template name="SetInitialState"/>
  <!--end-->
  <!-- blank lines -->
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
    <tr style="height: 8mm">
      </tr>
    </thead>
    <tfoot/>
    <tbody>
    <!--  Line 10   -->
      <tr>
      <td class="styTableCell" style="     width:6mm;text-align:left;padding-left:2mm;font-weight:bold;border-color:black;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;
      padding-bottom:3mm;"><b>10</b>
      </td>
        <td class="styTableCell" style="width: 75mm;padding-left:1mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;">
       If you skipped Part II, enter the amount from line 4. If you completed Part II, subtract line 6 from line 4
    </td>
      <td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;border-bottom-width:0px;border-top-width:0px;border-right-width:0px;background-color:lightgrey;padding-left:0px;padding:right:0px" >        
        <span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;border-left-width:0px;
        background-color:white;padding-left:0px;padding-right:0px">10</span>
                </td>
        <xsl:choose>
          <!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
          <xsl:when test="(($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2))">
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;width:46.5mm; text-align:center;padding-top:5mm;">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="ShortMessage">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp/TentativeCreditForPersonalUse"/>
              </xsl:call-template>
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"></span></td>
          </xsl:otherwise>
        </xsl:choose>
                 <td class="styTableCell" style="border-color: black; border-left-width: 0px;width:45mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center"><span class="styTableCellPad"></span></td>
        </tr>
 </tbody>
  </table>
</div>
</xsl:if>
</div>
  <!--  Line 11 -->
<div style="width: 187mm">  
    <div class="styLNLeftNumBox" >11</div>
    <div class="styLNDesc" style="width:139mm;">
	  <span style="float:left;">Add columns (a) and (b) on line 10 </span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span> 
    </div>    
      <div class="styLNRightNumBox" style="height:4mm;">11</div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotTentCreditForPersonalUse"/>
        </xsl:call-template>
      </div>          
    </div>  
  <!-- End Line 11 -->  
  <!--  Line 12--> 
<div style="width: 187mm">  
    <div class="styLNLeftNumBox" >12</div>
    <div class="styLNDesc" style="width:139mm;">
	  <span style="float:left;">Enter the amount from Form 1040, line 46, or Form 1040NR, line 44 </span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">............</span> 
    </div>    
      <div class="styLNRightNumBox" style="height:4mm;">12</div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/TotalTxBeforeCrAndOtherTxsAmt"/>
        </xsl:call-template>
      </div>          
    </div>
   <!-- Line 13    -->
   <div style="width187mm;">
	  <div class="styLNLeftNumBox" >13</div>
      <div class="styLNDesc" style="width:139mm;">
        <span style="float:left;">Personal credits from Form 1040 or 1040NR (see instructions) </span> 
        <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span> 
      </div>
      <div class="styLNRightNumBox" style="height:4mm;">13</div>
	  <div class="styLNAmountBox"  style="height:4mm;">
		<xsl:call-template name="PopulateAmount">
		  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehOtherFormCreditsAmt"/>
		</xsl:call-template> 
	  </div>
    </div>
     <!--  Line 14--> 
<div style="width: 187mm">  
    <div class="styLNLeftNumBox" >14</div>
    <div class="styLNDesc" style="width:139mm;">
	  <span style="float:left;">Subtract line 13 from line 12 </span> 
	  <span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span> 
    </div>    
      <div class="styLNRightNumBox" style="height:4mm;">14</div>
      <div class="styLNAmountBox" style="height:4mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehAdjPrsnlCreditAmt"/>
        </xsl:call-template>
      </div>          
    </div>
	<!-- Line 15  -->	
	<div class="styBB" style="width: 187mm">  
      <div class="styLNLeftNumBox" >15</div>
      <div class="styLNDesc" style="width:139mm;">
	    <b> Personal use part of credit. </b> Enter the <b>smaller </b>of line 11 or line 14 here 
	    and on Form 1040,  line 53, or Form 1040NR, line 50. 
        Check box <b>c</b> on that line and enter “8936” in the space next to that box. If line 14 
        <span style="float:left;">is smaller than line 11, see instructions </span> 
	    <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span> 
      </div>    
      <div class="styLNRightNumBoxNBB" style="height:10mm;padding-top:8mm;">15</div>
      <div class="styLNAmountBoxNBB" style="height:10mm;padding-top:8mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCredit"/>
        </xsl:call-template>
      </div>          
  </div>
 <!-- End of page -->
      	<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:122px;"/>                      
          Cat. No. 37751E
          <span style="width:125px;"/>  
          Form <span class="styBoldText">8936</span> (2011)
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
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br />
    <br />
    <span class="styRepeatingDataTitle">Form IRS8936, Part I - Tentative Credit:</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
          <thead class="styTableThead">
            <tr style="height: 8mm" class="styDepTblHdr">
              <td class="styDepTblCell" colspan="2" style="width: 91mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">        
                <span class="styNormalText" style="padding-left: 5mm">
                  Use a separate column for each vehicle. If you need more columns, use additional Forms 8936 and include the totals on lines 7 and 11.
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
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescription/VehicleYear" />  
          </xsl:call-template>
          <br />
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescription/VehicleMake" />  
          </xsl:call-template>
          <br />
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp [$pos + 1]/VehicleDescription/VehicleModel" />  
          </xsl:call-template>
        </td>
            </tr> 
            <!-- Line 2  -->
            <tr class="styDepTblRow2" style="height: 8mm; font-size: 7pt">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:2mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span><span style="width: 1mm"></span>
     Vehicle identification number (see instructions)
              </td>
              <td class="styLNRightNumBox">2</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="VehicleIdentificationNumber" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleIdentificationNumber" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
             </tr>
               <!-- Line 3  -->
            <tr class="styDepTblRow1" style="height: 8mm; font-size: 7pt">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:2mm;">
              <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span><span style="width: 1mm"></span>
                <span>Enter date vehicle was placed in service <br /><span style="padding-left:4mm;"></span>
(MM/DD/YYYY)</span>
              </td>
              <td class="styLNRightNumBox">3</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDate" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align:center;padding-top:6mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehiclePlacedInServiceDate" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              </tr>
            <!-- Line 4 -->
            <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">4</span>
              <span style="width: 1mm"></span><b>Tentative credit.</b> (see instructions for amount to enter).
               </td>
               <td class="styLNRightNumBox" >4</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="VehicleTentativeCreditAmt" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/VehicleTentativeCreditAmt" />
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
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br />
    <br />
    <span class="styRepeatingDataTitle">Form IRS8936, Part II -Credit for Business/investment Use Part of Vehicle:</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
          <tbody>
 <!-- line 5 -->         
           <tr class="styDepTblRow1" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">5</span>
              <span style="width: 1mm"></span>Business/investment use percentage (see instructions)
               </td>
               <td class="styLNRightNumBox" >5</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              %
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUsePct" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              %
              </td>
            </tr>
 <!-- line 6  -->            
              <tr class="styDepTblRow2" style="height: 8mm">
              <td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-top:4mm;">
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">6</span><span style="width: 1mm"></span>Multiple line 4 by line 5
               </td>
               <td class="styLNRightNumBox" >6</td>
             <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmt" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/BusinessInvestmentUseAmt" />
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
  <xsl:if test="($Print = $Separated) and (count($FormData/QlfyPlugInElecDriveMtrVehCrGrp) &gt; 2)">            
    <br />
    <br />
    <span class="styRepeatingDataTitle">Form IRS8936, Part III -Credit for Personal Use Part of Vehicle:</span>
    <xsl:for-each select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:if test="(position() mod 2)=1">
        <table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
         <tbody>
 <!-- line 10 -->         
           <tr class="styDepTblRow1" style="height:8mm">
              <td class="styTableCell"  style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;" >
              <span class="styBoldText" style="font-size:7pt; padding-left: 2mm;text-align:bottom;">10</span><span style="width: 1mm;">
              </span>  If you skipped Part II, enter the amount from line 4. <br/> 
              <span style="width: 7mm;"/>If you completedPart II, subtract line 6 from line  4                                                                                                             
               </td>
               <td class="styLNRightNumBox" >10</td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TentativeCreditForPersonalUse" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
              </td>
              <td class="styTableCell" valign="bottom" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width:1px; border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCrGrp[$pos + 1]/TentativeCreditForPersonalUse" />
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