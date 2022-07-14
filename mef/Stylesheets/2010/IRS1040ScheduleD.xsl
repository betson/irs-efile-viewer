<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040ScheduleDStyle.xsl"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleD"/>
  <xsl:template match="/">
    <html>
      <head>
        <!-- Set Document Title -->
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
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <!-- Set Target to Top -->
        <!-- <meta http-equiv="Window-target" content="_top" /> -->
        <!-- Set Filename and Description -->
        <meta name="Description" content="Schedule D (Form 1040)"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1040ScheduleDStyle"/>
            <xsl:call-template name="AddOnStyle"/>
       </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <!-- <body onload="init();"> -->
      <body class="styBodyClass">
        <form name="Form1040ScheduleD">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- BEGIN FORM HEADER -->
          <div style="width:187mm;">
          <div class="styBB" style="width: 187mm;">
            <!-- Form Name -->
            <div class="styFNBox" style="width:26mm;height:20mm;">
              <!-- Form Name -->
              <div class="styFormNumber" style="font-size: 10pt;height:13.3mm">SCHEDULE D<br/>
               <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
                <div class="styFormNumber" style="font-size: 8pt;">(Form 1040)</div>
              </div>
              <!-- Agency Name -->
              <span class="styAgency" style="font-size:6pt;">Department of the Treasury</span><br/>
				<span class="styAgency" style="font-size:6pt;">Internal Revenue Service (99)</span>
            </div>
            <!-- Form Title Box -->
            <div class="styFTBox" style="width:130mm;height:20mm;">
              <!-- Form Title -->
              <div class="styMainTitle" style="height:6.5mm;padding-top: 2mm;">Capital Gains and Losses</div>
              <!-- Form Subtitle -->
              <div class="styFST" style="height: 8mm;text-align:left;padding-left:1mm;padding-top: 4mm;">
                <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow"/>
                <span style=" padding-left:1mm;width:55mm;"> Attach to Form 1040 or Form 1040NR.</span>
                <span style="width:2mm;"/>
                <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow"/>
            <span style=" padding-left:1mm;width:67mm;">See Instructions for Schedule D (Form 1040).</span>
              </div>
              <div>
                <span style="font-weight: bold;height: 4mm;">
                  <img src="{$ImagePath}\1040SchD_Bullet.gif" alt="Right Arrow" border="0"/> Use Schedule D-1 to list additional transactions for lines 1 and 8.
            </span>
              </div>
            </div>
            <!-- Tax Year Box -->
            <div class="styTYBox" style="width:31mm;height:20mm;">
           <!--<div style="padding-left:7mm;font-size:6pt;width:30mm;font-weight:bold;" >Version A, Cycle 1</div>-->
              <!-- OMB No. -->
              <div class="styOMB" style="height: 4mm;">OMB No. 1545-0074</div>
              <!-- Tax Year -->
              <div class="styTaxYear" style="height:8mm;">20<span style="color:green;">10</span>
              </div>
              <div style="padding-left:5mm;font-weight:normal;text-align: left;font-size:7pt;">Attachment<br/> Sequence No. <span style="font-weight: bold">12</span>
              </div>
            </div>
          </div>
          <!-- END FORM HEADER -->
          <!-- BEGIN TAXPAYER INFO -->
          <div class="styBB" style="width:187mm;float:left;clear:none">
            <!-- Name -->
            <div class="styNameBox" style="width:136mm;height:4mm;font-size:7pt;font-weight:normal;">
              Name(s) shown on return<br/><br/>
              <span>
                <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
              </span>
            </div>
            <!-- SSN -->
            <div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
              Your social security number
              <br/>
              <br/>
              <span style="text-align:left;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- END TAXPAYER INFO -->
          <!-- BEGIN PART I HEADER -->
			<div class="styBB" style="width:187mm;margin-top:2mm;">
            <span class="styPartName" style="width:12mm;font-size:9pt;">Part l</span>
			<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;padding-bottom:2mm;">
          Short-Term Capital Gains and Losses&#151;Assets Held One Year or Less 
			</div>
			<div class="styGenericDiv" style="float:right;height:1mm;padding-top:2mm;">
              <!-- button display logic -->
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="headerHeight" select="1"/>
                <xsl:with-param name="containerID" select="'STCapGainTableContainer'"/>
              </xsl:call-template>
              <!-- end button display logic -->
          </div>
          </div>
          <!-- END PART I HEADER -->
          <div class="styTableContainer" id="STCapGainTableContainer">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table class="IRS1040ScheduleD_styTable" cellspacing="0" name="STCapGainTable" id="STCapGainTable">
              <!-- BEGIN PART I TABLE HEADER -->
              <tr>
                <th class="IRS1040ScheduleD_styTableCellA" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 sh. XYZ Co.)</th>
                <th class="IRS1040ScheduleD_styTableCellB" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(b)</span> Date acquired<br/>(Mo., day, yr.)</th>
                <th class="IRS1040ScheduleD_styTableCellC" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(c)</span> Date sold<br/>(Mo., day, yr.)</th>
                <th class="IRS1040ScheduleD_styTableCellD" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(d)</span> Sales price<br/>(see page D-7 of <br/>
the instructions)</th>
                <th class="IRS1040ScheduleD_styTableCellE" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(e)</span> Cost or other basis<br/>(see page D-7 of <br/>
the instructions)</th>
                <th class="IRS1040ScheduleD_styTableCellF" style="text-align:center;font-weight:normal;" scope="col">
                  <b>(f) Gain or (loss)</b>
                  <br/>Subtract (e) from (d)
                </th>
              </tr>
              <!-- END PART I TABLE HEADER -->
              <!-- BEGIN PART I TABLE -->
              <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
              <!-- If the print parameter is separated, but there are fewer elements than the container height (5) -->
              <xsl:if test="($Print != $Separated) or (count($FormData/ShortTermCapitalGainAndLoss) &lt;= 5) ">
                <xsl:for-each select="$FormData/ShortTermCapitalGainAndLoss">
                  <tr>
                    <td class="IRS1040ScheduleD_styTableCellA" scope="row">
                      <!-- If this is the last row, do not display a bottom line -->
                      <span class="IRS1040ScheduleD_styLN" style="width:20px;text-align:left;padding-left:2mm;">
                       <xsl:if test="position() = 1">1</xsl:if>
                      </span>
                      <!--modify left border for this cell here -->
                      <!--Column A-->
                      <span class="styGenericDiv" style="text-align:left;width:3mm;" >
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="STDescriptionOfProperty"/>
                        </xsl:call-template>
                      </span>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="STDescriptionOfProperty"/>
                      </xsl:call-template>
                    </td>
                     <!--Column B-->
                 <td class="IRS1040ScheduleD_styTableCellB" style="width:21mm;">
                  <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STDateAcquired">
                    <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateMonthDayYear">
                            <xsl:with-param name="TargetNode" select="STDateAcquired"/>
                          </xsl:call-template>
                          </div>
                              </xsl:if>
                   <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STDateAcquiredVariousTxt">
                  <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="STDateAcquiredVariousTxt"/>
                          </xsl:call-template>
                          </div>
             </xsl:if>
                    </td>
                     <!--Column C-->
                    <td class="IRS1040ScheduleD_styTableCellC">
                         <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STDateSold">
                          <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateMonthDayYear">
                            <xsl:with-param name="TargetNode" select="STDateSold"/>
                          </xsl:call-template>
                          </div>
                       </xsl:if>
                      <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STDateSoldTxt">
                       <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="STDateSoldTxt"/>
                          </xsl:call-template>
                            </div>
                          </xsl:if>
                        
                    </td>
                      <!--Column D-->
                    <td class="IRS1040ScheduleD_styTableCellD" style="text-align:center">
                       <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STSalesPriceAmt">
                         <div class="styGenericDiv" style="float:right;font-size:7pt;" >
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="STSalesPriceAmt"/>
                          </xsl:call-template>
                           </div>
                          <div style="text-align:left;width:3mm;" class="styGenericDiv">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="STSalesPriceAmt"/>
                            </xsl:call-template>
                          </div>
                            </xsl:if>
                         <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STSalesPriceTxt">
                          <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="STSalesPriceTxt"/>
                          </xsl:call-template>
                                </div>
                          </xsl:if>
                    </td>
                    <!--Column E-->
                    <td class="IRS1040ScheduleD_styTableCellE">
                           <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STCostOrOtherBasisAmt">
                            <div style="width:33mm;font-size:6.5pt;height:2mm;float left;">
                               <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="STCostOrOtherBasisAmt"/>
                            </xsl:call-template>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="STCostOrOtherBasisAmt"/>
                          </xsl:call-template>
                          </div>
                          </xsl:if>
                          <xsl:if test="$FormData/ShortTermCapitalGainAndLoss/STCostOrOtherBasisTxt">
                          <div style="font-size:7pt;text-align:center;" >
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="STCostOrOtherBasisTxt"/>
                            </xsl:call-template>
                          </div>
                       </xsl:if>
                    </td>
                    <td class="IRS1040ScheduleD_styTableCellF">
                   <div style="width:35mm;font-size:6.5pt;height:2mm;float left;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="STGainOrLossAmt"/>
                        </xsl:call-template>
                        <span style="width:1mm;"></span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="STGainOrLossAmt"/>
                        </xsl:call-template>
                      </div>
                          
                    </td>
                
                  </tr>
                </xsl:for-each>
              </xsl:if>
              <!-- Depending on the number of data rows, insert blank rows to fill the container height -->
              <!-- For separated print where there are more data elements than the container height, -->
              <!-- display a message in the first row directing the user to the additional data table -->
              <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 1 or 
		                  ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span class="IRS1040ScheduleD_styLN" style="">1</span>
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD" >
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 2 or 
		                    ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD" >
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 3 or
		                    ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 4 or
		                    ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 5 or
		                    ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 5) and ($Print = $Separated))">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD" >
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss"/>
            <xsl:with-param name="containerHeight" select="5"/>
            <xsl:with-param name="headerHeight" select="1"/>
            <xsl:with-param name="containerID" select="'STCapGainTableContainer'"/>
          </xsl:call-template>
          <!-- END PART I TABLE -->
          <!--Line 2-->
          <div class="styBB" style="width:187mm;border-bottom-width: 0px;">
            <div class="styLNLeftNumBoxSD" style="width:6mm;" >2</div>
            <div class="styLNDesc" style="width:67mm;">
            Enter your short-term totals, if any, from Schedule D-1, line 2
        <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm">2</div>
            <div class="styLNAmountBox" style="height:8mm;width:34mm;">
            
                   <!-- Line 2d - No Entry:  -->
            </div>
            <div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;width:34mm;">
            </div>
            <div class="styLNAmountBox" style="height:8mm;width:37.5mm;">
              <!-- Line 2f - No Entry:  -->
             
            </div>
          </div>
          <!--Line 3-->
           <div class="styBB" style="width:187mm;border-bottom-width: 0px;">
            <div class="styLNLeftNumBoxSD" style="width:6mm;" >3</div>
            <div class="styLNDesc" style="width:67mm;">
            <b>Total short-term sales price amounts.</b> Add lines 1 and 2 in column (d)
        <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm">3</div>
            <div class="styLNAmountBox" style="height:8mm;width:34mm;padding-top:3.5mm">
             <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/TotalSTSalesPriceAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;width:34mm;">
            </div>
            <div class="styLNAmountBox" style="height:8mm;width:37.5mm;background-color:lightgrey;">
            </div>
          </div>
          <!-- Line 4 -->
          <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBoxSD" style="width:6mm;padding-top:1mm;">4</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;">Short-term gain from Form 6252 and short-term gain or (loss) from Forms 4684, 6781, and 8824
            </div>
            <div class="styLNRightNumBox" style="height:6mm;padding-top:1mm;width:8.2mm;">4</div>
            <div class="styLNAmountBox" style="width:37mm;height:6mm;padding-top:1mm;">
          
              <!-- Line 4(f) - No Entry: Forms 6252, 4684, 6781 and 8824 available in Phase II -->
            </div>
          </div>
          <!-- END LINE 4 -->
          <!-- BEGIN LINE 5 -->
          <div class="styBB" style="width:187mm;border-bottom-width: 0px;">
            <div class="styLNLeftNumBoxSD" style="width:6mm;">5</div>
            <div class="styLNDesc" style="width:135mm;"> Net short-term gain or (loss) from partnerships, S corporations, estates, and trusts from Schedule(s) <br/>K-1
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                      <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;width:8.2mm;">5</div>
            <div class="styLNAmountBox" style="width:37mm;height:8mm;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetSTGainOrLossFromSchK1Amt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- END LINE 5 -->
          <!-- BEGIN LINE 6 -->
           <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBoxSD" style="width:6mm;padding-top:1mm;">6</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;">Short-term capital loss carryover. Enter the amount, if any, from line 10 of your <b>Capital Loss Carryover Worksheet</b> on page D-7 of the instructions
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;width:8.2mm;">6</div>
            <div class="styLNAmountBox" style="width:37mm;height:8mm;padding-top:3mm;">
            (<xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/STCapitalLossCarryoverAmt"/>
              </xsl:call-template>)
            </div>
          </div>
          <!-- END LINE 6 -->
          <!-- BEGIN LINE 7 -->
         <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:6mm;padding-top:1mm;">7</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;"><b>Net short-term capital gain or (loss). </b>Combine lines 1 through 6 in column (f)
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:6mm;padding-top:1mm;width:8.2mm;border-bottom-width:0px;">7</div>
            <div class="styLNAmountBox" style="width:37mm;height:6mm;padding-top:1mm;border-bottom-width:0px;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- END LINE 7 -->
          <!-- BEGIN PART II HEADER -->
           <div class="styBB" style="width:187mm;margin-top:2mm;">
               <span class="styPartName" style="width:12mm;font-size:9pt;">Part ll</span>
            <div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;padding-bottom:2mm;">
          Long-Term Capital Gains and Losses&#151;Assets Held More Than One Year
			</div>
            <div class="styGenericDiv" style="float:right;height:1mm;padding-top:2mm;">
              <!-- button display logic -->
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="headerHeight" select="1"/>
                <xsl:with-param name="containerID" select="'LTCapGainTableContainer'"/>
              </xsl:call-template>
              <!-- end button display logic -->
            </div>
          </div>
          <!-- END PART II HEADER -->
          <!-- BEGIN PART II TABLE -->
          <div class="styTableContainer" id="LTCapGainTableContainer">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table class="IRS1040ScheduleD_styTable" cellspacing="0" name="LTCapGainTable" id="LTCapGainTable">
              <!-- BEGIN PART II TABLE HEADER -->
              <tr>
                <th class="IRS1040ScheduleD_styTableCellA" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 sh. XYZ Co.)</th>
                <th class="IRS1040ScheduleD_styTableCellB" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(b)</span> Date acquired<br/>(Mo., day, yr.)</th>
                <th class="IRS1040ScheduleD_styTableCellC" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(c)</span> Date sold<br/>(Mo., day, yr.)</th>
                <th class="IRS1040ScheduleD_styTableCellD" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(d)</span> Sales price<br/>(see page D-7 of <br/>
the instructions)</th>
                <th class="IRS1040ScheduleD_styTableCellE" style="text-align:center;font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(e)</span> Cost or other basis<br/>(see page D-7 of <br/>
the instructions)</th>
                <th class="IRS1040ScheduleD_styTableCellF" style="text-align:center;font-weight:normal;" scope="col">
                  <b>(f) Gain or (loss)</b>
                  <br/>Subtract (e) from (d)
                </th>
              </tr>
              <!-- END PART II TABLE HEADER -->
              <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
              <!-- If the print parameter is separated, but there are fewer elements than the container height (5) -->
              <xsl:if test="($Print != $Separated) or (count($FormData/LongTermCapitalGainAndLoss) &lt;= 5) ">
                <xsl:for-each select="$FormData/LongTermCapitalGainAndLoss">
                  <tr>
                  <!--Line 8 a-->
                    <td class="IRS1040ScheduleD_styTableCellA" scope="row">
                      <span class="IRS1040ScheduleD_styLN" style="width:20px;text-align:left;padding-left:2mm;">
                        <xsl:if test="position() = 1">8</xsl:if>
                      </span>
                      <span style="text-align:left;width:3mm;" class="styGenericDiv">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="LTDescriptionOfProperty"/>
                        </xsl:call-template>
                      </span>
                      
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="LTDescriptionOfProperty"/>
                      </xsl:call-template>
                    
                    </td>
                     <!--Line 8 b-->
                    <td class="IRS1040ScheduleD_styTableCellB" style="width:22mm;">
                           <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTDateAcquired">
                                <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateMonthDayYear">
                            <xsl:with-param name="TargetNode" select="LTDateAcquired"/>
                          </xsl:call-template>
                           </div>
                            </xsl:if>
                            <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTDateAcquiredVariousTxt">
                             <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="LTDateAcquiredVariousTxt"/>
                          </xsl:call-template>
                            </div>
                            </xsl:if>
                    </td>
                     <!--Line 8 c-->
                    <td class="IRS1040ScheduleD_styTableCellC" style="width:22mm;">
                       <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTDateSold">
                          <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateMonthDayYear">
                            <xsl:with-param name="TargetNode" select="LTDateSold"/>
                            </xsl:call-template>
                             </div>
                            </xsl:if>
                            <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTDateSoldTxt">
                              <div style="font-size:7pt;text-align:center;" >
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="LTDateSoldTxt"/>
                          </xsl:call-template>
                            </div>
                           </xsl:if>
                    </td>
                     <!--Line 8 d-->
                    <td class="IRS1040ScheduleD_styTableCellD">
                       <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTSalesPriceAmt">
                        <span style="float:right;font-size:7pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="LTSalesPriceAmt"/>
                          </xsl:call-template>
                             </span>
                          <span style="text-align:left;width:3mm;" class="styGenericDiv">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="LTSalesPriceAmt"/>
                            </xsl:call-template>
                          </span>
                            </xsl:if>
                             <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTSalesPriceTxt">
                          <div style="font-size:7pt;text-align:center;" >
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="LTSalesPriceTxt"/>
                            </xsl:call-template>
                           </div>
                           </xsl:if>
                    </td>
                     <!--Line 8 e-->
                    <td class="IRS1040ScheduleD_styTableCellE">
                       <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTCostOrOtherBasisAmt">
                        <span style="float:right;font-size:7pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="LTCostOrOtherBasisAmt"/>
                          </xsl:call-template>
                           </span>
                          <span style="text-align:left;width:3mm;" class="styGenericDiv">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="LTCostOrOtherBasisAmt"/>
                            </xsl:call-template>
                          </span>
                              </xsl:if>
                              <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTCostOrOtherBasisTxt"> 
                          <div style="font-size:7pt;text-align:center;" >
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="LTCostOrOtherBasisTxt"/>
                            </xsl:call-template>
                          </div>
                        </xsl:if>
                    </td>
                     <!--Line 8 f-->
                    <td class="IRS1040ScheduleD_styTableCellF" style="width:35mm;">
                       <xsl:if test="$FormData/LongTermCapitalGainAndLoss/LTGainOrLossAmt"> 
                      <span style="text-align:left;width:3mm;" class="styGenericDiv">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="LTGainOrLossAmt"/>
                        </xsl:call-template>
                      </span>
                      <span style="float:right;font-size:7pt;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="LTGainOrLossAmt"/>
                        </xsl:call-template>
                      </span>
                      </xsl:if>
                    </td>
                  </tr>
                </xsl:for-each>
              </xsl:if>
              <!-- Depending on the number of data rows, insert blank rows to fill the container height -->
              <!-- For separated print where there are more data elements than the container height, -->
              <!-- display a message in the first row directing the user to the additional data table -->
              <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 1 or
               (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 5)) ">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span class="IRS1040ScheduleD_styLN" style="font-size:8pt">8</span>
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 2 or
		     (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 5)) ">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 3 or
		     (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 5)) ">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 4 or
		      (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 5)) ">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 5 or 
		     (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 5)) ">
                <tr>
                  <td class="IRS1040ScheduleD_styTableCellA">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellB">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellC">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellD">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellE">
                    <span style="width: 4px"/>
                  </td>
                  <td class="IRS1040ScheduleD_styTableCellF">
                    <span style="width: 4px"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss"/>
            <xsl:with-param name="containerHeight" select="5"/>
            <xsl:with-param name="headerHeight" select="1"/>
            <xsl:with-param name="containerID" select="'LTCapGainTableContainer'"/>
          </xsl:call-template>
          <!-- END PART II TABLE -->
          <!-- BEGIN LINE 9 -->
         <div class="styBB" style="width:187mm;border-bottom-width: 0px;">
            <div class="styLNLeftNumBoxSD" style="width:6mm;" >9</div>
            <div class="styLNDesc" style="width:67mm;">
            Enter your long-term totals, if any, from Schedule D-1, line 9
        <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm">9</div>
            <div class="styLNAmountBox" style="height:8mm;width:34mm;">
           
                   <!-- Line 9d - No Entry:  -->
            </div>
            <div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;width:34mm;">
            </div>
            <div class="styLNAmountBox" style="height:8mm;width:37.5mm;">
              <!-- Line 9f - No Entry:  -->
               
            </div>
          </div>
              <!-- End LINE 9 -->
               <!-- Begin LINE 10 -->
             <div class="styBB" style="width:187mm;border-bottom-width: 0px;">
            <div class="styLNLeftNumBox" style="width:6mm;" >10</div>
            <div class="styLNDesc" style="width:67mm;">
           <b>Total long-term sales price amounts. </b>Add lines 8 and 9 in column (d)
        <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm">10</div>
            <div class="styLNAmountBox" style="height:8mm;width:34mm;padding-top:3.5mm">
             <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/TotalLTSalesPriceAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;width:34mm;">
            </div>
            <div class="styLNAmountBox" style="height:8mm;width:37.5mm;background-color:lightgrey;">
            </div> 
              </div>
          <!-- End LINE 10 -->
          <!-- BEGIN LINE 11 -->
             <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">11</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;">Gain from Form 4797, Part I; long-term gain from Forms 2439 and 6252; and long-term gain or
<br/>(loss) from Forms 4684, 6781, and 8824
<span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;width:8.2mm;">11</div>
            <div class="styLNAmountBox" style="width:37mm;height:8mm;padding-top:3mm;">
             <!-- Line 11(f) - No Entry: Forms 2439, 6252, 4684, 6781 and 8824 available in Phase II -->
            </div>
          </div><!-- Line 11 (f) No Entry-->
          <!-- END LINE 11 -->
          <!-- BEGIN LINE 12 -->
          <div class="styBB" style="width:187mm;border-bottom-width: 0px;">
            <div class="styLNLeftNumBox" style="width:6mm;">12</div>
            <div class="styLNDesc" style="width:135mm;"> Net long-term gain or (loss) from partnerships, S corporations, estates, and trusts from
<br/>Schedule(s) K-1
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                      <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;width:8.2mm;">12</div>
            <div class="styLNAmountBox" style="width:37mm;height:8mm;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetLTGainOrLossFromSchK1Amt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- END LINE 12 -->
          <!-- BEGIN LINE 13 -->
           <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">13</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;">Capital gain distributions. See page D-2 of the instructions
            <!-- Line 13(f) Form 8814 Literal Cd - No Entry: Form 8814 is a Phase II Form -->
			<!-- ELFFieldNumber 1760 ELFFieldNumber -->
			<!-- Line 13(f) Form 8814 Amt - No Entry: Form 8814 is a Phase II Form -->
			<!-- ELFFieldNumber 1770 ELFFieldNumber -->
             <!--<xsl:call-template name="SetFormLinkInline">
               <xsl:with-param name="TargetNode" select="LTCostOrOtherBasisAmt"/>
               </xsl:call-template>-->
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:6mm;padding-top:1mm;width:8.2mm;">13</div>
            <div class="styLNAmountBox" style="width:37mm;height:6mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- END LINE 13 -->
          <!-- BEGIN LINE 14 -->
          <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">14</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;">Long-term capital loss carryover. Enter the amount, if any, from line 15 of your<b> Capital Loss
Carryover Worksheet </b>on page D-7 of the instructions
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;width:8.2mm;">14</div>
            <div class="styLNAmountBox" style="width:37mm;height:8mm;padding-top:3mm;">(
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/LTCapitalLossCarryoverAmt"/>
              </xsl:call-template>)
            </div>
          </div>
          <!-- END LINE 14 -->
          <!-- BEGIN LINE 15 -->
            <div class="styBB" style="width:187mm;border-bottom-width:0px;float:left;clear:none;">
            <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">15</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;"><b>Net long-term capital gain or (loss). </b>Combine lines 8 through 14 in column (f). Then go to
Part III on the back
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3mm;width:8.2mm;border-bottom-width: 0px; ">15</div>
            <div class="styLNAmountBox" style="width:37mm;height:8mm;padding-top:3mm;border-bottom-width: 0px;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- END LINE 15 -->
          <!-- page footer -->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;border-top-width:1px;">
          <div class="stySmallText" style="width:110mm;">
           <span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
            </div>
            <div class="stySmallText" style="width:29mm;">Cat. No. 11338H</div>
            <div class="stySmallText" style="width:45mm;text-align:right;"><span class="styBoldText">Schedule D (Form 1040) 2010</span>       </div>
          </div>
          
        <!--Begin Page 2 -->
        <div class="styBB" style="width:187mm;border-bottom-width:0px;">
        <!--<span style="float:right;font-size:6pt;font-weight:bold;" class="styGenericDiv">Version A, Cycle 1</span>-->
        </div>
        <div class="styBB" style="width:187mm;border-bottom-width:1px;">
          <span style="width:65mm;font-size:7pt;" class="styGenericDiv">Schedule D (Form 1040) 2010</span>
          <span style="float:right;font-size:7pt;text-align:center;" class="styGenericDiv">Page <b>2</b></span>
        </div>
        <!--  PART III HEADER -->
        <div class="styBB" style="width:187mm;margin-top:2mm;">
            <span class="styPartName" style="width:17mm;font-size:9pt;">Part lll</span>
			<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;padding-bottom:2mm;">
			<span style="width:3mm;"/>
          Summary
			</div>
        	</div> 
        <!-- END PART III HEADER -->
        <!-- BEGIN LINE 16 -->
       <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">16</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;">Combine lines 7 and 15 and enter the result
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                      <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:6mm;padding-top:1mm;width:8.2mm;">16</div>
            <div class="styLNAmountBox" style="width:37mm;height:6mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetSTAndLTCapitalGainOrLossAmt"/>
              </xsl:call-template>
            </div>
          </div>
        <!-- Line 16 - first bulleted item -->
        <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"></div>
          <div class="styLNDesc" style="width: 135mm;">
              <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
            <span style="width: .5mm"/>  If line 16 is a<b> gain, </b>enter the amount from line 16 on Form 1040, line 13, or Form 1040NR, line 14.<br/> 
            <span style="width: 2.1mm"/>Then go to line 17 below.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;height:8mm;"/>
        </div>
        <!-- Line 16 - second bulleted item -->
        <div class="styGenericDiv " style="width:187mm;font-size:8pt;">
          <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"></div>
          <div class="styLNDesc" style="width: 135mm;">
            <span>
              <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
            </span>
            <span style="width:1mm"/> If line 16 is a <b>loss,</b> skip lines 17 through 20 below. Then go to line 21. Also be sure to   <span style="width: 2.1mm"/>complete line 22.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;height:8mm;"/>
        </div>
        <!-- Line 16 - third bulleted item, line 1 -->
        <div class="styGenericDiv " style="width:187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"></div>
          <div class="styLNDesc" style="width: 135mm;">
            <span>
              <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
            </span>
              <span style="width:1mm"/> If line 16 is <b>Zero,</b> skip lines 17 through 21 below and enter -0- on Form 1040, line 13, or Form<br/>  
            <span style="width: 2mm"/> 1040NR, line 14. Then go to line 22.    
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:9mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:9mm;"/>
        </div>
        <!-- END LINE 16 -->
        <!-- BEGIN LINE 17 -->
        <div class="styGenericDiv " style="width:187mm;height:3mm;padding-top:0mm;">
             <div class="styLNLeftNumBox" style="width:6mm;padding-top:0mm;height:3mm;">17</div>
          <div class="styLNDesc" style="width:135mm;padding-top:0mm;height:3mm;">Are lines 15 and 16 <span style="font-weight:bold">both</span> gains?</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:3mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:3mm;"/>
        </div>
        <!-- LINE 17 2nd line, YES checkbox -->
        <div class="styGenericDiv " style="width:187mm;height:5mm;">
            <div class="styLNLeftNumBox" style="width:6mm;height:5mm;"></div>
          <div class="styLNDesc" style="width:135mm;height:5mm;">
            <input type="checkbox" class="styCkBox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd"/>
                 <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">Yes.</span>
    
      </label>
             Go to line 18.</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:5mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:5mm;"/>
        </div>
        <!-- LINE 17 2nd line end -->
        <!-- LINE 17 3rd line, No checkbox -->
        <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"></div>
          <div class="styLNDesc" style="width:135mm;">
            <input type="checkbox" class="styCkBox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd"/>
                 <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
              </xsl:call-template>
            </input>
             <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">No.</span>
    
      </label>
             Skip lines 18 through 21, and go to line 22.</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:6mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:6mm;"/>
        </div>
        <!-- END LINE 17 -->
        <!-- BEGIN Line 18  -->
        <div class="styGenericDiv" style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">18</div>
          <div class="styLNDesc" style="width: 135mm;">Enter the amount, if any, from line 7 of the <b>28% Rate Gain Worksheet</b> on page D-8 of the<br/>
instructions   
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/RateGainWrkshtAmt"/>
            </xsl:call-template>
            <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                       <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                      <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="right pointing bullet image" border="0"/>
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;height:8mm;padding-top:3mm;">18</div>
          <div class="styLNAmountBox" style="width: 37mm;height:8mm;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/RateGainWrkshtAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- END LINE 18 -->
        <!-- BEGIN LINE 19 -->
        <div class="styGenericDiv " style="width:187mm;">
         <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">19</div>
          <div class="styLNDesc" style="width:135mm;">Enter the amount, if any, from line 18 of the 
            <span style="font-weight:bold">Unrecaptured Section 1250 Gain Worksheet</span> on </div>
             <div class="styLNRightNumBox" style="width:8.2mm;height:4mm;background-color:lightgrey;border-bottom-width:0px"/>
              <div class="styLNAmountBox" style="width:37mm;height:4mm;border-bottom-width:0px;"/>
              <div class="styLNDesc" style="width:135mm;">page D-9 of the instructions
            <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                       <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
             <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="right pointing bullet image" border="0"/>
          </div>
              <div class="styLNRightNumBox" style="width:8.2mm;height:4mm;">19</div>
          <div class="styLNAmountBox" style="width:37mm;height:4mm;border-bottom-width:1px;">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/UnrcptrSect1250GainWrkshtAmt"/>
            </xsl:call-template>
            </div>
        </div>
        <!-- END LINE 19 -->
        <!-- BEGIN LINE 20 -->
        <div class="styGenericDiv " style="width:187mm;">
          <div class="styLNLeftNumBox" style="width:6mm;">20</div>
          <div class="styLNDesc" style="width:135mm;">Are lines 18 and 19 <span style="font-weight:bold">both</span> zero or blank?
			</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;"/>
        </div>
        <!-- LINE 20 2nd line, YES checkbox -->
        <div class="styGenericDiv " style="width:187mm;">
         <div class="styLNLeftNumBox" style="width:6mm;"></div>
          <div class="styLNDesc" style="width: 135mm;">
            <input type="checkbox" class="styCkBox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd"/>
              </xsl:call-template>
            </input>
              <label>
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleD/ZeroOrBlankInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">Yes.</span>
    
      </label>
            Complete Form 1040 through line 43, or Form 1040NR through line 41. Then complete<br/>
			<span style="padding-left:7mm;"/> the <b>Qualified Dividends and Capital Gain Tax Worksheet </b>
			  on page 39 of the Instructions for <br/>
		<span style="padding-left:7mm;"/> Form 1040 (or in the Instructions for 
			Form 1040NR). <b>Do not</b>  complete lines 21 and 22 below.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:11mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:11mm;"/>
        </div>
        <!-- LINE 20 2nd line end -->
        <!-- LINE 20 3rd line, No checkbox -->
        <div class="styGenericDiv " style="width:187mm;">
          <div class="styLNLeftNumBox" style="width:6mm;"></div>
          <div class="styLNDesc" style="width: 135mm;">
            <input type="checkbox" class="styCkBox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd"/>
              </xsl:call-template>
            </input>
              <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleD/ZeroOrBlankInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">No.</span>
    
      </label>
           Complete Form 1040 through line 43, or Form 1040NR through line 41. Then  <br/>
			<span style="padding-left:7mm;"/> complete the <b>Schedule D Tax Worksheet</b> on page D-10 of the instructions. <b> Do not</b>  <br/>
		<span style="padding-left:7mm;"/> complete lines 21 and 22 below.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:11mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:11mm;"/>
          <br/>
        </div>
        <!-- END LINE 20 -->
        <!-- BEGIN LINE 21 -->
        <div class="styGenericDiv " style="width:187mm;">
            <div class="styLNLeftNumBox" style="width:6mm;">21</div>
          <div class="styLNDesc" style="width: 135mm;">If line 16 is a loss, enter here and on Form 1040, line 13, or Form 1040NR, line 14, the <b>smaller</b> of:
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:6mm"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:6mm"/>
          <br/>
          <!-- BEGIN LINEs 21 a, b, and Note line -->
          <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;"></div>
            <div class="styLNDesc" style="width:70mm;height:8mm;">
            <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
                The loss on line 16 or<br/>
                 <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
              ($3,000), or if married filing separately, ($1,500)
                   </div>
                  <div class="styLNDesc" style="width:2mm;height:8mm;"> 
                  <img src="{$ImagePath}/1040SchD_Bracket.gif" alt="bracket image"/>
            </div>
              <div class="styLNDesc" style="width:62.8mm;height:8mm;"> 
              <span class="styBoldText">
					<span style="width:16px;padding-top:2mm;"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
                </div>
              <div class="styLNRightNumBox" style="width:8.2mm;height:6mm">21</div>
              <div class="styLNAmountBox" style="width: 37mm;height:6mm">
               (
              <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AllowableLossAmt"/>
                </xsl:call-template>
              )
            </div>
         <div class="styLNRightNumBox" style="height:4mm;width:8.2mm;border-bottom-width:0px;px;border-left-width:1px;float:left;background-color:lightgrey"/>
            <div class="styLNAmountBox" style="height:4mm;width:37mm;border-bottom-width:0px;border-left-width:0px;background-color:lightgrey"/>
          </div>
        </div>
        <div class="styGenericDiv " style="width:187mm;height:6mm;">
          <div class="styLNLeftNumBox" style="width:6mm;height:6mm;"></div>
          <div class="styLNDesc" style="width:135mm;height:6mm;">
            <span class="styBoldText">Note.</span> When figuring which amount is smaller, treat both amounts as positive numbers.  </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;height:6mm;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;border-left-width:0px;background-color:lightgrey;height:6mm;"/>
        </div>
        <!-- END LINE 21 -->
        <!-- BEGIN LINE 22 -->
        <div class="styGenericDiv " style="width:187mm;">
          <div class="styLNLeftNumBox" style="width:6mm;">22</div>
          <div class="styLNDesc" style="width:135mm;">Do you have qualified dividends on Form 1040, line 9b, or Form 1040NR, line 10b?
             </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;border-left-width:0;background-color:lightgrey;"/>
        </div>
        <!-- LINE 22 2nd line, YES checkbox -->
        <div class="styGenericDiv " style="width:187mm;height:12mm">
           <div class="styLNLeftNumBox" style="width:6mm;"></div>
          <div class="styLNDesc" style="width:135mm;">
            <input type="checkbox" class="styCkBox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd"/>
              </xsl:call-template>
            </input>
            <label>
             <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleD/QualifiedDividendsInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">Yes.</span>
      </label>
          Complete Form 1040 through line 43, or Form 1040NR through line 41. Then 
			<div style="padding-left:8mm;"> 
			complete the <span style="font-weight:bold;">Qualified Dividends and Capital Gain Tax Worksheet </span>on page 39 of the Instructions for Form 1040 (or in the Instructions for Form 1040NR).</div>
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:12mm"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:12mm;border-left-width:0;background-color:lightgrey;"/>
        </div>
        <!-- LINE 22 2nd line end -->
        <!-- LINE 22 3rd line, No checkbox -->
        <div class="styGenericDiv " style="width:187mm;height:8mm">
          <div class="styLNLeftNumBox" style="width:6mm;"></div>
          <div class="styLNDesc" style="width:135mm;">
            <input type="checkbox" class="styCkBox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd"/>
              </xsl:call-template>
            </input>
            <label>
             <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleD/QualifiedDividendsInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">No.</span>
      </label>
           Complete the rest of Form 1040 or Form 1040NR.			
			</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:8mm"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;height:8mm;border-left-width:0;background-color:lightgrey;"/>
        </div>
        <!-- END LINE 22 -->
        <div class="styBB" style="width:187mm;border-top-width: 1px;border-bottom-width:0px;">
          <span style="font-weight:bold;float:right" class="styGenericDiv">Schedule D (Form 1040) 2010</span>
        </div>
        <!--  PART III HEADER -->
        <div class="pageEnd">
        </div>
              </div>
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
          Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>
        </div>
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
        </table>
        <!-- Additonal Data Table for Part I Line 1 -->
        <xsl:if test="($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss) &gt; 5)">
          <span class="styRepeatingDataTitle">
            <br/>Form 1040 Schedule D, Part I, Line 1 - Short-Term Capital Gains and Losses - Assets Held One Year or Less
          </span>
          <table class="styDepTbl" style="font-size:7pt">
            <thead class="styTableHead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" colspan="1" style="width:34mm">(a) Description of property (Example: 100 sh. XYZ Co.)</th>
                <th class="styDepTblCell" style="width:22mm">(b) Date acquired (mo., day, yr.)</th>
                <th class="styDepTblCell" style="width:22mm">(c) Date sold (mo., day, yr.)</th>
                <th class="styDepTblCell" colspan="1" style="width:35mm">(d) Sales price (see page D-7 of the instructions)</th>
                <th class="styDepTblCell" colspan="1" style="width:35mm">(e) Cost or other basis (see page D-7 of the instructions)</th>
                <th class="styDepTblCell" colspan="1" style="width:35mm">(f) Gain or (loss)<br/>Subtract (e) from (d)</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="$FormData/ShortTermCapitalGainAndLoss">
                <tr>
                  <!--Define background colors to the rows -->
                  <xsl:attribute name="class">
                  <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                  </xsl:attribute>
                  <!-- Column A  -->
                  <td class="styDepTblCell" style="border-left-width:0px;text-align:left;width:34mm">
                   <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="STDescriptionOfProperty"/>
                      <xsl:with-param name="TabOrder" select="2"/>
                    </xsl:call-template>
                    <span style="width:3mm;"></span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="STDescriptionOfProperty"/>
                    </xsl:call-template>
                  </td>
                    <!-- Column B -->
                  <td class="styDepTblCell" style="text-align:center;width:22mm">
                    <xsl:choose>
                      <xsl:when test="STDateAcquired">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="STDateAcquired"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="STDateAcquiredVariousTxt"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                   <!-- Column C -->
                  <td class="styDepTblCell" style="text-align:center;width:22mm">
                    <xsl:choose>
                      <xsl:when test="STDateSold">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="STDateSold"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="STDateSoldTxt"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <!-- Column D -->
                  <td class="styDepTblCell" style="border-left-width:0px;text-align:right;width:35mm">
                    <xsl:choose>
                      <xsl:when test="STSalesPriceAmt">
                    <div style="width:33mm;font-size:6.5pt;height:2mm;float left;">
                        <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="STSalesPriceAmt"/>
                    </xsl:call-template>
                    <span style="width:1mm;"></span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="STSalesPriceAmt"/>
                        </xsl:call-template>
                          </div>
                      </xsl:when>
                      <xsl:otherwise>
                       <div style="width:33mm;text-align:center;font-size:6.5pt;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="STSalesPriceTxt"/>
                        </xsl:call-template>
                        </div>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                
                  <!-- Column E -->
                  <td class="styDepTblCell" style="border-left-width:0px;text-align:right;width:35mm">
                    <xsl:choose>
                      <xsl:when test="STCostOrOtherBasisAmt">
                         <div style="width:33mm;font-size:6.5pt;height:2mm;float left;">
                          <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="STCostOrOtherBasisAmt"/>
                      <xsl:with-param name="TabOrder" select="2"/>
                    </xsl:call-template>
                <span style="width:1mm;"></span>
                      
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="STCostOrOtherBasisAmt"/>
                        </xsl:call-template>
                          </div>
                      </xsl:when>
                      <xsl:otherwise>
                      <div style="width:33mm;text-align:center;font-size:6.5pt;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="STCostOrOtherBasisTxt"/>
                        </xsl:call-template>
                         </div>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  
                  
                  <!-- Column F  -->
                  <td class="styDepTblCell" style="border-left-width:0px;text-align:right;width:35mm">
                   <div style="width:33mm;font-size:6.5pt;height:2mm;float left;">
                   <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="STGainOrLossAmt"/>
                      <xsl:with-param name="TabOrder" select="2"/>
                    </xsl:call-template>
                 <span style="width:1mm;"></span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="STGainOrLossAmt"/>
                    </xsl:call-template>
                       </div>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </xsl:if>
        <!-- End Part I Line 1 separated data -->
        <!-- Additonal Data Table for Part II Line 8 -->
        <xsl:if test="($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 5)">
          <span class="styRepeatingDataTitle">
            <br/>
            Form 1040 Schedule D, Part II, Line 8 - Long-Term Capital Gains and Losses - Assets Held More Than One Year
          </span>
          <table class="styDepTbl" style="font-size:7pt; table-cell-pad:0">
            <thead class="styTableHead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" colspan="1" style="width:32mm">(a) Description of property (Example: 100 sh. XYZ Co.)</th>
                <th class="styDepTblCell" style="width:22mm">(b) Date acquired (mo., day, yr.)</th>
                <th class="styDepTblCell" style="width:22mm">(c) Date sold (mo., day, yr.)</th>
                <th class="styDepTblCell" colspan="1" style="width:35mm">(d) Sales price (see page D-7 of the instructions)</th>
                <th class="styDepTblCell" colspan="1" style="width:35mm">(e) Cost or other basis (see page D-7 of the instructions)</th>
                <th class="styDepTblCell" colspan="1" style="width:35mm">(f) Gain or (loss)<br/>Subtract (e) from (d)</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="$FormData/LongTermCapitalGainAndLoss">
                <tr>
                  <!--Define background colors to the rows -->
                  <xsl:attribute name="class">
                  <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                  </xsl:attribute>
                  <!-- column A -->
                  <td class="styDepTblCell" style="border-right-width:0px;width:32mm;">
                    <div style="width:2mm;float:left;">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="LTDescriptionOfProperty"/>
                      <xsl:with-param name="TabOrder" select="2"/>
                    </xsl:call-template>
                        </div>
                        <div style="width:28mm;float:right;font-size:6.5pt;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="LTDescriptionOfProperty"/>
                    </xsl:call-template>
                     </div>
                  </td>
                    <!-- Column B  -->
                  <td class="styDepTblCell" style="text-align:center;width:22mm">
                    <xsl:choose>
                      <xsl:when test="LTDateAcquired">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="LTDateAcquired"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LTDateAcquiredVariousTxt"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                     <!-- Column C  -->
                  <td class="styDepTblCell" style="text-align:center;width:24mm">
                    <xsl:choose>
                      <xsl:when test="LTDateSold">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="LTDateSold"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LTDateSoldTxt"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                 
                  <!-- Column D  -->
                  <td class="styDepTblCell" style="border-left-width:0px;text-align:right;width:35mm">
                    <xsl:choose>
                       <xsl:when test="LTSalesPriceAmt">
                 <div style="width:33mm;font-size:6.5pt;height:2mm;float left;">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="LTSalesPriceAmt"/>
                      <xsl:with-param name="TabOrder" select="2"/>
                    </xsl:call-template>
                              <span style="width:1mm;"></span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="LTSalesPriceAmt"/>
                        </xsl:call-template>
                          </div>
                      </xsl:when>
                      <xsl:otherwise>
                      <div style="width:33mm;text-align:center;font-size:6.5pt;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LTSalesPriceTxt"/>
                        </xsl:call-template>
                        </div>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                 
                  <!-- Column E -->
                  <td class="styDepTblCell" style="border-left-width:0px;width:35mm">
                    <xsl:choose>
                    <xsl:when test="LTCostOrOtherBasisAmt">
                      <div style="width:33mm;font-size:6.5pt;height:2mm;float left;">
                       <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="LTCostOrOtherBasisAmt"/>
                      <xsl:with-param name="TabOrder" select="2"/>
                    </xsl:call-template>
                         <span style="width:1mm;"></span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="LTCostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        </div>
                      </xsl:when>
                      <xsl:otherwise>
                      <div style="width:33mm;text-align:center;font-size:6.5pt;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LTCostOrOtherBasisTxt"/>
                        </xsl:call-template>
                         </div>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  
                  <!-- Column F  -->
                  <td class="styDepTblCell" style="border-left-width:0px;width:35mm">
                  <div style="width:33mm;font-size:6.5pt;height:2mm;float left;">
                   <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="LTGainOrLossAmt"/>
                    </xsl:call-template>
                      <span style="width:1mm;"></span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="LTGainOrLossAmt"/>
                    </xsl:call-template>
                       </div>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </xsl:if>
        <!-- End Part II Line 6 separated data -->
         </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
