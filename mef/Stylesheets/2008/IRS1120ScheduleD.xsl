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
    <xsl:include href="IRS1120ScheduleDStyle.xsl"/>
    <xsl:param name="FormData" select="$RtnDoc/IRS1120ScheduleD"/>  
    <xsl:template match="/">
      <html>
        <head>
          <!-- Set Document Title -->
          <title>
            <xsl:call-template name="FormTitle">
              <xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param>
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
          <meta name="Description" content="Schedule D (Form 1120)"/>
          <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
          <xsl:call-template name="InitJS"></xsl:call-template>
          <style type="text/css">
            <!--Comment out the if statement for separate print format -->
            <xsl:if test="not($Print) or $Print=''">
              <xsl:call-template name="IRS1120ScheduleDStyle"/>
              <xsl:call-template name="AddOnStyle"></xsl:call-template>
            </xsl:if>
          </style>
          <xsl:call-template name="GlobalStylesForm"/>
        </head>
        <!-- <body onload="init();"> -->
        <body class="styBodyClass">
          <form name="Form1120ScheduleD">
            <!-- BEGIN WARNING LINE -->
            <xsl:call-template name="DocumentHeader"></xsl:call-template>  
            <!-- END WARNING LINE -->
            <!-- BEGIN FORM HEADER -->
            <div class="IRS1120ScheduleD_styBB" style="width:707px;">
              <!-- Form Name -->
              <div class="IRS1120ScheduleD_styFN" style="width:110px;height:85px;">
              <!-- Form Name -->
                <div class="styFormNumber" style="font-size: 10pt;">SCHEDULE D
                  <br />
                  <div class="styFormNumber" style="font-size: 9pt;">(Form 1120)</div>
                </div>
                <br/>
                <!-- Agency Name -->
                <div class="IRS1120ScheduleD_styAgency" style="height:25px;padding-top:5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
              </div>
              <!-- Form Title Box -->
              <div class="IRS1120ScheduleD_styFTBox" style="width:472px;height:85px;">
              <!-- Form Title -->
                <div class="styMainTitle" style="height:26px;">Capital Gains and Losses</div>
                <!-- Form Subtitle -->
                <div class="IRS1120ScheduleD_styFST" style="height:34px;text-align:left;padding-left:2mm;">
                  <img src="{$ImagePath}/1120SchD_Bullet.gif" alt="Right arrow"/> 
                  <span style=" padding-left:2mm;width:118mm;"> Attach to Form 1120, 1120-C, 1120-F, 1120-FSC, 1120-H, 1120-IC-DISC, 1120-L,</span>
		     <span style="padding-left:5mm;width:118mm;">1120-ND, 1120PC, 1120-POL, 1120-	REIT, 1120-RIC, 1120-SF, or certain Forms 990-T.</span>
		   </div>
		   <span style="font-weight:bold; padding-bottom:7mm;">
		    <img src="{$ImagePath}\8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/> See separate instructions.
                </span>
                <div style="width:472px;"/>
              </div>
              <!-- Tax Year Box -->
              <div class="IRS1120ScheduleD_styTYBox" style="width:125px;height:85px;">
                <!-- OMB No. -->
                <div class="IRS1120ScheduleD_styOMB" style="height:35px;line-height:15px;padding-top:4.5mm;">OMB No. 1545-0123</div>
                <!-- Tax Year -->
                <div class="IRS1120ScheduleD_styTY" style="height:45px;line-height:45px;color:Green;padding-top:.5mm;">
                  <span style="color:black;">20</span>08
                </div>
              </div>
            </div>
            <!-- END FORM HEADER -->
            <!-- BEGIN TAXPAYER INFO -->
            <div style="width:707px;float:left;clear:left;border-top:1 solid black;">
              <!-- Name -->
              <div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;font-weight:normal;">
                Name
                <br/>
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
              <!-- EIN -->
              <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
                Employer identification number
                <br/><br />
                <span style="text-align:left;font-weight:normal;">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                  </xsl:call-template>              
                </span>
              </div>
            </div>
            <!-- END TAXPAYER INFO -->
            <!-- BEGIN PART I HEADER -->
            <div class="IRS1120ScheduleD_styPartHdr" style="width:707px;float:left;clear:both;">
              <div style="width:607px; float:left;">            
                <span style="width:76px">
                  <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                  <span class="IRS1120ScheduleD_styPartHdrTitle">Part I</span>
                  <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                </span>
                <span style="height:14px">Short-Term Capital Gains and Losses&#151;Assets Held One Year or Less</span>
              </div>
              <div style="float:right">                        
                <!-- button display logic -->          
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss" />
                  <xsl:with-param name="containerHeight" select="7" />
                  <xsl:with-param name="headerHeight" select="1"/>
                  <xsl:with-param name="containerID" select="'STCapGainTableContainer'" />                  
                </xsl:call-template>               
                <!-- end button display logic -->              
              </div>            
            </div>
            <!-- END PART I HEADER -->
            <div class="IRS1120ScheduleD_styTableContainer" id="STCapGainTableContainer">
              <!-- print logic -->
              <xsl:call-template name="SetInitialState"/>
              <!-- end -->      
              <table class="IRS1120ScheduleD_styTable" cellspacing="0"  name="STCapGainTable" id="STCapGainTable">
              <!-- BEGIN PART I TABLE HEADER -->
                <tr>
                  <th class="IRS1120ScheduleD_styTableCellA" style="text-align:center;font-weight:normal;" scope="col">
                    <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 shares of Z Co.)
                  </th>
                  <th class="IRS1120ScheduleD_styTableCellB" style="text-align:center;font-weight:normal;" scope="col">
                    <span style="font-weight:bold;">(b)</span> Date acquired<br/>(mo., day, yr.)
                  </th>
                  <th class="IRS1120ScheduleD_styTableCellC" style="text-align:center;font-weight:normal;" scope="col">
                    <span style="font-weight:bold;">(c)</span> Date sold<br/>(mo., day, yr.)
                  </th>
                  <th class="IRS1120ScheduleD_styTableCellD" style="text-align:center;font-weight:normal;" scope="col">
                    <span style="font-weight:bold;">(d)</span> Sales price<br/>(see instructions)
                  </th>
                  <th class="IRS1120ScheduleD_styTableCellE" style="text-align:center;font-weight:normal;" scope="col">
                    <span style="font-weight:bold;">(e)</span> Cost or other<br/>basis (see<br/>instructions)
                  </th>
                  <th class="IRS1120ScheduleD_styTableCellF" style="text-align:center;font-weight:normal;" scope="col">
                    <b>(f) Gain or (loss)</b><br />(Subtract (e) from (d))
                  </th>                
                </tr>
                <!-- END PART I TABLE HEADER -->
                <!-- BEGIN PART I TABLE -->
                <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                <!-- If the print parameter is separated, but there are fewer elements than the container height (7) -->
                <xsl:if test="($Print != $Separated) or (count($FormData/ShortTermCapitalGainAndLoss) &lt;= 7) ">
                  <xsl:for-each select="$FormData/ShortTermCapitalGainAndLoss">
                    <tr>
                      <td class="IRS1120ScheduleD_styTableCellA" scope="row">
                        <!-- If this is the last row, do not display a bottom line -->
                        <xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
                          <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <span class="IRS1120ScheduleD_styLN" style="font-size:8pt">                      
                          <xsl:if test="position() = 1">1</xsl:if>
                        </span>
                        <!--modify left border for this cell here -->                 
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                        </xsl:call-template>
                        <xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Line 1 - ssbic Rollover Indicator</xsl:with-param>
                          <xsl:with-param name="TargetNode" select="PropertyDescription/@ssbicRolloverIndicator"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1120ScheduleD_styTableCellB">                     
                        <!-- If this is the last row, do not display a bottom line -->
                        <xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
                          <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when test="DateAcquiredVarious != ''">
                            <xsl:call-template name="PopulateMonthDayYear">
                              <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
                            </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="PopulateMonthDayYear">
                                <xsl:with-param name="TargetNode" select="DateAcquired"/>
                              </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                      </td>
                      <td class="IRS1120ScheduleD_styTableCellC">
                        <!-- If this is the last row, do not display a bottom line -->
                        <xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
                          <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when test="DateSoldVarious != ''">
                            <xsl:call-template name="PopulateMonthDayYear">
                              <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateMonthDayYear">
                              <xsl:with-param name="TargetNode" select="DateSold"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                      <td class="IRS1120ScheduleD_styTableCellD">
                        <!-- If this is the last row, do not display a bottom line -->
                        <xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
                          <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="SalesPrice"/>
                        </xsl:call-template>
                      </td>
                      <td class="IRS1120ScheduleD_styTableCellE" style="text-align:right;">
                        <!-- If this is the last row, do not display a bottom line -->
                        <xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
                          <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <span style="text-align:left;width:3mm;" class="styGenericDiv">
                          <xsl:call-template name="SetFormLinkInline">
                            <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                            <xsl:with-param name="TabOrder" select="2"/>
                          </xsl:call-template>  
                        </span>
                        <span style="text-align:right;float:right;" class="styGenericDiv">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                          </xsl:call-template> 
                        </span>                     
                      </td>
                      <td class="IRS1120ScheduleD_styTableCellF">
                        <!-- If this is the last row, do not display a bottom line -->
                        <xsl:if test="(position() = last()) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;6)">
                          <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <span style="text-align:left;width:3mm;" class="styGenericDiv">
                          <xsl:call-template name="SetFormLinkInline">
                            <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                            <xsl:with-param name="TabOrder" select="2"/>
                          </xsl:call-template>  
                        </span>
                        <span style="text-align:right;float:right;font-size:7pt;" class="styGenericDiv">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                          </xsl:call-template>
                        </span>
                      </td>
                      <td class="IRS1120ScheduleD_styTableLastCol" id="Table1LastCol"> </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- Depending on the number of data rows, insert blank rows to fill the container height -->
                <!-- For separated print where there are more data elements than the container height, -->
                <!-- display a message in the first row directing the user to the additional data table -->
		  <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 1 or ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 7) and ($Print = $Separated))">
		    <tr>
		      <td class="IRS1120ScheduleD_styTableCellA">
		        <span class="IRS1120ScheduleD_styLN" style="font-size:8pt">1</span>
		        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                       <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss"/>
                     </xsl:call-template>
		      </td>
		      <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		    </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 2 or ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 7) and ($Print = $Separated))">
		    <tr>
		      <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		    </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 3 or ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 7) and ($Print = $Separated))">
		    <tr>
		      <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		     <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		     <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		    </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 4 or ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 7) and ($Print = $Separated))">
		    <tr>
		      <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		    </tr>
               </xsl:if>
		  <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 5 or ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 7) and ($Print = $Separated))">
		    <tr>
		      <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		    </tr>
		  </xsl:if>		
		  <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 6 or ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 7) and ($Print = $Separated))">
		    <tr>
		      <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		      <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		    </tr>
		  </xsl:if>
		  <xsl:if test="count($FormData/ShortTermCapitalGainAndLoss) &lt; 7 or ((count($FormData/ShortTermCapitalGainAndLoss) &gt; 7) and ($Print = $Separated))">
		    <tr>
		     <td class="IRS1120ScheduleD_styTableCellA" style="border-bottom-width: 0px"><span style="width: 1mm" /></td>
		     <td class="IRS1120ScheduleD_styTableCellB" style="border-bottom-width: 0px"><span style="width: 1mm" /></td>
		     <td class="IRS1120ScheduleD_styTableCellC" style="border-bottom-width: 0px"><span style="width: 1mm" /></td>
		     <td class="IRS1120ScheduleD_styTableCellD" style="border-bottom-width: 0px"><span style="width: 1mm" /></td>
		    <td class="IRS1120ScheduleD_styTableCellE" style="border-bottom-width: 0px"><span style="width: 1mm" /></td>
		    <td class="IRS1120ScheduleD_styTableCellF" style="border-bottom-width: 0px"><span style="width: 1mm" /></td>
		    </tr>
		  </xsl:if>
              </table>
              </div>
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss" />
                <xsl:with-param name="containerHeight" select="7" />
                <xsl:with-param name="headerHeight" select="1"/>
                <xsl:with-param name="containerID" select="'STCapGainTableContainer'" />                  
              </xsl:call-template>        
              <!-- END PART I TABLE -->
              <!-- BEGIN LINE 2 -->
              <div class="IRS1120ScheduleD_styLineItem">
                <span class="IRS1120ScheduleD_styLN">2</span>
                <span class="IRS1120ScheduleD_styLNRtMargin"/>
                <span class="IRS1120ScheduleD_styLNDesc">Short-term capital gain from installment sales from Form 6252, line 26 or 37 . . . . . . . . . . .</span>
                <span class="IRS1120ScheduleD_styLNBox">2</span>
                <div class="IRS1120ScheduleD_styLNValBox">
                  <span type="text" class="IRS1120ScheduleD_styLNVal" name="ShortTermCapGainInstalSales" id="ShortTermCapGainInstalSales">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapGainInstalSales"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!-- END LINE 2 -->
              <!-- BEGIN LINE 3 -->
              <div class="IRS1120ScheduleD_styLineItem">
                <span class="IRS1120ScheduleD_styLN">3</span>
                <span class="IRS1120ScheduleD_styLNRtMargin"/>
                <span class="IRS1120ScheduleD_styLNDesc">Short-term gain or (loss) from like-kind exchanges from Form 8824 . . . . . . . . . . . . . . . . .</span>
                <span class="IRS1120ScheduleD_styLNBox">3</span>
                <div class="IRS1120ScheduleD_styLNValBox">
                  <span type="text" class="IRS1120ScheduleD_styLNVal" name="ShortTermGainLossFromLikeKind" id="ShortTermGainLossFromLikeKind">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ShortTermGainLossFromLikeKind"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!-- END LINE 3 -->
              <!-- BEGIN LINE 4 :EXCEPTION Per  Gwen Chambliss' email response to IBM Defect 20437 dated 9/19/08 to allow the descrepancy between Schema and Style sheet.  
                     Where Schema efile data type as USAMOUNT which allow neg and pos amount present in a hardcode bracket line 
                     and Style sheet guideline indicate only pos amount allow in a hard coded bracket line.-->
              <div class="IRS1120ScheduleD_styLineItem">
                <span class="IRS1120ScheduleD_styLN">4</span>
                <span class="IRS1120ScheduleD_styLNRtMargin"/>
                <span class="IRS1120ScheduleD_styLNDesc">Unused capital loss carryover (attach computation)
                  <span style="width:3px;"></span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/UnusedCapitalLossCarryover"/>
                    <xsl:with-param name="TabOrder" select="2"/>
                  </xsl:call-template>      
                  <span style="width:15px;"></span>
                  <span>. . . . . . . . . . . . . . . . . . . . . . . . . . </span>
                </span>
                <span class="IRS1120ScheduleD_styLNBox">4</span>
                <div class="IRS1120ScheduleD_styLNValBox">
                  <span type="text" class="IRS1120ScheduleD_styLNVal" name="UnusedCapitalLossCarryover" id="UnusedCapitalLossCarryover" style="font-size:6.3pt;">
                    <xsl:call-template name="PopulateNegativeNumber">
                      <xsl:with-param name="TargetNode" select="$FormData/UnusedCapitalLossCarryover"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!-- END LINE 4 -->
              <!-- BEGIN LINE 5 -->
              <div class="IRS1120ScheduleD_styLineItem">
                <span class="IRS1120ScheduleD_styLN">5</span>
                <span class="IRS1120ScheduleD_styLNRtMargin"/>
                <span class="IRS1120ScheduleD_styLNDesc">Net short-term capital gain or (loss). Combine lines 1 through 4 . . . . . . . . . . . . . . . . . . . .</span>
                <span class="IRS1120ScheduleD_styLNBox" style="border-bottom-width:0px;">5</span>
                <div class="IRS1120ScheduleD_styLNValBox" style="border-bottom-width:0px;">
                  <span type="text" class="IRS1120ScheduleD_styLNVal" name="NetShortTermCapitalGainLoss" id="NetShortTermCapitalGainLoss">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NetShortTermCapitalGainLoss"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!-- END LINE 5 -->
              <!-- BEGIN PART II HEADER -->
              <div class="IRS1120ScheduleD_styPartHdr" style="width:707px;height:16px;">
                <span style="float:left;clear:left;">
                  <span style="width:76px;">
                    <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                    <span class="IRS1120ScheduleD_styPartHdrTitle">Part II</span>
                    <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                  </span>
                  <span style="width:613px;height:14px;">Long-Term Capital Gains and Losses&#151;Assets Held More Than One Year</span>
                </span>
                <div style="float:right">                        
                  <!-- button display logic -->          
                  <xsl:call-template name="SetDynamicTableToggleButton">
                    <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss" />
                    <xsl:with-param name="containerHeight" select="7" />
                    <xsl:with-param name="headerHeight" select="1"/>
                    <xsl:with-param name="containerID" select="'LTCapGainTableContainer'" />                  
                  </xsl:call-template>               
                  <!-- end button display logic -->              
                </div>    
              </div>
              <!-- END PART II HEADER -->
              <!-- BEGIN PART II TABLE -->
              <div class="IRS1120ScheduleD_styTableContainer" id="LTCapGainTableContainer">
                <!-- print logic -->
                <xsl:call-template name="SetInitialState"/>
                <!-- end -->    
                <table class="IRS1120ScheduleD_styTable" cellspacing="0" name="LTCapGainTable" id="LTCapGainTable">
                  <!-- BEGIN PART II TABLE HEADER -->
                  <tr style="display:none;">
                    <th class="IRS1120ScheduleD_styTableCellA" style="text-align:center;font-weight:normal;" scope="col">
                      <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 shares of Z Co.)
                    </th>
                    <th class="IRS1120ScheduleD_styTableCellB" style="text-align:center;font-weight:normal;" scope="col">
                      <span style="font-weight:bold;">(b)</span> Date acquired<br/>(mo., day, yr.)
                    </th>
                    <th class="IRS1120ScheduleD_styTableCellC" style="text-align:center;font-weight:normal;" scope="col">
                      <span style="font-weight:bold;">(c)</span> Date sold<br/>(mo., day, yr.)
                    </th>
                    <th class="IRS1120ScheduleD_styTableCellD" style="text-align:center;font-weight:normal;" scope="col">
                      <span style="font-weight:bold;">(d)</span> Sales price<br/>(see instructions)
                    </th>
                    <th class="IRS1120ScheduleD_styTableCellE" style="text-align:center;font-weight:normal;" scope="col">
                      <span style="font-weight:bold;">(e)</span> Cost or other<br/>basis (see<br/>instructions)
                    </th>
                    <th class="IRS1120ScheduleD_styTableCellF" style="text-align:center;font-weight:normal;" scope="col">
                      <b>(f) Gain or (loss)</b><br />(Subtract (e) from (d))
                    </th>
                  </tr>
                  <!-- END PART II TABLE HEADER -->
                  <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                  <!-- If the print parameter is separated, but there are fewer elements than the container height (7) -->
                  <xsl:if test="($Print != $Separated) or (count($FormData/LongTermCapitalGainAndLoss) &lt;= 7) ">
                    <xsl:for-each select="$FormData/LongTermCapitalGainAndLoss">
                      <tr>
                        <td class="IRS1120ScheduleD_styTableCellA" scope="row">
                        <!-- If this is the last row, do not display a bottom line -->
                          <xsl:if test="(position() = last()) and (count($FormData/LongTermCapitalGainAndLoss) &gt;6)">
                            <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                          </xsl:if>
                          <span class="IRS1120ScheduleD_styLN" style="font-size:8pt">
                            <xsl:if test="position() = 1">6</xsl:if>
                          </span>                     
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                          </xsl:call-template>
                          <xsl:call-template name="LinkToLeftoverDataTableInline">
                            <xsl:with-param name="Desc">Line 1 - ssbic Rollover Indicator</xsl:with-param>
                            <xsl:with-param name="TargetNode" select="PropertyDescription/@ssbicRolloverIndicator"/>
                          </xsl:call-template>
                        </td>
                        <td class="IRS1120ScheduleD_styTableCellB">
                          <!-- If this is the last row, do not display a bottom line -->
                          <xsl:if test="(position() = last()) and (count($FormData/LongTermCapitalGainAndLoss) &gt;6)">
                            <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                          </xsl:if>
                          <xsl:choose>
                            <xsl:when test="DateAcquiredVarious != ''">
                              <xsl:call-template name="PopulateMonthDayYear">
                                <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="PopulateMonthDayYear">
                                <xsl:with-param name="TargetNode" select="DateAcquired"/>
                              </xsl:call-template>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="IRS1120ScheduleD_styTableCellC">
                          <!-- If this is the last row, do not display a bottom line -->
                          <xsl:if test="(position() = last()) and (count($FormData/LongTermCapitalGainAndLoss) &gt;6)">
                            <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                          </xsl:if>
                          <xsl:choose>
                            <xsl:when test="DateSoldVarious != ''">
                              <xsl:call-template name="PopulateMonthDayYear">
                                <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="PopulateMonthDayYear">
                                <xsl:with-param name="TargetNode" select="DateSold"/>
                              </xsl:call-template>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="IRS1120ScheduleD_styTableCellD">
                          <!-- If this is the last row, do not display a bottom line -->
                          <xsl:if test="(position() = last()) and (count($FormData/LongTermCapitalGainAndLoss) &gt;6)">
                            <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                          </xsl:if>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SalesPrice"/>
                          </xsl:call-template>                     
                        </td>
                        <td class="IRS1120ScheduleD_styTableCellE">
                          <!-- If this is the last row, do not display a bottom line -->
                          <xsl:if test="(position() = last()) and (count($FormData/LongTermCapitalGainAndLoss) &gt;6)">
                            <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                          </xsl:if>
                          <span style="text-align:left;width:3mm;" class="styGenericDiv">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                              <xsl:with-param name="TabOrder" select="2"/>
                            </xsl:call-template>  
                          </span>
                          <span style="float:right;">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                            </xsl:call-template>   
                          </span>                  
                        </td>
                        <td class="IRS1120ScheduleD_styTableCellF">
                          <!-- If this is the last row, do not display a bottom line -->
                          <xsl:if test="(position() = last()) and (count($FormData/LongTermCapitalGainAndLoss) &gt;6)">
                            <xsl:attribute name="style">border-bottom-width:0px;</xsl:attribute>
                          </xsl:if>
                          <span style="text-align:left;width:3mm;" class="styGenericDiv">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                              <xsl:with-param name="TabOrder" select="2"/>
                            </xsl:call-template>  
                          </span>
                          <span style="float:right;font-size:7pt;">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                            </xsl:call-template> 
                          </span>                    
                        </td>
                        <td class="IRS1120ScheduleD_styTableLastCol" id="Table2LastCol"> </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <!-- Depending on the number of data rows, insert blank rows to fill the container height -->
                  <!-- For separated print where there are more data elements than the container height, -->
                  <!-- display a message in the first row directing the user to the additional data table -->
                  <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 1 or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)) ">
		      <tr>
		        <td class="IRS1120ScheduleD_styTableCellA">
		          <span class="IRS1120ScheduleD_styLN" style="font-size:8pt">6</span>
		          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                         <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss"/>
                       </xsl:call-template>
		        </td>
		        <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		      </tr>
		     </xsl:if>
		     <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 2 or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)) ">
		      <tr>
		        <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		        <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		      </tr>
		      </xsl:if>
		      <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 3 or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)) ">
		        <tr>
		          <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		        </tr>
		      </xsl:if>
		      <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 4 or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)) ">
		        <tr>
		         <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		         <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		         <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		         <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		         <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		         <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		        </tr>
                   </xsl:if>
		      <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 5 or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)) ">
		        <tr>
		          <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		        </tr>
		      </xsl:if>		
		      <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 6 or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)) ">
		        <tr>
		          <td class="IRS1120ScheduleD_styTableCellA"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellB"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellC"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellD"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellE"><span style="width: 4px"></span></td>
		          <td class="IRS1120ScheduleD_styTableCellF"><span style="width: 4px"></span></td>
		        </tr>
		      </xsl:if>
		      <xsl:if test="count($FormData/LongTermCapitalGainAndLoss) &lt; 7 or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)) ">
		        <tr>
              	    <td class="IRS1120ScheduleD_styTableCellA" style="border-bottom-width: 0px"><span style="width: 4px" /></td>
              	    <td class="IRS1120ScheduleD_styTableCellB" style="border-bottom-width: 0px"><span style="width: 4px" /></td>
              	    <td class="IRS1120ScheduleD_styTableCellC" style="border-bottom-width: 0px"><span style="width: 4px" /></td>
              	    <td class="IRS1120ScheduleD_styTableCellD" style="border-bottom-width: 0px"><span style="width: 4px" /></td>
              	    <td class="IRS1120ScheduleD_styTableCellE" style="border-bottom-width: 0px"><span style="width: 4px" /></td>
            		    <td class="IRS1120ScheduleD_styTableCellF" style="border-bottom-width: 0px"><span style="width: 4px" /></td>
		        </tr>
		      </xsl:if>
                 </table>
               </div>
               <!--Toggle button at the bottom -->
               <xsl:call-template name="SetInitialDynamicTableHeight">
                 <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss" />
                 <xsl:with-param name="containerHeight" select="7" />
                 <xsl:with-param name="headerHeight" select="1"/>
                 <xsl:with-param name="containerID" select="'LTCapGainTableContainer'" />                  
               </xsl:call-template>               
               <!-- END PART II TABLE -->
               <!-- BEGIN LINE 7 -->
               <div class="IRS1120ScheduleD_styLineItem">
                 <span class="IRS1120ScheduleD_styLN">7</span>
                 <span class="IRS1120ScheduleD_styLNRtMargin"/>
                 <span class="IRS1120ScheduleD_styLNDesc">Enter gain from Form 4797, line 7 or 9  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .</span>
                 <span class="IRS1120ScheduleD_styLNBox">7</span>
                 <div class="IRS1120ScheduleD_styLNValBox">
                   <span type="text" class="IRS1120ScheduleD_styLNVal" name="GainFromForm4797" id="GainFromForm4797">
                     <xsl:call-template name="PopulateAmount">
                       <xsl:with-param name="TargetNode" select="$FormData/GainFromForm4797"/>
                     </xsl:call-template>
                   </span>
                 </div>
                </div>
                <!-- END LINE 7 -->
                <!-- BEGIN LINE 8 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">8</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Long-term capital gain from installment sales from Form 6252, line 26 or 37 . . . . . . . . . . .</span>
                  <span class="IRS1120ScheduleD_styLNBox">8</span>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="LongTermCapGainInstalSales" id="LongTermCapGainInstalSales">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/LongTermCapGainInstalSales"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 8 -->
                <!-- BEGIN LINE 9 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">9</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Long-term gain or (loss) from like-kind exchanges from Form 8824 . . . . . . . . . . . . . . . . .</span>
                  <span class="IRS1120ScheduleD_styLNBox">9</span>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="LongTermGainLossFromLikeKind" id="LongTermGainLossFromLikeKind">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/LongTermGainLossFromLikeKind"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- BEGIN LINE 10 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">10</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Capital gain distributions (see instructions) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .</span>
                  <span class="IRS1120ScheduleD_styLNBox">10</span>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="CapitalGainDistributions" id="CapitalGainDistributions" value="100672">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributions"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- BEGIN LINE 11 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">11</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Net long-term capital gain or (loss). Combine lines 6 through 10 . . . . . . . . . . . . . . . . . . . .</span>
                  <span class="IRS1120ScheduleD_styLNBox" style="border-bottom-width:0px;">11</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="border-bottom-width:0px;">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="NetLongTermCapitalGainLoss" id="NetLongTermCapitalGainLoss">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/NetLongTermCapitalGainLoss"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 11 -->
                <!-- BEGIN PART III HEADER -->
                <div class="IRS1120ScheduleD_styPartHdr" style="width:707px;float:left;clear:left;">
                  <span style="width:76px;">
                    <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                    <span class="IRS1120ScheduleD_styPartHdrTitle">Part III</span>
                    <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                    </span>Summary of Parts I and II
                </div>
                <!-- END PART III HEADER -->
                <!-- BEGIN LINE 12 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">12</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Enter excess of net short-term capital gain (line 5) over net long-term capital loss (line 11) .</span>
                  <div class="IRS1120ScheduleD_styLNBox">12</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="ExcessNetSTGainOverNetLTLoss" id="ExcessNetSTGainOverNetLTLoss">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExcessNetSTGainOverNetLTLoss"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 12 -->
                <!-- BEGIN LINE 13 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">13</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Net capital gain. Enter excess of net long-term capital gain (line 11) over net short-term <br />capital  loss (line 5) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .</span>          
                  <span class="IRS1120ScheduleD_styLNBox" style="height:8mm; padding-top:4mm">13</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm; padding-top:4mm">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="NetCapitalGain" id="NetCapitalGain">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/NetCapitalGain"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 13 -->
                <!-- BEGIN LINE 14 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">14</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Add lines 12 and 13. Enter here and on Form 1120, page 1, line 8, or the proper line on<br /> other returns. If the corporation has qualified timber gain, also complete Part IV. . . . . . . . .</span>
                  <span class="IRS1120ScheduleD_styLNBox" style="height:8mm; padding-top:4mm">14</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm; padding-top:4mm">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" onmouseover="this.style.cursor='hand';" onmouseout="this.style.cursor='auto';" name="CapitalGainNetIncome" id="CapitalGainNetIncome" onclick="SetReturnBookmark( this.id, 'Form 1120 Schedule D Line 14 Capital Gain Net Income' );top.ReturnTree.LabelClick( '1120' );">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncome"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 14 -->
                <!-- BEGIN NOTE -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN"/>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">
                    <span style="font-weight:bold;">Note: </span>
                    <span style="font-style:italic;">If losses exceed gains, see <span style="font-weight:bold;">Capital losses</span> in the instructions.</span>
                  </span>
                 </div>
                 <!-- END NOTE -->
                    <!-- BEGIN PART IVI HEADER -->
                <div class="IRS1120ScheduleD_styPartHdr" style="width:707px;float:left;clear:left;">
                  <span style="width:76px;">
                    <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                    <span class="IRS1120ScheduleD_styPartHdrTitle">Part IV</span>
                    <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                    </span>Alternative Tax for Corporations with Qualified Timber Gains. <i style="font-weight:normal;">Complete Part IV</i>only <i style="font-weight:normal;">if the corporation</i><br/>
                    <i style="font-weight:normal;padding-left:20mm;">has qualified timber gain under section 1201(b). Skip this part if you are filing Form 1120-RIC. See </i>
                    <i style="font-weight:normal;padding-left:20mm;">instructions.</i>
                </div>
                <!-- END PART III HEADER -->
                <!-- BEGIN LINE 15 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">15</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc" style="width:391px;">Enter qualified timber gain (as defined in section 1201(b)(2)). . . . .</span>
                  <div class="IRS1120ScheduleD_styLNBox">15</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="QualifiedTimberGain" id="QualifiedTimberGain">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/QualifiedTimberGain"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="IRS1120ScheduleD_styLNBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
                  <div class="IRS1120ScheduleD_styLNValBox" style="border-bottom-width:0px;"></div>
                </div>
                <!-- END LINE 15 -->
                <!-- BEGIN LINE 16 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">16</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc" style="width:391px;">Enter taxable income from Form 1120, page 1, line 30, or the <br />applicable line of your tax return . . . . . . . . . . . . . . . . . . . . . . . . .</span>          
                  <span class="IRS1120ScheduleD_styLNBox" style="height:8mm; padding-top:4mm">16</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm; padding-top:4mm">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="TaxableIncomeFromF1120Line30" id="TaxableIncomeFromF1120Line30">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeFromF1120Line30"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="IRS1120ScheduleD_styLNBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px;"></div>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm;border-bottom-width:0px;"></div>
                </div>
                <!-- END LINE 16 -->
                <!-- BEGIN LINE 17 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">17</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc" style="width:391px;">Enter the smallest of: (a) the amount on line 15; (b) the amount on <br />line 16; or (c) the amount on Part III, line 13 . . . . . . . . . . . . . . . .</span>          
                  <span class="IRS1120ScheduleD_styLNBox" style="height:8mm; padding-top:4mm">17</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm; padding-top:4mm">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="SmallestLine15Or16OrPartIII13" id="SmallestLine15Or16OrPartIII13">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SmallestLine15Or16OrPartIII13"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="IRS1120ScheduleD_styLNBox" style="height:8mm;background-color:lightgrey;"></div>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm;"></div>
                </div>
                <!-- END LINE 17 -->
                <!-- BEGIN LINE 18 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">18</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Multiply line 17 by 15%. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . </span>
                  <div class="IRS1120ScheduleD_styLNBox">18</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="MultiplyLine17By15Percent" id="MultiplyLine17By15Percent">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine17By15Percent"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 18 -->
                <!-- BEGIN LINE 19 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">19</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc" style="width:391px;">Subtract line 13 from line 16. If zero or less, enter -0-. . . . . . . . . .</span>
                  <div class="IRS1120ScheduleD_styLNBox">19</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="SubtractLine13FromLine16" id="SubtractLine13FromLine16">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SubtractLine13FromLine16"/>
                      </xsl:call-template>
                    </span>
                  </div>
                 <div class="IRS1120ScheduleD_styLNBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
                  <div class="IRS1120ScheduleD_styLNValBox" style="border-bottom-width:0px;"></div>
                </div>
                <!-- END LINE 19 -->
                <!-- BEGIN LINE 20 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">20</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Enter the tax on line 19, figured using the Tax Rate Schedule (or applicable tax rate) <br />appropriate for the return with which Schedule D (Form 1120) is being filed . . . . . . . . . . . .</span>          
                  <span class="IRS1120ScheduleD_styLNBox" style="height:8mm; padding-top:4mm">20</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm; padding-top:4mm">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="MultiplyLine19UsingTaxRateSch" id="MultiplyLine19UsingTaxRateSch">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine19UsingTaxRateSch"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 20 -->
                <!-- BEGIN LINE 21 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">21</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc" style="width:391px;">Add lines 17 and 19. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .</span>
                  <div class="IRS1120ScheduleD_styLNBox">21</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="AddLines17And19" id="AddLines17And19">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AddLines17And19"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="IRS1120ScheduleD_styLNBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
                  <div class="IRS1120ScheduleD_styLNValBox" style="border-bottom-width:0px;"></div>
                </div>
                <!-- END LINE 21 -->
                <!-- BEGIN LINE 22 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">22</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc" style="width:391px;">Subtract line 21 from line 16. If zero or less, enter -0--. . . . . . . . . . </span>
                  <div class="IRS1120ScheduleD_styLNBox">22</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="SubtractLine21From16" id="SubtractLine21From16">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SubtractLine21From16"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="IRS1120ScheduleD_styLNBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
                  <div class="IRS1120ScheduleD_styLNValBox" style="border-bottom-width:0px;"></div>
                </div>
                <!-- END LINE 22 -->
                <!-- BEGIN LINE 23 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">23</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Multiply line 22 by 35%. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . </span>
                  <div class="IRS1120ScheduleD_styLNBox">23</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="MultiplyLine22By35Percent" id="MultiplyLine22By35Percent">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/MultiplyLine22By35Percent"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 23 -->
                <!-- BEGIN LINE 24 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">24</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Add lines 18, 20, and 23. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .</span>
                  <div class="IRS1120ScheduleD_styLNBox">24</div>
                  <div class="IRS1120ScheduleD_styLNValBox">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="AddLines18And20And23" id="AddLines18And20And23">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AddLines18And20And23"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 24 -->
                <!-- BEGIN LINE 25 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">25</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Enter the tax on line 16, figured using the Tax Rate Schedule (or applicable tax rate)
                    <br />appropriate for the return with which Schedule D (Form 1120) is being filed . . . . . . . . . . . .</span>          
                  <span class="IRS1120ScheduleD_styLNBox" style="height:8mm; padding-top:4mm">25</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm; padding-top:4mm">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" name="EnterTaxLine16UsingTaxRateSch" id="EnterTaxLine16UsingTaxRateSch">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/EnterTaxLine16UsingTaxRateSch"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 25 -->
                <!-- BEGIN LINE 26 -->
                <div class="IRS1120ScheduleD_styLineItem">
                  <span class="IRS1120ScheduleD_styLN">26</span>
                  <span class="IRS1120ScheduleD_styLNRtMargin"/>
                  <span class="IRS1120ScheduleD_styLNDesc">Enter the smaller of line 24 or line 25. Also enter this amount on Form 1120, Schedule J, <br />line 2, or the applicable line of your tax return. . . . . . . . .</span>
                  <span class="IRS1120ScheduleD_styLNBox" style="height:8mm; padding-top:4mm;border-bottom-width:0px;">26</span>
                  <div class="IRS1120ScheduleD_styLNValBox" style="height:8mm; padding-top:4mm;border-bottom-width:0px;">
                    <span type="text" class="IRS1120ScheduleD_styLNVal" onmouseover="this.style.cursor='hand';" onmouseout="this.style.cursor='auto';" name="SmallerOfLine24OrLine25" id="SmallerOfLine24OrLine25" onclick="SetReturnBookmark( this.id, 'Form 1120 Schedule D Line 14 Capital Gain Net Income' );top.ReturnTree.LabelClick( '1120' );">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SmallerOfLine24OrLine25"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </div>
                <!-- END LINE 26 -->
                 <!-- BEGIN FOOTER -->
                 <div class="IRS1120ScheduleD_styFormFooter" style="width:707px;border-top-width: 1px;">
                   <span style="width:115mm;font-weight:bold;font-size:7pt;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the Instructions for Form 1120.</span>
                   <span style="width:30mm;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv">Cat. No. 11460M</span>
                   <span style="width:42mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv" >Schedule D (Form 1120) 2008</span>
                 </div>
                 <!-- BEGIN FOOTER -->
               </form>
               <!-- leftover data table -->
               <br class="pageend" />        
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
                  <xsl:with-param name="TargetNode" select="$FormData" />
                  <xsl:with-param name="DescWidth" select="100"/>
                </xsl:call-template>
                <xsl:call-template name="PopulateLeftoverRowAmount">
                  <xsl:with-param name="Desc">Line 1 - ssbic Rollover Indicator</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss/PropertyDescription/@ssbicRolloverIndicator"/>
                  <xsl:with-param name="DescWidth" select="100"/>
                </xsl:call-template>
               </table>
               <!-- Additonal Data Table for Part I Line 1 -->
               <xsl:if test="($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss) &gt; 7)">
                 <span class="styRepeatingDataTitle">
                   <br/>Form 1120 Schedule D, Part I, Line 1 - Short-Term Capital Gains and Losses - Assets Held One Year or Less
                 </span>
                 <table class="styDepTbl" style="font-size:7pt">
                   <thead class="styTableHead">
                     <tr class="styDepTblHdr">
                       <th class="styDepTblCell">(a) Description of property (Example: 100 shares of Z Co.)</th>
                       <th class="styDepTblCell">(b) Date acquired (mo., day, yr.)</th>
                       <th class="styDepTblCell">(c) Date sold (mo., day, yr.)</th>
                       <th class="styDepTblCell">(d) Sales price (see instructions)</th>
                       <th class="styDepTblCell" colspan="2">(e) Cost or other basis (see instructions)</th>
                       <th class="styDepTblCell" colspan="2">(f) Gain or (loss)<br/>Subtract (e) from (d)</th>
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
                         <td class="styDepTblCell" style="text-align:left;">
                           <xsl:call-template name="PopulateText">
                             <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                           </xsl:call-template>
                         </td>
                         <td class="styDepTblCell" style="text-align:center;width:22mm">
                           <xsl:choose>
                             <xsl:when test="DateAcquired">
                               <xsl:call-template name="PopulateMonthDayYear">
		                    <xsl:with-param name="TargetNode" select="DateAcquired"/>
		                  </xsl:call-template>
                             </xsl:when>
                             <xsl:otherwise>
                               <xsl:call-template name="PopulateText">
		                     <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
		                  </xsl:call-template>
                             </xsl:otherwise>
                           </xsl:choose>
                         </td>
                         <td class="styDepTblCell" style="text-align:center;width:22mm">
                           <xsl:choose>
                             <xsl:when test="DateSold">
                               <xsl:call-template name="PopulateMonthDayYear">
		                    <xsl:with-param name="TargetNode" select="DateSold"/>
		                  </xsl:call-template>
                             </xsl:when>
                             <xsl:otherwise>
                               <xsl:call-template name="PopulateText">
		                     <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
		                  </xsl:call-template>
                             </xsl:otherwise>
                           </xsl:choose>
                         </td>
                         <td class="styDepTblCell" style="text-align:right;width:30mm">
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="SalesPrice"/>
                           </xsl:call-template>
                         </td>
                         <td class="styDepTblCell" style="border-right-width:0px;">
                           <xsl:call-template name="SetFormLinkInline">
                             <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                             <xsl:with-param name="TabOrder" select="2"/>
                           </xsl:call-template>  
                         </td>
                         <td class="styDepTblCell" style="text-align:right;width:29mm;border-left-width:0px;">
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                           </xsl:call-template>
                         </td>
                         <td class="styDepTblCell" style="border-right-width:0px;">
                           <xsl:call-template name="SetFormLinkInline">
                             <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                             <xsl:with-param name="TabOrder" select="2"/>
                           </xsl:call-template>  
                         </td>
                         <td class="styDepTblCell" style="border-left-width:0px;text-align:right;width:29mm">
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                           </xsl:call-template>
                         </td>
                       </tr>
                     </xsl:for-each>
                   </tbody>
                 </table>
               </xsl:if>
               <!-- End Part I Line 1 separated data -->
               <!-- Additonal Data Table for Part II Line 6 -->
               <xsl:if test="($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt; 7)">
                 <span class="styRepeatingDataTitle">
                   <br/>
                     Form 1120 Schedule D, Part II, Line 6 - Long-Term Capital Gains and Losses - Assets Held More Than One Year
                 </span>
                 <table class="styDepTbl" style="font-size:7pt">
                   <thead class="styTableHead">
                     <tr class="styDepTblHdr">
                       <th class="styDepTblCell">(a) Description of property (Example: 100 shares of Z Co.)</th>
                       <th class="styDepTblCell">(b) Date acquired (mo., day, yr.)</th>
                       <th class="styDepTblCell">(c) Date sold (mo., day, yr.)</th>
                       <th class="styDepTblCell">(d) Sales price (see instructions)</th>
                       <th class="styDepTblCell" colspan="2">(e) Cost or other basis (see instructions)</th>
                       <th class="styDepTblCell" colspan="2">(f) Gain or (loss)<br/>Subtract (e) from (d)</th>
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
                           <td class="styDepTblCell" style="text-align:left;">
                             <xsl:call-template name="PopulateText">
                               <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                             </xsl:call-template>
                           </td>
                           <td class="styDepTblCell" style="text-align:center;width:22mm">
                             <xsl:choose>
                               <xsl:when test="DateAcquired">
                                  <xsl:call-template name="PopulateMonthDayYear">
		                      <xsl:with-param name="TargetNode" select="DateAcquired"/>
		                     </xsl:call-template>
                               </xsl:when>
                               <xsl:otherwise>
                                  <xsl:call-template name="PopulateText">
		                        <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
		                     </xsl:call-template>
                                </xsl:otherwise>
                             </xsl:choose>
                           </td>
                           <td class="styDepTblCell" style="text-align:center;width:22mm">
                             <xsl:choose>
                               <xsl:when test="DateSold">
                                <xsl:call-template name="PopulateMonthDayYear">
		                     <xsl:with-param name="TargetNode" select="DateSold"/>
		                   </xsl:call-template>
                               </xsl:when>
                               <xsl:otherwise>
                                  <xsl:call-template name="PopulateText">
		                        <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
		                     </xsl:call-template>
                                </xsl:otherwise>
                             </xsl:choose>
                           </td>
                           <td class="styDepTblCell" style="text-align:right;width:30mm">
                             <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="SalesPrice"/>
                             </xsl:call-template>
                           </td>
                           <td class="styDepTblCell" style="border-right-width:0px;">
                             <xsl:call-template name="SetFormLinkInline">
                               <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                               <xsl:with-param name="TabOrder" select="2"/>
                             </xsl:call-template>  
                           </td>
                           <td class="styDepTblCell" style="text-align:right;width:29mm;border-left-width:0px;">
                             <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                             </xsl:call-template>
                           </td>
                           <td class="styDepTblCell" style="border-right-width:0px;">
                             <xsl:call-template name="SetFormLinkInline">
                               <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                               <xsl:with-param name="TabOrder" select="2"/>
                             </xsl:call-template>  
                           </td>
                           <td class="styDepTblCell" style="border-left-width:0px;text-align:right;width:29mm">
                             <xsl:call-template name="PopulateAmount">
                               <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                             </xsl:call-template>
                           </td>
                         </tr>
                       </xsl:for-each>
                     </tbody>
                   </table>
                 </xsl:if>
                 <!-- End Part II Line 6 separated data -->
               </body>
             </html>
           </xsl:template>      
         </xsl:stylesheet>
