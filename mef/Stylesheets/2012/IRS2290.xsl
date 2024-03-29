<?xml version="1.0" encoding="UTF-8"?>
<!-- 9/23/09  Added the new Special Condition Description to end of form per ETA091682OTH  -->
<!-- 9/23/09  Added pushpin for the General Dependency Medium per ETA091653OTH -->
<!-- 12/14/09  Removed the box lines from Part I Line 1 as unable to get date to conform and enter correctly per business and IBM -->
<!-- 04/19/11 - Made changes to tax period as per UWR WSP101182OTH - Jeremy Nichols -->
<!-- 04/25/11 - Made changes to tax period as per UWR WSP101182OTH Additional requirements - Jeremy Nichols -->
<!-- 05/19/11 - Made changes per ITAMS #28985 - Jeremy Nichols -->
<!-- 05/20/11 - Made changes per ITAMS #28986 - Jeremy Nichols -->
<!-- 09/28/11 - Made changes per UWR #47823 - Jeremy Nichols -->
<!-- 12/14/11 - Made changes per defect #54388 - Jeremy Nichols -->
<!-- 01/09/12 - Made changes per KISAM #158562 - Jeremy Nichols -->
<!-- 06/13/12 - Made changes per KISAM #IM00485278 - Jeremy Nichols -->
<!-- 06/14/12 - Made changes per defect #32968 - Jeremy Nichols -->
<!-- 06/14/12 - Made changes per defect #32972 - Jeremy Nichols -->
<!-- 10/19/12 - Made changes per KISAM #IIM00719647 - Jeremy Nichols -->
  
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS2290Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form2290" select="$RtnDoc/IRS2290"/>
  <xsl:param name="Form2290Data" select="$RtnDoc/IRS2290"/>
  <xsl:template match="/">
  
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form2290)"/>
          </xsl:call-template>
        </title>
        
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 2290"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=&apos;&apos;">
            <xsl:call-template name="IRS2290Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form2290">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:25mm;">
        Form <span class="styFormNumber">2290</span>
              <br/>
              <span class="styAgency">(Rev. July 2012) 
              <!-- General Dependency pushpin added -->
                <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2290"/>
              </xsl:call-template>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Amended Month</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form2290/AmendedMonth"/>
              </xsl:call-template>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="TargetNode" select="$Form2290/SpecialConditionDescription"/>
              </xsl:call-template> 
          <br/> Department of the Treasury
        </span>
              <br/>
              <span class="styAgency">Internal Revenue Service  (99)</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:25mm;">
              <div class="styMainTitle" style="">Heavy Highway Vehicle Use Tax Return</div>
              <div style="font-family: &apos;;Arial&apos;font-size:10pt;">
          For the period July 1, 2012, through June 30, 2013
        </div>
              <div class="styFBT">
                <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 
          Attach both copies of Schedule 1 to this return
        </div>
              <div class="styFBT" style="font-weight:normal;">
                <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 
                <b>See the separate instructions.</b>
        </div>
            </div>
            <div class="styTYBox" style="width:31mm;height:25mm;">
              <div class="styOMB" style="height:10mm;padding-left:1mm;padding-top:1mm;text-align:left;font-family:&apos;Arial Narrow&apos;;font-size:8pt">Keep a copy of this<br/>return for your records</div>
              <div style="height:10mm;padding-left:0.5mm;padding-top:3mm;text-align:left;border-bottom-width:0">OMB No. 1545-0143</div>
            </div>
          </div>
          <!-- End Form Title -->
          <!-- Begin Address Change Table -->
          <table border="0" cellspacing="0" cellpadding="0" style="font-size:6pt;width:187mm">
            <tbody>
              <tr>
                <td rowspan="3" style="border:0 solid black;border-right-width:1;width:15mm;font-size:7pt;text-align:center">
                  <span class="styBoldText">Type<br/> or<br/> Print</span>
                </td>
                <td style="height:8mm;width:90mm;border:0 solid black;border-right-width:1;border-bottom-width:1;padding-left:2mm;">Name
              <br/>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                  </xsl:call-template>
                </td>
                <td style="width:47mm;height:8mm;border:0 solid black;border-right-width:1;border-bottom-width:1;vertical-align:top;padding-bottom:0.25mm;padding-left:1mm">
                  <b>Employer identification number</b>
                  <br/>
                  <div style="padding-top:1.25mm">
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="1"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="2"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="float:left;clear:none"> - </span>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="3"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="4"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="5"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="6"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="7"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="8"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="9"/>
                      <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                      <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                      <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                    </xsl:call-template>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="2" valign="top" style="border:0 solid black;padding-top:.5mm;border-right-width:1;border-bottom-width:1;padding-left:2mm;height:8mm;">Address (number, street, and room or suite no.)
              <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td colspan="2" valign="top" style="border:0 solid black;border-right-width:1;padding-left:2mm;height:8mm;padding-bottom:1mm;">City, state, and ZIP code (for Canadian or Mexican address, see the separate instructions.)
              <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">Country</xsl:with-param>
                    <xsl:with-param name="MainForm">true</xsl:with-param>
                  </xsl:call-template>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- End Address Change Table -->
          <!--  *****************ADDITION OF 4 CHECKBOXES PER WSP-090336OTH    FEB. 2009 *****************************************************-->
          <div class="styNBB" style="width:187mm;border-top-width:1px;border-color: black;border-style:solid;border-bottom-width:0px;border-right-width:0px; border-left-width:0px; ">
            <div class="styLNLeftNumBox" style="padding-left: 0mm;padding-top:.3mm;"/>
            <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm;padding-bottom:1mm;border-top-width:0;">
Check if applicable:</div>
          </div>
          <!-- Address Change Checkbox -->
          <div style=" width: 187mm; ">
            <div class="styLNLeftNumBox" style="padding-left: 0mm;padding-top:0mm;"/>
            <div class="styLNDesc" style="width:175mm;border-right-width:0;padding-left: 5mm;padding-top:0mm;">
              <span style="width:89mm;float:left;clear:all;">
                <span style="padding-top:0mm;">
                  <!--<xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form2290/AddressChange"/>
                  </xsl:call-template>-->
                  <input type="checkbox" class="styCkbox" onclick="return false;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form2290/AddressChange"/>
                      <xsl:with-param name="BackupName">Form2290AddressChange</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <label style="padding-top:0mm;padding-left:2mm;">
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form2290/AddressChange"/>
                  </xsl:call-template>            
             Address Change    <br/>

                  <!-- Amended Return Box  -->
                  <span style="width:90mm;float:left;clear:all;">
                    <span style="padding-top:0mm;">
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
                      </xsl:call-template>
                      <input type="checkbox" class="styCkbox" onclick="return false;">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
                          <xsl:with-param name="BackupName">Form990ScheduleDProtectionOfNaturalHabitat</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </span>
                    <label style="padding-left:2mm">
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
                      </xsl:call-template>            
					  <span style="width:84mm;">Amended Return</span>
                      <span style="width:5mm;padding-top:.5mm;"/><span style="width:84mm;">Check this box if reporting (a) additional tax from</span>
                      <span style="width:5mm;"/><span style="width:84mm;">an increase in taxable gross vehicle weight or</span>
                      <span style="width:5mm;"/><span style="width:84mm;">(b) suspended vehicles exceeding the mileage</span>
                      <span style="width:5mm;"/><span style="width:84mm;">use limit.  <b>Do not </b>check this box for any other</span>
                      <span style="width:5mm;"/><span style="width:84mm;">reason.</span>
                      <br/>
                    </label>
                  </span>
                </label>
              </span>
              <!-- VIN Correction Box -->
              <div style="float:right;clear:all;" valign="top">
                <span style="width:80mm;padding-left:4mm;">
                  <input type="checkbox" class="styCkbox" onclick="return false;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form2290/VINCorrection"/>
                      <xsl:with-param name="BackupName">Form2290VINCorrection</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label style="padding-top:0mm;padding-left:2mm">
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form2290/VINCorrection"/>
                    </xsl:call-template>            
					<span style="width:70mm;">VIN Correction </span>
                    <span style="width:5mm;padding-top:.5mm;"/><span style="width:70mm;">Check this box if you are correcting a vehicle</span>
                    <span style="width:5mm;"/><span style="width:70mm;">identification number (VIN) listed on a previously</span>
                    <span style="width:5mm;"/><span style="width:70mm;">filed Schedule 1 (Form 2290).  <b>Do not</b> check this</span>
                    <span style="width:5mm;"/><span style="width:70mm;">box for any other reason.</span>
                    <br/>
                    <!-- Final Return Box -->
                    <span style="width:80mm;padding-left:0mm;float:right;clear:all;">
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form2290/FinalReturn"/>
                      </xsl:call-template>
                      <input type="checkbox" class="styCkbox" onclick="return false;">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form2290/FinalReturn"/>
                          <xsl:with-param name="BackupName">Form990ScheduleDHistoricStructure</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label style="padding-top:0mm;padding-left:2mm">
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form2290/FinalReturn"/>
                        </xsl:call-template>            
					    <span style="width:70mm;">Final Return</span>
                        <span style="width:5.25mm;padding-top:.5mm;"/><span style="width:70mm;">Check this box if you no longer have taxable</span>
                        <span style="width:5.25mm;"/><span style="width:70mm;">vehicles to report.</span>
                      </label>
                    </span>
                  </label>
                </span>
              </div>
            </div>
          </div>
          <!--  BEGIN  PART I  -->
          <div class="styBB" style="width:187mm;height:4.75mm;border-top-width:1;">
            <div class="styPartName" style="height:4.75mm;padding-top:.5mm;">Part I</div>
            <div class="styPartDesc" style="float:left;width:167mm;padding-top:.5mm;"> Figuring the Tax</div>
          </div>
          <!-- Line 1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">1</div>
            <div class="styLNDesc" style="width:135mm;height:7mm;padding-top:2mm;">Was the vehicle(s) reported on this return used on public highways during <b>July</b> 2012? If YES,</div>
            <div style="float:right">
               <div class="styLNRightNumBox" style="height:7mm;padding-left:.25mm;width:8.25mm;border-bottom-width:0;border-right-width:1px;"/>
               <div class="styLNAmountBox" style="padding-left:.25mm;height:5mm;width:33mm;border-bottom-width:1;border-left-width:0px;">
            <span style="float:left;clear:none;width:5mm;padding-left:.5mm;padding-right:0mm;padding-top:.5mm;text-align:center;font-size:6.5pt;">Y</span>
                <span style="width:5.5mm;float:left;clear:none;text-align:center;padding-right:0mm;padding-left:.5mm;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="float:left;clear:none;padding-left:.5mm;width:5.5mm;text-align:center;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="width:5.75mm;float:left;clear:none;text-align:center;padding-left:.5mm;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="width:5.75mm;float:left;clear:none;text-align:center;padding-left:.25mm;padding-top:.5mm;font-size:6.5pt;">M</span>
                <span style="width:5.75mm;float:right;clear:all;text-align:center;padding-top:.5mm;font-size:6.5pt;">M</span>
              </div>
            </div>
          </div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;"/>
  <div class="styLNDesc" style="width:117mm;height:5mm">enter <span class="styBoldText">201207</span> in the boxes to the right. If NO, see the table on page 3 of the instructions</div>
  <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right;padding-top:0mm;padding-bottom:0mm;">
	<span style="width:0.5mm;float:left;clear:none"/>       
	<xsl:call-template name="Populate2290DateBox">
	  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
	  <xsl:with-param name="BoxNum" select="1"/>
	  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
	  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
	  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
	</xsl:call-template>  
	<xsl:call-template name="Populate2290DateBox">
	  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
	  <xsl:with-param name="BoxNum" select="2"/>
	  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
	  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
	  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
	</xsl:call-template>
	<xsl:call-template name="Populate2290DateBox">
	  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
	  <xsl:with-param name="BoxNum" select="3"/>
	  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
	  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
	  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
	</xsl:call-template> 
	<xsl:call-template name="Populate2290DateBox">
	  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
	  <xsl:with-param name="BoxNum" select="4"/>
	  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
	  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
	  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
	</xsl:call-template>  
	
	<xsl:choose>
		<xsl:when test="string-length($RtnHdrData/FirstUsedDate)= 6">
			<xsl:call-template name="Populate2290DateBox">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
			  <xsl:with-param name="BoxNum" select="5"/>
			  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
			  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
			  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
			</xsl:call-template>   
			<xsl:call-template name="Populate2290DateBox">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
			  <xsl:with-param name="BoxNum" select="6"/>
			  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
			  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
			  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="Populate2290DateBox">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
			  <xsl:with-param name="BoxNum" select="6"/>
			  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
			  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
			  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
			</xsl:call-template>   
			<xsl:call-template name="Populate2290DateBox">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
			  <xsl:with-param name="BoxNum" select="7"/>
			  <xsl:with-param name="BoxWidth" select="&apos;5.5mm&apos;"/>
			  <xsl:with-param name="BoxHeight" select="&apos;4.5mm&apos;"/>
			  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>

  </div>
  <div class="styLNRightNumBox" style="height:5mm;float:right">1</div>
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">...</div>
           
           
               </div>
          <!-- Line 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">2</div>
            <div class="styLNDesc" style="width:77mm;height:5mm">
              <span class="styBoldText">Tax.</span> Enter the <span class="styBoldText">Total</span> from Form 2290, page 2, column (4)</div>
            <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/TaxFromTaxComputation"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:5mm;float:right">2</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <span class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">.............</span>
          </div>
          <!-- Line 3 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">3</div>
            <div class="styLNDesc" style="width:98mm;height:5mm;">Additional tax from increase in taxable gross weight (see instructions).  
    <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2290/AdditionalTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/AdditionalTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:5mm;float:right">3</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">........</div>
          </div>
          <!-- Line 4 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">4</div>
            <div class="styLNDesc" style="width:40mm;height:5mm">
              <span class="styBoldText">Total tax.</span> Add lines 2 and 3</div>
            <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/TotalTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:5mm;float:right">4</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">......................</div>
          </div>
          <!-- Line 5 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">5</div>
            <div class="styLNDesc" style="width:44mm;height:5mm;">
              <span class="styBoldText">Credits.</span> (see instructions).
    <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2290/CreditsAmount"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:34mm;height:5mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/CreditsAmount"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:5mm;float:right">5</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">.....................</div>
          </div>
          <!-- Line 6 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">6</div>
            <div class="styLNDesc" style="width:135mm;height:4mm;">
              <span class="styBoldText">Balance due.</span> Subtract line 5 from line 4. This is the amount you owe. If payment through</div>
            <div class="styLNAmountBox" style="height:4mm;width:34mm;border-bottom-width:0;float:right"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0;float:right"/>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:30mm;height:4mm">EFTPS, check here <span style="width2mm"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form2290/EFTPSPayment"/>
                  <xsl:with-param name="BackupName">IRS2290EFTPSPayment</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form2290/EFTPSPayment"/>
                  <xsl:with-param name="BackupName">IRS2290EFTPSPayment</xsl:with-param>
                </xsl:call-template>
              </label>
            </div>
            <div class="styLNAmountBox" style="width:34mm;height:4mm;float:right;border-bottom-width:0px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/BalanceDue"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;float:right;border-bottom-width:0px">6</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">........................</div>
          </div>
          <!-- Begin Part II -->
          <div class="styBB" style="width:187mm;height:4.75mm;border-top-width:1">
            <div class="styPartName" style="height:4.75mm;padding-top:.5mm;">Part II</div>
            <div class="styPartDesc" style="float:left;width:167mm;padding-top:.5mm;"> Statement in Support of Suspension <span style="font-size:7pt;font-weight:normal">(Complete the statements that apply. Attach additional sheets if needed.)</span>
            </div>
          </div>
          <!--  LINE 7 -->
          <div style="width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:6mm;">7</div>
            <div class="styLNDesc" style="width:178mm;height:6mm;padding-top:.5mm;">
              <!--Dotted Line-->
             I declare that the vehicles reported on Schedule 1 as suspended (category W) are expected to be used on public highways (check the boxes that
apply):<br/>
              <span style="padding-left:36mm;padding-top:.5mm;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form2290/Checkbox5000Miles"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox5000Miles</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form2290/Checkbox5000Miles"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox5000Miles</xsl:with-param>
                  </xsl:call-template>
        5,000 miles or less </label>
                <span style="width:10mm"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form2290/Checkbox7500Miles"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox7500Miles</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form2290/Checkbox7500Miles"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox7500Miles</xsl:with-param>
                  </xsl:call-template>
        7,500 miles or less for agricultural vehicles</label>
              </span>
              <br/>
during the period July 1, 2012, through June 30, 2013, and are suspended from the tax. Complete and attach Schedule 1.
       </div>
          </div>
          <!-- Line 8a -->
          <div style="width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">8a</div>
            <div class="styLNDesc" style="width:178mm;height:5mm;">        
            I declare that the vehicles listed as suspended on the Form 2290 filed for the period July 1, 2011, through June 30, 2012, were not
subject to the tax for that period except for any vehicles listed on line 8b. <span class="styBoldText">Check this box if applicable.</span>
              <span style="width:3mm"/>
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
              <span style="width:3mm"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form2290/NotSubjectToTax "/>
                  <xsl:with-param name="BackupName">IRS2290NotSubjectToTax </xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form2290/NotSubjectToTax "/>
                  <xsl:with-param name="BackupName">IRS2290NotSubjectToTax </xsl:with-param>
                </xsl:call-template>
              </label>
            </div>
          </div>
          <!--  LINE 8b  -->
          <div style="width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm;">b</div>
            <div class="styLNDesc" style="width:178mm;height:5mm;">        
            Vehicle identification numbers
                
          <span style="width:130mm;border-bottom:1 black solid">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form2290/SuspendedVIN"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!--  LINE 9 -->
          <div style="width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">9</div>
            <div class="styLNDesc" style="width:178mm;height:5mm;">        
           
           I declare that vehicle identification numbers 
            <span style="width:110mm;border-bottom:1 black solid">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form2290/TransferredSuspendedVIN"/>
                </xsl:call-template>
              </span>
              <br/>
were listed as suspended on the Form 2290 filed for the period July 1, 2011, through June 30, 2012. These vehicles were sold or
transferred to
<span style="width:60mm;border-bottom:1 black solid"/>

 on <span style="width:30mm;border-bottom:1 black solid"/>,<span style="width:30mm;border-bottom:1 black solid"/>.
 <div class="styLNLeftNumBox" style="height:3mm;"/>
              <div class="styLNDesc" style="width:178mm;height:3mm;">
At the time of the transfer, the vehicles were still eligible for the suspension of the tax. Attach a separate list if needed.
           </div>
            </div>
          </div>
          <!-- Begin Third Party Designee Signature block -->
          <table border="0" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm">
            <tbody>
              <tr>
                <td style="font-size:8pt;border:1 solid black;border-left-width:0;font-weight:bold">Third<br/> Party<br/> Designee</td>
                <td style="padding-left:2mm;border:1 solid black;border-left-width:0;border-right-width:0">Do you want to allow another person to discuss this return with the IRS (see instructions)?
        <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyYes</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyYes</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <b> Yes.</b> Complete the following. 
        <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyNo</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyNo</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <b>No</b>
                  <br/>
                  <br/>
                  <div style="float:left">
          Designee's<br/>name<span style="width:5mm"/>
                    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:1mm"/>
                    <span style="width:40mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneeName"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div style="float:left">
          Phone<br/>no.<span style="width:5mm"/>
                    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:1mm"/>
                    <span style="width:30mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePhone"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div style="float:left">
          Personal identification<br/>number (PIN)<span style="width:13mm"/>
                    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:1mm"/>
                    <span style="width:30mm">
                      <xsl:call-template name="PopulatePin">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </td>
              </tr>
              <!-- END Third Party Designee block -->
              <!--  BEGIN Sign Here block -->
              <tr>
                <td style="font-size:8pt;border:0 solid black; border-right-width:1;border-bottom-width:1;font-weight:bold">Sign Here</td>
                <td style="padding-left:2mm;border: 0 solid black;border-bottom-width:1">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements and to the best of my
                  knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.<br/>
                  <br/>
                  <img src="{$ImagePath}/2290_Bullet_Jumbo.gif" alt="bullet"/>
                  <span style="width:90mm;border-top:1 solid black">Signature</span>
                  <span style="width:10mm"/>
                  <img src="{$ImagePath}/2290_Bullet_Jumbo.gif" alt="bullet"/>
                  <span style="width:63mm;border-top:1 solid black">Date</span>
                  <br/>
                  <div style="width:105mm;float:left;clear:none">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <span>Type or print name below signature.</span>
                  </div>
                  <div style="width:60mm;float:left;clear:none">
                    <br/>
                    <br/>
Telephone number 
<span style="padding-left:2mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- END  Sign Here Signature block -->
          <!-- The Paid Preparer&apos;s Signature block was added per PDF dated 02/14/2008 and schema version 2007v6.2 
      and RIS  ETA081635OTH   Also changed revision dates to 2008 -->
          <!-- BEGIN Paid Preparer&apos;s Use Only block -->
          <!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;border-bottom:1 solid black;">
            <tr>
							<!--row 1-->
							<td rowspan="3" style="width:17.5mm;font-size:9pt;font-weight:bold;font-family:'arial narrow';border-right:1 solid black;border-bottom:1 solid black;text-align:left;">Paid<br/> Preparer<br/> Use Only</td>
							<td style="width:45.5mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Print/Type preparer's name
                <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</td>
							<td style="width:57mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Preparer's signature
                <br/>
								<span style="width:2px;"/>
							</td>
							<td style="width:24mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
		    Date <br/>
								<span style="text-align:center; padding-left:7mm;">
                <xsl:call-template name="PopulateReturnHeaderPreparer">
                  <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                </xsl:call-template>
								</span>
							</td>
							<td style="width:19mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
                <nobr>
                  <label for="dummyid1">
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
                      <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>Check  
          </label>
                </nobr>
                <input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
                    <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
                  </xsl:call-template>
                </input>
                if <br/> self-employed
              </td>
							<td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">PTIN
                <br/>
								<span style="text-align:center;padding-left:10mm;">
                <xsl:call-template name="PopulateReturnHeaderPreparer">
                  <xsl:with-param name="TargetNode">SSN</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="PopulateReturnHeaderPreparer">
                  <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
                </xsl:call-template>
								</span>
              </td>
            </tr>
            <tr>
							<!--row 2-->
							<td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm's name
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:16mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:1 solid black;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<!--row 3-->
							<td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm's address
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">Country</xsl:with-param>
									</xsl:call-template>
								</span>
              </td>
              <td style="border-bottom:1 solid black;padding-left:1mm;"> Phone no. 
        <xsl:call-template name="PopulateReturnHeaderPreparer">
                  <xsl:with-param name="TargetNode">Phone</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="PopulateReturnHeaderPreparer">
                  <xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!-- END PREPARER SIGNATURE SECTION -->
          <div class="pageEnd" style="width:187mm;padding-top:.5mm;">
            <span>
              <span class="styBoldText" style="padding-right:5mm">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
              <span style="padding-right:5mm;">Cat. No. 11250O</span>
              <span>Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2012)</span>
            </span>
          </div>
          <!--  PAGE 1  END -->
          <!-- PAGE 2  BEGIN -->
          <div class="styBB" style="width:187mm;text-align:right">
            <span style="float:left">Form 2290 (Rev. 2012)</span>Page <span class="styBoldtext" style="font-size:8pt">2</span>
          </div>
          <!--******************************************************************************************************************************************-->
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!--  TAX  COMPUTATION  TABLE -->
          <div class="styBB" style="width:187mm;text-align:center;font-weight:bold;font-size:9pt;padding:2mm;">
Tax Computation
 </div>
          <div style="width:187mm">
            <table cellspacing="0" style="font-size:7pt;border-color:black;text-align:center">
              <tbody>
                <tr style="height:17mm">
                  <th class="styTableCellHeader" style="width:8mm;height:32mm" rowspan="2">
                    <img src="{$ImagePath}/2290_Category.gif" alt="Category"/>
                  </th>
                  <th class="styTableCellHeader" style="width:16mm;background-color:lightgrey">
                    <span style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:30mm;vertical-align:top" colspan="2">(1)<br/>Annual tax<br/>
                    <span style="font-weight:normal">(vehicles used</span><br/><span style="font-weight:normal">during July)</span>
                  </th>
                  <th class="styTableCellHeader" style="width:56mm;vertical-align:top" colspan="2">(2)<br/>Partial-period tax<br/>
                    <span style="font-weight:normal">(vehicles first used after July)</span><br/><span style="font-weight:normal">See the tables at the end of</span><br/><span style="font-weight:normal">the separate instructions.</span>
                  </th>
                  <th class="styTableCellHeader" style="width:44mm;vertical-align:top" colspan="2">(3)<br/>Number of<br/>vehicles</th>
                  <th class="styTableCellHeader" style="width:26mm;vertical-align:top">(4)<br/>Amount of tax <br/>
                    <span style="font-weight:normal">(col. (1) or (2)</span><br/><span style="font-weight:normal">multiplied by col.(3))</span>
                  </th>
                  <th class="styTableCellHeader" style="width:8mm;height:32mm;border-right-width:0px" rowspan="2">
                    <img src="{$ImagePath}/2290_Category.gif" alt="Category"/>
                  </th>
                </tr>
                <tr style="height:15mm;font-weight:bold">
                  <td class="styTableCellHeader" style="width:20mm;vertical-align:center;padding-left:1mm">Taxable<br/>gross weight<br/>(in pounds)</td>
                  <td class="styTableCellHeader" style="width:14mm;vertical-align:top">(a)<br/>Vehicles<br/>except logging*</td>
                  <td class="styTableCellHeader" style="width:14mm;vertical-align:top">(b)<br/>Logging<br/>vehicles*</td>
                  <td class="styTableCellHeader" style="width:28mm;vertical-align:top">(a)<br/>Vehicles<br/>except logging*</td>
                  <td class="styTableCellHeader" style="width:28mm;vertical-align:top">(b)<br/>Logging<br/>vehicles*</td>
                  <td class="styTableCellHeader" style="width:21mm;vertical-align:top">(a)<br/>Vehicles<br/>except logging*</td>
                  <td class="styTableCellHeader" style="width:21mm;vertical-align:top">(b)<br/>Logging<br/>vehicles*</td>
                  <td class="styTableCellHeader" style="background-color:lightgrey">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">A</xsl:with-param>
                  <xsl:with-param name="pos">1</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">B</xsl:with-param>
                  <xsl:with-param name="pos">2</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">C</xsl:with-param>
                  <xsl:with-param name="pos">3</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">D</xsl:with-param>
                  <xsl:with-param name="pos">4</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">E</xsl:with-param>
                  <xsl:with-param name="pos">5</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">F</xsl:with-param>
                  <xsl:with-param name="pos">6</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">G</xsl:with-param>
                  <xsl:with-param name="pos">7</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">H</xsl:with-param>
                  <xsl:with-param name="pos">8</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">I</xsl:with-param>
                  <xsl:with-param name="pos">9</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">J</xsl:with-param>
                  <xsl:with-param name="pos">10</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">K</xsl:with-param>
                  <xsl:with-param name="pos">11</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">L</xsl:with-param>
                  <xsl:with-param name="pos">12</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">M</xsl:with-param>
                  <xsl:with-param name="pos">13</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">N</xsl:with-param>
                  <xsl:with-param name="pos">14</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">O</xsl:with-param>
                  <xsl:with-param name="pos">15</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">P</xsl:with-param>
                  <xsl:with-param name="pos">16</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">Q</xsl:with-param>
                  <xsl:with-param name="pos">17</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">R</xsl:with-param>
                  <xsl:with-param name="pos">18</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">S</xsl:with-param>
                  <xsl:with-param name="pos">19</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">T</xsl:with-param>
                  <xsl:with-param name="pos">20</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">U</xsl:with-param>
                  <xsl:with-param name="pos">21</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">V</xsl:with-param>
                  <xsl:with-param name="pos">22</xsl:with-param>
                </xsl:call-template>
                <!--			&lt;/xsl:otherwise&gt;
              &lt;/xsl:choose&gt;-->
                <tr>
                  <td class="styTableCellText" style="width:105mm;height:12mm;text-align:justify" colspan="6">
                    <b>Totals.</b> Add the number of vehicles in columns (3a) and (3b). Enter the total
				here (this should be the same total of taxable vehicles shown on Schedule 1, Part II, line c). Add the amounts in column (4). Enter
				the total here and on Form 2290, line 2 <span class="styDotLn" style="float:none;padding-left:1.5mm">............ </span>
				<img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 

                  </td>
                  <td class="styTableCell" style="width:44mm;vertical-align:bottom;font-size:6pt;padding-right:.5mm" colspan="2">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/TotalNumberOfVehicles"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="font-size:6pt;width:30mm;vertical-align:bottom;padding-right:1mm">
                    <span style="float:left;clear:none">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/TotalAmountOfTax"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:8mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNCtrNumBox" style="border-left-width:0px;height:12mm;vertical-align:middle">W</td>
                  <td class="styTableCellText" style="width:22mm;font-size:6pt">
				Tax-Suspended Vehicles
				(See <i>Part II</i> on page  
				6 of the instructions.)
			</td>
                  <td class="styTableCellText" style="width:76mm;background-color:lightgrey" colspan="4">
                    <span style="width:1px"/>
                  </td>
                  <td class="styTableCell" style="font-size:6pt;width:22mm;vertical-align:bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/NumberTaxSuspendedLoggingVeh"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="font-size:6pt;width:22mm;vertical-align:bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/NumTaxSuspendedNonLoggingVeh"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:30mm;background-color:lightgrey;border-right-width:0px">
                    <span style="width:1px"/>
                  </td>
                  <td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px;border-bottom-width:0px;background-color:lightgrey" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellCtr" style="width:179mm;height:8mm;vertical-align:middle;font-weight:bold;font-size:9pt;border-bottom-width:2px" colspan="9">
				Complete both copies of Schedule 1 (Form 2290) and attach them to Form 2290.
			</td>
                  <td class="styLNCtrNumBox" style="background-color:lightgrey;border-left-width:0px;border-right-width:0px;border-bottom-width:0px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" style="width:179mm;height:8mm;vertical-align:middle;border-bottom-width:2px" colspan="9">
				* See page 2 of the instructions for information on logging vehicles.
			</td>
                  <td class="styLNCtrNumBox" style="background-color:lightgrey;border-left-width:0px;border-right-width:0px;border-bottom-width:2px">
                    <span style="width:1px"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="pageEnd" style="width:187mm">
            <span style="float:right"> Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2012)</span>
          </div>
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
            Additional Data        
          </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form2290"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            
            
            
            
            <!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
          <!--  <xsl:if test="$Form2290/AmendedReturn">
              <tr>
                <td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
                      <xsl:with-param name="BackupName">IRS2290AmendedReturn</xsl:with-param>
                    </xsl:call-template>
              Amended Return:
            </label>
                </td>
                <td class="styLeftOverTableRowAmount" style="width:87mm;">
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
                      <xsl:with-param name="BackupName">IRS2290AmendedReturn</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </td>
              </tr>
            </xsl:if>-->
            <xsl:if test="$Form2290/AmendedMonth">
              <tr>
                <td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
                  <xsl:call-template name="PopulateLeftoverRow">
                    <xsl:with-param name="Desc">Amended Month</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form2290/AmendedMonth"/>
                    <xsl:with-param name="DescWidth" select="100"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </table>
          <!-- END Left Over Table -->
          
<!--Special Condition Description -->
<span class="styRepeatingDataTitle">Form 2290, Special Condition Description: </span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">
Special Condition Description</th>
</tr>
</thead>
<tfoot/>
<tbody>
<xsl:for-each select="$Form2290Data/SpecialConditionDescription">
<tr style="border-color:black;height:6mm;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td class="styTableCellText" style="width:179mm;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="."/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
          
          
          
          
          <!-- Optional Print Solution for repeating data table Part I, Line 2 -->
          <!--     </div>-->
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="CategoryDetails">
    <xsl:param name="TargetCategory"/>
    <!-- enter this as a number 1=A -->
    <xsl:choose>
      <xsl:when test="$TargetCategory = 1 ">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      55,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				$100.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				$75.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 2">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      55,001-56,000
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				122.00
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				91.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 3">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      56,001-57,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				144.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				108.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 4">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      57,001-58,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				166.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				124.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 5">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      58,001-59,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				188.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				141.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 6">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      59,001-60,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				210.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				157.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 7">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      60,001-61,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				232.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				174.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 8">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      61,001-62,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				254.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				190.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 9">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      62,001-63,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				276.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				207.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 10">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      63,001-64,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				298.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				223.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 11">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      64,001-65,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				320.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				240.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 12">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      65,001-66,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				342.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				256.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 13">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      66,001-67,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				364.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				273.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 14">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      67,001-68,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				386.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				289.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 15">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      68,001-69,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				408.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				306.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 16">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      69,001-70,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				430.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				322.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 17">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      70,001-71,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				452.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				339.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 18">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      71,001-72,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				474.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				355.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 19">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      72,001-73,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				496.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				372.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 20">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      73,001-74,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				518.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				388.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 21">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      74,001-75,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				540.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				405.00
        </td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 22 ">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			     Over 75,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				550.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				412.50
			</td>
      </xsl:when>
      <xsl:otherwise>
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
          <span style="width:1px"/>
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm">
          <span style="width:1px"/>
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm">
          <span style="width:1px"/>
        </td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="CategoryRow">
    <xsl:param name="TargetCategory"/>
    <xsl:param name="pos"/>
    <xsl:param name="internal">1</xsl:param>
    <xsl:choose>
      <xsl:when test="$TargetCategory=$Form2290/TaxComputation[position()=$internal]/Category">
        <tr>
          <td class="styLNCtrNumBox" style="border-left-width:0px">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/Category"/>
            </xsl:call-template>
          </td>
          <xsl:call-template name="CategoryDetails">
            <xsl:with-param name="TargetCategory" select="$pos"/>
          </xsl:call-template>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = &apos;A&apos;">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/NonLoggingPartialTax"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = &apos;A&apos;">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/LoggingPartialTax"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/NumberVehicleNonLogging"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/NumberVehicleLogging"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:30mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = &apos;A&apos;">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/AmountOfTax"/>
            </xsl:call-template>
          </td>
          <td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/Category"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:when>
      <xsl:when test="$internal &gt; 22">
        <!--Empty row-->
        <tr>
          <td class="styLNCtrNumBox" style="border-left-width:0px">
            <xsl:value-of select="$TargetCategory"/>
          </td>
          <xsl:call-template name="CategoryDetails">
            <xsl:with-param name="TargetCategory">
              <xsl:value-of select="$pos"/>
            </xsl:with-param>
          </xsl:call-template>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = &apos;A&apos;">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = &apos;A&apos;">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:30mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = &apos;A&apos;">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <span style="width:1px"/>
          </td>
          <td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px">
            <xsl:value-of select="$TargetCategory"/>
          </td>
        </tr>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="CategoryRow">
          <xsl:with-param name="TargetCategory" select="$TargetCategory"/>
          <xsl:with-param name="internal">
            <xsl:value-of select="$internal+1"/>
          </xsl:with-param>
          <xsl:with-param name="pos">
            <xsl:value-of select="$pos"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
    
  <xsl:template name="Populate2290DateBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="BoxNum"/>
    <xsl:param name="BoxWidth" />
    <xsl:param name="BoxHeight" />
    <xsl:param name="BoxTopPadding" />

	<div style="width:{$BoxWidth};height:{$BoxHeight};padding-top:{$BoxTopPadding};text-align:center;border-top:0;border-bottom:0;border-left:0;border-right:1 solid black;clear:none;float:left" >
	  <span>    
		<xsl:attribute name="id">    
		  <xsl:call-template name="PopulateID">
			<xsl:with-param name="TargetNode" select="$TargetNode"/>
		  </xsl:call-template>    
		</xsl:attribute>        
		<xsl:call-template name="PopulateChgHistory">
		  <xsl:with-param name="targetNode" select="$TargetNode"/>
		  <xsl:with-param name="thisTemplate" select=" 'forLetterBox' "/>   
		  <xsl:with-param name="boxNum" select="$BoxNum"/>  
		</xsl:call-template> 
	  </span>        
	</div>   
  </xsl:template>
</xsl:stylesheet>
