<?xml version="1.0"?>
<!-- 09/07/2012 - Modified per UWR 69492 - Jeremy Nichols-->  
<!-- 11/15/2012 - Modified per defect 34402 - Jeremy Nichols-->  
<!-- 11/28/2012 - Modified per defect 34517 - Jeremy Nichols-->  
<!-- 12/13/2012 - Modified per KISAMS #IM00823352 - Jeremy Nichols-->  

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
                  <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>  
				  Information about Form 8834 and its instructions is at www.irs.gov/form8834.
				</div>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1374</div>
              <div class="styTY" style="height:10mm">20<span class="styTYColor">12</span>
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
<!--                <xsl:choose>
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
                </xsl:choose>-->
              </div>
            </div>
          </div>
          
   <div class="styBB" style="width:187mm;font-size:8pt;">
   <b>Note:  </b>  <br/> <img src="{$ImagePath}/8844_Bullet_Round.gif" alt="dot"/> Use this form to claim the credit for certain two- or three-wheeled or low-speed four-wheeled plug-in electric vehicles acquired before 2012. <br/> 
   <img src="{$ImagePath}/8844_Bullet_Round.gif" alt="dot"/> Claim the credit for certain other plug-in electric vehicles on Form 8936. <br/> 
   <img src="{$ImagePath}/8844_Bullet_Round.gif" alt="dot"/>  Claim the credit for certain alternative motor vehicles on Form 8910.</div>
          
          
          <div class="styBB" style="width: 187mm; border-top-width: 0px">
            <div class="styPartName" style="width: 15mm">Part I</div>
            <div class="styPartDesc" style="width: 172mm">Qualified Plug-in Electric Vehicle Credit 
            <span class="styNormalText" style="font-size: 7pt"></span>
       
                
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
					
 <div >
             
       <xsl:choose>
       

       
       <!-- Creates table outline when there is no data  -->
		<xsl:when test="($Print != $Separated) and (count($FormData/VehicleInformation) &lt; 1)">
   <table class="styTable" cellspacing="0" style="font-size: 7pt">
		        	     			<xsl:call-template name="SetTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/VehicleInformation"/>
									<xsl:with-param name="containerHeight" select="1"/>
									<xsl:with-param name="containerID" select="'Line1TPctn'"/>
								</xsl:call-template>	

			     <thead class="styTableThead">
     			<tr style="height: 8mm"> 
        			<th class="styTableCell" colspan="3" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:left;">
          				<span class="styNormalText" style="font-size:7pt;">
            					Use a separate column for each vehicle. If you need more columns, use additional Forms 8834 and include the totals on lines 12 and 19.
             				</span>
        			</th>
        			<th class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:0px; border-bottom-width:1px; text-align: center">(<xsl:number value="1" format="a"/>)<br>Vehicle 1</br></th>
        			<th class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="2" format="a"/>)<br>Vehicle 2</br></th>
      			</tr>
 
    		</thead>
    		<tfoot/>
    		<tbody>
    			<tr>
        			<td  class="styBoldText" style="padding-top:5mm; padding-left: 2mm;width:6mm;" valign="bottom">1</td>
        			<td class="styTableCell" style="width:98mm; text-align: left; height: 10mm; padding-top:5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
          				Year, make, and model of vehicle
          				<b>
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.
              				<span class="styNBSP"></span>.

          				</b>
        			</td>
        			<td class="styLNRightNumBox">1</td>
                		<td class="styTableCell" style="text-align:left;width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"/></td>
                		<td class="styTableCell" style="text-align:left;width: 45.5mm;border-color: black; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad"/></td>
        		</tr>
        		<!-- Line 2 -->
        		<tr>
        			<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">2</td>
        			<td class="styTableCell" style="width:98mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px ;font-size:7pt;">
          			   Vehicle Identification Number (see instructions)

        			</td>
        			<td class="styLNRightNumBox" style="border-top-width: 0px">2</td>
        			<td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          		<!-- provides one space of padding between data and table cell border-->
          				<span class="styTableCellPad"/> 

        			</td>
        			<td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          		<!-- provides one space of padding between data and table cell border-->
          				<span class="styTableCellPad"/> 
.        			</td>
      			</tr>
 
 
       		<tr>
        			<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">3</td>
        			<td class="styTableCell" style="width:98mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px ;font-size:7pt;">
          				Enter date vehicle was placed in service (MM/DD/YYYY)

        			</td>
        			<td class="styLNRightNumBox" style="border-top-width: 0px">3</td>
        			<td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          		<!-- provides one space of padding between data and table cell border-->
          				<span class="styTableCellPad"/> 

        			</td>
        			<td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          		<!-- provides one space of padding between data and table cell border-->
          				<span class="styTableCellPad"/> 
.        			</td>
      			</tr>
  
        
       	<!-- Line 4  -->
      			<tr style="font-size: 7pt">
      				<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;border-style: solid;border-color: black; border-width:0px 0px 1px 0px">4
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
				<td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
</span></td>
        			<td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><span class="styTableCellPad">
</span></td>
         		</tr>

        	</tbody>
        	</table>
	</xsl:when>
	
	<xsl:otherwise>
 	<xsl:for-each select="$FormData/VehicleInformation">
  		<xsl:variable name="pos" select="position()"/>
			 <xsl:if test="(position() mod 2)=1">


   <table class="styTable" cellspacing="0" style="font-size: 7pt">
     			<thead class="styTableThead">
     				<tr style="height: 8mm"> 
        				<th class="styTableCell" colspan="3" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:left;">
          					<span class="styNormalText" style="font-size:7pt;">
            				Use a separate column for each vehicle. If you need more columns, use additional Forms 8834 and include the totals on lines 12 and 19.
             					</span>
       				 </th>
        				<th class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos)" format="a"/>)<br>Vehicle 1</br></th>
        				<th class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">(<xsl:number value="($pos+1)" format="a"/>)<br>Vehicle 2</br></th>
      				</tr>
   		 </thead>
    		<tfoot/>
    		<tbody>
    

         
    <tr>
        <td  class="styBoldText" style="padding-top:5mm; padding-left: 2mm;width:6mm;" valign="bottom">1</td>
        <td class="styTableCell" style="width:75mm; text-align: left; height: 10mm; padding-top:5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
          Year, make, and model of vehicle
          <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.

          </b>
        </td>
        <td class="styLNRightNumBox">1</td>
        <td class="styTableCell" style="text-align:left;width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top: 5mm;padding-left:1mm;" valign="bottom">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleYear"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleYear"><br/></xsl:if>
          <xsl:call-template name="PopulateText">
          	<xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleMake"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleModel and 
          $FormData/VehicleInformation[$pos]/VehicleDescription/VehicleMake"><br/></xsl:if>
          <xsl:call-template name="PopulateText">
          	<xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]/VehicleDescription/VehicleModel"/>
          </xsl:call-template>
          <span class="styTableCellPad"/>
        </td>

        <td class="styTableCell" style="text-align:left;width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top: 5mm;padding-left:1mm;" valign="bottom">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleYear"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleYear"><br/></xsl:if>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleMake"/>
          </xsl:call-template>
          <xsl:if test="$FormData/VehicleInformation[$pos+1]/VehicleDescription/VehicleModel and 
          $FormData/VehicleInformation[$pos+1]/VehicleDescription/VehicleMake"><br/></xsl:if>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]/VehicleDescription/VehicleModel"/>
          </xsl:call-template>
          <span class="styTableCellPad"/>
        </td>

    </tr> 
       
       <!-- Line 2  -->
      <tr>
        <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">2</td>
        <td class="styTableCell" style="width:75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px ;font-size:7pt;">
          Vehicle Identification Number (see instructions)

        <b>
           <span class="styNBSP"></span>.
        </b>
        </td>

        <td class="styLNRightNumBox" style="border-top-width: 0px">2</td>
        <td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          <!-- provides one space of padding between data and table cell border-->
          <span class="styTableCellPad"/> 
          <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]//VehicleIdentificationNum"/> 
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          <!-- provides one space of padding between data and table cell border-->
          <span class="styTableCellPad"/> 
          <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]//VehicleIdentificationNum"/> 
          </xsl:call-template>
        </td>
      </tr>

       <!-- Line 3  -->
      <tr>
        <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">3</td>
        <td class="styTableCell" style="width:75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px ;font-size:7pt;">
          Enter date vehicle was placed in service (MM/DD/YYYY)

        </td>
        <td class="styLNRightNumBox" style="border-top-width: 0px">3</td>
        <td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          <!-- provides one space of padding between data and table cell border-->
          <span class="styTableCellPad"/> 
          <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos]//VehiclePlacedInServiceDate"/> 
          </xsl:call-template>
        </td>
        <td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: center">
          <!-- provides one space of padding between data and table cell border-->
          <span class="styTableCellPad"/> 
          <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos +1]//VehiclePlacedInServiceDate"/> 
          </xsl:call-template>
        </td>
      </tr>

        
       <!-- Line 4  -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;border-style: solid;border-color: black; border-width:0px 0px 1px 0px">4
      </td> 
        <td class="styTableCell" style="width:75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; ">
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
         <td class="styLNRightNumBox">4</td>
         
         <td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><!--<span class="styTableCellPad">-->
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CostOfVehicleAmt"/>
        </xsl:call-template><!--</span>--></td>
        <td class="styTableCell" style="width: 45.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/VehicleInformation[$pos + 1]/CostOfVehicleAmt"/>
        </xsl:call-template><!--</span>--></td>
         </tr>
             </tbody>
             </table>
                </xsl:if>

  </xsl:for-each>
  
  </xsl:otherwise>
  </xsl:choose>

      </div>
		
   <div class="styBB" style="width:187mm;font-size:8pt;border-bottom-width:0px;">
   <b>Next:</b> If you did NOT use your vehicle for business or investment purposes and did not have a credit from a partnership or
S corporation, skip Section B and go to Section C. All others, go to Section B.</div>

		 <xsl:if test="count($FormData/VehicleInformation) = 9 or count($FormData/VehicleInformation) = 10">
			 <div class="pageend"/>
		 </xsl:if>

  
 	<div class="styBB" style="width: 187mm;border-top-width:1px;">
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
    <tbody>
    
      <!-- Line 5 -->
	  <tr>
		  <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;">5</td>
		  <td class="styTableCell" style="width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;">
			  Business/investment use percentage (see instructions)
		  </td>
          <td class="styLNRightNumBox" style="border-top-width: 0px">5</td>
          <td class="styTableCell" style="height:5mm;border-color: black; border-left-width: 1px;border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right; padding-top:5mm;">
			  <span class="styTableCellPad"></span>
		  </td>
          <td class="styTableCell" style="height: 5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right; padding-top:5mm">
			  <span class="styTableCellPad"></span>
		  </td>
      </tr>
        
      <!-- Line 6 -->
      <tr style="font-size: 7pt">
		  <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">6</td> 
		  <td class="styTableCell" style="height: 4.5mm;width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
			  Multiply line 3 by line 4
			  <b>
				  <span class="styNBSP"></span>.
				  <span class="styNBSP"></span>.
				  <span class="styNBSP"></span>.
				   <span class="styNBSP"></span>.
				  <span class="styNBSP"></span>.
			  </b>
           </td>
		   <td class="styLNRightNumBox">6</td>
           <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
			   <span class="styTableCellPad"></span>
		   </td>
           <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
			   <span class="styTableCellPad"></span>
		   </td>
       </tr>
        
       <!-- Line 7  -->
       <tr>
			<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">7</td> 
			<td class="styTableCell" style="height: 4.5mm;width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
                Section 179 expense deduction (see instructions)
		    </td>
            <td class="styLNRightNumBox" style="border-bottom-width: 1px">7</td>
            <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
				<span class="styTableCellPad"></span>
			</td>
			<td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
				<span class="styTableCellPad"></span>
			</td>
	    </tr>
        
		<!--  Line 8  -->
		<tr>
		   <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">8</td> 
		   <td class="styTableCell" style="height: 4.5mm;width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
			   Subtract line 6 from line 5
			   <b>
				  <span class="styNBSP"></span>.
				  <span class="styNBSP"></span>.
				  <span class="styNBSP"></span>.
              </b>
		   </td>
           <td class="styLNRightNumBox">8</td>
           <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
			   <span class="styTableCellPad"></span>
		   </td>
           <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
			   <span class="styTableCellPad"></span>
		   </td>
	   </tr>
               
       <!-- Line 9  -->
       <tr>
		  <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="bottom">9</td>
		  <td class="styTableCell" style="height: 4.5mm;width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
			  Multiply line 7 by 10% (.10)
             <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
			 </b>
		  </td>
          <td class="styLNRightNumBox">9</td>
		  <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
			  <span class="styTableCellPad"></span>
		  </td>
		  <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
			  <span class="styTableCellPad"></span>
		  </td>
       </tr> 
       
       <!-- Line 10 -->
       <tr>
		  <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="bottom">10</td>
		  <td class="styTableCell" style="height: 4.5mm;width:74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">
			  Maximum credit per vehicle
              <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
              </b>
		  </td>
          <td class="styLNRightNumBox">10</td>
          <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
			  <span class="styTableCellPad">2,500.00</span>
		  </td>
          <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
			  <span class="styTableCellPad">2,500.00</span>
		  </td>
       </tr>  
        
       <!-- Line 11  -->
      <tr>
		  <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="bottom">11</td>
		  <td class="styTableCell" style="height: 4.5mm;width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
			  Enter the <span class="styBoldText">smaller</span> of line 8 or line 9
			  <b>
				  <span class="styNBSP"></span>.
				  <span class="styNBSP"></span>.
			  </b>
          </td>
          <td class="styLNRightNumBox" style="border-bottom-width:1px">11</td>
		  <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"></span></td>
       </tr>
	</tbody>
  </table>
</xsl:when> 
<xsl:otherwise>


 <xsl:for-each select="$FormData/CrBusinessInvestmentVehicle">
 <xsl:variable name="pos" select="position()"/>
 <xsl:if test="(position() mod 2)=1">
 <div class="styIRS8834TableContainer" id="Spcctn">
	<table class="styTable" cellspacing="0" style="width:187mm;font-size: 7pt">
		<tbody>
        
			<!--  Line 5   -->
			<tr>
				<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;padding-top:4mm;border-top-width:0px;" valign="bottom">5</td>
				<td class="styTableCell" style="width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px; border-bottom-width:0px;padding-top:6mm" valign="bottom">
					Business/investment use percentage (see instructions)
				</td>
				<td class="styLNRightNumBox" style="border-top-width: 0px">5</td>
                <td class="styTableCell" style="height:10mm;border-color: black; border-left-width: 1px;border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right; padding-top:10mm">
					<!--<span class="styTableCellPad">-->
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos]/QlfyElecVehBusInvestmentUse"/>
					</xsl:call-template>
					<!--</span>-->
				</td>
				<td class="styTableCell" style="height: 10mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right; padding-top:10mm">
					<!--<span class="styTableCellPad">-->
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehBusInvestmentUse"/>
					</xsl:call-template>
					<!--</span>-->
				</td>
			</tr>
        
            <!-- Line 6 -->
			<tr style="font-size: 7pt">
				<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">6</td> 
				<td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
					Multiply line 4 by line 5
				    <b>
						<span class="styNBSP"></span>.
						<span class="styNBSP"></span>.
						<span class="styNBSP"></span>.
						<span class="styNBSP"></span>.
						<span class="styNBSP"></span>.
					</b>
				</td>
				<td class="styLNRightNumBox">6</td>
				<td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
					<!--<span class="styTableCellPad">-->
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos]/QlfyElecVehBusInvestmentUsePct"/>
					</xsl:call-template>
					<!--</span>-->
				</td>
				<td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
					<!--<span class="styTableCellPad">-->
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyElecVehBusInvestmentUsePct"/>
					</xsl:call-template>
					<!--</span>-->
				</td>
			</tr>
        
			<!-- Line 7  -->
     <tr>
         <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">7
        </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
                Section 179 expense deduction (see instructions)
               </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">7</td>
         
          <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><!--<span class="styTableCellPad">-->
              <xsl:call-template name="PopulateAmount">
         <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos]/QlfyPlugInElecVehSect179ExpDed"/>
        </xsl:call-template><!--</span>--></td>
        
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyPlugInElecVehSect179ExpDed"/>
        </xsl:call-template><!--</span>--></td>
          </tr>
        
             <!--  Line 8  -->
      <tr>
       <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">8
      </td> 
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
        
          Subtract line 7 from line 6
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              </b>
        </td>
        <td class="styLNRightNumBox">8</td>
             <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><!--<span class="styTableCellPad">-->
               <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos]/NetQlfyPlugInElecVehBusInvst"/>
        </xsl:call-template><!--</span>--></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/NetQlfyPlugInElecVehBusInvst"/>
        </xsl:call-template><!--</span>--></td>
               </tr>
         <!-- Line 9  -->
        <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="bottom">9</td>
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
               Multiply line 8 by 10% (.10)
             <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                 </b>
       </td>
         <td class="styLNRightNumBox">9</td>
            
              <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><!--<span class="styTableCellPad">-->
              <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos]/QlfyPlugInElecVehNetPct"/>
        </xsl:call-template><!--</span>--></td>
        
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyPlugInElecVehNetPct"/>
        </xsl:call-template><!--</span>--></td>
        
       </tr> 
       
       <!-- Line 10 -->
      <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="bottom">10</td>
        <td class="styTableCell" style="height: 4.5mm;width:75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">
          Maximum credit per vehicle
              <b>
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                <span class="styNBSP"></span>.
                
              </b>
        </td>
         <td class="styLNRightNumBox">10</td>
         <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">2,500.00</span></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;"><span class="styTableCellPad">2,500.00</span></td>
        </tr>  
        
       <!-- Line 11  -->
      <tr>
      <td  class="styBoldText" style="padding-left: 2mm;width:6mm;" valign="bottom">11</td>
        <td class="styTableCell" style="height: 4.5mm;width: 75mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
          Enter the <span class="styBoldText">smaller</span> of line 9 or line 10
            <b>
            <span class="styNBSP"></span>.
            <span class="styNBSP"></span>.
            
          </b>
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width:1px">11</td>
         
       
               <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><!--<span class="styTableCellPad">-->
               <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos]/QlfyPlugInElecVehSmllrPctOrCr"/>
        </xsl:call-template><!--</span>--></td>
        <td class="styTableCell" style="height: 4.5mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CrBusinessInvestmentVehicle[$pos + 1]/QlfyPlugInElecVehSmllrPctOrCr"/>
        </xsl:call-template><!--</span>--></td>
       
        </tr>
        
      </tbody>
    </table>
  </div>
  </xsl:if> 
  </xsl:for-each>
  </xsl:otherwise>
  </xsl:choose>
  <!--</xsl:if>-->

  <!--  Line12 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">12</div>
    <div style="float:left;padding-top:.5mm;">
      Add coumns (a) and (b) on line 11
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        ..................
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px;">12</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehTotBusInvstUse"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  
  
  <!--  Line 13 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">13</div>
    <div style="float:left;padding-top:.5mm;">
      Qualified plug-in electric vehicle credit from partnerships and S corporations
    </div>    
    <div style="float:right;">    
      <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        ......
      </span>        
      <div class="styLNRightNumBox" style="border-bottom-width: 1px">13</div>
      <div class="styLNAmountBox" style="border-bottom-width: 1px">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecVehicleCr"/>
        </xsl:call-template>
      </div>          
    </div>
  </div>
  
<!--  Line 14 -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">14</div>
    <div style="float:left;padding-top:.5mm;">
     <b> Business/investment use part of credit.</b> Add lines 12 and 13. Partnerships and S corporations,
     <br></br>
     report this amount on Schedule K; all others, report this amount on Form 3800, line 1z
    </div>  
    <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  
        </span>          
    <div style="float:right;">    
      
      <div class="styLNRightNumBox" style="padding-top:.5mm;border-bottom-width: 1px">14</div>
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

<div class=".styIRS8834TableContainer">
  <xsl:choose>
       
  <!-- Creates table outline when there is no data  -->
	<xsl:when test="count($FormData/CreditPersonalUsePartVehicle) &lt; 1">
<table cellspacing="0" style="width:187mm; font-size: 7pt">
    <tbody>
      <!--  Line 15   -->
      <tr>
      <td class="styBoldText" style="font-size: 7pt; padding-bottom: 3mm;padding-left: 2mm;width:6mm;" valign="bottom">15
      </td>
        <td class="styTableCell" style="width: 72mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
 If you skipped Section B, enter the amount from line 4. If you completed Section B, subtract line 6 from line 4 
        </td>
        <td class="styLNRightNumBox" style="border-top-width: 0px">15</td>
       <td class="styTableCell" style="height:10mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
            <span style="width:1mm;"/>
              </td>
       <td class="styTableCell" style="height:10mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
         <span style="width:1mm;"/>
         </td>
        </tr>
        
           <!-- Line 16  -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">16
      </td> 
        <td class="styTableCell" style="width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
    Multiply line 15 by 10% (.10)
  <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              </b>
           </td>
         <td class="styLNRightNumBox">16</td>
         <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><!--<span class="styTableCellPad">-->
        <span style="width:1mm;"/></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><!--<span class="styTableCellPad">-->
        <span style="width:1mm;"/>
        </td>
       </tr>
        
        <!-- Line 17  -->
     <tr>
         <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="top">17
        </td> 
        <td class="styTableCell" style="width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
                Maximum credit per vehicle. If you skipped Section B, enter
$2,500. If you completed Section B, subtract line 11 from
line 10
              <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              
    </b>
             
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">17</td>
		 <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
          <span style="width:1mm;"/>
          </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;">
        <span style="width:1mm;"/>
        </td>
         </tr>
      <!--  Line 18   -->
      <tr>
       <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">18
      </td> 
        <td class="styTableCell" style="width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
        
          Enter the <b>smaller</b> of line 16 or line 17
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              
            </b>
        </td>
        <td class="styLNRightNumBox">18</td>
       
	    <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
	    <span style="width:1mm;"/>
	    </td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
        <span style="width:1mm;"/>
        </td>
        </tr>
        </tbody>
        </table>
    </xsl:when>
    <xsl:otherwise>

  
 <xsl:for-each select="$FormData/CreditPersonalUsePartVehicle">
  <xsl:variable name="pos" select="position()"/>
 <xsl:if test="(position() mod 2)=1">
<table cellspacing="0" style="width:187mm; font-size: 7pt">
    <tbody>
      <!--  Line 15   -->
      <tr>
      <td class="styBoldText" style="font-size: 7pt; padding-bottom: 3mm;padding-left: 2mm;width:6mm;" valign="bottom">15
      </td>
        <td class="styTableCell" style="width: 72mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
 If you skipped Section B, enter the amount from line 4. If you completed Section B, subtract line 6 from line 4 
        </td>
        <td class="styLNRightNumBox" style="border-top-width: 0px">15</td>
       <td class="styTableCell" style="height:10mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
            <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos]/QlfyElecVehNetCostPrsnlUse"/>
        </xsl:call-template>
              <!--</span>-->
              </td>
       <td class="styTableCell" style="height:10mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehNetCostPrsnlUse"/>
        </xsl:call-template>
           <!--</span>-->
         </td>
        </tr>
        
           <!-- Line 16  -->
      <tr style="font-size: 7pt">
      <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">16
      </td> 
        <td class="styTableCell" style="width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
    Multiply line 15 by 10% (.10)
  <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              </b>
           </td>
         <td class="styLNRightNumBox">16</td>
            <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos]/QlfyElecVehNetCostPcnt"/>
        </xsl:call-template>
        <!--</span>--></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehNetCostPcnt"/>
        </xsl:call-template>
       <!-- </span>-->
        </td>
       </tr>
        
        <!-- Line 17  -->
     <tr>
         <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="top">17
        </td> 
        <td class="styTableCell" style="width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
                Maximum credit per vehicle. If you skipped Section B, enter
$2,500. If you completed Section B, subtract line 11 from
line 10
              <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
               <span class="styNBSP"></span>.
              
    </b>
             
         </td>
         <td class="styLNRightNumBox" style="border-bottom-width: 1px">17</td>
              <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
              <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos]/QlfyElecVehMaxCrPerVeh"/>
        </xsl:call-template><!--</span>--></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;">
        <!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehMaxCrPerVeh"/>
        </xsl:call-template><!--</span>--></td>
         </tr>
      <!--  Line 18   -->
      <tr>
       <td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:6mm;" valign="bottom">18
      </td> 
        <td class="styTableCell" style="width: 74mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">
        
          Enter the <b>smaller</b> of line 16 or line 17
            <b>
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              <span class="styNBSP"></span>.
              
            </b>
        </td>
        <td class="styLNRightNumBox">18</td>
       
	    <td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
	    <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos]/QlfyElecVehSmllrCostOrMaxCr"/>
        </xsl:call-template><!--</span>--></td>
        <td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;vertical-align:bottom;"><!--<span class="styTableCellPad">-->
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/CreditPersonalUsePartVehicle[$pos + 1]/QlfyElecVehSmllrCostOrMaxCr"/>
        </xsl:call-template><!--</span>--></td>
        </tr>
        </tbody>
        </table>
             
                    </xsl:if>
  </xsl:for-each>
  </xsl:otherwise>
  </xsl:choose>
  </div>

       
  <!--</xsl:if>-->
              <!--  Line 19 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">19</div>
                <div style="float:left">
            Add columns (a) and (b) on line 18'<span style="letter-spacing:4mm; font-weight:bold;"> .................</span></div>
            <div style="float:right">
              
              <div class="styLNRightNumBox" style="border-bottom-width: 1px">19</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehTotCrPrsnlUse"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  Line 20 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">20</div>
            <div style="float:left">
               Enter the amount from Form 1040, line 46, or Form 1040NR, line 44<span style="letter-spacing:4mm; font-weight:bold; "> .........</span>
            </div>
            <div style="float:right">
              
              <div class="styLNRightNumBox" style="border-bottom-width: 1px">20</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalTxBeforeCrAndOtherTxs"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  Line 21 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">21</div>
            <div style="float:left">
               Personal credits from Form 1040 or 1040NR (see instructions)<span style="letter-spacing:4mm; font-weight:bold; "> ..........</span>
            </div>
            <div style="float:right">
              
              <div class="styLNRightNumBox" style="border-bottom-width: 1px">21</div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehCreditFromForm"/>
                </xsl:call-template>
              </div>
            </div>
          </div>

           <!--  Line 22 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">22</div>
            <div style="width:130mm;float:left">
               Subtract line 21 from line 20. If zero or less, enter -0- and stop here. You cannot claim the <br/>
               personal use part of the credit.<span style="letter-spacing:4mm; font-weight:bold;">...................</span>
            </div>
            <div style="float:right">
              <!--<span style="letter-spacing:4mm; font-weight:bold; float:left">.</span>-->
           <div class="styLNRightNumBox" style="border-bottom-width: 1px; height:4.5mm;padding-top:4mm;">22
              </div>
              <div class="styLNAmountBox" style="border-bottom-width: 1px; height:4.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecVehAdjustedCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 23 -->
                <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="width:10mm;padding-left: 2mm">23</div>
            <div style="width:130mm;float:left">
               <b>Personal use part of credit.</b> Enter the <b>smaller</b> of line 19 or line 22. Report the total of this amount<br/> 
               and the amount, if any, from line 30 on Form 1040, line 53 (or Form 1040NR, line 50).  Check<br/> 
               box <b>c</b> on that line and enter &quot;8834&quot; in the space next to that box. If line 22 is smaller than line<br/> 
               19, see instructions.<span style="letter-spacing:4mm; font-weight:bold;">........</span>               
            </div>
           <div style="float:right">
          <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px;"></div>
      <div class="styLNAmountBox" style="border-bottom-width: 0px; "></div> 
          <div class="styLNRightNumBox" style="border-bottom-width: 0px;height:2.5mm;padding-top:4.5mm;">23</div>
                <div class="styLNAmountBox" style="border-bottom-width: 0px; height:2.5mm;padding-top:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPlugInElecVehPrsnlUsePrtCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
            <!--  End Part I -->
            
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageend">
            <div class="styGenericDiv" style="width:117mm;font-weight:bold;">For  Paperwork Reduction Act Notice, see instructions.</div>
            <div class="styGenericDiv" style="width:23mm;">Cat. No. 14953G</div>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">8834</span> (2012)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 8834 (2012)</div>
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
             
             <!-- Line 24  -->
             <div style="width:187mm">
				<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;vertical-align:bottom;">24</div>
				<div class="styLNDesc" style="width:138mm;height:8mm;padding-top:4mm;vertical-align:bottom;">
				  Qualified electric vehicle passive activity credits allowed for 2012 (see instructions) 
				  <!--Dotted Line-->
					<span style="letter-spacing:4mm; font-weight:bold">  
					  ....
					</span>  
				</div>
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">24  </div>
				<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPssvActyCrAllw"/>
				  </xsl:call-template>
				</div>
			  </div>
          
          <!--  Line 25 -->
          <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="padding-top:4mm;">25</div>
        <div class="styLNDesc" style="width:100mm;padding-top:4mm;">
          Regular tax before credits:     <br/>    
       <img src="{$ImagePath}/8844_Bullet_Round.gif" alt="dot"/>    Individuals. Enter the amount from Form 1040, line 44, or Form 1040NR, line 42.<br/>
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
        <div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">
         <!-- <div class="styLNRightNumBoxNBB" style="width:7.75mm;padding-top=0.5mm;border-left-width:0px;background-color:lightgrey;"></div>-->
         25
        </div>
        <div class="styLNAmountBox" style="width:32mm;height:14mm;padding-top: 10mm;">
          <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehRegularTxBfrCr"/>
        </xsl:call-template>
        </div>
        <div style="float:right;padding-right:32.8mm;">
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:15.75mm;border-right-width:1px;"></div>
		
        </div>
        </div>
          <!-- End Line 25 -->
          
       <div class="styBB" style="width:187mm;">
       <!-- Line 26a-->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">26</div>
        <div class="styLNDesc" style="width:138mm;height:4.5mm">
          Credits that reduce regular tax before the qualified electric vehicle credit:
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey; border-bottom-width: 0px"></div>
        <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px">
        </div>
      </div>
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">a</div>
        <div class="styLNDesc" style="width:98.1mm;height:4mm">
          Foreign tax credit
          <span style="letter-spacing:4mm; font-weight:bold">  
            ...............
          </span>  
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">26a</div>
        <div class="styLNAmountBox" style="height:4.5mm;width:32mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCredit"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"></div>
      </div>
            

            
      <!-- Line 26b-->
    
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">b</div>
        <div class="styLNDesc" style="width:98.1mm;height:4mm">
        Personal credits from Form 1040 or 1040NR (see instructions)
         <span style="letter-spacing:4mm; font-weight:bold">..
          </span> 
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">26b</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
        <!--
          NO SCHEMA ELEMENT FOR THIS FIELD-->        
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehSumOfCredits"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"></div>
      </div>
      <!-- End Line 26b-->
       
       <!-- Line 26c -->
       <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">c</div>
        <div class="styLNDesc" style="width:98.1mm;height:4mm">
			American Samoa economic development  credit (Form 5735)
         <span style="letter-spacing:4mm; font-weight:bold">...</span> 
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">26c</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
        <!--
          NO SCHEMA ELEMENT FOR THIS FIELD-->        
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/AmericanSamoaEconomicDevCredit"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"></div>
      </div>
      <!-- End Line 26c -->
      
      <!-- Line 26d -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">d</div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
          Add lines 26a through 26c
            <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">  
              .....................
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">26d</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotTaxCrBfrQlfyElecVehCredit"/>
          </xsl:call-template>
        </div>
      </div>
      <!-- End Line 26d -->
      
      <!-- Line 27  -->      
      <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:3mm;vertical-align:bottom;">27</div>
        <div class="styLNDesc" style="width:138mm;height:4.5mm;padding-top:3mm;vertical-align:bottom;">
          Net regular tax. Subtract line 26d from line 25. If zero or less, enter -0- and stop here; <b>do not</b> file this form unless you are claiming the qualified plug-in electric vehicle credit in Part I
          <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">  
              ......
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:10mm;vertical-align:bottom;padding-top:6mm;">27 </div>
        <div class="styLNAmountBox" style="height:10mm;vertical-align:bottom;padding-top:6mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehNetRegularTax"/>
          </xsl:call-template>
        </div>
      </div>
      
      <!--  Line 28  -->    
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">28</div>
        <div class="styLNDesc" style="width:105mm;height:4mm;">
          Tentative minimum tax:            
        <li style="height:4mm; padding-top: .75mm">Individuals. Enter the amount from Form 6251, line 33.</li>
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
        28
        </div>
        <div class="styLNAmountBox" style="height:8.55mm; border-bottom-width: 1px">
          <br/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehTentativeMinTax"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:8mm;border-right-width:1px;"></div>
      </div>
      <!--  End Line 28  -->
  
      <!--  Line 29  -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;">29</div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
          Subtract line 28 from line 27. If zero or less, enter -0- and stop here; <span class="styBoldText">do not</span> file this form unless you are
claiming the qualified plug-in electric vehicle credit in Part I
<span style="letter-spacing:4mm; font-weight:bold"> ...........
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">29
        </div>
        <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehAdjRegularTax"/>
          </xsl:call-template>
          
        </div>
      </div>
      
      <!--  Line 30 -->
      <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
  <div class="styLNDesc" style="width:138mm;height:4mm;float:right:"/>
  <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;padding-top:0mm;background-color:lightgrey;" />

  
      
      
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">30</div>
        <div class="styLNDesc" style="width:138mm;height:4.5mm;">
          <span class="styBoldText">Qualified electric vehicle credit.</span> Enter the <span class="styBoldText">smaller</span> of line 24 or line 29. Report the total of this
amount and the amount, if any, from line 23 on Form 1040, line 53; Form 1040NR, line 50; Form
1120, Schedule J, line 5b; or the appropriate line of your return.<br></br>
If line 29 is smaller than line 24, see instructions    
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
        
     <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm; border-bottom-width: 0px;">30</div>
           
        <div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm; border-bottom-width: 0px">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecMotorVehCr"/>
          </xsl:call-template>
        </div>  
       </div> 
     </div>
     <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageend">
            <div class="styGenericDiv" style="width:117mm;font-weight:bold;">For  Paperwork Reduction Act Notice, see instructions.</div>
            <div class="styGenericDiv" style="width:23mm;">Cat. No. 14953G</div>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">8834</span> (2012)</div>
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
