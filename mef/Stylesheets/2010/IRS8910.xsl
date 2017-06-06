<?xml version="1.0"?>

<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->

<!DOCTYPE xsl:stylesheet [

<!ENTITY nbsp "&#160;">

]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>

<xsl:include href="CommonPathRef.xsl"/>

<xsl:include href="AddHeader.xsl"/>

<xsl:include href="IRS8910Style.xsl"/>

<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*"/>

<xsl:param name="FormData" select="$RtnDoc/IRS8910"/>

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

<meta name="Description" content="Form IRS 8910"/>

<meta name="GENERATOR" content="IBM WebSphere Studio"/>

<xsl:call-template name="GlobalStylesForm"/>

<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>

<xsl:call-template name="InitJS"/>

<style type="text/css">

<!-- ************************************************************************

     Notes: Part I, line 1 thru 5, Part II, 6 and 7, and Part 3, line 11

              is an unbound repeatable columns.

     ************************************************************************** -->

<xsl:if test="not($Print) or $Print=''">

<xsl:call-template name="IRS8910Style"/>

<xsl:call-template name="AddOnStyle"/>

 </xsl:if>

</style>

</head>

<body class="styBodyClass">

<form name="Form8910">

<xsl:call-template name="DocumentHeader"/>

<!--Title of Form -->

<div class="styBB" style="width:187mm;height: 20mm">

<div class="styFNBox" style="width:31mm;font-size: 7pt;height:21mm;">

      Form <span class="styFormNumber">8910</span>

<br/>

<br/>

<br/>

<span class="styAgency">Department of the Treasury</span>

<xsl:call-template name="SetFormLinkInline">

 <xsl:with-param name="TargetNode" select="$FormData"/>

 </xsl:call-template>

<br/>

<span class="styAgency">Internal Revenue Service</span>

</div>

<div class="styFTBox" style="height: 22mm;width:125mm;padding-top:3mm;">

<div class="styMainTitle" style="height: 8mm">Alternative Motor Vehicle Credit</div>

<div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold;">

<div style="margin-left: 1.5mm;">

<img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>

            See separate instructions.<br/>

 <img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>

            Attach to your tax return.<br/>           

</div>

</div>

</div>

<div class="styTYBox" style="width:30mm;height:21mm; border-left-width: 1px">

<div class="styOMB" style="height:2mm;">OMB No. 1545-1998</div>

<div class="styTY" style="height:10mm">20<span class="styTYColor">10</span>

</div>

<div class="stySequence">Attachment<br/>Sequence No. <b>152</b>

</div>

</div>

</div>

<!--  End title of Form   -->

<!--  Name and Employer identification number  -->

<div class="styBB" style="width:187mm">

<div class="styNameBox" style="width:141mm;font-size:7pt;">Name(s) shown on return<br/>

<div style="font-family:verdana;font-size:6pt;height:6mm">

<xsl:choose>

<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">

<xsl:call-template name="PopulateReturnHeaderFiler">

<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateReturnHeaderFiler">

<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>

</xsl:call-template>

</xsl:when>

<xsl:otherwise>

<br/>

<xsl:call-template name="PopulateReturnHeaderFiler">

<xsl:with-param name="TargetNode">Name</xsl:with-param>

</xsl:call-template>

</xsl:otherwise>

</xsl:choose>



</div>

</div>

<!--   ****************************************************************************** -->     



<div class="styEINBox" style=" padding-left:2mm; font-size:7pt;">

<span class="BoldText">Identifying number</span>

<div style="text-align:left;font-weight:normal; ">

<br/>

         <xsl:choose>

			<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">

			 <span style="text-align:left;font-weight:normal;">

					<xsl:call-template name="PopulateReturnHeaderFiler">

					  <xsl:with-param name="TargetNode">EIN</xsl:with-param>

					</xsl:call-template>

				  </span>

			    </xsl:when>

			    	<xsl:otherwise>

			 <span style="text-align:left;font-weight:normal;">

					<xsl:call-template name="PopulateReturnHeaderFiler">

					  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>

					</xsl:call-template>

				  </span>	

				  </xsl:otherwise>

				  </xsl:choose>

	

</div>

</div>

</div>

<!--  End Name and Employer indentification number  -->

<!-- *******************************************************************  -->

    <!--  line 1a4  -->

          <div style="width: 187mm"><b>Note.</b></div>

              <div style="width: 187mm">

                 <span class="styBoldText">

                 <img src="{$ImagePath}/8910_Bullet_Round.gif" alt="SmalllBullet"/> 

              </span>

              <span style="width: 2mm"/>

              Use this form to claim the credit for certain alternative motor vehicles or 

              plug-in electric vehicle conversions.

           </div>

             <div style="width: 187mm">

                 <span class="styBoldText">

                 <img src="{$ImagePath}/8910_Bullet_Round.gif" alt="SmalllBullet"/> 

              </span>

              <span style="width: 2mm"/>

              Claim the credit for certain two- or three-wheeled or low-speed

               four-wheeled plug-in electric vehicles on Form 8834.

           </div>

           <div class="styBB" style="width: 187mm">

                 <span class="styBoldText">

                 <img src="{$ImagePath}/8910_Bullet_Round.gif" alt="SmalllBullet"/> 

              </span>

              <span style="width: 2mm"/>

              Claim the credit for certain other plug-in electric vehicles on Form 8936.

           </div>

<!-- *******************************************************************  -->



<!--  Part I -->

<div class="styBB" style="width: 187mm;padding-top:4px;padding-bottom:4px;">

<div class="styPartName">Part I</div>

<div class="styPartDesc">Tentative Credit</div>

</div>

<!--  End Part I -->

<xsl:if test="($Print != $Separated) or (count($FormData/IRS8910PartI) &lt;= 3)">

<xsl:for-each select="$FormData/IRS8910PartI">

<xsl:variable name="pos" select="position()"/>

<xsl:if test="(position() mod 3)=1">

<!--print logic-->



<!--end-->

<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt; font-family:verdana;">

<tr style="height: 8mm">

<th scope="col" class="PopulateTxt" style="border-color:black;border-bottom-width:1px;padding-left:0px;padding-right:0px;"/>

<th scope="col" class="PopulateTxt" colspan="2" style="width:83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1mm; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px;">

<span class="styNormalText" style="font-size:6pt;"> Use a separate column for each vehicle. If you need more columns, use additional Forms 8910 and include the total on lines 13 and 17.

            </span>

</th>

<th scope="col" class="styTableCell" style="width:32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center">Vehicle <xsl:number value="($pos)" format="1"/>

</th>

<th scope="col" class="styTableCell" style="width:32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center;">Vehicle <xsl:number value="($pos + 1)" format="1"/>

</th>

<th scope="col" class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px; text-align: center">Vehicle <xsl:number value="($pos + 2)" format="1"/>

</th>

</tr>

<tfoot/>

<tbody>

<!--  Line 1   -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          padding-top:6mm;border-color:black;border-top-width:1px;

                          border-right-width:0px;border-bottom-width:0px">

<b>1</b>

</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align:left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width:1px; border-bottom-width:0px;padding-top:6mm;">

                           Year, make, and model of vehicle

                          <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">......           

                          </span>

</td>

<td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;

                          border-bottom-width:0px;border-top-width:1px;border-right-width:0px;

                          background-color:lightgrey;padding-left:0px;padding:right:0px">

<span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;f

                         loat:right;border-top-width:0px;border-left-width:0px;background-color:white;

                         padding-left:0px;padding-right:1px">1

                         </span>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; 

                           border-top-width: 1px; border-bottom-width:1px; text-align: center;

                           padding-left:0mm;padding-right:0mm">

<span class="styTableCellPad"/>

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

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleYear"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleMake"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleModel"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 1px; border-bottom-width:1px; text-align: center">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleYear"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleMake"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleModel"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 2  -->

<tr style="font-size: 7pt">

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px;

                          border-bottom-width:0px;">2

                          </td>

<td class="styTableCell" style="width: 75mm; padding-left:2mm;text-align: left; border-color: black;

                           border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                            border-bottom-width:0px;">

                          Enter date vehicle was placed in service (MM/DD/YY)

                          </td>

<td class="styLNRightNumBox">2</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                           border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; 

                           text-align:center;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateMonthDayYear">

<xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDate"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; 

                          text-align:center;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateMonthDayYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/VehiclePlacedInServiceDate"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align:center;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateMonthDayYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/VehiclePlacedInServiceDate"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 3  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">3</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:0px;">

<b> Credit allowable </b>(see instructions for amount to enter)

               <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:0px;">3</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px; 

                          border-right-width:1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="MaximumAllowedCredit"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                           border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/MaximumAllowedCredit"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/MaximumAllowedCredit"/>

</xsl:call-template>

</td>

</tr>

<!--  Line 4   -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-color:black;border-top-width:0px; border-right-width:0px;

                          border-bottom-width:0px;padding-bottom:7mm">

<b>4</b>

</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align:left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width:0px; border-bottom-width:0px;padding-top:2mm;">

                           If you are not claiming the plug-in conversion credit, skip lines 4 through 8, enter -0- on

                            line 9, and go to line 10. Otherwise, enter the cost of converting the vehicle to 

                            a qualified plug-in electric drive motor vehicle 

                           

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..

                         </span>

</td>

<td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;

                           border-bottom-width:0px;border-top-width:1px;border-right-width:0px;

                           background-color:lightgrey;padding-left:0px;padding:right:0px">

<span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;

border-top-width:0px;

                            border-left-width:0px;padding-left:0px;padding-right:0px">4

                           </span>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; 

                          border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;

                           text-align:right;padding-left:0mm;padding-right:0mm;padding-top:16mm;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehCostOfConversionAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;

                           text-align: right;padding-top:16mm">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/AltMotorVehCostOfConversionAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px;

                           text-align: right;padding-top:16mm">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehCostOfConversionAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 5  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">5</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Section 179 expense deduction (see instructions)

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">5</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehSect179ExpDedAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehSect179ExpDedAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehSect179ExpDedAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 6  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">6</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Subtract line 5 from 4

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..........</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">6</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehNetCostOfCnvrtAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehNetCostOfCnvrtAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                           border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehNetCostOfCnvrtAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 7  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">7</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Multiply line 6 by 10% (.10)

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">........</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">7</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehConversionPctAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehConversionPctAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehConversionPctAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 8  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">8</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Maximum plug-in conversation credit amount allowable

                     

                          </td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">8</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>4000.00

                            <br/>

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehMaxPlugInCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>4000.00

                            <br/>

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehMaxPlugInCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/> 4000.00

                            <br/>

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/AltMotorVehMaxPlugInCreditAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 9  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">9</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Enter the <b>smaller</b> of line 7 or line 8

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">......</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">9</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehAllowableCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehAllowableCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehAllowableCreditAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 10  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                        border-color:black;border-right-width:0px;border-bottom-width:1px;" valign="top">10</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:1px;">

<b>Tentative credit.</b> Add lines 3 and 9

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">......</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">10</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehTentativeCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 1px; border-top-width: 0px; border-bottom-width:01px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehTentativeCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehTentativeCreditAmt"/>

</xsl:call-template>

</td>

</tr>

</tbody>

</table>



</xsl:if>

</xsl:for-each>

</xsl:if>

<!-- Display if there are no data elements, or Print is set to separated and there are more than 3 elements.  Be sure to test by commenting 

 out "if separated" statements in 3 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm -->

<xsl:if test="(count($FormData/IRS8910PartI)=0) or (($Print = $Separated) and (count($FormData/IRS8910PartI) &gt; 3))">

<div class="styIRS8910TableContainer" id="Spcctn">

<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->

<xsl:call-template name="SetInitialState"/>

<!--end-->

<!-- blank lines -->

<table class="styTable" cellspacing="0" style="font-size: 7pt">

<thead class="styTableThead">

<tr style="height: 8mm">

<th scope="col" class="PopulateTxt" style="border-color:black;border-bottom-width:1px;padding-left:0px;padding-right:0px;"/>

<th scope="col" class="PopulateTxt" colspan="2" style="width:83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1mm; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px;">

<span class="styNormalText" style="font-size:6pt;"> Use a separate column for each vehicle. If you need more columns, use additional Forms 8910 and include the total on lines 13 and 17.

            </span>

</th>

<th scope="col" class="styTableCell" style="width:32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center">Vehicle 1

</th>

<th scope="col" class="styTableCell" style="width:32mm;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center;">Vehicle 2

</th>

<th scope="col" class="styTableCell" style="width: 32mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px; text-align: center">Vehicle 3

</th>

</tr>

</thead>

<tfoot/>

<tbody>

<!--  Line 1   -->

<tr>

<td class="styTableCell" style="width:6mm;text-align:right;font-weight:bold;padding-top:6mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;">

<b>1</b>

</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;padding-top:6mm;">

       Year, make, and model of vehicle

    <span style="letter-spacing:4mm;font-weight:bold">.....</span>



</td>



<td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;

                           border-bottom-width:0px;border-top-width:1px;border-right-width:0px;

                           background-color:lightgrey;padding-left:0px;padding:right:0px">

<span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;

                            border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px">1

                           </span>

</td>



<xsl:choose>

<!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->

<xsl:when test="(($Print = $Separated) and (count($FormData/IRS8910PartI) &gt; 3))">

<td class="styTableCell" style="border-color: black; border-left-width: 1px; 

                          border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;

                           text-align:center;padding-top:5mm">

<xsl:call-template name="PopulateAdditionalDataTableMessage">

<xsl:with-param name="ShortMessage">true</xsl:with-param>

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI/VehicleDescription"/>

</xsl:call-template>

</td>

</xsl:when>

<xsl:otherwise>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">

<span class="styTableCellPad"/>

</td>

</xsl:otherwise>

</xsl:choose>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 2  -->

<tr style="font-size: 7pt">

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                      border-right-width: 0px;border-bottom-width:0px;padding-left:1mm;">2

      </td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">

   Enter date vehicle was placed in service (MM/DD/YY)

        </td>

<td class="styLNRightNumBox">2</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 3  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                      border-right-width: 0px;border-bottom-width:0px;padding-left:1mm;" valign="top">3</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">

<b>Credit allowable </b>(see instructions for amount to enter)

              

  <span style="letter-spacing:4mm;font-weight:bold">.....</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:0px;">3</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                       border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px" valign="bottom">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- ***********************************************************************************  -->

<!--  Line 4   -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-color:black;border-top-width:0px; border-right-width:0px;

                          border-bottom-width:0px;padding-bottom:13mm">

<b>4</b>

</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm; text-align:left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width:0px; border-bottom-width:0px;padding-top:2mm;">

                           If you are not claiming the plug-in conversion credit, skip lines 4 through 8, enter -0- on

                            line 9, and go to line 10. Otherwise, enter the cost of converting the vehicle to 

                            a qualified plug-in electric drive motor vehicle 

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.............

                         </span>

</td>

<td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;

                           border-bottom-width:0px;border-top-width:1px;border-right-width:0px;

                           background-color:lightgrey;padding-left:0px;padding:right:0px">

<span class="styLNRightNumBox" style="width:8.75mm;padding-bottom:0mm;float:right;border-top-width:0px;

                            border-left-width:0px;background-color:white;padding-left:0px;padding-right:0px">4

                           </span>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; 

                          border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;

                           text-align: center;padding-left:0mm;padding-right:0mm">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;

                           text-align: center">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px;

                           text-align: center">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 5  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px" valign="top">5</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Section 179 expense deduction (see instructions)

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">5</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 6  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">6</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Subtract line 5 from 4

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..........</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">6</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                           border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 7  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;" valign="top">7</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Multiply line 6 by 10% (.10)

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">........</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">7</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 8  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px" valign="top">8</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Maximum plug-in conversation credit amount allowable

                     

                          </td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">8</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>4000.00

                           

                          </td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>4000.00

                          </td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/> 4000.00

                          </td>

</tr>

<!-- Line 9  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px" valign="top">9</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:0px;">

                         Enter the <b>smaller</b> of line 7 or line 8

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">......</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">9</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                          border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 10  -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                        border-color:black;border-right-width:0px;border-bottom-width:1px;" valign="top">10</td>

<td class="styTableCell" style="width: 75mm;padding-left:2mm;text-align: left; 

                          border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:1px">

<b>Tentative credit.</b> Add lines 3 and 9

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">......</span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">10</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px;

                           border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                          border-right-width: 1px; border-top-width: 0px; border-bottom-width:01px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; 

                          border-top-width: 0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

</td>

</tr>

<!-- ***********************************************************************************  -->

</tbody>

</table>

</div>

</xsl:if>

<!--  Part II -->

<div style="width: 187mm;padding-top:4px;padding-bottom:4px

          ;border-top-width:0px;">

<span style="padding-left:7mm"/>

<b>Next:</b> If you did NOT use your vehicle for business or 

          investment purposes and did not have a credit from a partnership or S corporation, 

         <span style="padding-left:7mm;border-top-width:1px;"/>skip Part II and go to Part III. ALL others, go to Part II.

           

          </div>

<div class="styBB" style="width: 187mm;padding-top:4px;padding-bottom:4px;border-top-width:1px">

<div class="styPartName">Part II</div>

<div class="styPartDesc">Credit for Business/Investment Use Part of Vehicle</div>

</div>

<div style="width:187mm">

<!-- Added by Doug Peterson-->

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

<thead class="styTableThead"/>

<tfoot/>

<tbody>

<!-- line 11 -->

<tr>

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width:0px;border-bottom-width:0px;">11

                          </td>

<td class="styTableCell" style="width:75mm; padding-left:2mm;text-align:left;border-color:black;border-left-width:0px;border-right-width: 0px;border-top-width:0px;border-bottom-width:0px;font-size:6pt;padding-top:.5mm;">

                                Business/investment use percentage (see instructions)

             <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">...</span>

</td>

<td class="styLNRightNumBox">11</td>

<td class="styTableCell" style="border-color:black;border-left-width:1px; border-right-width:1px; border-top-width:0px; border-bottom-width:1px">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>

</xsl:call-template>

        %

        </td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUsePct"/>

</xsl:call-template>

          %

          </td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUsePct"/>

</xsl:call-template>

        %

        </td>

</tr>

<!-- Line 12 -->

<tr>

<td class="styTableCell" style=";width:5.5mm;text-align:right;

                          font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center">12</td>

<td class="styTableCell" style="width:75mm; padding-left:2mm;text-align: left;

                           border-color: black; border-left-width: 0px; border-right-width: 0px;

                            border-top-width: 0px; border-bottom-width:0px;">Multiply line 10 by line 11<b>



         <span style="letter-spacing:4mm;font-weight:bold">........</span>

             </b>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">12</td>

<td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmount"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUseAmount"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color:black;border-left-width:0px;border-right-width:0px; border-top-width:0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUseAmount"/>

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

<xsl:if test="(count($FormData/BusinessInvestmentUse)=0) or (($Print = $Separated) 

            and (count($FormData/BusinessInvestmentUse) &gt; 3))">

<div class="styIRS8910TableContainer" id="Spcctn">

<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->

<xsl:call-template name="SetInitialState"/>

<!--end-->

<!-- blank lines -->

<table class="styTable" cellspacing="0" style="font-size: 7pt">

<tfoot/>

<tbody>

<!-- line 11  -->

<tr>

<td class="styTableCell" style="padding-left:.25mm;width:5.5mm;text-align:right;

                      font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">11

      </td>

<td class="styTableCell" style="width:75mm;text-align:left; border-color:black;

                      border-left-width:0px;border-right-width: 0px;border-top-width:0px;

                      border-bottom-width:0px;font-size:6pt;padding-top:.5mm;">

         Business/investment use percentage (See instructions)

       </td>

<td class="styLNRightNumBox">11</td>

<xsl:choose>

<!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->

<xsl:when test="(($Print = $Separated) and (count($FormData/BusinessInvestmentUse) &gt; 3))">

<td class="styTableCell" style="padding-left:1mm;width:32mm;border-color: black;

                           border-left-width: 1px; border-right-width:1px; border-top-width:0px;

                            border-bottom-width:1px; text-align:center;">

<xsl:call-template name="PopulateAdditionalDataTableMessage">

<xsl:with-param name="ShortMessage">true</xsl:with-param>

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse/BusinessInvestmentUsePct"/>

</xsl:call-template>

<span style="text-align:right;padding-left:7.5mm;width:auto">%</span>

</td>

</xsl:when>

<xsl:otherwise>

<td class="styTableCell" style="width:32mm;border-color: black;

                           border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; 

                           border-bottom-width:1px; text-align: center">

<span class="styTableCellPad"/>

            %

            </td>

</xsl:otherwise>

</xsl:choose>

<td class="styTableCell" style="width:32mm;border-color: black; border-left-width: 0px;

                       border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">

<span class="styTableCellPad"/>

        %

        </td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                       border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">

<span class="styTableCellPad"/>

          %

          </td>

</tr>

<!-- Line 12          -->

<tr>

<td class="styBoldText" style="padding-left: 2mm;width:6mm;padding-top:.5mm;">12</td>

<td class="styTableCell" style="width:71mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

              Multiply line 10 by line 11<b>

<span style="letter-spacing:4mm;font-weight:bold">.....</span>

             </b>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;border-left:width:0px;

                      border-right-width:1px;">12</td>

<td style="border-style:solid black;border-color:black;border-bottom: 1 solid black; 

                      border-left-width:1px;border-right-width:1 solid black; border-right-width:1px;

                      border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad" style="border-color:black;

                        border-left-width:1px;border-right-width:1px; border-top-width:0px;

                         border-bottom-width:1px "/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color:black;border-left-width:0px;border-right-width:0px; border-top-width:0px; border-bottom-width:1px" valign="bottom">

<span class="styTableCellPad"/>

</td>

</tr>

</tbody>

</table>

</div>

</xsl:if>

<!--  Line 13 -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm">13</div>

<div style="float:left;padding-top:.5mm;">

      Add columns (a) through (c) on line 12

    </div>

<div style="float:right;">

<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  

        ..................

      </span>

<div class="styLNRightNumBox" style="border-bottom-width: 1px">13</div>

<div class="styLNAmountBox" style="border-bottom-width: 1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInvestmentUseAmt"/>

</xsl:call-template>

</div>

</div>

</div>

<!--  Line 14 -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm;">14</div>

<div style="float:left;padding-top:.5mm;">

     Alternative motor vehicle credit from partnerships and S corporations

    </div>

<div style="float:right;">

<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">  

        .........

      </span>

<div class="styLNRightNumBox" style="border-bottom-width: 1px">14</div>

<div class="styLNAmountBox" style="border-bottom-width: 1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/AlternativeMotorVehicleCredit"/>

</xsl:call-template>

</div>

</div>

</div>

<!--  Line 15 -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm;">15</div>

<div style="float:left;padding-top:.5mm;">

<b>

   Business/investment use part of credit. </b>Add lines 13 and 14. 

   Partnerships and S corporations, report

    </div>

<div style="float:right;">

<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left"/>

<div class="styLNRightNumBox" style="border-bottom-width: 0px;background-color:lightgrey;"/>

<div class="styLNAmountBox" style="border-bottom-width: 0px"/>

</div>

</div>

<!-- end  Line 15a -->

<!--  Line 15b -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm"/>

<div style="float:left;padding-top:.5mm;">

  this amount on Schedule K; all others, report this amount on Form 3800, line 1r

    </div>

<div style="float:right;">

<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">......  

       </span>

<div class="styLNRightNumBox" style="border-bottom-width: 0px">15</div>

<div class="styLNAmountBox" style="border-bottom-width: 0px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/BusInvestmentUsePartOfCredit"/>

</xsl:call-template>

</div>

</div>

</div>

</div>

<!--  end Line 15b -->

<!--   Part III header -->

<div class="styBB" style="width: 187mm;padding-top:4px;padding-bottom:4px;border-top-width:1px">

<div class="styPartName">Part III</div>

<div class="styPartDesc">Credit for Personal Use Part of Vehicle</div>

</div>

<!-- Line 16  -->

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

<thead class="styTableThead"/>

<tfoot/>

<tbody>

<tr style="font-size: 7pt">

<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;

                          border-right-width: 0px;border-bottom-width:0px;padding-bottom:4mm;

                          ">16</td>

<td class="styTableCell" style="width: 75mm; padding-left:2mm;

                          text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px;

                           border-top-width: 0px; border-bottom-width:0px">

                          If you skipped Part II, enter the amount from line 10.

                           If you completed Part II, subtract line 12 from line 10

                          	<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.</span>

</td>

<td class="styLNRightNumBox">16</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos]"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos + 1]"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos + 2]"/>

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

<div class="styIRS8910TableContainer" id="Spcctn">

<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->

<xsl:call-template name="SetInitialState"/>

<!--end-->

<table class="styTable" cellspacing="0" style="font-size: 7pt">

<thead class="styTableThead"/>

<tfoot/>

<tbody>

<!-- line 16 -->

<tr style="font-size: 7pt">

<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:4mm;

                      padding-bottom:2mm;">16

        </td>

<td class="styTableCell" style="width: 75mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">

             if you skipped Part II, enter the amount from line 10. if you completed Part II,  

             subtract line 12 from line 10

         

                      </td>

<td class="styLNRightNumBox">16</td>

<xsl:choose>

<!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->

<xsl:when test="(($Print = $Separated) and (count($FormData/TentativeCreditForPersonalUse) &gt; 3))">

<td class="styTableCell" style="width:32mm;border-color: black; border-left-width:1px; border-right-width:1px;

                           border-top-width:0px; border-bottom-width:1px; text-align:center;">

<xsl:call-template name="PopulateAdditionalDataTableMessage">

<xsl:with-param name="ShortMessage">true</xsl:with-param>

<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                           border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                           border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">

<span class="styTableCellPad"/>

</td>

</xsl:when>

<xsl:otherwise>

<!-- separated but no data -->

<td class="styTableCell" style="width:32mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:0px; border-bottom-width:1px; text-align: center;">

<span class="styTableCellPad"/>

</td>

</xsl:otherwise>

</xsl:choose>

</tr>

</tbody>

</table>

</div>

</xsl:if>

</div>

<!--  Line 17 -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm;">17</div>

<div style="float:left;padding-top:.5mm;">

    Add columns (a) through (c) on line 16

    </div>

<div style="float:right;">

<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">..................

      </span>

<div class="styLNRightNumBox" style="border-bottom-width: 1px;">17</div>

<div class="styLNAmountBox" style="border-bottom-width: 1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TotTentCreditForPersonalUse"/>

</xsl:call-template>

</div>

</div>

</div>

<!-- End Line 17 -->

<!--  Line 17 -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm;">18</div>

<div style="float:left;padding-top:.5mm;">

           Enter the amount from Form 1040, line 46, or Form 1040NR, line 43

          </div>

<div style="float:right;">

<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">..........

      </span>

<div class="styLNRightNumBox" style="border-bottom-width: 1px;">18</div>

<div class="styLNAmountBox" style="border-bottom-width: 1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TotalTxBeforeCrAndOtherTxsAmt"/>

</xsl:call-template>

</div>

</div>

</div>

<!-- End Line 18 -->

<!--  Line 19 -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm;">19</div>

<div class="styLNDesc" style="width:139.2mm;padding-right:1mm;">

             Personal credits from Form 1040 or 1040NR (see instructions)

             <span style="letter-spacing:4mm; font-weight:bold">...........</span>

</div>

<div class="styLNRightNumBox" style="padding-top:0mm;padding-bottom:0mm;border-bottom:0px;">

<div class="styLNRightNumBoxNBB" style="padding-bottom:0mm;width:7.75mm;border-left-width:0px;background-color:lightgrey;"/>

	          19





	  </div>

<div class="styLNAmountBox" style="width:31mm;border-bottom-width:1px;height:7.5mm;padding-top:3.5mm">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/AltMotorVehCreditFromFormsAmt"/>

</xsl:call-template>

</div>

</div>

<!--  Line 20 -->

<div style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm">20</div>

<div class="styLNDesc" style="width:139.2mm;height:4mm;padding-right:1mm;">

              Subtract line 19 from line 18. If zero or less, <b>stop.</b> You cannot claim the personal use 

              part of the credit

            </div>

<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;">

<div class="styLNRightNumBoxNBB" style="padding-bottom:0mm;width:7.75mm;

border-left-width:0px;border-top-width:1px;background-color:lightgrey;"/>

	          20

	         </div>

<div class="styLNAmountBox" style="width:31mm;padding-top: 3.5mm;border-bottom-width:1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/AltMotorVehAdjustedCreditAmt"/>

</xsl:call-template>

</div>

</div>

<!--  Line 21 -->

<div class="styBB" style="width: 187mm">

<div class="styLNLeftNumBox" style="padding-left: 2mm">21</div>

<div class="styLNDesc" style="width:139.2mm;height:4mm;padding-right:1mm;">

<b> Personal use part of credit.</b> Enter the <b>smaller</b> of line 17 or line 20 here 

              and on Form 1040, line 53 (or Form 1040NR, line 50).  Check box <b>c</b> on that line 

              and enter "8910" in the space next to that box. If line 20 is smaller than line 17, see instructions

          <span style="letter-spacing:4mm; font-weight:bold">.................</span>

            </div>

<div class="styLNRightNumBox" style="height:11mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;">

<div class="styLNRightNumBoxNBB" style="padding-bottom:0mm;width:7.75mm;padding-top:4mm;

border-left-width:0px;border-top-width:1px;background-color:lightgrey;"/>

	  21

	  </div>

<div class="styLNAmountBox" style="height:11mm;width:31mm;padding-top: 3.5mm;border-bottom:0px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCredit"/>

</xsl:call-template>

</div>

</div>

<!-- End of page -->

<div style="width:187mm;">

<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>

<span style="width:120px;"/>                      

          Cat. No. 37720F 

          <span style="width:80px;"/>  

          Form <span class="styBoldText">8910</span> (2010)

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

<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage

              );"/>

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

<xsl:if test="($Print = $Separated) and (count($FormData/IRS8910PartI) &gt; 3)">

<br/>

<br/>

<span class="styRepeatingDataTitle">Form IRS8910, Part I - Tentative Credit:</span>

<xsl:for-each select="$FormData/IRS8910PartI">

<xsl:variable name="pos" select="position()"/>

<xsl:if test="(position() mod 3)=1">

<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">

<thead class="styTableThead">

<tr style="height: 8mm" class="styDepTblHdr">

<td class="styDepTblCell" colspan="2" style="width: 91mm; border-color: black; 

                      border-left-width: 0px; border-right-width: 0px; border-top-width:

                       0px; border-bottom-width:1px; text-align: left">

<span class="styNormalText" style="padding-left: 5mm">

                  Use a separate column for each vehicle. If you need more<br/>

<span style="width: 5mm"/>

                  columns, use additional Forms 8910 and include the totals <br/>

<span style="width: 5mm"/>on line 8 and 12.

                </span>

</td>

<td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;

                       text-align: center;">Vehicle <xsl:number value="($pos)" format="1"/>

</td>

<td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 0px; 

                      border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;

                       text-align: center">Vehicle <xsl:number value="($pos + 1)" format="1"/>

</td>

<td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 0px;

                       border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;

                        text-align: center">Vehicle <xsl:number value="($pos + 2)" format="1"/>

</td>

</tr>

</thead>

<tfoot/>

<tbody>

<!--  Line 1   -->

<!-- column 1 -->

<tr class="styDepTblRow1" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; 

                       border-bottom-width:1px">

<span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>

<span style="width: 1mm"/>

<span>Year, make, and model of vehicle</span>

<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">......

                         </span>

</td>

<td class="styLNRightNumBox" style="border-top-width: 1px;">1</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; 

                      border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">

<span class="styTableCellPad"/>

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

<td class="styTableCell" style="border-color: black; border-left-width: 1px; 

                      border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; 

                      text-align: center">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleYear"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleMake"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/VehicleDescription/VehicleModel"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; 

                      border-top-width: 1px; border-bottom-width:1px; text-align: center">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleYear"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleMake"/>

</xsl:call-template>

<br/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/VehicleDescription/VehicleModel"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 2  -->

<tr class="styDepTblRow2" style="height: 5mm; font-size: 7pt">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; 

                       border-bottom-width:0px">

<span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span>

<span style="width: 1mm"/>

<span>Enter date vehicle was placed in service <br/>

<span style="padding-left:5mm"/>(MM/DD/YYYY)</span>

</td>

<td class="styLNRightNumBox">2</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; 

                      border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; 

                      text-align:center">

<xsl:call-template name="PopulateMonthDayYear">

<xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDate"/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                       border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; 

                       text-align:center">

<xsl:call-template name="PopulateMonthDayYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/VehiclePlacedInServiceDate"/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                      border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;

                       text-align:center">

<xsl:call-template name="PopulateMonthDayYear">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/VehiclePlacedInServiceDate"/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

</tr>

<!-- Line 3  -->

<tr class="styDepTblRow1" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">3</span>

<span style="width: 1mm"/>

<b>Credit allowable.</b> (see instructions for amount to enter)

                        

               </td>

<td class="styLNRightNumBox">3</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="MaximumAllowedCredit"/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 1px; 

                      border-top-width: 0px; border-bottom-width:1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/MaximumAllowedCredit"/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px;

                       border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/MaximumAllowedCredit"/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

</tr>

<!-- ***********************************************************************************  -->

<!--  Line 4   -->

<tr class="styDepTblRow2" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">4</span>

<span style="width: 1mm"/>

                      If you are not claiming the plug-in conversion credit,

                     <br/>

<span style="width:6mm"/> skip lines 4 through 8, enter -0- on

                            line 9, and go to<br/>

<span style="padding-left:6mm"/>line 10. Otherwise, enter the cost of converting <span style="padding-left:6mm"/> the vehicle to a qualified plug-in electric drive motor 

<span style="padding-left:6mm;"/>vehicle 

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.........

                         </span>

</td>

<td class="styLNRightNumBox" style="padding-bottom:8mm">4</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="AltMotorVehCostOfConversionAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 1]/AltMotorVehCostOfConversionAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehCostOfConversionAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 5  -->

<tr class="styDepTblRow1" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">5</span>

<span style="width: 1mm"/>

                      Section 179 expense deduction (see instructions)

                       <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.

                         </span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">5</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehSect179ExpDedAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehSect179ExpDedAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehSect179ExpDedAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- *****************************************************************************  -->

<!-- Line 6  -->

<tr class="styDepTblRow1" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">6</span>

<span style="width: 1mm"/>

                      Subtract line 5 from line 4

                       <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.

                         </span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">6</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehNetCostOfCnvrtAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehNetCostOfCnvrtAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehNetCostOfCnvrtAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- ***************************************************************************** -->





<!-- Line 7  -->

<tr class="styDepTblRow1" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">7</span>

<span style="width: 1mm"/>

                        Multiply line 6 by 10% (.10)

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.......

                         </span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">7</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehConversionPctAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehConversionPctAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehConversionPctAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 8  -->

<tr class="styDepTblRow2" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">8</span>

<span style="width: 1mm"/>

                      Maximum plug-in conversation credit amount allowable

                     

                      </td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">8</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<span class="styTableCellPad" style="padding-right:3mm"/>4000.00

                        <br/>

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehMaxPlugInCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<span class="styTableCellPad" style="padding-right:3mm"/>4000.00

                        <br/>

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehMaxPlugInCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<span class="styTableCellPad" style="text-align:center"/>4000.00

                        <br/>

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 2]/AltMotorVehMaxPlugInCreditAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 9  -->

<tr class="styDepTblRow1" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">9</span>

<span style="width: 1mm"/> Enter the <b>smaller</b> of line 7 or line 8

                 

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.....

                         </span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1px;">9</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehAllowableCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehAllowableCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehAllowableCreditAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- Line 10  -->

<tr class="styDepTblRow2" style="height: 5mm">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;

                        border-bottom-width:0px;">

<span class="styBoldText" style="font-size:7pt; padding-left: .5mm;">10</span>

<span style="width: 2mm"/>

<b>Tentative credit.</b> Add lines 3 and 9



                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.....

                         </span>

</td>

<td class="styLNRightNumBox" style="border-bottom-width:1mm;padding-right:2mm">10</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="AltMotorVehTentativeCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI[$pos + 1]/AltMotorVehTentativeCreditAmt"/>

</xsl:call-template>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px;

                       border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/IRS8910PartI [$pos + 2]/AltMotorVehTentativeCreditAmt"/>

</xsl:call-template>

</td>

</tr>

<!-- ***********************************************************************************  -->

</tbody>

</table>

<br/>

</xsl:if>

</xsl:for-each>

</xsl:if>

<!-- Additional Data Table for Separated Data from Part II;

           displayed if more than 3 elements and Print is set to separated-->

<xsl:if test="($Print = $Separated) and (count($FormData/BusinessInvestmentUse) &gt; 3)">

<br/>

<br/>

<span class="styRepeatingDataTitle">

            Form IRS8910, Part II -Credit for Business/investment Use Part of Vehicle:</span>

<xsl:for-each select="$FormData/BusinessInvestmentUse">

<xsl:variable name="pos" select="position()"/>

<xsl:if test="(position() mod 3)=1">

<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">

<tbody>

<!-- line 11 -->

<tr class="styDepTblRow1">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;

                       border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; 

                       border-bottom-width:0px;">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">11</span>

<span style="width: 1mm;font-size:5pt"/>Business/investment use percentage (see instructions)

               </td>

<td class="styLNRightNumBox">11</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; 

                      border-top-width:0px; border-bottom-width:1px">

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>

</xsl:call-template>

<span class="styTableCellPad"/>

              %

              </td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                      border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUsePct"/>

</xsl:call-template>

<span class="styTableCellPad"/>

              %

              </td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;

                       border-top-width: 0px; border-bottom-width:1px;">

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUsePct"/>

</xsl:call-template>

<span class="styTableCellPad"/>

              

              %</td>

</tr>

<!-- line 12 -->

<tr class="styDepTblRow2">

<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; 

                      border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">12</span>

<span style="width: 1mm"/>Multiple line 10 by line 11

                         <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.......

                         </span>

</td>

<td class="styLNRightNumBox">12</td>

<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; 

                      border-top-width: 0px; border-bottom-width:1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmount "/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; 

                      border-left-width: 0px; border-right-width: 1px; border-top-width: 0px;

                       border-bottom-width:1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 1]/BusinessInvestmentUseAmount "/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

<td class="styTableCell" style="border-color: black; border-left-width: 0px; 

                      border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUse[$pos + 2]/BusinessInvestmentUseAmount "/>

</xsl:call-template>

<span class="styTableCellPad"/>

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

<br/>

<br/>

<span class="styRepeatingDataTitle">Form IRS8910, Part III -Credit for Personal Use of Vehicle:</span>

<xsl:for-each select="$FormData/TentativeCreditForPersonalUse">

<xsl:variable name="pos" select="position()"/>

<xsl:if test="(position() mod 3)=1">

<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">

<tbody>

<!-- line16 -->

<tr class="styDepTblRow2">

<td class="styTableCell" style="width: 83mm; text-align: left;

                       border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; 

                       border-bottom-width:1px;border-color: black;">

<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">16</span>

<span style="width: 1mm;"/>if you skipped Part II, enter the amount from line 10.<br/>

<span style="width:7mm"/>if you completed Part II, subtract line 12 from line 10

               </td>

<td class="styDepTblRow2" style="width:8mm;border-left-width: 1px;

 border-right-width:1px; border-top-width:1px;border-bottom-width:1px;border-color: black;">16</td>

<td class="styDepTblRow2" style="border-left-width: 1px; border-right-width: 1px; 

                      border-top-width: 0px; border-bottom-width:1px;border-color: black">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos]"/>

</xsl:call-template>

</td>

<td class="styDepTblRow2" style=" 

                      border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;

                       border-bottom-width:1px;border-color: black;">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos + 1]"/>

</xsl:call-template>

</td>

<td class="styDepTblRow2" style="border-color: black; border-left-width: 0px; 

                      border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px">

<span class="styTableCellPad"/>

<xsl:call-template name="PopulateAmount">

<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPersonalUse[$pos +2]"/>

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

