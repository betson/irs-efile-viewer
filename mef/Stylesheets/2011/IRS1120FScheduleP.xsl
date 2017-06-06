<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FSchedulePStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleP"/>
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
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="Form IRS1120FScheduleP"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120FSchedulePStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120FScheduleP">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!--Begin Header-->
          <div class="styTBB" style="width:187mm;border-bottom-width: 1px">
            <table cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <!--Form Number-->
                  <th rowspan="2" class="sty1120FSchPFNBox" style="width:36mm" scope="col">
			SCHEDULE P
			<br/>
			(Form 1120-F)
			<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$FormData"/>
</xsl:call-template>
			
			<div class="sty1120FSchPAgency" style="padding-top:1.5mm">Department of the Treasury</div>
                    <div class="sty1120FSchPAgency">Internal Revenue Service</div>
                  </th>
                  <!--Form Name-->
                  <th rowspan="2" class="sty1120FSchPFTBox" style="width:119mm" scope="col">
                    <div class="sty1120FSchPMainTitle">
			List of Foreign Partner Interests in Partnerships
			</div>
                    <div class="styFST" style="padding-top:0.5mm">
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
		                                	Attach to Form 1120-F.
			                                 <br/>
                      <span style="padding-left:3.83mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
			See separate instructions.
			</div>
                  </th>
                  <!--OMB/Tax Year-->
                  <th class="sty1120FSchPOMB" style="width:32mm" scope="col">OMB No. 1545-0126</th>
                </tr>
                <tr>
                  <td class="sty1120FSchPTY">20<span class="styTYColor">10</span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End header-->
          			<xsl:variable name="DistributiveShareTreatedAsECIID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
						</xsl:call-template>
					</xsl:variable>
          <!--Begin Name/EIN-->
          <div style="width:187mm">
            <div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
		Name of corporation (foreign partner)
	<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
              <span style="font-size:6pt; font-weight:bold">Employer identification number (EIN)</span>
              <br/>
              <br/>
              <xsl:choose>
                <xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="($RtnHdrData/Filer/EIN)">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!--End Name/EIN-->
          <!-- Begin Part I -->
          <div class="sty1120FSchPSectionTitle" style="width:187mm">
            <div class="styBB" style="width:183mm">
              <div class="styPartName" style="width:23mm;">Part I</div>
              <div class="styPartDesc" style="width:154mm;">
		            List of Foreign Partner Interests in Partnerships</div>
            </div>
            <!-- button display logic -->
            <div class="styBB" style="float:right; width:4mm; border-bottom-width:1px">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo"/>
                <xsl:with-param name="containerHeight" select="4"/>
                <xsl:with-param name="containerID" select=" 'OFCctn' "/>
                <xsl:with-param name="imageID" select=" 'OFCimg' "/>
                <xsl:with-param name="buttonID" select=" 'OFCbtn' "/>
              </xsl:call-template>
            </div>
            <!-- end button display logic -->
          </div>
          <!-- begin Part I Table -->
          <div class="styTableContainer" style="width:187mm" id="OFCctn">
            <!-- begin print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end print logic -->
            <table class="styTable" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:60mm" colspan="2">(a)
									</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
                     				(b)</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:40mm; border-right-width:1px">
	                    			(c)</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm;border-right-width:0px">
		                    		(d)</th>
                </tr>
                <tr>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:60mm" colspan="2">
					Name of partnership</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
					Address</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:40mm; border-right-width:1px">
					EIN</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm;
                                      border-right-width:0px;text-align:left;padding-left:2mm">
					For each partnership, is the foreign corporation&#8217;s distributive share ECI, or treated as ECI, 
					in whole or in part, with a U.S. trade or business determined under section 875 (see instructions)?</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:if test="($Print != $Separated) or (count($FormData/ForeignPartnerInfo) &lt;= 4) ">
                  <xsl:for-each select="$FormData/ForeignPartnerInfo">
                    <tr>
                      <!--Line number-->
                      <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInfo) and position() &gt;3">width:4mm; border-right-width:0px; border-bottom-width:0px</xsl:when><xsl:otherwise>width:4mm; border-right-width:0px;</xsl:otherwise></xsl:choose></xsl:attribute>
                        <xsl:number format="A" value="position()"/>
                      </td>
                      <!--Name-->
                      <td class="sty1120FSchPTableCellData" style="width:56mm">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInfo) and position() &gt;3">width:56mm; border-bottom-width:0px</xsl:when><xsl:otherwise>width:56mm;</xsl:otherwise></xsl:choose></xsl:attribute>
                        <span style="float:none;text-align:left;font-weight:normal">
                          <xsl:choose>
                            <xsl:when test="PartnerName">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="PartnerName"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="PartnerBusinessName/BusinessNameLine1">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine1"/>
                              </xsl:call-template>
                              <xsl:if test="PartnerBusinessName/BusinessNameLine2">
                                <br/>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine2"/>
                                </xsl:call-template>
                              </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </span>
                      </td>
                      <!--Address-->
                      <td class="sty1120FSchPTableCellDataLF">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInfo) and position() &gt;3">border-bottom-width:0px</xsl:when><xsl:otherwise/></xsl:choose></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="PartnerUSAddress">
                            <xsl:call-template name="PopulateUSAddressTemplate">
                              <xsl:with-param name="TargetNode" select="PartnerUSAddress"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:when test="PartnerForeignAddress">
                            <xsl:call-template name="PopulateForeignAddressTemplate">
                              <xsl:with-param name="TargetNode" select="PartnerForeignAddress"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                      <!--EIN-->
                      <td class="sty1120FSchPTableCellDataLF">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() =
												 count($FormData/ForeignPartnerInfo) and position() &gt;3">
												 border-bottom-width:0px
												 </xsl:when><xsl:otherwise/></xsl:choose></xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="PartnerEIN">
                            <span style="text-align:center;padding-left:10mm">
                              <xsl:call-template name="PopulateEIN">
                                <xsl:with-param name="TargetNode" select="PartnerEIN"/>
                              </xsl:call-template>
                            </span>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="text-align:center;padding-left:10mm">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                              </xsl:call-template>
                              <span style="width:1px"/>
                            </span>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                      <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                      <!--Foreign Corp -->
                      <!-- this variable will be used to create a unique id for ConsolidatedGroup2 -->

                      
                      
                      <td class="sty1120FSchPTableCellDataRG" scope="row" style="border-left-width:1px;">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInfo)
												                          and position() &gt;3">border-bottom-width:1px
											    </xsl:when><xsl:otherwise/></xsl:choose></xsl:attribute>
                        <span style="width:6mm"/>
                        <input type="checkbox" class="styCkbox" name="InitialReturn">
                          <xsl:call-template name="PopulateYesCheckbox">
                                <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                                <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                          </xsl:call-template>
                          <!--  <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                        </input>
                        <label>
                          <xsl:call-template name="PopulateLabelYes">
                             <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                             <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                            
                          </xsl:call-template>
                          <!--xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                        </label>
	                        <span style="width:2mm;"/>Yes  
                            <span style="width:5mm"/>
                        <input type="checkbox" class="styCkbox" name="InitialReturn">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                            <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                          </xsl:call-template>
                          <!--<xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
                        </input>
                        <label>
                          <xsl:call-template name="PopulateLabelNo">
                            <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                            <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                          </xsl:call-template>
                          <!--<xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
                          <span style="width:2mm"/>No
	                                                </label>
                        <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- begin Part I separated table format -->
                <xsl:if test="count($FormData/ForeignPartnerInfo)&lt; 1 or
								 ((count($FormData/ForeignPartnerInfo) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm; 
										border-right-width:0px;">A</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm;">
                      <xsl:if test="((count($FormData/ForeignPartnerInfo) &gt; 4) 
											and ($Print = $Separated))">
                        <span style="float:none;text-align:left;font-weight:normal">
                          <xsl:choose>
                            <xsl:when test="$FormData/ForeignPartnerInfo/PartnerName">
                              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerName"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="$FormData/ForeignPartnerInfo/PartnerBusinessName/BusinessNameLine1">
                              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerBusinessName/BusinessNameLine1"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </span>
                      </xsl:if>
                      <span style="width:1px"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF">
                      <span style="width:1mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG">
                      <span style="width:1mm"/>
                    </td>
                    <td class="styTableCell" scope="row" style="border-left-width:1px;border-color:black;
										       border-right-width:0px;">
                      <span style="width:6mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        
                        <!--<xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                       <!-- <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn" scope="row">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                       <!-- <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                      <!--  <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
                        <span style="width:2mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($FormData/ForeignPartnerInfo)&lt; 2  or ((count($FormData/ForeignPartnerInfo) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px;">B</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG">
                      <span style="width:2mm"/>
                    </td>
                    <td class="styTableCell" style="border-right-width:0px;border-left-width:1px;border-color:black" scope="row" >
                      <span style="width:6mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn" >
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[2]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                         <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[2]')"/></xsl:attribute>
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>

                        </xsl:call-template>
                         <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[2]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                         <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[2]')"/></xsl:attribute>
                        <span style="width:2mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($FormData/ForeignPartnerInfo)&lt; 3 
								 or ((count($FormData/ForeignPartnerInfo) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px">C</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG">
                      <span style="width:2mm"/>
                    </td>
                    <td class="styTableCell" scope="row" style="border-right-width:0px;border-left-width:1px;border-color:black">
                      <span style="width:6mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn" >
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[3]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>

                        </xsl:call-template>
                         <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[3]')"/></xsl:attribute>
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>                     
                        </xsl:call-template>
                         <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[3]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[3]')"/></xsl:attribute>
                        <span style="width:2mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($FormData/ForeignPartnerInfo)&lt; 4  
								or ((count($FormData/ForeignPartnerInfo) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px; border-bottom-width:0px">D</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm; border-bottom-width:0px">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF" style="border-bottom-width:0px">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG" style="border-bottom-width:0px">
                      <span style="width:2mm"/>
                    </td>
                    <td class="styTableCell"  scope="row" style="border-right-width:0px;border-left-width:1px;border-color:black;border-bottom-width:0px;">
                      <span style="width:6mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                         <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[4]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[4]')"/></xsl:attribute>
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>                    
                        </xsl:call-template>
                        <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[4]')"/></xsl:attribute>
                        
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[4]')"/></xsl:attribute>
                        <span style="width:2mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <!-- end Part I separated table format -->
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo"/>
            <xsl:with-param name="containerHeight" select="4"/>
            <xsl:with-param name="containerID" select=" 'OFCctn' "/>
            <xsl:with-param name="imageID" select=" 'OFCimg' "/>
            <xsl:with-param name="buttonID" select=" 'OFCbtn' "/>
          </xsl:call-template>
          <!-- End Part I table -->
          <!-- End Part I -->
        
            <div class="styBB" style="width:187mm">
	         <b>Note:</b><span style="font-weight:normal; padding-left:2mm">
                <i>If corporation has more than 4 partnership interests, continue on separate page. See instructions.</i>
              </span>
            </div>
         
   <div class="pageEnd"/>
   <br/>
           <div style="width:187mm">
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="width:20mm;">Part II</div>
              <div class="styPartDesc" style="width:164mm;">
            Foreign Partner Income and Expenses: Reconciliation to Schedule K-1 (Form 1065)
            <br/>See instructions if reconciling to Schedule K-1 (Forrm 1065-B).
            </div>
            </div>
            <!-- END Part III Title -->
            <!-- Begin Part III Table -->
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/ForeignPartnerInfo) &lt; 5)">
                  <!--For each table with 4 items do the following-->
                  <xsl:for-each select="$FormData/ForeignPartnerInfo">
                    <xsl:if test="position() mod 4 = 1">
                      <!--Table Header-->
                      <tr>
                        <td colspan="2" class="sty1120FSchPTableK1CellMainHeaderSpacer"/>
                        <td colspan="5" class="sty1120FSchPTableK1CellMainHeader">Schedules K-1</td>
                      </tr>
                      <tr>
                        <td colspan="2" class="sty1120FSchPTableK1CellHeaderSpacer">
                          <span style="width:1px"/>
                        </td>
                        <xsl:call-template name="CreateHeader">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastColHeader">Total</td>
                      </tr>
                      <!--Line 15 begin line 1-->
                    <!--Line 1-->
                    
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">1</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
                        <span>Net income (loss) reported on lines 1 through 3, Schedule K-1</span>
                        <span class="sty1120FSchPDotLn">............</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/NetIncome"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/NetIncome"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 2-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">2</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
													Gross income included on lines 1 through 3, Schedule K-1
													<span class="sty1120FSchPDotLn">............</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/GrossIncome"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/GrossIncome"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 3-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">3</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
											Gross effectively connected income (ECI) on lines 1 through 3, Schedule K-1
											<span class="sty1120FSchPDotLn">......</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/GrossECI"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/GrossECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 4-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">4</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
											Other non-interest expenses on lines 1 through 3, Schedule K-1
											<span class="sty1120FSchPDotLn">...........</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherNonInterestExpense"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherNonInterestExpense"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 5-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">5</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
												Non-interest expenses on lines 1 through 3,<br/> Schedule K-1, allocated to gross ECI
												<span class="sty1120FSchPDotLn">....</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/NonIntExpensesAllocToGrossECI"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/NonIntExpensesAllocToGrossECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 6-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">6</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
												Other gross income reported on Schedule <br/>K-1
												<span class="sty1120FSchPDotLn">...............</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherGrossIncomeReported"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherGrossIncomeReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 7-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:2.5mm;">7</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
										    		Other gross ECI reported on Schedule K-1
													<span class="sty1120FSchPDotLn">..</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherGrossECIReported"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherGrossECIReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 8-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">8</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
												Other non-interest expenses reported on <br/>Schedule K-1
												<span class="sty1120FSchPDotLn">............</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherNonIntExpensesReported"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherNonIntExpensesReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 9-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">9</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
												Other non-interest expenses reported on <br/>Schedule K-1 allocated to gross ECI 
												<span class="sty1120FSchPDotLn">....</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherNonIntExpensesAllocToECI"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherNonIntExpensesAllocToECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 10-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">10</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
                        <b>Total gross income.</b> Add lines 2 and 6 
													<span class="sty1120FSchPDotLn">....</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/TotalGrossIncome"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/TotalGrossIncome"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 11-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px">11</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
                        <b>Total gross effectively connected income.  </b>Add lines 3 and 7
												<span class="sty1120FSchPDotLn">............</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/TotalGrossECI"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/TotalGrossECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 12-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD">12</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
											Interest expense on lines 1 through 3, Schedule K-1
											<span class="sty1120FSchPDotLn">...............</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/InterestExpenseIncluded"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/InterestExpenseIncluded"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 13-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD">13</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
												Other interest expense reported on Schedule <br/>K-1, lines 13 and 18
													
												<span class="sty1120FSchPDotLn">.........</span>
																			<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherInterestExpenseReported"/>
									</xsl:call-template>

                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherInterestExpenseReported"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherInterestExpenseReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 14a-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm;">14a</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
                        <b>Total interest expense. </b>Add lines 12 and 13
												<span class="sty1120FSchPDotLn">..</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/TotalInterestExpense"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/TotalInterestExpense"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 14b-->
                    <tr>
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD">
                        <span style="width:3mm; padding-top:1mm;"/>b</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
											Interest expense directly allocable under Regulations section1.882-5(a)(1)(ii)(B).<span style="width:2mm"/>(<b>Note: </b> Include the line 14b total on Schedule I, line 22.) <span class="sty1120FSchPDotLn">.........</span>
                      </td>
                      <xsl:call-template name="CreateTablePaddingTop">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/IntExpnsAllcblSect18825a1iiB"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/IntExpnsAllcblSect18825a1iiB"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 14c-->
                    <tr>
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:2px">
                        <span style="width:3mm; padding-top:1mm;"/>c</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
													Subtract line 14b from line 14a.<span style="width:2mm"/>(<b>Note:</b>
													Enter the line 14c total on Schedule I, line 9, column (b).)
													<span class="sty1120FSchPDotLn">...............</span>
                      </td>
                      <xsl:call-template name="CreateTable14c">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/InterestExpenseNotDrtAllcbl"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol" style="border-bottom-width:2px; padding-top:6mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/InterestExpenseNotDrtAllcbl"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                  </xsl:if>
                  </xsl:for-each>
                </xsl:if>
                <xsl:if test="($Print = $Separated and count($FormData/ForeignPartnerInfo) &gt; 4) or count($FormData/ForeignPartnerInfo) = 0">
                  <!--Table Header-->
                  <tr>
                    <td colspan="2" class="sty1120FSchPTableK1CellMainHeaderSpacer"/>
                    <td colspan="5" class="sty1120FSchPTableK1CellMainHeader">Schedules K-1</td>
                  </tr>
                  <tr>
                    <td colspan="2" class="sty1120FSchPTableK1CellHeaderSpacer">
                      <span style="width:1px"/>
                    </td>
                    <xsl:call-template name="CreateHeader">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastColHeader">Total</td>
                  </tr>
                <!--Line 1-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">1</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Net income (loss) reported on lines 1through 3, Schedule K-1
									<span class="sty1120FSchPDotLn">............</span>
                  </td>
                  <xsl:choose>
                    <xsl:when test="count($FormData/ForeignPartnerInfo) = 0">
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="1"/>
                        <xsl:with-param name="Stop" select="5"/>
                        <xsl:with-param name="TargetNode" select="none"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <td colspan="2" class="sty1120FSchPTableK1Cell" style="width:46mm;text-align:center">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/NetIncome"/>
                        </xsl:call-template>
                      </td>
                      <td class="sty1120FSchPTableK1Cell">
                        <span style="width:1px"/>
                      </td>
                      <td class="sty1120FSchPTableK1Cell">
                        <span style="width:1px"/>
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 2-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">2</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Gross income included on lines 1 through 3, Schedule K-1
									<span class="sty1120FSchPDotLn">............</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">3</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Gross effectively connected income (ECI) on lines 1 through 3, Schedule K-1
									<span class="sty1120FSchPDotLn">......</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 4-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">4</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Other non-interest expenses on lines 1through 3, Schedule K-1
									<span class="sty1120FSchPDotLn">...........</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 5-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">5</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
									Non-interest expenses on lines 1 through 3, Schedule K-1, allocated to gross ECI
									<span class="sty1120FSchPDotLn">....</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:3mm">6</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Other gross income reported on Schedule K-1
								   	</td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 7-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:3mm">7</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
										Other gross ECI reported on Schedule K-1
										<span class="sty1120FSchPDotLn">..</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 8-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">8</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Other non-interest expenses reported on <br/>Schedule K-1
									<span class="sty1120FSchPDotLn">............</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 9-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">9</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
										Other non-interest expenses reported on <br/>Schedule K-1 allocated to ECI 
										<span class="sty1120FSchPDotLn">......</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">10</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
                    <b>Total gross income.</b> Add lines 2 and 6 
									<span class="sty1120FSchPDotLn">....</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 11-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px">11</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
                    <b>Total gross effectively connected</b>
                    <b>income. </b>Add lines 3 and 7
									<span class="sty1120FSchPDotLn">............</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 12-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD">12</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Interest expense on lines 1 through 3, Schedule K-1
									<span class="sty1120FSchPDotLn">...............</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 13-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD">13</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Other interest expense reported on Schedule<br/> K-1, lines 13 and 18
									<span class="sty1120FSchPDotLn">..........</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 14a-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">14a</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
                    <b>Total interest expense. </b>Add lines 12 and 13
										<span class="sty1120FSchPDotLn">..</span>
                  </td>
                  <xsl:call-template name="CreateTable">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 14b-->
                <tr>
                  <td valign="top" class="sty1120FSchPTableK1CellNumSD">
                    <span style="width:3mm; padding-top:1mm;"/>b</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Interest expense directly allocable under Temporary<br/>Regulations section
				                	1.882-5(a)(1)(ii)(B). <br/>	(<b>Note:</b> Include the
				                 	line 14b total on Schedule I, line 22.)
										<span class="sty1120FSchPDotLn">..............</span>
                  </td>
                  <xsl:call-template name="CreateTablePaddingTop">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 14c-->
                <tr>
                  <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:2px">
                    <span style="width:3mm; padding-top:1mm;"/>c</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
										Subtract line 14b from line 14a.<span style="width:2mm"/> (<b>Note:</b>
										Enter the line 14c total on Schedule I, line 9, column (b).)
										<span class="sty1120FSchPDotLn">...............</span>
                  </td>
                  <xsl:call-template name="CreateTable14c">
                    <xsl:with-param name="Start" select="1"/>
                    <xsl:with-param name="Stop" select="5"/>
                    <xsl:with-param name="TargetNode" select="none"/>
                  </xsl:call-template>
                  <td class="sty1120FSchPTableK1CellLastCol" style="border-bottom-width:2px">
                    <span style="width:1px"/>
                  </td>
                </tr>
              </xsl:if>
              </tbody>
            </table>
          </div>          
          <!-- page break and footer-->
          <div style="width:187mm;padding-top:1mm">
            <div style="float:left;">
              <span class="styBoldText" style="width:95mm;">For Paperwork Reduction Act Notice, see <br/>the Instructions for Form 1120-F.</span>
             </div>
              <span style="font-size:6pt">Cat. No. 49677Z</span>
            
           
              <span style="width:32mm"/>
              <span style="font-weight:bold; font-size:6pt">Schedule P (Form 1120-F) 2010</span>
          
          </div>
          <div class="pageEnd"/>
          <!-- end page break and footer  -->
          <!-- begin page 2 -->
          <!-- page header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Schedule P (Form 1120-F) 2010<span style="width:100mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- end page header -->
          <!-- Begin Part III Title -->
          <div style="width:187mm">
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="width:20mm;">Part III</div>
              <div class="styPartDesc" style="width:164mm;">
            Foreign Partner&#8217;s Average Outside Basis Under Regulations sections 1.882-5(b) and 1.884-1(d)(3)
            </div>
            </div>
            <!-- END Part III Title -->
            <!-- Begin Part III Table -->
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/ForeignPartnerInfo) &lt; 5)">
                  <!--For each table with 4 items do the following-->
                  <xsl:for-each select="$FormData/ForeignPartnerInfo">
                    <xsl:if test="position() mod 4 = 1">
                      <!--Table Header-->
                      <tr>
                        <td colspan="2" class="sty1120FSchPTableK1CellMainHeaderSpacer"/>
                        <td colspan="5" class="sty1120FSchPTableK1CellMainHeader">Schedules K-1ggggg</td>
                      </tr>
                      <tr>
                        <td colspan="2" class="sty1120FSchPTableK1CellHeaderSpacer">
                          <span style="width:1px"/>
                        </td>
                        <xsl:call-template name="CreateHeader">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastColHeader">Total</td>
                      </tr>
                      <!--Line 15-->
                      <tr>
                        <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;">15</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
												Section 705 outside basis	
												<span class="sty1120FSchPDotLn">.......</span>
												<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/Section705OutsideBasis"/>
									</xsl:call-template>

                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/Section705OutsideBasis"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/Section705OutsideBasis"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 16a-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">16a</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
					                         		Partner&#8217;s liabilities included in outside basis under section
					                         		 752 that give rise to directly allocable interest expense
					                         		  under Temporary Regulations section 1.882-5(a)(1)(ii)(B)
						
														<span class="sty1120FSchPDotLn">..</span>
                        </td>
                        <xsl:call-template name="CreateTablePaddingTop">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerLiabUnderSect18825a1iiB"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerLiabUnderSect18825a1iiB"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 16b-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">
                          <span style="width:3.5mm"/>b</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
													All other liabilities included in partner&#8217;s outside basis under section 752
													<span class="sty1120FSchPDotLn">........</span>
                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherLiabilitiesIncluded"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/OtherLiabilitiesIncluded"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 16c-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">
                          <span style="width:3.5mm"/>c</td>
                        <td class="sty1120FSchPTableK1Desc" style="padding-bottom:1.5mm" scope="row">
                          <div style="text-align-last:justify">
								Add lines 16a and 16b
									<span class="sty1120FSchPDotLn">........</span>
                          </div>
                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/SumOfLiabilitiesUnderSect752"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/SumOfLiabilitiesUnderSect752"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 16d-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">
                          <span style="width:3.5mm"/>d</td>
                        <td class="sty1120FSchPTableK1Desc" style="padding-bottom:1.5mm" scope="row">
                          <div style="text-align-last:justify">
								Subtract line 16c from line 15
									<span class="sty1120FSchPDotLn">.....</span>
                          </div>
                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OutsideBasisLessSect752Liab"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/OutsideBasisLessSect752Liab"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 17-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="
												  padding-top:1mm">17</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
                          <!--				****one*****    -->
			             							Partner&#8217;s liabilities under Regulations 
						                         	section 1.884-1(d)(3)(vi).
						                         	<span style="width:2mm"/>(<b>Note: </b>Enter the 
				                         			line 17 total on Schedule I, line 8, column (b).)
										     		<span class="sty1120FSchPDotLn">...............</span>
                        </td>
                        <xsl:call-template name="CreateTablePaddingTop">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerLiabUnderSect18841d3vi"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerLiabUnderSect18841d3vi"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 18-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:3.5mm">18</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
                          <b>Partner&#8217;s outside basis under Regulations section 
												      1.884-1(d)(3)(vi).</b>  Add lines 16d and 17
												</td>
                        <xsl:call-template name="CreateTablePaddingTop">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerBasisUnderSect18841d3vi"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerBasisUnderSect18841d3vi"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 19-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">19</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
													Partner&#8217;s outside basis allocable to ECI
						                            under Regulations section 1.884-1(d)(3)(i).<span style="width:2mm"/>
						                            (<b>Note: </b>Enter the line 19 total on Schedule I, line 5, column (b).)		
													<span class="sty1120FSchPDotLn">............</span>
                        </td>
                        <xsl:call-template name="CreateTablePaddingTop">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerOutsideBasisAllcblToECI"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerOutsideBasisAllcblToECI"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 20-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2mm; border-bottom-width:2px">20</td>
                        <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
												Enter &#8220;income&#8221;or &#8220;asset&#8221;to indicate the <br/>allocation method used on line 19<br/> (see instructions)
												<span class="sty1120FSchPDotLn">..........</span>
                        </td>
                        <xsl:call-template name="CreateTable20">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/AllocationMethodUsed"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="border-bottom-width:2px; padding-top:9mm">
                          <span style="width:1px"/>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:if>
                <xsl:if test="($Print = $Separated and count($FormData/ForeignPartnerInfo) &gt; 4) or count($FormData/ForeignPartnerInfo) = 0">
                  <!--Table Header-->
                  <tr>
                    <td colspan="2" class="sty1120FSchPTableK1CellMainHeaderSpacer"/>
                    <td colspan="5" class="sty1120FSchPTableK1CellMainHeader">Schedules K-1</td>
                  </tr>
                  <tr>
                    <td colspan="2" class="sty1120FSchPTableK1CellHeaderSpacer">
                      <span style="width:1px"/>
                    </td>
                    <xsl:call-template name="CreateHeader">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastColHeader">Total</td>
                  </tr>
                  <!--Line 15-->
                  <tr>
                    <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;">15</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
											Section 705 outside basis
												<span class="sty1120FSchPDotLn">.......</span>
                    </td>
                    <xsl:choose>
                      <xsl:when test="count($FormData/ForeignPartnerInfo) = 0">
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="1"/>
                          <xsl:with-param name="Stop" select="5"/>
                          <xsl:with-param name="TargetNode" select="none"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <td colspan="2" class="sty1120FSchPTableK1Cell" style="width:46mm;text-align:center">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/Section705OutsideBasis"/>
                          </xsl:call-template>
                        </td>
                        <td class="sty1120FSchPTableK1Cell">
                          <span style="width:1px"/>
                        </td>
                        <td class="sty1120FSchPTableK1Cell">
                          <span style="width:1px"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 16a-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">16a</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
											Partner&#8217;s liabilities included in outside 
		                              		basis under section 752 that give rise to
	                            			directly allocable interest expense under
                            				Regulations section 1.882-5(a)(1)(ii)(B)							
                             				<span class="sty1120FSchPDotLn">......</span>
                    </td>
                    <xsl:call-template name="CreateTablePaddingTop">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 16b-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">
                      <span style="width:3.5mm"/>b</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
											All other liabilities included in partner&#8217;s outside basis under section 752
											<span class="sty1120FSchPDotLn">........</span>
                    </td>
                    <xsl:call-template name="CreateTable">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 16c-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2mm;">
                      <span style="width:3.5mm"/>c</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
										Add lines 16a and 16b
										<span class="sty1120FSchPDotLn">.........</span>
                    </td>
                    <xsl:call-template name="CreateTable">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 16d-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;">
                      <span style="width:3.5mm"/>d</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
											Subtract line 16c from line 15
										<span class="sty1120FSchPDotLn">......</span>
                    </td>
                    <xsl:call-template name="CreateTable">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 17-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">17</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
                      <!-- *****two *****-->
										Partner&#8217;s liabilities under Regulations section 1.884-1(d)(3)(vi). 
											(<b>Note: </b> Enter the line 17 total on Schedule I, line 8, column (b).)	
											<span class="sty1120FSchPDotLn">..............</span>
                    </td>
                    <xsl:call-template name="CreateTable">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 18-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">18</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
                      <b>Partner&#8217;s outside basis under Regulations section 1.884-1(d)(3)(vi).</b>
										  Add lines 16d and 17
										<span class="sty1120FSchPDotLn">...</span>
                    </td>
                    <xsl:call-template name="CreateTable">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 19-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">19</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
											Partner&#8217;s outside basis allocable to ECI under Regulations section 
											1.884-1(d)(3)(i).<span style="width:2mm"/>(<b>Note: </b>Enter the line 19 total on Schedule
											I, line 5, column (b).)	
												<span class="sty1120FSchPDotLn">............</span>
                    </td>
                    <xsl:call-template name="CreateTable">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                  <!--Line 20-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm; border-bottom-width:2px">20</td>
                    <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
												Enter &#8220;income&#8221;or &#8220;asset&#8221;to indicate the <br/>allocation method used on line 19
													(see <br/>instructions)	
												<span class="sty1120FSchPDotLn">............</span>
                    </td>
                    <xsl:call-template name="CreateTable20">
                      <xsl:with-param name="Start" select="1"/>
                      <xsl:with-param name="Stop" select="5"/>
                      <xsl:with-param name="TargetNode" select="none"/>
                    </xsl:call-template>
                    <td class="sty1120FSchPTableK1CellLastCol" style="border-bottom-width:2px">
                      <span style="width:1px"/>
                    </td>
                  </tr>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <!-- page break and footer-->
          <div style="width:187mm;padding-top:0.5mm;">
            <div style="float:left;">
              <span class="styBoldText"/>
              <span style="width:13mm;"/>
            </div>
            <div style="float:right;">
              <span style="width:40px;"/>
              <span class="styBoldText">Schedule P (Form 1120-F) 2010</span>
            </div>
          </div>
          <div class="pageEnd"/>
          <!-- end page break and footer  -->
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
			Additional Data        
		</div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
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
          <!-- begin additional separated data for Part I -->
          <xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInfo) &gt; 4) ">
            <br/>
            <span class="styRepeatingDataTitle">Form 1120F Schedule P, Part I&#8212;List of Foreign Partner Interests in Partnerships</span>
            <br/>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
                <tr class="styDepTblHdr">
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:60mm" colspan="2">
				(a)</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
				(b)</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:40mm; border-right-width:1px">
				(c)</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
				(d)</th>
                </tr>
                <tr>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:60mm" colspan="2">
					Name of partnership</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
					Address</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:40mm; border-right-width:1px">
					EIN</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
					For each partnership, is the foreign corporation&#8217;s distributive share treated as ECI,
					in whole or in part, with respect to a U.S. trade or business as derermined under section 875 (see instructions)?</th>
                </tr>
                <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$FormData/ForeignPartnerInfo">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styTableCellText" style="width:4mm; border-right-width:0px; font-weight:bold">
                      <xsl:number format="A" value="position()"/>
                    </td>
                    <!--Name-->
                    <td class="styTableCellText" style="width:56mm">
                      <span style="float:none;text-align:left;font-weight:normal">
                        <xsl:choose>
                          <xsl:when test="PartnerName">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PartnerName"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:when test="PartnerBusinessName/BusinessNameLine1">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine1"/>
                            </xsl:call-template>
                            <xsl:if test="PartnerBusinessName/BusinessNameLine2">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine2"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </td>
                    <!--Address-->
                    <td class="styTableCellTextSeparatedData">
                      <xsl:choose>
                        <xsl:when test="PartnerUSAddress">
                          <xsl:call-template name="PopulateUSAddressTemplate">
                            <xsl:with-param name="TargetNode" select="PartnerUSAddress"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="PartnerForeignAddress">
                          <xsl:call-template name="PopulateForeignAddressTemplate">
                            <xsl:with-param name="TargetNode" select="PartnerForeignAddress"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <span style="width:1px"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <!-- EIN -->
                    <td class="styTableCellText" style="text-align:center">
                      <xsl:choose>
                        <xsl:when test="PartnerEIN">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="PartnerEIN"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="MissingEINReason">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <span style="width:1px"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <!--Address1-->
                    <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                    <td class="styTableCell" style="border-left-width:1px;border-color:black">
                      <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInfo)
												  and position() &gt;3">border-bottom-width:0px</xsl:when><xsl:otherwise/></xsl:choose></xsl:attribute>
                      <span style="width:6mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                           <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <span style="width:2mm;"/>Yes   
	                                                </label>
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedAsECI"/>
                          <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <span style="width:2mm"/>No
	                                                </label>
                      <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- end additional separated data for Part I -->
          <!-- begin additional separated data for Part II -->
          <xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInfo) &gt; 4) ">
            <br/>
            <span class="styRepeatingDataTitle">Form 1120F Schedule P, Part II&#8212;Foreign Partner Income and Expenses: Reconciliation to Schedule K-1 (Form 1065)</span>
            <br/>
            <table class="styDepTbl" cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--For each table with 4 items do the following-->
                <xsl:for-each select="$FormData/ForeignPartnerInfo">
                  <xsl:if test="position() mod 4 = 1">
                    <!--Table Header-->
                    <tr class="styDepTblHdr">
                      <td colspan="2" class="sty1120FSchPTableK1CellMainHeaderSpacer"/>
                      <td colspan="5" class="sty1120FSchPTableK1CellMainHeader">Schedules K-1</td>
                    </tr>
                    <tr class="styDepTblHdr">
                      <td colspan="2" class="sty1120FSchPTableK1CellHeaderSpacer">
                        <span style="width:1px"/>
                      </td>
                      <xsl:call-template name="CreateHeader">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastColHeader">Total</td>
                    </tr>
                    <!--Line 1-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;">1</td>
                      <td class="sty1120FSchPTableK1Desc">
												Net income (loss) reported on lines 1through 3, Schedule K-1
											<span class="sty1120FSchPDotLn">...........</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/NetIncome"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/NetIncome"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 2-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">2</td>
                      <td class="sty1120FSchPTableK1Desc">
												Gross income included on lines 1	through 3, Schedule K-1
											<span class="sty1120FSchPDotLn">...........</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/GrossIncome"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/GrossIncome"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 3-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">3</td>
                      <td class="sty1120FSchPTableK1Desc">
											Gross effectively connected income (ECI) on lines 1 through 3, Schedule K-1
											<span class="sty1120FSchPDotLn">...</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/GrossECI"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/GrossECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 4-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">4</td>
                      <td class="sty1120FSchPTableK1Desc">
												Other non-interest expenses on lines 1 through 3, Schedule K-1
											<span class="sty1120FSchPDotLn">.......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherNonInterestExpense"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherNonInterestExpense"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 5-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">5</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
								      		Non-interest expenses on lines 1 through 3, Schedule K-1, allocated to gross ECI
											<span class="sty1120FSchPDotLn">...</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/NonIntExpensesAllocToGrossECI"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/NonIntExpensesAllocToGrossECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 6-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">6</td>
                      <td class="sty1120FSchPTableK1Desc">
											Other gross income reported on Schedule K-1
											
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherGrossIncomeReported"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherGrossIncomeReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 7-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:3mm;">7</td>
                      <td class="sty1120FSchPTableK1Desc">
											Other gross ECI reported on Schedule K-1
											<span class="sty1120FSchPDotLn">..</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherGrossECIReported"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherGrossECIReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 8-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">8</td>
                      <td class="sty1120FSchPTableK1Desc">
											Other non-interest expenses reported on Schedule K-1
										<span class="sty1120FSchPDotLn">...........</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherNonIntExpensesReported"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherNonIntExpensesReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 9-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">9</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
											Other non-interest expenses reported <br/>on Schedule K-1 allocated to ECI 
											<span class="sty1120FSchPDotLn">.....</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherNonIntExpensesAllocToECI"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherNonIntExpensesAllocToECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 10-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD">10</td>
                      <td class="sty1120FSchPTableK1Desc">
                        <b>Total gross income.</b> Add lines 2 	and 6 
										
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/TotalGrossIncome"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/TotalGrossIncome"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  -->
                    <!--Line 11-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px">11</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
                        <b>Total gross effectively connected</b>
                        <b>income. </b>Add lines 3 and 7
													<span class="sty1120FSchPDotLn">............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/TotalGrossECI"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/TotalGrossECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 12-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD">12</td>
                      <td class="sty1120FSchPTableK1Desc">Interest expense on lines 1 through 3, Schedule K-1
			          </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/InterestExpenseIncluded"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/InterestExpenseIncluded"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 13-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD">13</td>
                      <td class="sty1120FSchPTableK1Desc">
											Other interest expense reported on Schedule<br/> K-1, lines 13 and 18
											<span class="sty1120FSchPDotLn">.........</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherInterestExpenseReported"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherInterestExpenseReported"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 14a-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">14a</td>
                      <td class="sty1120FSchPTableK1Desc">
                        <b>Total interest expense. </b>Add lines 12 and 13
											<span class="sty1120FSchPDotLn">..............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/TotalInterestExpense"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/TotalInterestExpense"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 14b-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD">
                        <span style="width:3mm; padding-top:1mm"/>b</td>
                      <td class="sty1120FSchPTableK1Desc">
												Interest expense directly allocable 
				                				under <br/>Regulations section
							                	1.882-5(a)(1)(ii)(B). <span style="width:2mm"/>  (<b>Note:</b> Include the
				                				line 14b total on Schedule I, line 22.)
				                					<span class="sty1120FSchPDotLn">.............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3Padding">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/IntExpnsAllcblSect18825a1iiB"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC" style="padding-top:9mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/IntExpnsAllcblSect18825a1iiB"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 14c-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px">
                        <span style="width:3mm; padding-top:1mm;"/>c</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
												Subtract line 14b from line 14a.<span style="width:2mm"/>(<b>Note:</b>
												Enter the line 14c total on Schedule I,  line 9, column (b).)
												<span class="sty1120FSchPDotLn">...............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4Padding">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/InterestExpenseNotDrtAllcbl"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:6mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/InterestExpenseNotDrtAllcbl"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- end additional separated data for Part II -->
          <!-- begin additional separated data for Part III -->
          <xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInfo) &gt; 4) ">
            <br/>
            <span class="styRepeatingDataTitle">
	        	Form 1120F Schedule P, Part III&#8212;Foreign Partner&#8217;s Average Outside Basis Under Regulations sections 1.882-5(b) and 1.884-1(d)(3)
	        </span>
            <br/>
            <table class="styDepTbl" cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--For each table with 4 items do the following-->
                <xsl:for-each select="$FormData/ForeignPartnerInfo">
                  <xsl:if test="position() mod 4 = 1">
                    <!--Table Header-->
                    <tr class="styDepTblHdr">
                      <td colspan="2" class="sty1120FSchPTableK1CellMainHeaderSpacer"/>
                      <td colspan="5" class="sty1120FSchPTableK1CellMainHeader">Schedules K-1</td>
                    </tr>
                    <tr class="styDepTblHdr">
                      <td colspan="2" class="sty1120FSchPTableK1CellHeaderSpacer">
                        <span style="width:1px"/>
                      </td>
                      <xsl:call-template name="CreateHeader">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastColHeader">Total</td>
                    </tr>
                    <!--Line 15-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;">15</td>
                      <td class="sty1120FSchPTableK1Desc">
									    	Section 705 outside basis	
											<span class="sty1120FSchPDotLn">.......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/Section705OutsideBasis"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/Section705OutsideBasis"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 16a-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">16a</td>
                      <td class="sty1120FSchPTableK1Desc">
		                     					Partner&#8217;s liabilities included in outside 
			                     				basis under section 752 that give rise to
                     							directly allocable interest expense under
                     							Regulations section 1.882-5(a)(1)(ii)(B)
												<span class="sty1120FSchPDotLn">......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4Padding9mm">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerLiabUnderSect18825a1iiB"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:9mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerLiabUnderSect18825a1iiB"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 16b-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;">
                        <span style="padding-left:3mm"/>b</td>
                      <td class="sty1120FSchPTableK1Desc">
												All other liabilities included in partner&#8217;s<br/> outside basis under section 752
												<span class="sty1120FSchPDotLn">.....</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OtherLiabilitiesIncluded"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OtherLiabilitiesIncluded"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 16c-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm;">
                        <span style="padding-left:3mm"/>c</td>
                      <td class="sty1120FSchPTableK1Desc">
												Add lines 16a and 16b
											<span class="sty1120FSchPDotLn">........</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/SumOfLiabilitiesUnderSect752"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/SumOfLiabilitiesUnderSect752"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 16d-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm;">
                        <span style="padding-left:3mm"/>d</td>
                      <td class="sty1120FSchPTableK1Desc">
										    	Subtract line 16c from line 15
												<span class="sty1120FSchPDotLn">.....</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/OutsideBasisLessSect752Liab"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/OutsideBasisLessSect752Liab"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 17-->
                    <!--*****three *** -->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">17</td>
                      <td class="sty1120FSchPTableK1Desc">
									Partner&#8217;s liabilities under Regulations  section 1.884-1(d)(3)(vi).
									<span style="width:2mm"/>(<b>Note: </b>Enter the 17 total on Schedule I, line 8, column (b).)	
												<span class="sty1120FSchPDotLn">.............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4Padding9mm">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerLiabUnderSect18841d3vi"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:9mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerLiabUnderSect18841d3vi"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 18-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">18</td>
                      <td class="sty1120FSchPTableK1Desc">
                        <b>Partner&#8217;s outside basis under Regulations <br/>section 1.884-1(d)(3)(vi).</b>
											Add lines 16d and 17
									    	<span class="sty1120FSchPDotLn">...............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3Padding6">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerBasisUnderSect18841d3vi"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC" style="padding-top:6mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerBasisUnderSect18841d3vi"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 19-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">19</td>
                      <td class="sty1120FSchPTableK1Desc">
												Partner&#8217;s outside basis allocable to ECI
	                     						under Regulations section 1.884-1(d)(3)(i).  (<b>Note: </b>Enter the line 19 total on  Schedule I, line 5, column (b).)		
												<span class="sty1120FSchPDotLn">............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4Padding9mm">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/PartnerOutsideBasisAllcblToECI"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:9mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/Total/PartnerOutsideBasisAllcblToECI"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 20-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm; border-bottom-width:1px">20</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
											Enter &#8220;income&#8221;or &#8220;asset&#8221;to indicate the allocation method used on line 19
									        (see instructions)	
										    <span class="sty1120FSchPDotLn">............</span>
                      </td>
                      <xsl:call-template name="CreateTableDep20">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInfo/AllocationMethodUsed"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC" style="border-bottom-width:1px">
                        <span style="width:1px"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- end additional separated data for Part III -->
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="CreateHeader">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="sty1120FSchPTableK1CellHeader">
        <xsl:number format="A" value="$Start"/>
      </td>
      <xsl:call-template name="CreateHeader">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTable">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="sty1120FSchPTableK1Cell">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTable">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTablePaddingTop">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="sty1120FSchPTableK1Cell" style="padding-top:9mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTablePaddingTop">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTable14c">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="sty1120FSchPTableK1Cell" style="border-bottom-width:2px; padding-top:6mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTable14c">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTable20">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="sty1120FSchPTableK1Cell" style="border-bottom-width:2px; text-align:left; padding-left:1mm; padding-top:9mm">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTable20">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTableDep20">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow3" style="border-bottom-width:1px; text-align:left; padding-left:1mm; padding-top:6mm">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDep20">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTableDepRow3">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow3" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDepRow3">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTableDepRow3Padding">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow3" style="border-bottom-width:1px; text-align:right; padding-left:1mm;padding-top:9mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDepRow3Padding">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTableDepRow3Padding6">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow3" style="border-bottom-width:1px; text-align:right; padding-left:1mm;padding-top:6mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDepRow3Padding6">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTableDepRow4">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow4" style="border-bottom-width:1px; text-align:right; padding-left:1mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDepRow4">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTableDepRow4Padding">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow4" style="border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:6mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDepRow4Padding">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="CreateTableDepRow4Padding9mm">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow4" style="border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:9mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDepRow4Padding9mm">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
