<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FScheduleVStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form1120FScheduleVData" select="$RtnDoc/IRS1120FScheduleV"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120FScheduleVData)"/>
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
        <meta name="Description" content="IRS Form 1120FScheduleV"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!-- Print spot -->
          <xsl:if test="not($Print) or $Print=''">   
            <xsl:call-template name="IRS1120FScheduleVStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>   
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120FScheduleV">
          <!--xsl:value-of select='$PageWatermark'/-->
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:30mm;height:19.5mm;">
              <div style="padding-left:0mm; font-weight:bold;">Schedule V</div>
              <div style="padding-left:0mm; font-weight:bold;">(Form 1120-F)</div>
              <br/>
              <br/>
              <span class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br/>Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:12mm;">
              <div class="styMainTitle" style="height:8mm;padding-top:2mm;">
            List of Vessels or Aircraft, Operators, and Owners
                      </div>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:3mm;">
                <img src="{$ImagePath}/1120FScheduleV_Bullet.gif" width="4" height="7" alt="bullet image"/>
            Attach to Form 1120-F,  Section I, line 9.
          </div>
            </div>
            <div class="styTYBox" style="width:31mm;height:19.5mm;">
              <div style="height:2mm;"/>
              <div class="styOMB" style="height:1mm;">
            OMB No. 1545-0XXXX
          </div>
              <div class="styTY" style="height:8mm;">20<span class="styTYColor">08</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;float:none;clear:none;">
            <div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
          Name of corporation<br/>
              <span>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            <div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Employer identification number<br/>
              <br/>
              <span style="width:27mm;text-align:left;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <div style="width:187mm;padding-bottom:5mm;font-size:7pt;">With respect to any vessel or aircraft for which the corporation is claiming a 4% rate of tax under section 887 on Form 1120-F,Section I, line 9, the corporation must provide the following information with respect to each such vessel or aircraft.</div>

          <!-- *******first viewing ****** -->
          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation">
                  <table class="styTable" cellspacing="0" style="border-color:black;width:187mm;">
                    <xsl:for-each select="$Form1120FScheduleVData/VesselAircraftInformation">
                      <xsl:variable name="pos" select="position()"/>
                      <xsl:if test="position() mod 4 = 1">
                      <!-- title row -->
                      <tr>
                        <td class="styTableCellSmall" style="width:67mm;height:5mm;"/>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:1px;border-right-width:1px;">
                          <xsl:number value="position()" format="A"/>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:1px;">
                          <xsl:number value="position()+1" format="A"/>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:1px;">
                          <xsl:number value="position()+2" format="A"/>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;">
                          <xsl:number value="position()+3" format="A"/>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      
                      <!-- Line 1 -->
                      <tr>
                        <td style="border:none;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;
                                                                    padding-left:.5mm;height:8mm;padding-top:3mm;">1</div>
                            <div class="styGenericDiv" style="font-size:7.5pt;padding-top:3mm;"> 
                              Name of vessel or aircraft 
                              <span style="width:12px;"/>.
                              <span style="width:12px;"/>.
                              <span style="width:12px;"/>.
                              <span style="width:12px;"/>.
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;padding-top:4mm;border-left-width:1px;
                                                                font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;
                                                           padding-top:4mm;font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    1]/VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;
                                                           padding-top:4mm;font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                   2]/VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;
                                                           padding-top:4mm;border-right-width:0px;font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                               3]/VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      
                      
                      <!-- Line 2 -->
                      <tr>
                        <td style="border:none;widht:67mm;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;
                                                                        padding-left:.5mm;height:8mm;padding-top:4mm;">2</div>
                            <div class="styGenericDiv" style="width:58mm;font-size:7.5pt;height:8mm;
                                                                     padding-top:4mm;">Vessel or aircraft ID number
                                                                               <span style="width:12px;"/>.
                                                                               <span style="width:12px;"/>.
                                                                               <span style="width:12px;"/>.
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; 
                                                           border-color: black;height:8mm;padding-top:4mm;border-left-width:1px;
                                                           text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: 
                                                             black;height:8mm;padding-top:4mm;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                  1]/VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: 
                                                                 black;height:8mm;padding-top:4mm;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                  2]/VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: 
                                                                 black;height:8mm;padding-top:4mm;text-align:left;border-right-width:0px;border-top-width:0px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                  3]/VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>

                      <!-- line 3 -->
                      <tr>
                        <td style="border:none;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:6pt;padding-left:.5mm;
                                                                       height:8mm;padding-top:4mm;">3</div>
                            <div class="styGenericDiv" style="font-size:6pt;height:8mm;
                                                                     padding-top:4mm;">
                                                                         Check if vessel or aircraft is chartered in
                               <span style="font-size:7.5pt;">                                          
                                 <span style="width:12px;"/>.
                                 <span style="width:12px;"/>.
                                 <span style="width:12px;"/>.
                               </span>
                                                                         
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color:
                                                             height:8mm;padding-top:4mm;border-left-width:1px;text-align:center;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: black;
                                                            height:8mm;padding-top:4mm;text-align:center">
                          <xsl:call-template name="PopulateYesBoxText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: black;
                                                            height:8mm;padding-top:4mm;text-align:center">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: black;
                                                            height:8mm;padding-top:4mm;text-align:center;border-right-width:0px;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                     3]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                     3]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- line 4 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:6pt;padding-left:.5mm;
                                                                       height:8mm;padding-top:4mm;">4</div>
                            <div class="styGenericDiv" style="font-size:6pt;height:8mm;
                                                                     padding-top:4mm;">
                                                                         Check if vessel or aircraft is chartered out
                               <span style="font-size:7.5pt;">                                          
                                 <span style="width:12px;"/>.
                                 <span style="width:12px;"/>.
                               </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                           border-color: black;black;height:8mm;padding-top:4mm;border-left-width:1px;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                             border-color: black;black;height:8mm;padding-top:4mm">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                             border-color: black;black;height:8mm;padding-top:4mm">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                         2]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                          2]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                             border-color: black;black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                         3]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                          3]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 5 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;
                                                                         padding-left:.5mm;height:8mm;padding-top:4mm;">5</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                                                                         Name of owner corporation
                                                                         <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                                                                   <span style="width:12px;"/>.
                                                                                   <span style="width:12px;"/>.
                                                                                   <span style="width:12px;"/>.
                                                                                   <span style="width:12px;"/>.
                                                                         </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                             border-color: black;height:8mm;padding-top:4mm;border-left-width:1px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                            border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                 1]/OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    1]/OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                            border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                 2]/OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    2]/OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                            border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                 3]/OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    3]/OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 6 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;padding-left:.5mm;
                                                                        height:8mm;padding-top:4mm;">6</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                                EIN of owner corporation
                                <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                     border-color: black;height:8mm;padding-top:4mm;border-left-width:1px">
                          <xsl:if test="OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="MissingEINReason != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                      border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/MissingEINReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                      border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                      border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 7 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;padding-left:.5mm;
                                                                         height:8mm;padding-top:4mm;">7</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                              Name of operator corporation
                              <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                  <span style="width:12px;"/>.
                                  <span style="width:12px;"/>.
                                  <span style="width:12px;"/>.
                                  <span style="width:12px;"/>.
                              </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-top-width:0px;
                                                                border-style: solid; border-color: black;height:8mm;padding-top:4mm;
                                                                border-left-width:1px;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;
                                                               border-style: solid; border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                         1]/OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      1]/OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;
                                                               border-style: solid; border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                         2]/OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      2]/OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;
                                                               border-style: solid; border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                         3]/OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      3]/OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 8 -->
                      <tr>
                        <td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7.5pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;padding-left:.5mm;
                                                                        height:8mm;padding-top:4mm;">8</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                               EIN of operator corporation   
                               <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                               </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;border-left-width:1px">
                          <xsl:if test="OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- line 9 -->
                      <tr>
                        <td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;padding-left:.5mm;height:8mm;padding-top:4mm;">9</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                              U.S. source gross transportation income
                              <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                              <span style="width:12px;"/>.</span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;border-left-width:1px;
                                                              text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      1]/USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      2]/USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      3]/USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <xsl:if test="$pos='1'">
                        <tr>
                          <td class="styTableCellSmall" style="border-bottom-width:0px;text-align:left;font-size:7pt;width:156mm;" scope="row" colspan="4">
                            <div>
                              <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;padding-left:.5mm;height:8mm;padding-top:4mm;">10</div>
                              <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                                 Total U.S. source gross transportation
                                 income.  Add the amounts on line 9, columns A through D (and the amounts on 
                                 line 9 of any attachments).  Enter here and on Form 1120-F, Section I, 
                                 line 9, column (b)
                               <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                               </span>
                              </div>
                            </div>
                          </td>
                          <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                                border-color: black;height:12mm;padding-top:8mm;border-right-width:0px;">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/TotalUSSourceGrossTransIncm"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:if>
                      <tr>
                        <td colspan="5"><span class="styTableCellPad"/></td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each><!-- first for-each vessel aircraft information -->
                  </table>
          </xsl:if><!-- this is the endif for whether vessel aircraft info is available --><!-- a001 -->
          
          
          <!--  START Empty Table - it is simply a copy of the above table with a dummy value for position -->
             <xsl:if test="not($Form1120FScheduleVData/VesselAircraftInformation)"> 
               <table class="styTable" cellspacing="0">
                      <xsl:variable name="pos" select="1"/> <!-- This is just a dummy value so the empty table works properly -->
                      <!-- title row -->
                      <tr>
                        <td class="styTableCellSmall" style="width:67mm;height:5mm;"/>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:1px;border-right-width:1px;">
                          A
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:1px;">
                          B
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:1px;">
                          C
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;text-align:center;font-weight:bold;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;">
                          D
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      
                      <!-- Line 1 -->
                      <tr>
                        <td style="border:none;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;
                                                                    padding-left:.5mm;height:8mm;padding-top:3mm;">1</div>
                            <div class="styGenericDiv" style="font-size:7.5pt;padding-top:3mm;"> 
                              Name of vessel or aircraft 
                              <span style="width:12px;"/>.
                              <span style="width:12px;"/>.
                              <span style="width:12px;"/>.
                              <span style="width:12px;"/>.
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;padding-top:4mm;border-left-width:1px;
                                                                font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;
                                                           padding-top:4mm;font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    1]/VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;
                                                           padding-top:4mm;font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                   2]/VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;border-color:black;height:8mm;
                                                           padding-top:4mm;border-right-width:0px;font-size:6pt;text-align:left">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                               3]/VesselOrAircraftName"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      
                      
                      <!-- Line 2 -->
                      <tr>
                        <td style="border:none;widht:67mm;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;
                                                                        padding-left:.5mm;height:8mm;padding-top:4mm;">2</div>
                            <div class="styGenericDiv" style="width:58mm;font-size:7.5pt;height:8mm;
                                                                     padding-top:4mm;">Vessel or aircraft ID number
                                                                               <span style="width:12px;"/>.
                                                                               <span style="width:12px;"/>.
                                                                               <span style="width:12px;"/>.
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; 
                                                           border-color: black;height:8mm;padding-top:4mm;border-left-width:1px;
                                                           text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: 
                                                             black;height:8mm;padding-top:4mm;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                  1]/VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: 
                                                                 black;height:8mm;padding-top:4mm;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                  2]/VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: 
                                                                 black;height:8mm;padding-top:4mm;text-align:left;border-right-width:0px;border-top-width:0px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                  3]/VesselOrAircraftIDNumber"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>

                      <!-- line 3 -->
                      <tr>
                        <td style="border:none;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:6pt;padding-left:.5mm;
                                                                       height:8mm;padding-top:4mm;">3</div>
                            <div class="styGenericDiv" style="font-size:6pt;height:8mm;
                                                                     padding-top:4mm;">
                                                                         Check if vessel or aircraft is chartered in
                               <span style="font-size:7.5pt;">                                          
                                 <span style="width:12px;"/>.
                                 <span style="width:12px;"/>.
                                 <span style="width:12px;"/>.
                               </span>
                                                                         
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color:black;
                                                             height:8mm;padding-top:4mm;border-left-width:1px;text-align:center;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: black;
                                                            height:8mm;padding-top:4mm;text-align:center">
                          <xsl:call-template name="PopulateYesBoxText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: black;
                                                            height:8mm;padding-top:4mm;text-align:center">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid; border-color: black;
                                                            height:8mm;padding-top:4mm;text-align:center;border-right-width:0px;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                     3]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                     3]/VesselOrAircraftCharteredIn"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- line 4 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:6pt;padding-left:.5mm;
                                                                       height:8mm;padding-top:4mm;">4</div>
                            <div class="styGenericDiv" style="font-size:6pt;height:8mm;
                                                                     padding-top:4mm;">
                                                                         Check if vessel or aircraft is chartered out
                               <span style="font-size:7.5pt;">                                          
                                 <span style="width:12px;"/>.
                                 <span style="width:12px;"/>.
                               </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                           border-color: black;black;height:8mm;padding-top:4mm;border-left-width:1px;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                             border-color: black;black;height:8mm;padding-top:4mm">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                             border-color: black;black;height:8mm;padding-top:4mm">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                         2]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                          2]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:center;border-style: solid; 
                                                             border-color: black;black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 
                                                                         3]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                          3]/VesselOrAircraftCharteredOut"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 5 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;
                                                                         padding-left:.5mm;height:8mm;padding-top:4mm;">5</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                                                                         Name of owner corporation
                                                                         <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                                                                   <span style="width:12px;"/>.
                                                                                   <span style="width:12px;"/>.
                                                                                   <span style="width:12px;"/>.
                                                                                   <span style="width:12px;"/>.
                                                                         </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                             border-color: black;height:8mm;padding-top:4mm;border-left-width:1px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                            border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                 1]/OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    1]/OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                            border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                 2]/OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    2]/OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid; 
                                                            border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                 3]/OwnerCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +
                                                                    3]/OwnerCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 6 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;padding-left:.5mm;
                                                                        height:8mm;padding-top:4mm;">6</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                                EIN of owner corporation
                                <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                      <span style="width:12px;"/>. 
                                </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                     border-color: black;height:8mm;padding-top:4mm;border-left-width:1px">
                          <xsl:if test="OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="MissingEINReason != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                      border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/MissingEINReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                      border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                                      border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OwnerCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OwnerCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 7 -->
                      <tr>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;padding-left:.5mm;
                                                                         height:8mm;padding-top:4mm;">7</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                              Name of operator corporation
                              <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                  <span style="width:12px;"/>.
                                  <span style="width:12px;"/>.
                                  <span style="width:12px;"/>.
                                  <span style="width:12px;"/>.
                              </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-top-width:0px;
                                                                border-style: solid; border-color: black;height:8mm;padding-top:4mm;
                                                                border-left-width:1px;text-align:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;
                                                               border-style: solid; border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                         1]/OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      1]/OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;
                                                               border-style: solid; border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                         2]/OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      2]/OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;
                                                               border-style: solid; border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                         3]/OperatorCorporationName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      3]/OperatorCorporationName/BusinessNameLine2"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 8 -->
                      <tr>
                        <td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7.5pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;padding-left:.5mm;
                                                                        height:8mm;padding-top:4mm;">8</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                               EIN of operator corporation   
                               <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                                  <span style="width:12px;"/>.   
                               </span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;border-left-width:1px">
                          <xsl:if test="OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;text-align:left;border-style: solid;
                                                               border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorCorporationEIN != ' '">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorCorporationEIN"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReason != ' '">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReason"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </xsl:if>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- line 9 -->
                      <tr>
                        <td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7pt;" scope="row">
                          <div>
                            <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;padding-left:.5mm;height:8mm;padding-top:4mm;">9</div>
                            <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                              U.S. source gross transportation income
                              <span class="styBoldText" style="font-weight:bold;font-size:6pt;">
                              <span style="width:12px;"/>.</span>
                            </div>
                          </div>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;border-left-width:1px;
                                                              text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      1]/USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      2]/USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style: solid;
                                                              border-color: black;height:8mm;padding-top:4mm;border-right-width:0px;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +                         
                                                                      3]/USSourceGrossTransIncome"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <xsl:if test="$pos='1'">
                        <tr>
                          <td class="styTableCellSmall" style="border-bottom-width:0px;text-align:left;border-color:black;font-size:7pt;width:156mm;" scope="row" colspan="4">
                            <div>
                              <div class="styGenericDiv" style="width:5mm;font-size:7.5pt;padding-left:.5mm;height:8mm;padding-top:4mm;">10</div>
                              <div class="styGenericDiv" style="height:8mm;padding-top:4mm;">
                                 Total U.S. source gross transportation
                                 income.  Add the amounts on line 9, columns A through D (and the amounts on 
                                 line 9 of any attachments).  Enter here and on Form 1120-F, Section I, 
                                 line 9, column (b)
                              </div>
                            </div>
                          </td>
                          <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style:solid;
                                                                border-color:black;height:8mm;padding-top:4mm;border-right-width:0px;">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/TotalUSSourceGrossTransIncm"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:if>
                      <tr>
                        <td colspan="5"><span class="styTableCellPad"/></td>
                      </tr>
            </table>
          </xsl:if>
          <!-- END Empty Table -->          
          
          <div class="styBB" style="width:187mm;">
            <span style="width:32px;"/>
          </div>

          <!-- Empty table e1001 -->
          <div style="width:187mm;">
            <span class="styBoldText" style="font-size:6pt;">For Privacy Act and Paperwork Reduction Act Notice, see the Instructions for Form 1120-F.</span>
            <span style="width:32px;"/>
            <span style="width:85px;font-size:6pt;">Cat. No. 50821R</span>
            <span style="font-weight:bold;width:155px;font-size:6pt;">  
                    Schedule P (Form 1120-F) 2007</span>
          </div>
          <br class="pageEnd"/>
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
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          
          <!-- Blue Table -->
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
