<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FSchedulePStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest   -->
  <xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleP"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
                  <th rowspan="2" class="sty1120FSchPFTBox" style="width:119mm;float:none;" scope="col">
                    <div class="sty1120FSchPMainTitle">
			List of Foreign Partner Interests in Partnerships
			</div>
                    <div class="styFST" style="padding-top:0.5mm">
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
		                                	Attach to Form 1120-F.
			                                 <br/>
                      <span style="padding-left:3.83mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
			Information
   about Schedule P (Form 1120-F) and its separate instructions is available 
   at 
   <a href="http://www.irs.gov/form1120f">
             <i>www.irs.gov/form1120f.</i></a>
  			</div>
                  </th>
                  <!--OMB/Tax Year-->
                  <th class="sty1120FSchPOMB" style="width:32mm" scope="col">OMB No. 1545-0126</th>
                </tr>
                <tr>
                  <td class="sty1120FSchPTY">20<span class="styTYColor">13</span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End header-->
          			<xsl:variable name="DistributiveShareTreatedAsECIID">
						<xsl:call-template name="PopulateID">
							<xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
						</xsl:call-template>
					</xsl:variable>
          <!--Begin Name/EIN-->
          <div style="width:187mm;clear:all">
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
                <xsl:when test="normalize-space($FormData/MissingEINReasonCd) != ''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
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
                <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp"/>
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
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:60mm" colspan="2">
					(a) Name of partnership</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
					(b) Address</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:40mm; border-right-width:1px">
					(c) EIN</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm;                                       border-right-width:0px;text-align:left;padding-left:2mm">
					(d) For each partnership, is the foreign corporations distributive share ECI, or treated as ECI, 
					in whole or in part, with a U.S. trade or business determined under section 875 (see instructions)?</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:if test="($Print != $Separated) or (count($FormData/ForeignPartnerInformationGrp) &lt;= 4) ">
                  <xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
                    <tr>
                      <!--Line number-->
                      <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px;float:none;clear:none;">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInformationGrp) and position() &gt;3">width:4mm; border-right-width:0px; border-bottom-width:0px</xsl:when><xsl:otherwise>width:4mm; border-right-width:0px;</xsl:otherwise></xsl:choose></xsl:attribute>
                        <xsl:number format="A" value="position()"/>
                      </td>
                      <!--Name-->
                      <td class="sty1120FSchPTableCellData" style="width:56mm;float:none;clear:none;">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInformationGrp) and position() &gt;3">width:56mm; border-bottom-width:0px</xsl:when><xsl:otherwise>width:56mm;</xsl:otherwise></xsl:choose></xsl:attribute>
                        <span style="float:none;text-align:left;font-weight:normal">
                          <xsl:choose>
                            <xsl:when test="PartnerPersonNm">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="PartnerPersonNm"/>
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
                      <td class="sty1120FSchPTableCellDataLF" style="float:none;clear:none;">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInformationGrp) and position() &gt;3">border-bottom-width:0px</xsl:when><xsl:otherwise/></xsl:choose></xsl:attribute>
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
                      <td class="sty1120FSchPTableCellDataLF" style="float:none;clear:none;">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() =              count($FormData/ForeignPartnerInformationGrp) and position() &gt;3">
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
                                <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                              </xsl:call-template>
                              <span style="width:1px"/>
                            </span>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                      <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                      <!--Foreign Corp -->
                      <!-- this variable will be used to create a unique id for ConsolidatedGroup2 -->
                      <td class="sty1120FSchPTableCellDataRG" scope="row" style="border-left-width:1px;float:none;clear:none;">
                        <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInformationGrp)                                       and position() &gt;3">border-bottom-width:1px
											    </xsl:when><xsl:otherwise/></xsl:choose></xsl:attribute>
                        <span style="width:6mm"/>
                        <input type="checkbox" class="styCkbox" name="InitialReturn">
                          <xsl:call-template name="PopulateYesCheckbox">
                                <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                                <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                          </xsl:call-template>
                          <!--  <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                        </input>
                        <label>
                          <xsl:call-template name="PopulateLabelYes">
                             <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                             <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                             </xsl:call-template>
                          <!--xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                        </label>
	                        <span style="width:2mm;"/>Yes  
                            <span style="width:5mm"/>
                        <input type="checkbox" class="styCkbox" name="InitialReturn">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                            <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                          </xsl:call-template>
                          <!--<xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
                        </input>
                        <label>
                          <xsl:call-template name="PopulateLabelNo">
                            <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
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
                <xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 1 or          ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm;float:none;clear:none;            border-right-width:0px;">A</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm;float:none;clear:none;">
                      <xsl:if test="((count($FormData/ForeignPartnerInformationGrp) &gt; 4)             and ($Print = $Separated))">
                        <span style="float:none;text-align:left;font-weight:normal">
                          <xsl:choose>
                            <xsl:when test="$FormData/ForeignPartnerInformationGrp/PartnerPersonNm">
                              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerPersonNm"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="$FormData/ForeignPartnerInformationGrp/PartnerBusinessName/BusinessNameLine1">
                              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerBusinessName/BusinessNameLine1"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </span>
                      </xsl:if>
                      <span style="width:1px"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF" style="float:none;clear:none;">
                      <span style="width:1mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG" style="float:none;clear:none;">
                      <span style="width:1mm"/>
                    </td>
                    <td class="styTableCell" scope="row" style="border-left-width:1px;border-color:black; float:none;clear:none;                 border-right-width:0px;">
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <!--<xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                       <!-- <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[1]')"/></xsl:attribute>-->
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:4mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn" scope="row">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                       <!-- <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                      <!--  <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[1]')"/></xsl:attribute>-->
                        <span style="width:1mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 2  or ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px;float:none;clear:none;">B</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm;float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF" style="float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG" style="float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="styTableCell" style="border-right-width:0px;border-left-width:1px;border-color:black;float:none;clear:none;" scope="row">
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[2]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                         <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[2]')"/></xsl:attribute>
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:4mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                         <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[2]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                         <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[2]')"/></xsl:attribute>
                        <span style="width:1mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 3           or ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px;float:none;clear:none;">C</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm;float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF" style="float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG" style="float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="styTableCell" scope="row" style="border-right-width:0px;border-left-width:1px;border-color:black;float:none;clear:none;">
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[3]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                       </xsl:call-template>
                         <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[3]')"/></xsl:attribute>
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:4mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>                     
                        </xsl:call-template>
                         <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[3]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[3]')"/></xsl:attribute>
                        <span style="width:1mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($FormData/ForeignPartnerInformationGrp)&lt; 4           or ((count($FormData/ForeignPartnerInformationGrp) &gt; 4) and ($Print = $Separated))">
                  <tr>
                    <td class="sty1120FSchPTableCellData" style="width:4mm; border-right-width:0px; border-bottom-width:0px;float:none;clear:none;">D</td>
                    <td class="sty1120FSchPTableCellData" style="width:56mm; border-bottom-width:0px;float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataLF" style="border-bottom-width:0px;float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="sty1120FSchPTableCellDataRG" style="border-bottom-width:0px;float:none;clear:none;">
                      <span style="width:2mm"/>
                    </td>
                    <td class="styTableCell" scope="row" style="border-right-width:0px;border-left-width:1px;border-color:black;border-bottom-width:0px;float:none;clear:none;">
                      <span style="width:5mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                         <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[4]')"/></xsl:attribute>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'Yes[4]')"/></xsl:attribute>
                        <span style="width:2mm"/>Yes   
	                                                </label>
                      <span style="width:4mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>                    
                        </xsl:call-template>
                        <xsl:attribute name="id"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[4]')"/></xsl:attribute>
                       </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchPDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <xsl:attribute name="for"><xsl:value-of select="concat($DistributiveShareTreatedAsECIID, 'No[4]')"/></xsl:attribute>
                        <span style="width:1mm"/>No
	                                                </label>
                    </td>
                  </tr>
                </xsl:if>
                <!-- end Part I separated table format -->
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp"/>
            <xsl:with-param name="containerHeight" select="4"/>
            <xsl:with-param name="containerID" select=" 'OFCctn' "/>
            <xsl:with-param name="imageID" select=" 'OFCimg' "/>
            <xsl:with-param name="buttonID" select=" 'OFCbtn' "/>
          </xsl:call-template>
          <!-- End Part I table -->
          <!-- End Part I -->
						<div class="styBB" style="width:187mm;clear:all;font-size:8pt;">
	         <b>Note:</b><span style="font-weight:normal; padding-left:2mm">
                <i>If corporation has more than 4 partnership interests, continue on separate page. See instructions.</i>
              </span>
            </div>
    <!--div class="pageEnd"/-->
					<!--					<div class="styGenericDiv" style="width:187mm;">
-->
					<div style="width:187mm;">
            <div class="styBB" style="width:187mm;border-top-width:1px;">
              <div class="styPartName" style="width:20mm;">Part II</div>
              <div class="styPartDesc" style="width:164mm;height:auto;">
            Foreign Partner Income and Expenses: Reconciliation to Schedule K-1 (Form 1065) <br/> See instructions if reconciling to Schedule K-1 (Form 1065-B).
            </div>
            </div>
            <!-- END Part III Title -->
            <!-- Begin Part III Table -->
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &lt; 5)">
                  <!--For each table with 4 items do the following-->
                  <xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
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
                        Net income (loss) reported on lines 1 <span style="float:left;">through 3, Schedule K-1</span>
                        <span class="sty1120FSchPDotLn" style="float:right;">.............</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/NetIncomeAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/NetIncomeAmt"/>
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
													Gross income included on lines 1 through <span style="float:left;">3, Schedule K-1</span>
						<span class="sty1120FSchPDotLn" style="float:right;">..................</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossIncomeAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossIncomeAmt"/>
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
						  Gross effectively connected income <span style="float:left;">(ECI) on lines 1 through 3, Schedule K-1</span>
						  <span class="sty1120FSchPDotLn" style="float:right;">.</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossECIAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossECIAmt"/>
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
						Non-interest expenses on lines 1 through <span style="float:left;">3, Schedule K-1</span>
						<span class="sty1120FSchPDotLn" style="float:right;">..................</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="
             $FormData/ForeignPartnerInformationGrp/NonInterestExpenseAmt"/>  
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="
    $FormData/TotalGrp/NonInterestExpenseAmt"/>                        
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:0px; padding-left:2.5mm">5</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:0px" scope="row">
						Non-interest expenses on lines 1 through <span style="float:left;">3, Schedule K-1, allocated to gross ECI</span>
												<span class="sty1120FSchPDotLn" style="float:right;">.</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/NonIntExpnssAllocGroECIAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/NonIntExpnssAllocGroECIAmt"/>
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">6</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
						Net income (loss) reported on Schedule <span style="float:left;">K-1, other than on lines 1 through 3.</span>
						<span class="sty1120FSchPDotLn" style="float:right;">...</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherNetIncomeAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="
 $FormData/TotalGrp/OtherNetIncomeAmt"/>                            
                              
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">7</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
												Other gross income reported on Schedule K-1
						<span class="sty1120FSchPDotLn" style="float:right;">.</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherGrossIncomeReportedAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherGrossIncomeReportedAmt"/>
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:2.5mm;">8</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
										    		Other gross ECI reported onSchedule K-1
						<span class="sty1120FSchPDotLn" style="float:right;">..</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherGrossECIReportedAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherGrossECIReportedAmt"/>
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">9</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
												Other non-interest expenses reported on <span style="float:left;">Schedule K-1</span>
						<span class="sty1120FSchPDotLn" style="float:right;">...................</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherNonInterestExpensesRptAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherNonInterestExpensesRptAmt"/>
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px;">10</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
												Other non-interest expenses reported on <span style="float:left;">Schedule K-1 allocated to gross ECI </span>
						<span class="sty1120FSchPDotLn" style="float:right;">....</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherNonIntExpnssAllocECIAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherNonIntExpnssAllocECIAmt"/>
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">11</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
						  <span style="float:left;">
							  <b>Total gross income.</b> Add lines 2 and 7
						  </span>
						<span class="sty1120FSchPDotLn" style="float:right;">...</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalGrossIncomeAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalGrossIncomeAmt"/>
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
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px">12</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
                       <b>Total gross effectively connected  income. </b>
						  <span style="float:left;"> Add lines 3 and 8</span>
						<span class="sty1120FSchPDotLn" style="float:right;">.................</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalGrossECIAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalGrossECIAmt"/>
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
											Interest expense on lines 1 through 3, <br/><span style="float:left;">Schedule K-1</span>
						<span class="sty1120FSchPDotLn" style="float:right;">....................</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseIncludedAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseIncludedAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 14-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD">14</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
						Other interest expense reported on <br/><span style="float:left;">Schedule K-1, lines 13 and 18</span>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherInterestExpenseRptAmt"/>
							</xsl:call-template>
						  <span class="sty1120FSchPDotLn" style="float:right;">.......</span>
	                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherInterestExpenseRptAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherInterestExpenseRptAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 15a-->
                    <tr>
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm;">15a</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
                       <b>Total interest expense. </b>
						  Add lines 13 and 14
						<span class="sty1120FSchPDotLn" style="float:right;">.</span>
                      </td>
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalInterestExpenseAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalInterestExpenseAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 15b-->
                    <tr>
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-left:4mm;padding-top:1mm;">
                        b</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
						Interest expense directly allocable under <br/>Regulations section1.882-5(a)(1)(ii)(B).<br/>(<b>Note: </b> Include the line 15b total on <br/><span style="float:left;">Schedule I, line 22.) </span>
						  <span class="sty1120FSchPDotLn" style="float:right;">...............</span>
                      </td>
                      <xsl:call-template name="CreateTablePaddingTop">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseAllocableAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseAllocableAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 15c-->
                    <tr>
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:2px;padding-left:4mm;padding-top:3mm;">
                        c</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
													Subtract line 15b from line 15a.<span style="width:2mm"/>(<b>Note:</b><br/>
						Enter the line 15c total on Schedule I, <br/>line 9, column (b).)
						<span class="sty1120FSchPDotLn" style="float:right;"></span>
                      </td>
                      <xsl:call-template name="CreateTable14c">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseNotAllocableAmt"/>
                      </xsl:call-template>
                      <td class="sty1120FSchPTableK1CellLastCol" style="border-bottom-width:2px; padding-top:13mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseNotAllocableAmt"/>
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
                <xsl:if test="($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &gt; 4) or count($FormData/ForeignPartnerInformationGrp) = 0">
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
									Net income (loss) reported on lines 1 <span style="float:left;">through 3, Schedule K-1</span>
					<span class="sty1120FSchPDotLn" style="float:right;">..............</span>
                  </td>
                  <xsl:choose>
                    <xsl:when test="count($FormData/ForeignPartnerInformationGrp) = 0">
                      <xsl:call-template name="CreateTable">
                        <xsl:with-param name="Start" select="1"/>
                        <xsl:with-param name="Stop" select="5"/>
                        <xsl:with-param name="TargetNode" select="none"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <td colspan="2" class="sty1120FSchPTableK1Cell" style="width:46mm;text-align:center">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/NetIncomeAmt"/>
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
									Gross income included on lines 1 <span style="float:left;">through 3, Schedule K-1</span>
					<span class="sty1120FSchPDotLn" style="float:right;">...............</span>
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
									Gross effectively connected income (ECI) <span style="float:left;">on lines 1 through 3, Schedule K-1</span>
					<span class="sty1120FSchPDotLn" style="float:right;">......</span>
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
									Non-interest expenses on lines 1 through 3,<span style="float:left;">Schedule K-1</span>
					<span class="sty1120FSchPDotLn" style="float:right;">......................</span>
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
                  <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:0px; padding-left:2.5mm">5</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:0px" scope="row">
									Non-interest expenses on lines 1 through 3, <span style="float:left;">Schedule K-1, allocated to gross ECI</span>
					<span class="sty1120FSchPDotLn" style="float:right;">....</span>
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
                  <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">6</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
Net income (loss) reported on Schedule K-1, <span style="float:left;">other than on lines 1 through 3.</span>
					<span class="sty1120FSchPDotLn" style="float:right;">.........</span>
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
									Other gross income reported on Schedule K-1
					<span class="sty1120FSchPDotLn" style="float:right;">.</span>
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
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:3mm">8</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
										Other gross ECI reported on Schedule K-1
					<span class="sty1120FSchPDotLn" style="float:right;">..</span>
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
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">9</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
									Other non-interest expenses reported on <span style="float:left;">Schedule K-1</span>
					<span class="sty1120FSchPDotLn" style="float:right;">.....................</span>
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
                  <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px;">10</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
										Other non-interest expenses reported on <span style="float:left;">Schedule K-1 allocated to ECI </span>
					<span class="sty1120FSchPDotLn" style="float:right;">.........</span>
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
                <!--Line 11 -->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">11</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
					  <span style="float:left;">
						  <b>Total gross income.</b> Add lines 2 and 7
					  </span>
					<span class="sty1120FSchPDotLn" style="float:right;">.....</span>
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
                  <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px">12</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px" scope="row">
                    <b>Total gross effectively connected</b>
					  <span style="float:left;">
						  <b> income. </b>Add lines 3 and 8
					  </span>
					<span class="sty1120FSchPDotLn" style="float:right;">.............</span>
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
									Interest expense on lines 1 through 3, <span style="float:left;">Schedule K-1</span>
					<span class="sty1120FSchPDotLn" style="float:right;">......................</span>
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
                <!--Line 14-->
                <tr>
                  <td class="sty1120FSchPTableK1CellNumSD">14</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
						Other interest expense reported on <span style="float:left;">Schedule K-1, lines 13 and 18</span>
					<span class="sty1120FSchPDotLn" style="float:right;">..........</span>
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
                <!--Line 15a-->
                <tr>
              <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">15a</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row">
                    <b>Total interest expense. </b>
					  Add lines 13 and 14
					<span class="sty1120FSchPDotLn" style="float:right;">.</span>
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
                <!--Line 15b-->
                <tr>
                  <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-left:4mm;padding-top:1mm;">
                    b</td>
                  <td class="sty1120FSchPTableK1Desc" scope="row" >
									Interest expense directly allocable under <br/>Regulations section
				    1.882-5(a)(1)(ii)(B). <br/>(<b>Note:</b> Include the
				    line 15b total on<span style="float:left;"> Schedule I, line 22.)</span>
					<span class="sty1120FSchPDotLn" style="float:right;">.................</span>
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
                <!--Line 15c-->
                <tr>
                  <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:2px;padding-left:4mm;padding-top:3.5mm;">
                   c</td>
                  <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
					Subtract line 15b from line 15a. (<b>Note:</b><br/>
					Enter the line 15c total on Schedule I, <br/>line 9, column (b).)
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
              <span class="styBoldText" style="width:106mm">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-F.</span>
             </div>
              <span style="font-size:6pt">Cat. No. 49677Z</span>
              <span style="width:20mm"/>
              <span style="font-weight:bold; font-size:6pt">Schedule P (Form 1120-F) 2013</span>

          </div>
					<!--					<div class="pageEnd"/>
-->
          <!-- end page break and footer  -->
          <!-- begin page 2 -->
          <!-- page break and footer-->
					<div style="width:187mm">
						<p style="page-break-before: auto"/>
						<div>
							<span class="styBoldText">Schedule P (Form 1120-F) 2013</span>
							<span style="width:133mm"/>Page <b>2</b>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="height:3.5mm;">Part III</div>
							<div class="styPartDesc" style="width:172mm;padding-left:1mm;height:3.5mm;">
                Foreign Partners Average Outside Basis Under Regulations sections 1.882-5(b) and 1.884-1(d)(3)
              </div>
						</div>
            <!-- END Part III Title -->
            <!-- Begin Part III Table -->
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &lt; 5)">
                  <!--For each table with 4 items do the following-->
                  <xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
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
                      <!--Line 16-->
                      <tr>
                        <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;">16</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
							<span style="float:left;">Section 705 outside basis </span>
												<span class="sty1120FSchPDotLn" style="float:right;">.......</span>
												<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/Section705OutsideBasisAmt"/>
									</xsl:call-template>

                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/Section705OutsideBasisAmt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/Section705OutsideBasisAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 17a-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">17a</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
				                       		Partner&#8217;s liabilities included in outside <br/>basis under section
					      752 that give <br/>rise to directly allocable interest <br/>expense
					      under Regulations section <br/>1.882-5(a)(1)(ii)(B)	
					      <span class="sty1120FSchPDotLn" style="float:right;">........</span>
                        </td>
                        <xsl:call-template name="CreateTable17a">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18825a1iiBAmt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:13mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18825a1iiBAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 17b-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;padding-left:3mm;">
                          b</td>
               
                        <td class="sty1120FSchPTableK1Desc" scope="row">
							All other liabilities included in partners  <br/><span style="float:left;">outside basis under section 752</span>
						  <span class="sty1120FSchPDotLn" style="float:right;">......</span>
                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherLiabilitiesIncludedAmt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherLiabilitiesIncludedAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 17c-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2mm;padding-left:3mm;">
                         c</td>
                        <td class="sty1120FSchPTableK1Desc" style="padding-bottom:1.5mm" scope="row">
							<span style="float:left;">Add lines 17a and 17b </span>
							<span class="sty1120FSchPDotLn" style="float:right;">.............</span>
                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalLiabilitiesSection752Amt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalLiabilitiesSection752Amt"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 17d-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;padding-left:3mm;">
                          d</td>
                        <td class="sty1120FSchPTableK1Desc" style="padding-bottom:1.5mm" scope="row">
							<span style="float:left;">Subtract line 17c from line 16</span>
							<span class="sty1120FSchPDotLn" style="float:right;">........</span>
                        </td>
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OutsideBasisLessSect752LiabAmt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OutsideBasisLessSect752LiabAmt"/>
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
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">18</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
                          <!--				****one*****    -->
			             							Partners liabilities under Regulations <br/>section 1.884-1(d)(3)(vi).
						  <span style="width:2mm"/>(<b>Note: </b>Enter <br/>the
							line 18 total on Schedule I, line 8,  <br/>column (b).)
						  <span class="sty1120FSchPDotLn" style="float:right;">............</span>
                        </td>
                        <xsl:call-template name="CreateTablePaddingTop">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18841d3viAmt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18841d3viAmt"/>
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
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:3.5mm">19</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
                         <b>Partners outside basis under <br/>Regulations section 1.884-1(d)(3)(vi).</b><br/>
							<span style="float:left;"> Add lines 17d and 18</span>
	                       <span class="sty1120FSchPDotLn" style="float:right;">..............</span>
												</td>
                        <xsl:call-template name="CreateTablePaddingTop">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerBasisSect18841d3viAmt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerBasisSect18841d3viAmt"/>
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
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">20</td>
                        <td class="sty1120FSchPTableK1Desc" scope="row">
													Partners outside basis allocable to ECI <br/>
						  under Regulations section 1.884-1(d)(3)(i).<span style="width:2mm"/>
						  (<b>Note: </b>Enter the line 20 total on   <br/><span style="float:left;">Schedule I, line 5, column (b).)</span>
						  <span class="sty1120FSchPDotLn" style="float:right;">.....</span>
                        </td>
                        <xsl:call-template name="CreateTablePaddingTop">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerOutsideBssAllcblECIAmt"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="padding-top:9mm">
                          <xsl:choose>
                            <xsl:when test="position() = 1 ">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerOutsideBssAllcblECIAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="width:1px"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--Line 21-->
                      <tr>
                        <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2mm; border-bottom-width:2px">21</td>
                        <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
												Enter "income" or "asset" to indicate the <br/> allocation method used on line 20 <br/><span style="float:left;"> (see instructions)</span>
						  <span class="sty1120FSchPDotLn" style="float:right;">................</span>
                        </td>
                        <xsl:call-template name="CreateTable20">
                          <xsl:with-param name="Start" select="position()"/>
                          <xsl:with-param name="Stop" select="position()+4"/>
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/AllocationMethodUsedCd"/>
                        </xsl:call-template>
                        <td class="sty1120FSchPTableK1CellLastCol" style="border-bottom-width:2px; padding-top:9mm">
                          <span style="width:1px"/>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:if>
                <xsl:if test="($Print = $Separated and count($FormData/ForeignPartnerInformationGrp) &gt; 4) or count($FormData/ForeignPartnerInformationGrp) = 0">
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
                  <!--Line 16-->
                  <tr>
                    <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;">16</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
						<span style="float:left;">Section 705 outside basis</span>
						<span class="sty1120FSchPDotLn" style="float:right;">.............</span>
                    </td>
                    <xsl:choose>
                      <xsl:when test="count($FormData/ForeignPartnerInformationGrp) = 0">
                        <xsl:call-template name="CreateTable">
                          <xsl:with-param name="Start" select="1"/>
                          <xsl:with-param name="Stop" select="5"/>
                          <xsl:with-param name="TargetNode" select="none"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <td colspan="2" class="sty1120FSchPTableK1Cell" style="width:46mm;text-align:center">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/Section705OutsideBasisAmt"/>
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
                  <!--Line 17a-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">17a</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
											Partners liabilities included in outside 
		                              		basis under section 752 that give rise to
	                            			directly allocable interest expense under
                            				Regulations section 1.882-5(a)(1)(ii)(B)
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
                  <!--Line 17b-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;padding-left:3mm;">
                      b</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
						All other liabilities included in partners <br/><span style="float:left;">outside basis under section 752</span>
											<span class="sty1120FSchPDotLn" style="float:right;">.........</span>
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
                  <!--Line 17c-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2mm;padding-left:3mm;">
                     c</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
						<span style="float:left;">Add lines 17a and 17b</span>
						<span class="sty1120FSchPDotLn" style="float:right;">...............</span>
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
                  <!--Line 17d-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;padding-left:3mm;">
                      d</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
						<span style="float:left;">Subtract line 17c from line 16</span>
										<span class="sty1120FSchPDotLn" style="float:right;">.........</span>
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
                      <!-- *****two *****-->
					Partners liabilities under Regulations <br/>section 1.884-1(d)(3)(vi). 
											(<b>Note: </b> Enter the <br/>line 18 total on Schedule I, line 8, column (b).)
											<span class="sty1120FSchPDotLn" style="float:right;"></span>
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
                      <b>Partners outside basis under Regulations section 1.884-1(d)(3)(vi).</b>
										  <br/>Add lines 17d and 18
										<span class="sty1120FSchPDotLn" style="float:right;">..............</span>
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
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">20</td>
                    <td class="sty1120FSchPTableK1Desc" scope="row">
											Partners outside basis allocable to ECI under Regulations section 
											1.884-1(d)(3)(i).<br/>(<b>Note: </b>Enter the line 20 total on Schedule
											I, line 5, column (b).)
											<span class="sty1120FSchPDotLn" style="float:right;">...............</span>
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
                  <!--Line 21-->
                  <tr>
                    <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm; border-bottom-width:2px">21</td>
                    <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
												Enter "income" or "asset" to indicate the <br/>allocation method used on line 20<br/>
													<span style="float:left;">(see instructions)</span>
												<span class="sty1120FSchPDotLn" style="float:right;">...................</span>
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
              <span class="styBoldText">Schedule P (Form 1120-F) 2013</span>
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
          <xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInformationGrp) &gt; 4) ">
            <br/>
            <span class="styRepeatingDataTitle">Form 1120F Schedule P, Part IList of Foreign Partner Interests in Partnerships</span>
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
                <tr class="styDepTblHdr">
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:60mm" colspan="2">
					Name of partnership</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
					Address</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:40mm; border-right-width:1px">
					EIN</th>
                  <th class="sty1120FSchPTableCellText" scope="col" style="width:45mm">
					For each partnership, is the foreign corporations distributive share treated as ECI,
					in whole or in part, with respect to a U.S. trade or business as derermined under section 875 (see instructions)?</th>
                </tr>
                <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  -->
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styTableCellText" style="width:4mm; border-right-width:0px; font-weight:bold;">
                      <xsl:number format="A" value="position()"/>
                    </td>
                    <!--Name-->
                    <td class="styTableCellText" style="width:56mm;">
                      <span style="float:none;text-align:left;font-weight:normal">
                        <xsl:choose>
                          <xsl:when test="PartnerPersonNm">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PartnerPersonNm"/>
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
                        <xsl:when test="MissingEINReasonCd">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
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
                      <xsl:attribute name="style"><xsl:choose><xsl:when test="position() = count($FormData/ForeignPartnerInformationGrp) and position() &gt;3">border-bottom-width:0px</xsl:when><xsl:otherwise/></xsl:choose></xsl:attribute>
                      <span style="width:4mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                           <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <span style="width:2mm;"/>Yes   
	                                                </label>
                      <span style="width:4mm"/>
                      <input type="checkbox" class="styCkbox" name="InitialReturn">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="DistributiveShareTreatedECIInd"/>
                          <xsl:with-param name="BackupName">IRS1120SchFDistributiveShareTreatedAsECI</xsl:with-param>
                        </xsl:call-template>
                        <span style="width:1mm"/>No
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
          <xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInformationGrp) &gt; 4) ">
            <br/>
            <span class="styRepeatingDataTitle">Form 1120F Schedule P, Part II Foreign Partner Income and Expenses: Reconciliation to Schedule K-1 (Form 1065)<br/> See instructions if reconciling to Schedule K-1 (Form 1065-B).</span>
            <br/>
            <table class="styDepTbl" cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--For each table with 4 items do the following-->
                <xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
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
							Net income (loss) reported on <span style="float:left;">lines 1 through 3, Schedule K-1</span>
                      </td>
                      <span style="font-size:5.5pt">
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/NetIncomeAmt"/>
                      </xsl:call-template></span>
                      <td class="styDepTblRow3LC">
                      <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/NetIncomeAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 2-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">2</td>
                      <td class="sty1120FSchPTableK1Desc">
												Gross income included on lines <span style="float:left;">1 through 3, Schedule K-1</span>
											<span class="sty1120FSchPDotLn" style="float:right;">......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossIncomeAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                      <span style="font-size:5.5pt">
                                 <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossIncomeAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 3-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">3</td>
                      <td class="sty1120FSchPTableK1Desc">
											Gross effectively connected <br/>income (ECI) on lines 1 through<span style="float:left;">3, Schedule K-1</span>
											<span class="sty1120FSchPDotLn" style="float:right;">.............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/GrossECIAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                      <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/GrossECIAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 4-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">4</td>
                      <td class="sty1120FSchPTableK1Desc">
												 Non-interest expenses on lines <span style="float:left;">1 through 3, Schedule K-1</span>
											<span class="sty1120FSchPDotLn" style="float:right;">......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="
$FormData/ForeignPartnerInformationGrp/NonInterestExpenseAmt"/>                   
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                      <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="
$FormData/TotalGrp/NonInterestExpenseAmt"/>                           
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 5-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:0px; padding-left:2.5mm">5</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:0px">
								      		Non-interest expenses on lines <br/>1 through 3, Schedule K-1, <span style="float:left;">allocated to gross ECI</span>
											<span class="sty1120FSchPDotLn" style="float:right;">........</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/NonIntExpnssAllocGroECIAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                      <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/NonIntExpnssAllocGroECIAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 6-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px; padding-left:2.5mm">6</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
								      		Net income (loss) reported on Schedule K-1, other than on lines 1 through 3
											<span class="sty1120FSchPDotLn" style="float:right;">........</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherNetIncomeAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                      <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="
  $FormData/TotalGrp/OtherNetIncomeAmt"/>                           
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 7-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">7</td>
                      <td class="sty1120FSchPTableK1Desc">
											Other gross income reported on Schedule K-1
											<span class="sty1120FSchPDotLn" style="float:right;">.</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherGrossIncomeReportedAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                      <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherGrossIncomeReportedAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 8-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm;padding-top:3mm;">8</td>
                      <td class="sty1120FSchPTableK1Desc">
											Other gross ECI reported on Schedule K-1
											<span class="sty1120FSchPDotLn" style="float:right;">..</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherGrossECIReportedAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherGrossECIReportedAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 9-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-left:2.5mm">9</td>
                      <td class="sty1120FSchPTableK1Desc">
											Other non-interest expenses <span style="float:left;">reported on Schedule K-1</span>
										<span class="sty1120FSchPDotLn" style="float:right;">......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherNonInterestExpensesRptAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherNonInterestExpensesRptAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 10-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px;">10</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
											Other non-interest expenses reported <br/>on Schedule K-1, allocated to gross ECI
											<span class="sty1120FSchPDotLn" style="float:right;">.............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherNonIntExpnssAllocECIAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherNonIntExpnssAllocECIAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 11-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD">11</td>
                      <td class="sty1120FSchPTableK1Desc">
                        <b>Total gross income.</b>
						  <span style="float:left;">Add lines 2 and 7 </span>
										<span class="sty1120FSchPDotLn" style="float:right;">............</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalGrossIncomeAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalGrossIncomeAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  -->
                    <!--Line 12-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px">12</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
						  <b>
							  Total gross effectively </b><br/><b>connected income.</b> Add lines 3<br/> <span style="float:left;">and 8</span>
							<span class="sty1120FSchPDotLn" style="float:right;">....................</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalGrossECIAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalGrossECIAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 13-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD">13</td>
                      <td class="sty1120FSchPTableK1Desc">Interest expense on lines 1 <span style="float:left;">through 3, Schedule K-1</span>
                      <span class="sty1120FSchPDotLn" style="float:right;">........</span>
			          </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseIncludedAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseIncludedAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 14-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD">14</td>
                      <td class="sty1120FSchPTableK1Desc">
								Other interest expense reported <span style="float:left;">on Schedule K-1, lines 13 and 18</span>
											<!--<span class="sty1120FSchPDotLn">...</span>-->
                      </td>
                      <xsl:call-template name="CreateTableDepRow4">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherInterestExpenseRptAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherInterestExpenseRptAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 15a-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm">15a</td>
                      <td class="sty1120FSchPTableK1Desc">
                        <b>Total interest expense. </b>
						  Add lines 13 and 14
											<span class="sty1120FSchPDotLn" style="float:right;">.</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalInterestExpenseAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalInterestExpenseAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 15b-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-left:4mm;padding-top:1mm;">
                       b</td>
                      <td class="sty1120FSchPTableK1Desc">
												Interest expense directly allocable<br/>
				                				under Regulations section 1.882-5(a)(1)(ii)(B). 
				                				(<b>Note:</b> Include the line 15b <br/>total 
				                				on Schedule I, line 22.)
				                					<span class="sty1120FSchPDotLn" style="float:right;">....</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow13Padding">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseAllocableAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:13mm">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseAllocableAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                    <!--Line 15c-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="border-bottom-width:1px;padding-left:4mm;padding-top:2.5mm;">
                        c</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:1px">
							Subtract line 15b from line 15a. <br/>(<b>Note:</b>
												Enter the line 15c total on <br/>Schedule I, line 9, column (b).)
												<span class="sty1120FSchPDotLn" style="float:right;">...</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4Padding11mm">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/InterestExpenseNotAllocableAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC" style="padding-top:11mm">
                       <span style="font-size:5.5pt">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/InterestExpenseNotAllocableAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose></span>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- end additional separated data for Part II -->
          <!-- begin additional separated data for Part III -->
          <xsl:if test="($Print = $Separated) and (count($FormData/ForeignPartnerInformationGrp) &gt; 4) ">
            <br/>
            <span class="styRepeatingDataTitle">
	        	Form 1120F Schedule P, Part IIIForeign Partners Average Outside Basis Under Regulations sections 1.882-5(b) and 1.884-1(d)(3)
	        </span>
            <br/>
            <table class="styDepTbl" cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--For each table with 4 items do the following-->
                <xsl:for-each select="$FormData/ForeignPartnerInformationGrp">
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
                    <!--Line 16-->
                    <tr class="styDepTblHdr">
                      <td class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;">16</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
						  <span style="float:left;">Section 705 outside basis</span>
					  <span class="sty1120FSchPDotLn" style="float:right;">......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow1">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/Section705OutsideBasisAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC" style="padding-top:3mm;">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/Section705OutsideBasisAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 17a-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">17a</td>
						<td class="sty1120FSchPTableK1Desc" scope="row">
							Partners liabilities included in <br/>outside basis under section 752 <br/>that give rise to
							directly allocable<br/> interest expense under<br/>
							Regulations section 1.882-5(a)<br/> <span style="float:left;">(1)(ii)(B)</span>
							<span class="sty1120FSchPDotLn" style="float:right;">...................</span>
						</td>
                      <xsl:call-template name="CreateTableDepRow4Padding15mm">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18825a1iiBAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:15mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18825a1iiBAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 17b-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm;padding-left:3mm;">
                        <span style="padding-left:3mm"/>b</td>
                     <td class="sty1120FSchPTableK1Desc" scope="row">
												 All other liabilities included in <br/>partners outside basis under <span style="float:left;">section 752</span>
					  <span class="sty1120FSchPDotLn" style="float:right;">................</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OtherLiabilitiesIncludedAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OtherLiabilitiesIncludedAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 17c-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2mm;padding-left:3mm;">
                        <span style="padding-left:3mm"/>c</td>
                     <td class="sty1120FSchPTableK1Desc" scope="row">
						 <span style="float:left;">Add lines 17a and 17b</span>
					  <span class="sty1120FSchPDotLn" style="float:right;">.......</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow1BG">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/TotalLiabilitiesSection752Amt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:3mm;">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/TotalLiabilitiesSection752Amt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 17d-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:2.5mm;padding-left:3mm;">
                        <span style="padding-left:3mm"/>d</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
						  <span style="float:left;">Subtract line 17c from line 16</span>
					  <span class="sty1120FSchPDotLn" style="float:right;">...</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow1">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/OutsideBasisLessSect752LiabAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC" style="padding-top:3mm;">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/OutsideBasisLessSect752LiabAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 18-->
                    <!--*****three *** -->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">18</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
									Partners liabilities under <br/>Regulations section 1.884-1(d)(3)(vi). 
					  (<b>Note: </b> Enter the line 18 <br/>total on Schedule I, line 8, column (b).)	
					<span class="sty1120FSchPDotLn" style="float:right;"></span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4Padding15mm">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerLiabSect18841d3viAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:15mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerLiabSect18841d3viAmt"/>
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
                      <td class="sty1120FSchPTableK1Desc" scope="row">
                        <b>Partners outside basis under <br/>Regulations section 1.884-1(d)(3)</b>
						  <b>(vi).</b> Add lines 17d and 18
					  <span class="sty1120FSchPDotLn" style="float:right;">.....</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow3Padding6">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerBasisSect18841d3viAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow3LC" style="padding-top:6mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerBasisSect18841d3viAmt"/>
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
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:1mm">20</td>
                      <td class="sty1120FSchPTableK1Desc" scope="row">
							Partners outside basis allocable<br/> to ECI under Regulations <br/>section 
					  1.884-1(d)(3)(i).<br/>(<b>Note: </b>Enter the line 20 total on Schedule I, line 5, column (b).)
					  <span class="sty1120FSchPDotLn" style="float:right;">..</span>
                      </td>
                      <xsl:call-template name="CreateTableDepRow4Padding15mm">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/PartnerOutsideBssAllcblECIAmt"/>
                      </xsl:call-template>
                      <td class="styDepTblRow4LC" style="padding-top:15mm">
                        <xsl:choose>
                          <xsl:when test="position() = 1 ">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotalGrp/PartnerOutsideBssAllcblECIAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:1px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                    <!--Line 21-->
                    <tr class="styDepTblHdr">
                      <td valign="top" class="sty1120FSchPTableK1CellNumSD" style="padding-top:3mm; border-bottom-width:1px">21</td>
                      <td class="sty1120FSchPTableK1Desc" style="border-bottom-width:2px" scope="row">
							Enter "income" or "asset" to<br/> indicate the allocation method <br/>used on line 20 (see instructions)
			          <span class="sty1120FSchPDotLn" style="float:right;">..</span>
                      </td>
                      <xsl:call-template name="CreateTableDep20">
                        <xsl:with-param name="Start" select="position()"/>
                        <xsl:with-param name="Stop" select="position()+4"/>
                        <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInformationGrp/AllocationMethodUsedCd"/>
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
      <td class="sty1120FSchPTableK1Cell" style="border-bottom-width:2px; padding-top:13mm">
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
      <td class="styDepTblRow3" style="border-bottom-width:1px; text-align:left; padding-left:1mm; padding-top:12mm">
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
	<xsl:template name="CreateTableDepRow1">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styDepTblRow3" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:3mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTableDepRow1">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CreateTableDepRow1BG">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styDepTblRow4" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:3mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTableDepRow1BG">
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
      <td class="styDepTblRow3" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:7mm;">
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
      <td class="styDepTblRow3" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm;padding-top:6mm">
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
      <td class="styDepTblRow4" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm;padding-top:7mm;">
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
	<xsl:template name="CreateTableDepRow13Padding">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styDepTblRow4" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:13mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTableDepRow13Padding">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
  <xsl:template name="CreateTableDepRow4Padding11mm">
    <xsl:param name="Start"/>
    <xsl:param name="Stop"/>
    <xsl:param name="TargetNode"/>
    <xsl:if test="$Start &lt; $Stop">
      <td class="styDepTblRow3" style="border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:11mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
        </xsl:call-template>
      </td>
      <xsl:call-template name="CreateTableDepRow4Padding11mm">
        <xsl:with-param name="Start" select="$Start + 1"/>
        <xsl:with-param name="Stop" select="$Stop"/>
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
	<xsl:template name="CreateTable17a">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="sty1120FSchPTableK1Cell" style="padding-top:13mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTable17a">
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
	<xsl:template name="CreateTableDepRow4Padding15mm">
		<xsl:param name="Start"/>
		<xsl:param name="Stop"/>
		<xsl:param name="TargetNode"/>
		<xsl:if test="$Start &lt; $Stop">
			<td class="styDepTblRow4" style="width:32mm;border-bottom-width:1px; text-align:right; padding-left:1mm; padding-top:15mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
				</xsl:call-template>
			</td>
			<xsl:call-template name="CreateTableDepRow4Padding15mm">
				<xsl:with-param name="Start" select="$Start + 1"/>
				<xsl:with-param name="Stop" select="$Stop"/>
				<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>