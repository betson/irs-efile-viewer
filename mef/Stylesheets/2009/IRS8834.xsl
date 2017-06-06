<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="IRS8834Style.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8834"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Form IRS 8834"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8834Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form8834">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 20mm">
            <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm">
      Form <span class="styFormNumber">8834</span>
              <br/>
                <span style="width:2px;"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
             <!-- <span class="styAgency">(Rev. Novmber 2009)</span>-->
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="height: 22mm;width:125mm">
              <div class="styMainTitle" style="height: 8mm">Qualified Plug-in Electric and Electric Vehicle Credit</div>
              <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold">
                <br/>
                <div style="margin-left: 1.5mm; padding-top:1mm">
                  <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>  
          Attach to your tax return.
        </div>
               <div style="padding-top:1.5mm">
                 <!-- <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>  
          See instructions on back.-->
        </div>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1374</div>
              <div class="styTY" style="height:10mm">20<span class="styTYColor">09</span>
              </div>
              <div class="stySequence">Attachment<br/>Sequence No. <b>111</b>
              </div>
            </div>
         </div>
          <!--  End title of Form  -->
          <!--  Name and Employer identification number  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
              <div style="font-family:verdana;font-size:6pt;height:6mm">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div class="styEINBox" style=" padding-left:2mm; font-size:7pt;">
              <span class="BoldText">Identifying number</span>
              <div style="text-align:left;font-weight:normal; ">
                <br/>
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/IdentifyingNumber) != ''">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$FormData/IdentifyingNumber"/>
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
          <div class="styBB" style="width: 187mm; border-top-width: 0px">
            <div class="styPartName" style="width: 15mm">Part I</div>
            <div class="styPartDesc" style="width: 172mm">Qualified Plug-in Electric Vehicle Credit 
            <span class="styNormalText" style="font-size: 7pt">(For vehicles acquired and placed in service after February 17, 2009)</span>
       
                
            </div>
            </div>
          <div class="styBB" style="width: 187mm">
            <div class="styBoldText" style="padding-bottom:0mm;">
              <span style="font-size: 10pt">Section A</span>
              <span style="width: 1mm"/>
              <span style="font-size: 9pt">— Vehicle Information</span>
            </div>
              </div>
          <!--  End Name and Employer indentification number  -->
          
   
 <div class="styIRS8834TableContainer" id="Spcctn">
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
   
       <xsl:choose>
       
       <!-- Creates table outline when there is no data  -->
		<xsl:when test="count($FormData/VehicleInformation) &lt; 1">
		     <thead class="styTableThead">
     			<tr style="height: 8mm"> 
        			<th class="styTableCell" colspan="3" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:left;">
          				<span class="styNormalText" style="font-size:7pt;">
            					Use a separate column for each vehicle. If you need more columns, use additional Forms 8834 and include the totals on lines 11 and 18.
             				</span>
        			</th>
        			<th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:0px; border-bottom-width:1px; text-align: center">(<xsl:number value="1" format="a"/>)<br>Vehicle 1</br></th>
        			<th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="2" format="a"/>)<br>Vehicle 2</br></th>
        			<th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="3" format="a"/>)<br>Vehicle 3</br></th>
      			</tr>
    		</thead>
    		<tfoot/>
    		<tbody>
    			<tr>
        			<td  class="styBoldText" style="padding-top:30mm; padding-left: 2mm;width:6mm;" valign="middle">1</td>
        			<td class="styTableCell" style="width:98mm; text-align: left; height: 30mm; padding-top:30mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
          				Year, make, and model of vehicle
          				<b>
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.

          				</b>
        			</td>
        			<td class="styLNRightNumBox">1</td>
                		<td class="styTableCell" style="text-align:left;width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"/></td>
                		<td class="styTableCell" style="text-align:left;width: 32mm;border-color: black; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"/></td>
                		<td class="styTableCell" style="text-align:left;width: 32mm;border-color: black; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"/></td>
        		</tr>
        		<tr>
        			<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">2</td>
        			<td class="styTableCell" style="width:98mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px ;font-size:7pt;">
          				Enter date vehicle was placed in service (MM/DD/YYYY)

        			</td>
        			<td class="styLNRightNumBox" style="border-top-width: 0px">2</td>
        			<td class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
          		<!-- provides one space of padding between data and table cell border-->
          				<span class="styTableCellPad"/> 

        			</td>
        			<td class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
          		<!-- provides one space of padding between data and table cell border-->
          				<span class="styTableCellPad"/> 
        			</td>
        			<td class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
          				<!-- provides one space of padding between data and table cell border-->
          				<span class="styTableCellPad"/> 

        			</td>
      			</tr>
        
       	<!-- Line 3  -->
      			<tr style="font-size: 7pt">
      				<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;border-style: solid;border-color: black; border-width:0px 0px 1px 0px">3
      				</td> 
        			<td class="styTableCell" style="width:98mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; ">
    					Cost of the vehicle
  					<b>
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
               				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
              
    					</b>
  
         			</td>
         			<td class="styLNRightNumBox">3</td>
				<td class="styTableCell" style="width: 35mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
</span></td>
        			<td class="styTableCell" style="width: 35mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
</span></td>
        			<td class="styTableCell" style="width: 35mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
</span></td>
         		</tr>

        	</tbody>

	</xsl:when>
	<xsl:otherwise>
 
 	<xsl:for-each select="$FormData/VehicleInformation">
  		<xsl:variable name="pos" select="position()"/>
			 <xsl:if test="(position() mod 3)=1">


     			<thead class="styTableThead">
     				<tr style="height: 8mm"> 
        				<th class="styTableCell" colspan="3" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:left;">
          					<span class="styNormalText" style="font-size:7pt;">
            				Use a separate column for each vehicle. If you need more columns, use additional Forms 8834 and include the totals on lines 11 and 18.
             					</span>
       				 </th>
        				<th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos)" format="a"/>)<br>Vehicle 1</br></th>
        				<th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos + 1)" format="a"/>)<br>Vehicle 2</br></th>
        				<th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos + 2)" format="a"/>)<br>Vehicle 3</br></th>
      				</tr>
   		 </thead>
    		<tfoot/>
    		<tbody>
    

         
    <tr>
        <td  class="styBoldText" style="padding-top:30mm; padding-left: 2mm;width:6mm;" valign="middle">1</td>
        <td class="styTableCell" style="width:98mm; text-align: left; height: 30mm; padding-top:30mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
          Year, make, and model of vehicle
          <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.

          </b>
        </td>
        <td class="styLNRightNumBox">1</td>
        <td class="styTableCell" style="text-align:left;width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top: 28mm;padding-left:1mm;" valign="bottom">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleYear"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleYear">, </xsl:if>
          <xsl:call-template name="PopulateText">
          	<xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleMake"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleModel and 
          $FormData/VehicleInformation[$pos]/VehicleDescription/VehicleMake">, </xsl:if>
          <xsl:call-template name="PopulateText">
          	<xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleModel"/>
          </xsl:call-template>
          <span class="styTableCellPad"/>
        </td>

        <td class="styTableCell" style="text-align:left;width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top: 28mm;padding-left:1mm;" valign="bottom">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleYear"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleYear">, </xsl:if>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleMake"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos+1]/VehicleDescription/VehicleModel and 
          $FormData/VehicleInformation[$pos+1]/VehicleDescription/VehicleMake">, </xsl:if>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleModel"/>
          </xsl:call-template>
          <span class="styTableCellPad"/>
        </td>

        <td class="styTableCell" style="text-align:left;width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top: 28mm;padding-left:1mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +2]/VehicleDescription/VehicleYear"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos+2]/VehicleDescription/VehicleYear">, </xsl:if>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +2]/VehicleDescription/VehicleMake"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos+2]/VehicleDescription/VehicleModel and 
          $FormData/VehicleInformation[$pos+2]/VehicleDescription/VehicleMake">, </xsl:if>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +2]/VehicleDescription/VehicleModel"/>
          </xsl:call-template>
          <span class="styTableCellPad"/>
        </td>

    </tr> 
       
       <!-- Line 2  -->
      <tr>
        <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">2</td>
        <td class="styTableCell" style="width:98mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px ;font-size:7pt;">
          Enter date vehicle was placed in service (MM/DD/YYYY)

        </td>
        <td class="styLNRightNumBox" style="border-top-width: 0px">2</td>
        <td class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
          <!-- provides one space of padding between data and table cell border-->
          <span class="styTableCellPad"/> 
          <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]//VehiclePlacedInServiceDate"/> 
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
          <!-- provides one space of padding between data and table cell border-->
          <span class="styTableCellPad"/> 
          <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]//VehiclePlacedInServiceDate"/> 
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
          <!-- provides one space of padding between data and table cell border-->
          <span class="styTableCellPad"/> 
          <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +2]//VehiclePlacedInServiceDate"/> 
          </xsl:call-template>
        </td>
      </tr>
        
       <!-- Line 3  -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;border-style: solid;border-color: black; border-width:0px 0px 1px 0px">3
      </td> 
        <td class="styTableCell" style="width:98mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; ">
    Cost of the vehicle
  <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
             
              
    </b>
  
         </td>
         <td class="styLNRightNumBox">3</td>
         
         <td class="styTableCell" style="width: 35mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CostOfVehicleAmt"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="width: 35mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos + 1]/CostOfVehicleAmt"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="width: 35mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos + 2]/CostOfVehicleAmt"/>
        </xsl:call-template></span></td>
         </tr>
             </tbody>
                </xsl:if>
  </xsl:for-each>
   </xsl:otherwise>
  </xsl:choose>

        </table>
      </div>


  
   <div class="styBB" style="width:187mm;font-size:8pt;">
   <b>Next:</b> If you did NOT use your vehicle for business or investment purposes and did not have a credit from a partnership or
S corporation, skip Section B and go to Section C. All others, go to Section B.</div>
 	<div class="styBB" style="width: 187mm">
            <div class="styBoldText" style="padding-bottom:0mm;">
              <span style="font-size: 10pt">Section B— </span>
              <span style="width: 1mm"/>
        	<span style="font-size: 9pt">Credit for Business/Investment Use Part of Vehicle</span>
            </div>
      </div>


<xsl:choose>
       
       <!-- Creates table outline when there is no data  -->
<xsl:when test="count($FormData/CrBusinessInvestmentVehicle) &lt; 1">
	<table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
    <tr style="height:4mm">
      <th style="width:6mm;"></th>
      <th class="styTableCell" colspan="2" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align:left;">        
         </th>
       </tr>
    </thead>
    <tfoot/>
    <tbody>
		<tr>
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">4</td>
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;">
 Business/investment use percentage (see instructions)
        </td>
        <td class="styLNRightNumBox" style="border-top-width: 1px">4</td>
        <td class="styTableCell" style="height:10mm;border-color: black; border-left-width: 1px;border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right; padding-top:10mm"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 10mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right; padding-top:10mm"><span class="styTableCellPad"></span></td>
	<td class="styTableCell" style="height: 10mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:1px; text-align: right; padding-top:10mm"><span class="styTableCellPad"></span></td>
        </tr>
        
           <!-- Line 5 -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">5
      </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
    Multiply line 3 by line 4
  <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
             </b>
           </td>
         <td class="styLNRightNumBox">5</td>
         <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span></td>
       </tr>
        
        <!-- Line 6  -->
     <tr>
         <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">6
        </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
                Section 179 expense deduction (see instructions)
               </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">6</td>
         
          <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"></span></td>
          </tr>
        
             <!--  Line 7  -->
      <tr>
       <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">7
      </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
        
          Subtract line 6 from line 5
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              
              </b>
        </td>
        <td class="styLNRightNumBox">7</td>
             <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
               </tr>
         <!-- Line 8  -->
        <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="top">8</td>
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
               Multiply line 7 by 10% (.10)
             <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                 </b>
       </td>
         <td class="styLNRightNumBox">8</td>
            
              <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span>
        </td>
       </tr> 
       
       <!-- Line 9 -->
      <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="top">9</td>
        <td class="styTableCell" style="height: 4.5mm;width:75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
          Maximum credit per vehicle
              <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                
              </b>
        </td>
         <td class="styLNRightNumBox">9</td>
         <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">2,500.00</span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">2,500.00</span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">2,500.00</span></td>
        </tr>  
        
       <!-- Line 10  -->
      <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;">10</td>
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
          Enter the <span class="styBoldText">smaller</span> of line 8 or line 9
            <b>
            <span class="styNBSP"></span>.
            <span class="styNBSP"></span>.
            
          </b>
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width:1px">10</td>
         
       
               <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        </tr>
        </tbody>
        </table>
		</xsl:when> 
		<xsl:otherwise>


 <xsl:for-each select="$FormData/CrBusinessInvestmentVehicle">
 <xsl:variable name="pos" select="position()"/>
 <xsl:if test="(position() mod 3)=1">
 <div class="styIRS8834TableContainer" id="Spcctn">
 
        <table class="styTable" cellspacing="0" style="font-size: 7pt">
     <thead class="styTableThead">
    <tr style="height:4mm">
      <th style="width:6mm;"></th>
      <th class="styTableCell" colspan="2" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align:left;">        
         </th>
       </tr>
    </thead>
    <tfoot/>
    <tbody>
        
     <!--  Line 4   -->
      <tr>
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;padding-top:4mm;">4</td>
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;padding-top:6mm">
 Business/investment use percentage (see instructions)
        </td>
        <td class="styLNRightNumBox" style="border-top-width: 1px">4</td>
                <td class="styTableCell" style="height:10mm;border-color: black; border-left-width: 1px;border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right; padding-top:10mm">
         <span class="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle/QlfyElecVehBusInvestmentUse"/>
        </xsl:call-template>%
       
       </td>
        
        <td class="styTableCell" style="height: 10mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right; padding-top:10mm">
        <span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehBusInvestmentUse"/>
        </xsl:call-template>%
        </span>
        </td>
        
        <td class="styTableCell" style="height: 10mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:1px; text-align: right; padding-top:10mm">
        <span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 2]/QlfyElecVehBusInvestmentUse"/>
        </xsl:call-template>%
        </span>
        </td>
        </tr>
        
           <!-- Line 5 -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">5
      </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
    Multiply line 3 by line 4
  <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
             </b>
           </td>
         <td class="styLNRightNumBox">5</td>
         <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle/QlfyElecVehBusInvestmentUsePct"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
    <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehBusInvestmentUsePct"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 2]/QlfyElecVehBusInvestmentUsePct"/>
        </xsl:call-template></span></td>
       </tr>
        
        <!-- Line 6  -->
     <tr>
         <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">6
        </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
                Section 179 expense deduction (see instructions)
               </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">6</td>
         
          <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
              <xsl:call-template name="PopulateAmount">
         <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle/QlfyElecVehSect179ExpDed"/>
        </xsl:call-template></span></td>
        
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehSect179ExpDed"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 2]/QlfyElecVehSect179ExpDed"/>
        </xsl:call-template></span></td>
          </tr>
        
             <!--  Line 7  -->
      <tr>
       <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">7
      </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
        
          Subtract line 6 from line 5
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              </b>
        </td>
        <td class="styLNRightNumBox">7</td>
             <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
               <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle/QlfyElecVehDedLessBusInvst"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehDedLessBusInvst"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 2]/QlfyElecVehDedLessBusInvst"/>
        </xsl:call-template></span></td>
               </tr>
         <!-- Line 8  -->
        <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="top">8</td>
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
               Multiply line 7 by 10% (.10)
             <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                 </b>
       </td>
         <td class="styLNRightNumBox">8</td>
            
              <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">
              <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle/QlfyElecVehNetPct"/>
        </xsl:call-template></span></td>
        
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"><xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehNetPct"/>
        </xsl:call-template></span></td>
        
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 2]/QlfyElecVehNetPct"/>
        </xsl:call-template>
        </span>
        </td>
       </tr> 
       
       <!-- Line 9 -->
      <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="top">9</td>
        <td class="styTableCell" style="height: 4.5mm;width:75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
          Maximum credit per vehicle
              <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                
              </b>
        </td>
         <td class="styLNRightNumBox">9</td>
         <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">2,500.00</span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">2,500.00</span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">2,500.00</span></td>
        </tr>  
        
       <!-- Line 10  -->
      <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;">10</td>
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
          Enter the <span class="styBoldText">smaller</span> of line 8 or line 9
            <b>
            <span class="styNBSP"></span>.
            <span class="styNBSP"></span>.
            
          </b>
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width:1px">10</td>
         
       
               <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
               <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle/QlfyElecVehSmallerPctOrCr"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehSmallerPctOrCr"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 2]/QlfyElecVehSmallerPctOrCr"/>
        </xsl:call-template></span></td>
       
        </tr>
        
      </tbody>
    </table>
  </div>
  </xsl:if> 
  </xsl:for-each>
  </xsl:otherwise>
  </xsl:choose>
  <!--</xsl:if>-->

  <!--  Line11 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">11</div>
    <div style="float:left;padding-top:.5mm;">
      Add columns (a) through (c) on line 10
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        .................
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px">11</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehTotBusInvstUse"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  
  
  <!--  Line 12 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">12</div>
    <div style="float:left;padding-top:.5mm;">
      Qualified plug-in electric vehicle credit from partnerships and S corporations
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        ......
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px">12</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPlugInVehicleCr"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  
<!--  Line 13 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 2mm">13</div>
    <div style="float:left;padding-top:.5mm;">
     <b> Business/investment use part of credit.</b> Add lines 11 and 12. Partnerships and S corporations,
     <br></br>
     report this amount on Schedule K; all others, report this amount on Form 3800, line 1z
    </div>  
    <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        </span>          
    <div style="float:right;">    
      
      <div class="styLNRightNumBox" style="padding-top:.5mm;border-bottom-width: 1px">13</div>
      <div class="styLNAmountBox" style="padding-top:.5mm;border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehBusUsePrtCr"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>  
  <div class="styBB" style="width: 187mm"/>
  <div class="styBB" style="width: 187mm">
            <div class="styBoldText" style="padding-bottom:0mm;">
              <span style="font-size: 10pt">Section C— </span>
              <span style="width: 1mm"/>
              <span style="font-size: 9pt">Credit for Personal Use Part of Vehicle</span>
            </div>
              </div>
    
  
  <!--Section C-->



<div class="styIRS8834TableContainer" id="Spcctn1">
<table class="styTable" cellspacing="0" style="font-size: 7pt">
  
  <xsl:choose>
       
  <!-- Creates table outline when there is no data  -->
	<xsl:when test="count($FormData/CreditPersonalUsePartVehicle) &lt; 1">
	
	<thead class="styTableThead">
    <tr style="height: 8mm">
      <th style="width:6mm;"></th>
      <th class="styTableCell" colspan="2" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align:left;">        
       </th>
      
      <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; text-align: center">(<xsl:number value="(1)" format="a"/>)<br>Vehicle 1</br></th>
      
      <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; text-align: center">(<xsl:number value="(2)" format="a"/>)<br>Vehicle 2</br></th>
      
      <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: center">(<xsl:number value="(3)" format="a"/>)<br>Vehicle 3</br></th>
      </tr>
    </thead>
    <tfoot/>
    <tbody> 
    
      <!--  Line 14   -->
      <tr>
      <td class="styBoldText" style="font-size: 7pt; padding-bottom: 3mm;padding-left: 2mm;width:6mm;">14
      </td>
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
 If you skipped Section B, enter the amount from line 3. If you completed Section B, subtract line 5 from line 3 
        </td>
        <td class="styLNRightNumBox" style="border-top-width: 1px">14</td>
       <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span>
              </td>
       <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span>
         </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span>
            </td>
        </tr>
        
           <!-- Line 15  -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">15
      </td> 
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
    Multiply line 14 by 10% (.10)
  <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              </b>
           </td>
         <td class="styLNRightNumBox">15</td>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad"></span></td>
       </tr>
        
        <!-- Line 16  -->
     <tr>
         <td class="styBoldText" style="font-size: 7pt; padding-bottom: 6mm; padding-left: 2mm;width:6mm;">16
        </td> 
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
                Maximum credit per vehicle. If you skipped Section B, enter
$2,500. If you completed Section B, subtract line 10 from
line 9
              <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              
    </b>
             
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">16</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"></span></td>
         </tr>
      <!--  Line 17   -->
      <tr>
       <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">17
      </td> 
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
        
          Enter the <b>smaller</b> of line 15 or line 16
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              
            </b>
        </td>
        <td class="styLNRightNumBox">17</td>
       
               <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
        </tr>
        </tbody>
    </xsl:when>
    <xsl:otherwise>


  
 <xsl:for-each select="$FormData/CreditPersonalUsePartVehicle">
  <xsl:variable name="pos" select="position()"/>
 <xsl:if test="(position() mod 3)=1">
 
  

     <thead class="styTableThead">
    <tr style="height: 8mm">
      <th style="width:6mm;"></th>
      <th class="styTableCell" colspan="2" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align:left;">        
       </th>
      
      <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; text-align: center">(<xsl:number value="($pos)" format="a"/>)<br>Vehicle 1</br></th>
      
      <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; text-align: center">(<xsl:number value="($pos + 1)" format="a"/>)<br>Vehicle 2</br></th>
      
      <th class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: center">(<xsl:number value="($pos + 2)" format="a"/>)<br>Vehicle 3</br></th>
      </tr>
    </thead>
    <tfoot/>
    <tbody>
    
    
      <!--  Line 14   -->
      <tr>
      <td class="styBoldText" style="font-size: 7pt; padding-bottom: 3mm;padding-left: 2mm;width:6mm;">14
      </td>
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
 If you skipped Section B, enter the amount from line 3. If you completed Section B, subtract line 5 from line 3 
        </td>
        <td class="styLNRightNumBox" style="border-top-width: 1px">14</td>
       <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
            <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle/QlfyElecVehNetCostPrsnlUse"/>
        </xsl:call-template>
              </span>
              </td>
       <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehNetCostPrsnlUse"/>
        </xsl:call-template>
           </span>
         </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 2]/QlfyElecVehNetCostPrsnlUse"/>
        </xsl:call-template>
              </span>
            </td>
        </tr>
        
           <!-- Line 15  -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">15
      </td> 
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
    Multiply line 14 by 10% (.10)
  <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              </b>
           </td>
         <td class="styLNRightNumBox">15</td>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle/QlfyElecVehNetCostPcnt"/>
        </xsl:call-template>
        </span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehNetCostPcnt"/>
        </xsl:call-template>
        </span>
        </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 2]/QlfyElecVehNetCostPcnt"/>
        </xsl:call-template>
        </span>
        </td>
       </tr>
        
        <!-- Line 16  -->
     <tr>
         <td class="styBoldText" style="font-size: 7pt; padding-bottom: 6mm; padding-left: 2mm;width:6mm;">16
        </td> 
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
                Maximum credit per vehicle. If you skipped Section B, enter
$2,500. If you completed Section B, subtract line 10 from
line 9
              <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              
    </b>
             
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">16</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
              <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle/QlfyElecVehMaxCrPerVeh"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
        <span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehMaxCrPerVeh"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 2]/QlfyElecVehMaxCrPerVeh"/>
        </xsl:call-template></span></td>
         </tr>
      <!--  Line 17   -->
      <tr>
       <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">17
      </td> 
        <td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
        
          Enter the <b>smaller</b> of line 15 or line 16
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              
            </b>
        </td>
        <td class="styLNRightNumBox">17</td>
       
               <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
               <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle/QlfyElecVehSmllrCostOrMaxCr"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehSmllrCostOrMaxCr"/>
        </xsl:call-template></span></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 2]/QlfyElecVehSmllrCostOrMaxCr"/>
        </xsl:call-template></span></td>
        </tr>
        </tbody>
             
                    </xsl:if>
  </xsl:for-each>
  </xsl:otherwise>
  </xsl:choose>
        </table>
      </div>
       
  <!--</xsl:if>-->
              <!--  Line 18 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 2mm">18</div>
                <div style="float:left">
            Add columns (a) through (c) on line 17<span style="letter-spacing:4mm; font-weight:bold;"> .................</span></div>
            <div style="float:right">
              
              <div class="styLNRightNumBox" style="border-bottom-width: 1px">18</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehTotCrPrsnlUse"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  Line 19 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style=" padding-left: 2mm">19</div>
            <div style="float:left">
               Enter the amount from Form 1040, line 46, or Form 1040NR, line 43<span style="letter-spacing:4mm; font-weight:bold; "> .........</span>
            </div>
            <div style="float:right">
              
              <div class="styLNRightNumBox" style="border-bottom-width: 1px">19</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalTxBeforeCrAndOtherTxs"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- line 20  -->
          <!-- blank line first -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 2mm">20</div>
            <div style="float:left">
               Enter the total (if any) of your credits from Form 1040, lines 47 through 50; Form 5695, line 11; and <br/>Schedule R, line 24; <b>or</b> Form 1040NR, lines 44 through 46; and Form 5695, line 11<span style="letter-spacing:4mm; font-weight:bold;">.....</span>
            </div>
            <div style="float:right">
              
              <div class="styLNRightNumBox" style="border-bottom-width: 1px; height:4.5mm;padding-top:4mm;">20</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px; height:4.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehCreditFromForm"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
           <!--  Line 21 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 2mm">21</div>
            <div style="float:left">
               Subtract line 20 from line 19. If zero or less, <b>stop</b>. You cannot claim the personal use part of the <br>credit.</br><span style="letter-spacing:4mm; font-weight:bold;">..........................</span>
            </div>
            <div style="float:right">
              <!--<span style="letter-spacing:4mm; font-weight:bold; float:left">.</span>-->
           <div class="styLNRightNumBox" style="border-bottom-width: 1px; height:4.5mm;padding-top:4mm;">21
              </div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px; height:4.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehAdjustedCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 22 -->
                <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 2mm">22</div>
            <div style="float:left">
               <b>Personal use part of credit.</b> Enter the <b>smaller</b> of line 18 or line 21. Report the total of this amount and the <br/>amount (if any) from line 29 on Form 1040, line 53 (or Form 1040NR, line 49) and check box <b>c</b> on that<br/> line. If line 21 is smaller than line 18, see instructions.<span style="letter-spacing:4mm; font-weight:bold;">.............</span>               
            </div>
           <div style="float:right">
          <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px;"></div>
      <div class="styLNAmountBox" style="border-bottom-width: 0px; "></div> 
          <div class="styLNRightNumBox" style="border-bottom-width: 1px;height:2.5mm;padding-top:2mm;">22</div>
                <div class="styLNAmountBox" style="border-bottom-width: 1px; height:2.5mm;padding-top:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPersnlUsePrtCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
            <!--  End Part I -->
            
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageend">
            <div class="styGenericDiv" style="width:117mm;font-weight:bold;">For  Paperwork Reduction Act Notice, see instructions.</div>
            <div class="styGenericDiv" style="width:23mm;">Cat. No. 14953G</div>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">8834</span> (2009)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 8834 (2009)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </div>
          </div>
            
          <!--  Begin Part II -->
           <!--  Part II -->
             <div class="styBB" style="width: 187mm; border-top-width: 0px">
            <div class="styPartName" style="width: 15mm">Part II</div>
            <div class="styPartDesc" style="width: 172mm">Qualified Electric Vehicle Credit </div>
          </div>
         
          <div class="styBB" style="width:187mm;font-size:8pt;">
            <b>Caution.</b> This part only applies to qualified electric vehicle passive activity credits from prior
             years (allowed on <br/>Form 8582-CR or Form 8810).</div>
             
             <!-- Line 23  -->
             <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:4mm;padding-top:4mm;">23</div>
        <div class="styLNDesc" style="width:138mm;height:4mm;padding-top:4mm;">
          Qualified electric vehicle passive activity credits allowed for 2009 (see instructions) 
          <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">  
              ....
            </span>  
        </div>
        <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:4mm;"></div>  
        <div class="styLNAmountBoxNBB" style="height:4mm;padding-top:4mm;" ></div>
      </div>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;"></div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
                    
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">23  </div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPssvActyCrAllw"/>
          </xsl:call-template>
        </div>
      </div>
          
          <!--  Line 24 -->
          <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">24</div>
        <div class="styLNDesc" style="width:100mm;height:4mm;">
          Regular tax before credits:     <br/>    
       <img src="{$ImagePath}/8844_Bullet_Round.gif" alt="dot"/>    Individuals. Enter the amount from Form 1040, line 44, or Form 1040NR, line 41.<br/>
        <img src="{$ImagePath}/8844_Bullet_Round.gif" alt="dot"/>    Corporations. Enter the amount from Form 1120, Schedule J, line 2; or the
applicable line of your return<br/>
        <img src="{$ImagePath}/8844_Bullet_Round.gif" alt="dot"/>    Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G,
lines 1a and 1b, or the amount from the applicable line of your return.                   
        </div>
        <div class="styLNDesc" style="width:5mm; height:4mm;padding-top:4.5mm;">
          <img src="{$ImagePath}/8844_Bracket_Lger.gif" alt="bracket" border="0"/>        
        </div>
        <div class="styLNDesc" style="width:33mm; height:4mm;">                  
          <span class="styBoldText" style="width:33mm; height:4mm;padding-bottom:0mm;padding-top:10mm;">
            <span style="width:8px;"></span>.    
            <span style="width:8px;"></span>.  
            <span style="width:8px;"></span>.    
            <span style="width:8px;"></span>.
            <span style="width:8px;"></span>.
            <span style="width:8px;"></span>.  
            <span style="width:8px;"></span>.                                            
          </span>                  
        </div>
        <div class="styLNRightNumBox" style="height:28mm;padding-top:28mm;">
         <!-- <div class="styLNRightNumBoxNBB" style="width:7.75mm;padding-top=0.5mm;border-left-width:0px;background-color:lightgrey;"></div>-->
         24
        </div>
        <div class="styLNAmountBox" style="height:28mm;padding-top: 28mm;">
          <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehRegularTxBfrCr"/>
        </xsl:call-template>
        </div>
        </div>
          <!-- End Line 24 -->
          
       <div class="styBB" style="width:187mm;">
       <!-- Line 25a-->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">25</div>
        <div class="styLNDesc" style="width:138mm;height:4mm">
          Credits that reduce regular tax before the qualified electric vehicle credit:
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey; border-bottom-width: 0px"></div>
        <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px">
        </div>
      </div>
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">a</div>
        <div class="styLNDesc" style="width:98.25mm;height:4mm">
          Foreign tax credit
          <span style="letter-spacing:4mm; font-weight:bold">  
            ...............
          </span>  
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">25a</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCredit"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"></div>
      </div>
            
      <!-- Line 25b-->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">b</div>
        <div class="styLNDesc" style="width:98.25mm;height:5mm;">
          Credits from Form 1040, lines 48 through 52 (or Form 1040NR, lines
45 through 48); Form 8859, line 11; line 22 of this form; Form 8910,
line 21; Form 8936, line 14; and Schedule R, line 24
                    <!--Dotted Line-->
          <span style="letter-spacing:4mm; font-weight:bold">  
            ...
          </span>  
        </div>
        <div class="styLNRightNumBox" style="height10.5mm;padding-top:6.5mm;">25b</div>
        <div class="styLNAmountBox" style="height:10.5mm;padding-top:4.5mm;">
        <!--
          NO SCHEMA ELEMENT FOR THIS FIELD-->
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehSumOfCredits"/>
          </xsl:call-template>
        
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:10.5mm;border-right-width:1px;"></div>
      </div>
      <!-- Line 25b-->
 
      
      <!-- Line 25c-->
    
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">c</div>
        <div class="styLNDesc" style="width:98.25mm;height:4mm">
        American Samoa economic development credit (Form 5735)
          <span style="letter-spacing:4mm; font-weight:bold">  
            ..
          </span>  
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">25c</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/AmericanSamoaEconomicDevCredit"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"></div>
      </div>
      <!-- Line 25c-->
      

 
      
      <!-- Line 25d -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">d</div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
          Add lines 25a through 25c
            <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">  
              .....................
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">25d</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotTaxCrBfrQlfyElecVehCredit"/>
          </xsl:call-template>
        </div>
      </div>
      <!-- Line 25d -->
      
      <!-- Line 26  -->      
      <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:3mm;">26</div>
        <div class="styLNDesc" style="width:138mm;height:4.5mm;padding-top:3mm;">
          Net regular tax. Subtract line 25d from line 24. If zero or less, stop here; <b>do not</b> file this form unless you are claiming the qualified plug-in electric vehicle credit in Part I
          <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">  
              .........
            </span>  
        </div>
        <div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top:6mm;"></div>  
        <div class="styLNAmountBoxNBB" style="height:4.5mm;padding-top:6mm;" ></div>
      </div>
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;"></div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
                    
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">26  </div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehNetRegularTax"/>
          </xsl:call-template>
        </div>
      </div>
      
      <!--  Line 27  -->    
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">27</div>
        <div class="styLNDesc" style="width:105mm;height:4mm;">
          Tentative minimum tax:            
        <li style="height:4mm; padding-top: .75mm">Individuals. Individuals. Enter the amount from Form 6251, line 34.</li>
        <li style="height: 4mm; padding-top: .75mm">Corporations. Enter the amount from Form 4626, line 12.</li>
        <li style="height: 4mm; padding-top: .75mm">Estates and trusts. Enter the amount from Schedule I (Form 1041), line 54.</li>                   
        </div>
        <div class="styLNDesc" style="width:5mm; height:4mm;padding-top:4.5mm;">
          <img src="{$ImagePath}/8834_Bracket_Md.gif" style="padding-top:2mm" alt="Curly Bracket Image"/>        
        </div>
        <div class="styLNDesc" style="width:28mm; height:4mm;">                  
          <span class="styBoldText" style="width:28mm; height:4mm;padding-bottom:0mm;padding-top:7mm;">
            <span style="width:8px;"></span>.    
            <span style="width:8px;"></span>.  
            <span style="width:8px;"></span>.    
            <span style="width:8px;"></span>.
            <span style="width:8px;"></span>.    
            <span style="width:8px;"></span>.                                                      
          </span>                  
        </div>

        <div class="styLNRightNumBox" style="width:7.75mm;height:8.5mm;padding-top=0mm;border-bottom-width: 1px">
          <div class="styLNRightNumBoxNBB" style="width:7.75mm;padding-top=0.5mm;border-left-width:0px;">
        </div>
        27
        </div>
        <div class="styLNAmountBox" style="height:8.55mm; border-bottom-width: 1px">
          <br/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehTentativeMinTax"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:8mm;border-right-width:1px;"></div>
      </div>
      <!--  Line 27  -->
  
      <!--  Line 28  -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">28</div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
          Subtract line 27 from line 26. If zero or less, stop here; <span class="styBoldText">do not</span> file this form unless you are
claiming the qualified plug-in electric vehicle credit in Part I
<span style="letter-spacing:4mm; font-weight:bold"> ..............
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">28
        </div>
        <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehAdjRegularTax"/>
          </xsl:call-template>
          
        </div>
      </div>
      
      <!--  Line 29 -->
      <div class="styLNLeftNumBox" style="height:4mm;"></div>
  <div class="styLNDesc" style="width:138mm;height:4mm;float:right:"/>
  <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4mm;border-right-width:1px;padding-top:0mm;background-color:lightgrey;" />

  
      
      
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">29</div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
          <span class="styBoldText">Qualified electric vehicle credit.</span> Enter the <span class="styBoldText">smaller</span> of line 23 or line 28. Report the total of this
amount and the amount (if any) from line 22 on Form 1040, line 53; Form 1040NR, line 49; Form
1120, Schedule J, line 5b; Form 1041, Schedule G, line 2b; or the appropriate line of your return.<br></br>
If line 28 is smaller than line 23, see instructions    
          <!--Dotted Line-->

          <span style="letter-spacing:4mm; font-weight:bold">  
            ..........
            <img src="{$ImagePath}/8834_Bullet.gif" alt="Curly Bracket Image"/>
          </span>
            
        </div>
        <div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;border-right-width:1px;width:8.25mm;padding-top:.5mm;"></div>
	<div class="styLNAmountBox" style="border-bottom-width: 0px;border-left-width:0px;" />
	<div class="styLNRightNumBoxNBB" style="height:2mm;background-color:lightgrey;border-right-width:1px;width:8.25mm;padding-top:.5mm;"></div>
	<div class="styLNAmountBox" style="border-bottom-width: 0px;border-left-width:0px;" />
        
     <div class="styLNRightNumBox" style="height:4mm;padding-top:1mm; border-bottom-width: 0px;">29</div>
           
        <div class="styLNAmountBox" style="height:5.5mm; padding-top:1mm; border-bottom-width: 0px">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecDriveMtrVehCr"/>
          </xsl:call-template>
        </div>  
       </div> 
     </div>
          <!-- end of page 
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see back of form. </span>
            <span style="width:120px;"/>                      
          Cat. No. 14953G 
          <span style="width:125px;"/>  
          Form <span class="styBoldText">8834</span> (2009)
        </div>
          <br/>
          <br class="pageEnd"/>
-->
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
          
         </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
