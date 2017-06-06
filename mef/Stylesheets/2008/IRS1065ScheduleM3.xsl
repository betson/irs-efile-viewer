<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS1065ScheduleM3Style.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="Form1065ScheduleM3" select="$RtnDoc/IRS1065ScheduleM3"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:call-template name="FormTitle">
                        <xsl:with-param name="RootElement" select="local-name($Form1065ScheduleM3)">
        </xsl:with-param>
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
                <meta name="Description" content="IRS Form 1065 Schedule M3"/>
                <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
                <xsl:call-template name="InitJS"/>
                <style type="text/css">
                    <xsl:if test="not($Print) or $Print=''">
                        <xsl:call-template name="IRS1065ScheduleM3Style"/>
                        <xsl:call-template name="AddOnStyle"/>
                    </xsl:if>
                </style>
                <xsl:call-template name="GlobalStylesForm"/>
            </head>
            <body class="styBodyClass">
                <form name="Form1065ScheduleM3">
                    <xsl:call-template name="DocumentHeader"/>
                    <!-- Header - Form1065SchM3 Number, Title, and Year -->
                    <div class="styTBB" style="width:187mm;">
                        <div class="styFNBox" style="width:31mm;height:12mm;border-right-width:2px;">
                            <span class="styFormNumber" style="font-size:9pt;">SCHEDULE M-3<span style="font-size:8pt;">(Form 1065)</span>
                                <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3"/>
                                </xsl:call-template>
                            </span>
                            <br/>
                            <span class="styAgency" style="height:4mm;padding-top:1mm;">
          Department of the Treasury<br/>
          Internal Revenue Service</span>
                        </div>
                        <div class="styFTBox" style="width:125mm;height:12mm;">
                            <div class="styMainTitle" style="font-size:9.5pt">Net Income (Loss) Reconciliation<br/>for Certain Partnerships</div>
                            <div class="styFST" style="height:4mm;">
                                <img src="{$ImagePath}/1065ScheduleM3_Bullet_Title.gif" width="7" height="5" alt="Bullet"/>Attach to Form 1065 or Form 1065-B.<br/>
                                <img src="{$ImagePath}/1065ScheduleM3_Bullet_Title.gif" width="7" height="5" alt="Bullet"/>See separate instructions.<br/>
                            </div>
                        </div>
                        <div class="styTYBox" style="width:30mm;height:12mm;border-left-width:2px;">
                            <div class="styOMB" style="height:1mm;">OMB No. 1545-0099</div>
                            <div class="styTaxYear" style="height:7mm;padding-top:1mm;">20<span class="styTYColor" >08</span>
                            </div>
                        </div>
                    </div>
                    <!-- End Header - Form Number, Title, and Year -->
                    <!--  Name and Employer identification number  -->
                    <div class="styBB" style="width:187mm;">
                        <div class="styNameBox" style="width:124mm;height:6mm;font-size:7pt;">
            Name of partnership<br/>
                            <div style="font-family:verdana;font-size:7pt;height:4mm;">
                                <xsl:call-template name="PopulateReturnHeaderFiler">
                                    <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                                </xsl:call-template>
                                <br/>
                                <xsl:call-template name="PopulateReturnHeaderFiler">
                                    <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                                </xsl:call-template>
                            </div>
                        </div>
                        <div class="styEINBox" style="height:4mm;padding-left:2mm;font-size:7pt;">
         Employer identification number<br/>
                            <br/>
                            <span style="font-weight:normal;">
                                <xsl:call-template name="PopulateReturnHeaderFiler">
                                    <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                                </xsl:call-template>
                            </span>
                        </div>
                    </div>
                    <!--  End Name and Employer indentification number  -->
                    <br/>
                    <div class="styBB" style="width:187mm;border-bottom:none;height:4mm">
                        <span style="width:130mm;font-size:7pt;">
                            <b>This Schedule M-3 is being filed because (check all that apply):</b>
                        </span>
                    </div>
                    <div style="width:187mm;height:4mm;border-style:solid; border-bottom-width:1px;border-top-width:0;
          border-right-width:0px;border-left-width:0px;float:left;">
                        <!-- Line A -->
                        <div style="width:187mm;">
                            <div style="float:left;padding-left:1mm;padding-right:1mm;height:4mm;padding-top:none">
                                <b>A</b>
                            </div>
                            <div class="styLNDesc" style="width:179mm;height:4mm;padding-top:none">
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              TotalAssetsEndOfTaxYear"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                TotalAssetsEndOfTaxYear"/>
                                    </xsl:call-template>
                                </input>
                                <label>
                                    <xsl:call-template name="PopulateLabelYes">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAssetsEndOfTaxYear"/>
                                        <xsl:with-param name="BackupName" select="Form1065ScheduleM3/TotalAssetsEndOfTaxYear"/>
                                    </xsl:call-template>
                                </label>
          The amount of the partnership's total assets at the end of the tax year is equal to $10 million or more.</div>
                        </div>
                        <!-- Line B -->
                        <div style="width:187mm;">
                            <div style="float:left;padding-left:1mm;padding-right:1mm;">
                                <b>B</b>
                            </div>
                            <div class="styLNDesc" style="width:179mm;">
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              AdjustedTotalAssestsForYear"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                AdjustedTotalAssestsForYear"/>
                                    </xsl:call-template>
                                </input>
                                <label>
                                    <xsl:call-template name="PopulateLabelYes">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustedTotalAssestsForYear"/>
                                        <xsl:with-param name="BackupName" select="Form1065ScheduleM3/AdjustedTotalAssestsForYear"/>
                                    </xsl:call-template>
                                </label>          
         The amount of the partnership’s adjusted total assets for the year is equal to $10 million or more. If box B is checked,
enter the amount of adjusted total assets for the tax year 
<span style="width:30mm;border-bottom:solid 1px;text-align:right;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjustedTotalAssestsForYear/@Amount"/>
                                    </xsl:call-template>
                                </span>
.        </div>
                        </div>
                        <!-- Line C -->
                        <div style="width:187mm;">
                            <div style="float:left;padding-left:1mm;padding-right:1mm;">
                                <b>C</b>
                            </div>
                            <div class="styLNDesc" style="width:179mm;">
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              TotalReceiptsForTaxableYear "/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                TotalReceiptsForTaxableYear "/>
                                    </xsl:call-template>
                                </input>
                                <label>
                                    <xsl:call-template name="PopulateLabelYes">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalReceiptsForTaxableYear "/>
                                        <xsl:with-param name="BackupName" select="Form1065ScheduleM3/TotalReceiptsForTaxableYear "/>
                                    </xsl:call-template>
                                </label>          
The amount of total receipts for the taxable year is equal to $35 million or more. If box C is checked, enter the total
receipts for the tax year 
<span style="width:30mm;border-bottom:solid 1px;text-align:right;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalReceiptsForTaxableYear/@TotalReceipts"/>
                                    </xsl:call-template>
                                </span>
.       </div>
                        </div>
                        <!-- Line D -->
                        <div style="width:187mm;">
                            <div style="float:left;padding-left:1mm;padding-right:1mm;">
                                <b>D</b>
                            </div>
                            <div class="styLNDesc" style="width:179mm;">
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ReportableEntityPartners/ReportableEntityCheckbox"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                ReportableEntityPartners/ReportableEntityCheckbox"/>
                                    </xsl:call-template>
                                </input>
                                <label>
                                    <xsl:call-template name="PopulateLabelYes">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartners/ReportableEntityCheckbox"/>
                                        <xsl:with-param name="BackupName" select="Form1065ScheduleM3/ReportableEntityPartners/ReportableEntityCheckbox"/>
                                    </xsl:call-template>
                                </label>          
         An entity that is a reportable entity partner with respect to the partnership owns or is deemed to own an interest of 50
percent or more in the partnership’s capital, profit, or loss, on any day during the tax year of the partnership.      </div>
                        </div>
                        <div class="styBB" style="width:187mm;">
                            <div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
                                <!-- button display logic -->
                                <xsl:call-template name="SetDynamicTableToggleButton">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartners/Item"/>
                                    <xsl:with-param name="containerHeight" select="2"/>
                                    <xsl:with-param name="containerID" select=" 'REPtbl' "/>
                                </xsl:call-template>
                                <!-- end button display logic -->
                            </div>
                        </div>
                        <div class="styTableContainer" id="REPtbl">
                            <!-- print logic -->
                            <xsl:call-template name="SetInitialState"/>
                            <!-- end -->
                            <table class="styTable" cellspacing="0">
                                <thead class="styTableThead">
                                    <tr>
                                        <th class="styTableCellHeader" style="width:98mm;vertical-align:top;font-size:6.5pt;height:4mm" scope="col">
                                            <span class="styNormalText">Name of Reportable Entity Partner </span>
                                        </th>
                                        <th class="styTableCellHeader" style="width:44mm;vertical-align:top;font-size:6.5pt;height:4mm" scope="col">
                                            <span class="styNormalText">Identifying Number</span>
                                        </th>
                                        <th class="styTableCellHeader" style="width:44mm;vertical-align:top;font-size:6.5pt;height:4mm" scope="col">
                                            <span class="styNormalText">Maximum Percentage<br/>Owned or Deemed Owned</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tfoot/>
                                <tbody>
                                    <xsl:for-each select="$Form1065ScheduleM3/ReportableEntityPartners/Item">
                                        <xsl:if test="($Print != $Separated) or (count($Form1065ScheduleM3/ReportableEntityPartners/Item) &lt;=2)">
                                            <tr style="font-size: 7pt;">
                                                <td class="styTableCellText" style="width:98mm;height:4mm;">
                                                    <span style="width:4px"/>
                                                    <xsl:if test="NameOfReportableEntityPartner">
                                                        <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="NameOfReportableEntityPartner"/>
                                                        </xsl:call-template>
                                                    </xsl:if>
                                                </td>
                                                <td class="styTableCellText" style="width:44mm;text-align:center;">
                                                    <xsl:choose>
                                                        <xsl:when test="PartnerSSN">
                                                            <xsl:call-template name="PopulateSSN">
                                                                <xsl:with-param name="TargetNode" select="PartnerSSN"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:when test="PartnerEIN">
                                                            <xsl:call-template name="PopulateEIN">
                                                                <xsl:with-param name="TargetNode" select="PartnerEIN"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:call-template name="PopulateText">
                                                                <xsl:with-param name="TargetNode" select="MissingSSNEINReason"/>
                                                            </xsl:call-template>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </td>
                                                <td class="styTableCellText" style="width:44mm;text-align:center;">
                                                    <span style="width:4px"/>
                                                    <xsl:call-template name="PopulatePercent">
                                                        <xsl:with-param name="TargetNode" select="MaximumPercentageOfDeemedOwnr"/>
                                                    </xsl:call-template>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                    </xsl:for-each>
                                    <!-- Table Filler Rows -->
                                    <xsl:if test="count($Form1065ScheduleM3/ReportableEntityPartners/Item) &lt; 1 or ((count($Form1065ScheduleM3/ReportableEntityPartners/Item) &gt;2) and ($Print = $Separated))">
                                        <tr>
                                            <td class="styTableCellText" style="width:98mm;height:4mm;font-size:7pt;">
                                                <span style="width:4px"/>
                                                <xsl:if test="((count($Form1065ScheduleM3/ReportableEntityPartners/Item) &gt;2) and ($Print = $Separated))">
                                                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartners/Item"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </td>
                                            <td class="styTableCellText" style="width:44mm;height:6.5mm;">
                                                <span style="width:4px"/>
                                            </td>
                                            <td class="styTableCellCtr" style="width:44mm;">
                                                <span style="width:4px"/>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="count($Form1065ScheduleM3/ReportableEntityPartners/Item) &lt; 2 or ((count($Form1065ScheduleM3/ReportableEntityPartners/Item) &gt;2) and ($Print = $Separated))">
                                        <tr>
                                            <td class="styTableCellText" style="width:98mm;height:6.5mm;">
                                                <span style="width:4px"/>
                                            </td>
                                            <td class="styTableCellText" style="width:44mm;">
                                                <span style="width:4px"/>
                                            </td>
                                            <td class="styTableCellCtr" style="width:44mm;">
                                                <span style="width:4px"/>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </tbody>
                            </table>
                        </div>
                        <!-- Set Initial Height of Above Table -->
                        <xsl:call-template name="SetInitialDynamicTableHeight">
                            <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ReportableEntityPartners/Item"/>
                            <xsl:with-param name="containerHeight" select="2"/>
                            <xsl:with-param name="containerID" select=" 'REPtbl' "/>
                        </xsl:call-template>
                        <!-- End Set Initial Height of Above Table -->
                        <!-- Line E -->
                        <div style="width:187mm;">
                            <div style="float:left;padding-left:1mm;padding-right:1mm;">
                                <b>E</b>
                            </div>
                            <div class="styLNDesc" style="width:179mm;">
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              VoluntaryFiler"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                VoluntaryFiler"/>
                                    </xsl:call-template>
                                </input>
                                <label>
                                    <xsl:call-template name="PopulateLabelYes">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/VoluntaryFiler"/>
                                        <xsl:with-param name="BackupName" select="Form1065ScheduleM3/VoluntaryFiler"/>
                                    </xsl:call-template>
                                </label>          
         Voluntary Filer </div>
                        </div>
                    </div>
                    <!-- Part I - Header -->
                    <div style="width:187mm;height:3mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;padding-top:none;padding-bottom:none;float:left;">
                        <span class="styPartName" style="height:1mm;width:12mm;font-size:7pt">Part I</span>
                        <span style="width:130mm;font-size:7pt" class="styPartDesc">
                            <span style="width:3mm;"/>Financial Information and Net Income (Loss) Reconciliation<br/>
                        </span>
                    </div>
                    <!-- Line 1a -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD">1a</div>
                        <div class="styLNDesc" style="width:179mm;">
        Did the partnership file SEC Form 10-K for its income statement period 
        ending with or within this tax year?</div>
                    </div>
                    <!-- Line 1a - Yes -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpFiledSECForm10K"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                PrtshpFiledSECForm10K"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelYes">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpFiledSECForm10K"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpFiledSECForm10K"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
                            </label>          
          Skip lines 1b and 1c and complete lines 2 through 11 with respect to that SEC Form 10-K.
        </div>
                    </div>
                    <!-- Line 1a - No -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpFiledSECForm10K"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateNoCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                PrtshpFiledSECForm10K"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelNo">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpFiledSECForm10K"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/
              PrtshpFiledSECForm10K"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">No.</span>
                            </label>
          Go to line 1b. See instructions if multiple non-tax-basis income statements are prepared.
        </div>
                    </div>
                    <!-- Line 1b -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD">
                            <span style="width:1.5mm"/>b</div>
                        <div class="styLNDesc" style="width:179mm;">Did the partnership prepare
         a certified audited non-tax-basis income statement for that period?</div>
                    </div>
                    <!-- Line 1b - Yes -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepCertAuditedIncmStmt"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                PrtshpPrepCertAuditedIncmStmt"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelYes">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepCertAuditedIncmStmt"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/
              PrtshpPrepCertAuditedIncmStmt"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
                            </label>          
          Skip line 1c and complete lines 2 through 11 with respect to that income statement.
        </div>
                    </div>
                    <!-- Line 1b - No -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepCertAuditedIncmStmt"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateNoCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                PrtshpPrepCertAuditedIncmStmt"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelNo">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepCertAuditedIncmStmt"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/
              PrtshpPrepCertAuditedIncmStmt"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">No.</span>
                            </label>
          Go to line 1c.
        </div>
                    </div>
                    <!-- Line 1c -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD">
                            <span style="width:1.5mm"/>c</div>
                        <div class="styLNDesc" style="width:179mm;">Did the partnership prepare
         a non-tax-basis income statement for that period?
        </div>
                    </div>
                    <!-- Line 1c - Yes -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepIncomeStatement"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                PrtshpPrepIncomeStatement"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelYes">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepIncomeStatement"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/
              PrtshpPrepIncomeStatement"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
                            </label>          
          Complete lines 2 through 11 with respect to that income statement.
        </div>
                    </div>
                    <!-- Line 1c - No -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepIncomeStatement"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateNoCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                PrtshpPrepIncomeStatement"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelNo">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              PrtshpPrepIncomeStatement"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/
              PrtshpPrepIncomeStatement"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">No.</span>
                            </label>
          Skip lines 2 through 3b and enter the partnership’s net income (loss) per its books
           and records on line 4a. </div>
                    </div>
                    <!-- Line 2 -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD">2</div>
                        <div class="styLNDesc" style="width:179mm;">Enter the income statement period:
          <span style="width:3mm"/>Beginning<span style="width:3mm"/>
                            <span style="width:25mm;border-bottom:solid 1px;">
                                <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeStatementBegngDate"/>
                                </xsl:call-template>
                            </span>
                            <span style="width:8mm"/>Ending<span style="width:3mm"/>
                            <span style="width:25mm;border-bottom:solid 1px;">
                                <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeStatementEndDate"/>
                                </xsl:call-template>
                            </span>
                        </div>
                    </div>
                    <!-- Line 3a -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD">3a</div>
                        <div class="styLNDesc" style="width:179mm;">Has the partnership’s income statement been restated for the income statement period on line 2?
            <!-- Form Link -->
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Line 3a - Yes -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelYes">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
                            </label>          
          (If “Yes,” attach an explanation and the amount of each item restated.)
        </div>
                    </div>
                    <!-- Line 3a - No -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateNoCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelNo">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpIncomeStatementRestated"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">No.</span>
                            </label>
                        </div>
                    </div>
                    <!-- Line3b -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD"><span style="width:1.5mm"/>b</div>
                        <div class="styLNDesc" style="width:179mm;">Has the partnership’s income
         statement been restated for any of the five income statement periods preceding
          the period<br/> on line 2?
            <!-- Form Link -->
                            <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Line 3b - Yes -->
                    <div style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateYesCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelYes">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
                            </label>          
          (If “Yes,” attach an explanation and the amount of each item restated.)
        </div>
                    </div>
                    <!-- Line 3b - No -->
                    <div class="styBB" style="width:187mm;">
                        <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
                        <div class="styLNDesc" style="width:179mm;">
                            <span style="width:.5mm;"/>
                            <span>
                                <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                </xsl:call-template>
                                <input type="checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateNoCheckbox">
                                        <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                    </xsl:call-template>
                                </input>
                            </span>
                            <label>
                                <xsl:call-template name="PopulateLabelNo">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                    <xsl:with-param name="BackupName" select="Form1065ScheduleM3/PrtshpIncmStmtRestated5Preced"/>
                                </xsl:call-template>
                                <span class="styBoldText" style="padding-left:1mm;">No.</span>
                            </label>
                        </div>
                   </div>
                   <!-- Line 4a -->
                   <!--<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
                   </div>--> 
                   <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD" style="height:4mm">4a</div>
                                  <div class="styLNDesc" style="width:130mm;height:4mm">Worldwide consolidated net income (loss) from income statement source identified in Part I, line 1</div>
                           </div>
                           <div style="float:right;">
                                  <div class="styLNRightNumBox">4a</div>
                                  <div class="styLNAmountBox">
                                         <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/WorldwideCnsldtNetIncomeLoss"/>
                                         </xsl:call-template>
                                  </div>
                           </div>
                   </div>
                   <!-- Line 4b -->
                   <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD" style="height:4mm"><span style="width:1.5mm"/>b</div>
                                  <div class="styLNDesc" style="width:130mm;height:4mm">Indicate accounting standard used for line 4a (see instructions):</div>
                                  <div style="float:right;">
                                          <div class="styLNRightNumBox" style="height:4mm;border-bottom:none"></div>
                                          <div class="styLNAmountBox" style="height:4mm;border-bottom:none"></div>
                                  </div>
                           </div>
                   </div>
                   <!-- Line 4b - 1 GAAP -->
                   <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
                                  <span class="styBoldText">1</span>
                                  <span style="width:4mm;"/>
                                  <span>
                                             <xsl:call-template name="PopulateSpan">
                                                     <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardGAAP"/>
                                             </xsl:call-template>
                                             <input type="checkbox" class="styCkbox">
                                                       <xsl:call-template name="PopulateYesCheckbox">
                                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardGAAP"/>
                                                       </xsl:call-template>
                                             </input>
                                  </span>
                                  <label>
                                             <xsl:call-template name="PopulateLabelYes">
                                                     <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardGAAP"/>
                                                     <xsl:with-param name="BackupName" select="Form1065ScheduleM3/AcctStandardGAAP"/>
                                             </xsl:call-template>
                                             <span style="padding-left:3.5mm;">GAAP</span>
                                   </label>          
                                   <!-- Line 4b - 2 IFRS -->
                                             <span style="width:13mm;"/>
                                             <span class="styBoldText">2</span>
                                             <span style="width:4mm;"/>
                                             <span>
                                                       <xsl:call-template name="PopulateSpan">
                                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardIFRS"/>
                                                       </xsl:call-template>
                                                       <input type="checkbox" class="styCkbox">
                                                                  <xsl:call-template name="PopulateYesCheckbox">
                                                                          <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardIFRS"/>
                                                                  </xsl:call-template>
                                                       </input>
                                             </span>
                                             <label>
                                                       <xsl:call-template name="PopulateLabelYes">
                                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardIFRS"/>
                                                               <xsl:with-param name="BackupName" select="Form1065ScheduleM3/AcctStandardIFRS"/>
                                                       </xsl:call-template>
                                                       <span style="padding-left:4mm;">IFRS</span>
                                             </label>          
                                   <!-- Line 4b - 3 704(b) -->
                                             <span style="width:23.5mm;"/>
                                             <span class="styBoldText">3</span>
                                             <span style="width:5mm;"/>
                                             <span>
                                                        <xsl:call-template name="PopulateSpan">
                                                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardsStatutory"/>
                                                        </xsl:call-template>
                                                        <input type="checkbox" class="styCkbox">
                                                                   <xsl:call-template name="PopulateYesCheckbox">
                                                                           <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardsStatutory"/>
                                                                   </xsl:call-template>
                                                        </input>
                                              </span>
                                              <label>
                                                       <xsl:call-template name="PopulateLabelYes">
                                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardsStatutory"/>
                                                               <xsl:with-param name="BackupName" select="Form1065ScheduleM3/AcctStandardsStatutory"/>
                                                       </xsl:call-template>
                                                       <span style="padding-left:4mm;">704(b)</span>
                                              </label>
                           </div><!-- Closes Lline 4b GAAP (float:left)-->
                           <div style="float:right;">
                                   <div class="styLNRightNumBox" style="height:4mm;border-bottom:none"></div>
                                   <div class="styLNAmountBox" style="height:4mm;border-bottom:none"></div>
                           </div>  
                   </div> <!--Closes Line 4b - GAAP-->
                   <!-- Line 4b - 4 Tax-basis -->
                   <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                   <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
                                   <span class="styBoldText">4</span>
                                   <span style="width:4mm;"/>
                                   <span>
                                              <xsl:call-template name="PopulateSpan">
                                                      <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardTaxBasis"/>
                                              </xsl:call-template>
                                              <input type="checkbox" class="styCkbox">
                                                         <xsl:call-template name="PopulateYesCheckbox">
                                                                 <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardTaxBasis"/>
                                                         </xsl:call-template>
                                              </input>
                                   </span>
                                   <label>
                                              <xsl:call-template name="PopulateLabelYes">
                                                     <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardTaxBasis"/>
                                                     <xsl:with-param name="BackupName" select="Form1065ScheduleM3/AcctStandardTaxBasis"/>
                                              </xsl:call-template>
                                              <span style="padding-left:3.5mm;">Tax-basis</span>
                                   </label>          
                                   <!-- Line 4b - 5 Other: (Specify) -->
                                   <span style="width:7.5mm;"/>
                                   <span class="styBoldText">5</span>
                                   <span style="width:4mm;"/>
                                   <span>
                                              <xsl:call-template name="PopulateSpan">
                                                      <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardOther"/>
                                              </xsl:call-template>
                                              <input type="checkbox" class="styCkbox">
                                                        <xsl:call-template name="PopulateYesCheckbox">
                                                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardOther"/>
                                                        </xsl:call-template>
                                              </input>
                                   </span>
                                   <label>
                                              <xsl:call-template name="PopulateLabelYes">
                                                      <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardOther"/>
                                                              <xsl:with-param name="BackupName" select="Form1065ScheduleM3/AcctStandardOther"/>
                                                      </xsl:call-template>
                                                      <span style="padding-left:4mm;">Other: (Specify)
                                                                 <img src="{$ImagePath}/1065ScheduleM3_Bullet_Title.gif" width="8" height="8" alt="Bullet"/>
                                                                 <span style="width:60mm;border-bottom:solid 1px;">
                                                                           <span style="width:3mm"/>
                                                                           <xsl:call-template name="PopulateText">
                                                                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AcctStandardOther/@AcctStandardOtherSpecify"/>
                                                                           </xsl:call-template>
                                                                 </span>
                                                      </span>
                                    </label>
                           </div><!--Closes Line 4b Tax-basis (float:left)-->         
                           <div style="float:right;">
                                   <div class="styLNRightNumBox" style="height:4mm;border-bottom:none"></div>
                                   <div class="styLNAmountBox" style="height:4mm;border-bottom:none"></div>
                           </div>    
                   </div> <!--Closes Line 4b - Tax Basis-->
                   <!-- Line 5a -->
                   <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD" style="height:4mm">5a</div>
                                  <div class="styLNDesc" style="width:135mm;height:4mm">Net income from nonincludible foreign entities (attach schedule)
                                  <!-- Form Link -->
                                          <xsl:call-template name="SetFormLinkInline">
                                                 <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeNonincludibleFrgnEnt"/>
                                          </xsl:call-template>
                                          <span class="styDotLn" style="float:none;">............</span>
                                  </div>
                           </div>
                           <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">5a</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateNegativeNumber">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeNonincludibleFrgnEnt"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 5b -->
                    <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD" style="height:4mm">
                                          <span style="width:1.5mm"/>b
                                  </div>
                                  <div class="styLNDesc" style="width:137mm;height:4mm">Net loss from nonincludible foreign entities
                                                                                                                         (attach schedule and enter as a positive amount)
                                  <!-- Form Link -->
                                         <xsl:call-template name="SetFormLinkInline">
                                                 <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleFrgnEnt"/>
                                         </xsl:call-template>
                                         <span class="styDotLn" style="float:none;">...</span>
                                  </div>
                           </div>
                           <div style="float:right;">
                                  <div class="styLNRightNumBox" style="height:4mm;">5b</div>
                                  <div class="styLNAmountBox" style="height:4mm;">
                                         <xsl:call-template name="PopulateAmount">
                                                 <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleFrgnEnt"/>
                                         </xsl:call-template>
                                  </div>
                           </div>
                   </div>
                   <!-- Line 6a -->
                   <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm">6a</div>
                            <div class="styLNDesc" style="width:137mm;height:4mm">Net income from nonincludible U.S. entities (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeNonincludibleUSEnt"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;">.............</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">6a</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateNegativeNumber">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeNonincludibleUSEnt"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 6b -->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm">
                                <span style="width:1.5mm"/>b</div>
                            <div class="styLNDesc" style="width:137mm;height:4mm">Net loss from nonincludible U.S. entities 
                                                                                                                   (attach schedule and enter as a positive amount)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleUSEnt"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;">....</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">6b</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetLossNonincludibleUSEnt"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 7a -->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm">7a</div>
                            <div class="styLNDesc" style="width:137mm;height:4mm">Net income (loss) of other foreign disregarded entities (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <!-- check for setformlink elsewhere -->
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeLossForeignDisrgdEnt"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;">..........</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">7a</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeLossForeignDisrgdEnt"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 7b -->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm">
                                <span style="width:1.5mm"/>b</div>
                            <div class="styLNDesc" style="width:137mm;height:4mm">Net income (loss) of other U.S. disregarded entities (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeLossOtherDisrgdEnt"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;">...........</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">7b</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeLossOtherDisrgdEnt"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 8 -->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
                            <div class="styLNDesc" style="width:138mm;height:4mm">Adjustment to eliminations of transactions between includible entities and nonincludible entities 
          <br/> (attach schedule)           
           <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjToEliminateTransactions"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;">............................</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:7.53mm;padding-top:3mm;">8</div>
                            <div class="styLNAmountBox" style="height:7.53mm;padding-top:3mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjToEliminateTransactions"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 9 -->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="height:4mm">9</div>
                            <div class="styLNDesc" style="width:137mm;height:4mm">Adjustment to reconcile income statement period to tax year (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjRecnclIncmStmtYearToTaxYear"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;">.......</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">9</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/AdjRecnclIncmStmtYearToTaxYear"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 10 -->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBox" style="height:4mm">10</div>
                            <div class="styLNDesc" style="width:137mm;height:4mm">Other adjustments to reconcile to amount on line 11 (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherAdjToReconcile"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;">..........</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">10</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/OtherAdjToReconcile"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <!-- Line 11 -->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBox" style="height:3mm">11</div>
                            <div class="styLNDesc" style="width:137mm;height:3mm">
                                <span class="styBoldText">Net income (loss) per income statement of the partnership.</span> Combine lines 4 through 10
            <span class="styDotLn" style="float:none;">.....</span>
                            </div>
                        </div>
                        <div style="float:right;">
                            <div class="styLNRightNumBox" style="height:4mm;">11</div>
                            <div class="styLNAmountBox" style="height:4mm;">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/NetIncomeLossPerIncomeStmt"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                    <div class="styBB" style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="height:2mm"></div>
                            <div class="styLNDesc" style="width:147mm;height:2mm">
                                    <span class="styBoldText" style="height:2mm">Note. </span>
                                    <span style="width:1mm"/>
                                    <span style = "height:2mm">Part I, line 11, must equal the amount on Part II, line 26, column (a).</span>
                             </div>
                        </div>
                    </div>
                    <!-- Line 12 -->
                    <!--<div class="styBB" style="height:10mm;border-bottom-width:1px">-->
                    <div style="width:187mm;">
                        <div style="float:left;clear:none;">
                            <div class="styLNLeftNumBoxSD" style="padding-left:1mm">12</div>
                            <div class="styLNDesc" style="width:179mm;font-size:6.374pt">
                            Enter the total amount (not just the partnership's share) of the assets and liabilities of all entities included or removed on the following lines:</div>
                        </div>
                    </div>
                    <!--<div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD">4a</div>
                                  <div class="styLNDesc" style="width:130mm;">Worldwide consolidated net income (loss) from income statement source identified in Part I, line 1</div>
                           </div>
                           <div style="float:right;">
                                  <div class="styLNRightNumBox">4a</div>
                                  <div class="styLNAmountBox">
                                         <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/WorldwideCnsldtNetIncomeLoss"/>
                                         </xsl:call-template>
                                  </div>
                           </div>
                   </div>-->
                     <!-- Line 12 - Total Assets       Total Liabilities -->
                    <div style="width:187mm;">
                            <div style="float:right;width:140mm">
                                  <div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;width:42mm;border-top:solid black 1px;">
                                        <span style="padding-right:15mm;font-size:6pt;">Total Assets</span> 
                                  </div>                                              
                                  <div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;width:42mm;border-top:solid black 1px;
                                                                                          border-right:solid black 1 px">
                                        <span style="padding-right:12mm;font-size:6pt;">Total Liabilities</span>
                                  </div>
                            </div> 
                    </div>
                    <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD">
                                         <span style="width:1.5mm;font-size:6pt"/>a
                                  </div>
                                         <div class="styLNDesc" style="width:35mm;font-size:6pt">Included on Part I, line 4
                                         </div>
                            </div>
                            <div style="float:right;width:140mm">
                                  <div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;">
                                        <xsl:call-template name="PopulateAmount">
                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAmountIncludedTotAssetLn4"/>
                                        </xsl:call-template>
                                  </div>
                                  <div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;border-right:solid black 1px">
                                        <xsl:call-template name="PopulateAmount">
                                               <xsl:with-param name="TargetNode" 
                                                       select="$Form1065ScheduleM3/TotalAmountIncludedTotLiabLn4"/>
                                        </xsl:call-template>
                                  </div>
                            </div>
                   </div>
                   <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD">
                                         <span style="width:1.5mm;font-size:6pt"/>b
                                  </div>
                                  <div class="styLNDesc" style="width:35mm;font-size:6pt">Removed on Part I, line 5
                                  </div>
                           </div>        
                            <div style="float:right;width:140mm">
                                  <div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;">             
                                        <xsl:call-template name="PopulateAmount">
                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAmountRemovedTotAssetsLn5"/>
                                        </xsl:call-template>
                                   </div>
                                   <div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;border-right:solid black 1px"> 
                                         <xsl:call-template name="PopulateAmount">
                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAmountRemovedTotLiabLn5"/>
                                         </xsl:call-template>
                                   </div>
                           </div>   
                   </div>
                   <div style="width:187mm;">
                           <div style="float:left;clear:none;">
                                  <div class="styLNLeftNumBoxSD">
                                          <span style="width:1.5mm;font-size:6pt"/>c
                                  </div>
                                  <div class="styLNDesc" style="width:35mm;font-size:6pt">Removed on Part I, line 6
                                  </div>
                           </div> 
                           <div style="float:right;width:140mm">
                                  <div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;">       
                                        <xsl:call-template name="PopulateAmount">
                                              <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAmountRemovedTotAssetsLn6"/>
                                        </xsl:call-template>
                                  </div>
                                  <div class="styLNAmountBox" style="width:42mm;border-top:solid black 0px;border-right:solid black 1px">     
                                        <xsl:call-template name="PopulateAmount">
                                              <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAmountRemovedTotLiabLn6"/>
                                        </xsl:call-template>
                                  </div>
                           </div>   
                   </div>
                   <div class="styBB" style="width:187mm;">
                           <div style="float:left;clear:none;">
                                   <div class="styLNLeftNumBoxSD">
                                           <span style="width:1.5mm;font-size:6pt"/>d
                                   </div>
                                   <div class="styLNDesc" style="width:35mm;font-size:6pt">Included on Part I, line 7
                                   </div>
                           </div> 
                           <div style="float:right;width:140mm">
                                  <div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;height:2mm;width:42mm;border-top:solid black 0px;">        
                                        <xsl:call-template name="PopulateAmount">
                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAmountIncludedTotAssetLn7"/>
                                        </xsl:call-template>
                                  </div>
                                  <div class="styLNAmountBox" style="padding-top:none;padding-bottom:none;height:2mm;width:42mm;
                                                                                          border-top:solid black 0px;border-right:solid black 1px">                                  
                                        <xsl:call-template name="PopulateAmount">
                                               <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/TotalAmountIncludedTotLiabLn7"/>
                                        </xsl:call-template>
                                  </div>
                            </div>   
                   </div>
                   <!-- Page 1 Footer -->
                    <div class="pageEnd" style="width:187mm;">
                        <div class="styBoldText" style="width:115mm;float:left;font-size:6pt;height:3mm">For Paperwork Reduction Act Notice, see the Instructions for your return.
                        </div>
                        <div style="float:left;font-size:6pt">Cat. No. 39669D</div>
                        <div class="styBoldText" style="float:right;font-size:6pt;height:3mm">Schedule M-3 (Form 1065) 2008</div>
                    </div>
                    <!-- Page 2 -->
                    <!-- Page 2 Header -->
                    <div class="styBB" style="width:187mm;">
                        <div style="float:left;">Schedule M-3 (Form 1065) 2008</div>
                        <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
                        </div>
                    </div>
                    <!-- Name and EIN Line -->
                    <div class="styBB" style="width:187mm;">
                        <!-- Name -->
                        <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
          Name of partnership<br/>
                            <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/PartnershipName/BusinessNameLine1"/>
                            </xsl:call-template>
                            <br/>
                            <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/PartnershipName/BusinessNameLine2"/>
                            </xsl:call-template>
                        </div>
                        <!-- Employer Identification Number -->
                        <div style="width:47mm;float:right;clear:none;padding-left:1mm;">
                            <span class="styBoldText">Employer identification number</span>
                            <br/>
                            <br/>
                            <xsl:call-template name="PopulateEIN">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/PartnershipEIN"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Part 2 - Header -->
                    <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
                        <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">Part II</span>
                        <span class="styPartDesc" style="width:170mm;">
                            <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Partnership with Income (Loss)<br/>
                            <span style="width:2mm;"/> per Return
           <xsl:call-template name="SetFormLinkInline">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems"/>
                            </xsl:call-template>
                        </span>
                    </div>
                    <!-- Part II Table -->
                    <table class="styTable" id="IRS1065ScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible entities With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
                        <tr>
                            <th class="styTableThead" style="width:6mm"/>
                            <th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;">
                           Income (Loss) Items
                                   <br/><br/>
                                   <span style="font-size:7pt;font-weight:normal;float:left">(Attach schedules for lines 1 through 9)
                                   </span>
                            </th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">
                           (a)</span>
                                <br/> Income (Loss) per<br/> Income Statement <br/>
                            </th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">
                           (b)</span>
                                <br/> Temporary<br/> Difference</th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">
                           (c)</span>
                                <br/> Permanent<br/> Difference</th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">
                           (d)</span>
                                <br/> Income (Loss) per<br/> Tax Return <br/>
                            </th>
                        </tr>
                        <!-- Part II - Line 1 -->
                        <tr>
                             <td class="styIRS1065ScheduleM3NumberCell">
                                   <span style="width:1.5mm;"/>1
                             </td>
                             <td>
                            Income (loss) from equity method foreign corporations
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell">
                                <span style="width:1mm"/>
                            </td>
                        </tr>
                        <!-- Part II - Line 2 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>2</td>
                            <td>Gross foreign dividends not previously taxed
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 3 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>3</td>
                            <td>Subpart F, QEF, and similar income inclusions
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 4 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>4</td>
                            <td>Gross foreign distributions previously taxed
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
                                <span style="width:1mm"/>
                            </td>
                        </tr>
                        <!-- Part II - Line 5 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>5</td>
                            <td>Income (loss) from equity method U.S. corporations
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell">
                                <span style="width:1mm"/>
                            </td>
                        </tr>
                        <!-- Part II - Line 6 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>6</td>
                            <td>U.S. dividends            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/USDiv"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/USDiv/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/USDiv/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/USDiv/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/USDiv/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 7 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>7</td>
                            <td>Income (loss) from U.S. partnerships (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossUSPartnerships"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 8 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>8</td>
                            <td>Income (loss) from foreign partnerships (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossForeignPartnerships"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 9 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>9</td>
                            <td style="padding-top:.5mm;">Income (loss) from other pass-through entities (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 10 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">10</td>
                            <td>Items relating to reportable transactions (attach details)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 11 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">11</td>
                            <td>Interest income (attach Form 8916-A)  
                                 <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/InterestIncome"/>
                                 </xsl:call-template>
                          
                            <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/InterestIncome/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/InterestIncome/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/InterestIncome/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/InterestIncome/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 12 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">12</td>
                            <td>Total accrual to cash adjustment<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/TotalAccrualCashAdjustment/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/TotalAccrualCashAdjustment/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/TotalAccrualCashAdjustment/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/TotalAccrualCashAdjustment/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 13 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">13</td>
                            <td>Hedging transactions<span class="styDotLn" style="float:none;
                  padding-left:3mm;">...........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/HedgingTransactions/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/HedgingTransactions/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 14 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">14</td>
                            <td>Mark-to-market income (loss)<span class="styDotLn" style="float:none;
                  padding-left:3mm;">........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                     IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 15 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">15</td>
                            <td>Cost of goods sold (attach Form 8916-A)
                      <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/CostOfGoodsSold"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell"><span>(</span>
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3
              /IncomeLossItems/CostOfGoodsSold/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                                <span>)</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/CostOfGoodsSold/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/CostOfGoodsSold/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell"><span>(</span>
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/CostOfGoodsSold/IncomeLossPerTaxReturn"/>
                                </xsl:call-template><span>)</span>
                            </td>
                        </tr>
                        <!-- Part II - Line 16 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">16</td>
                            <td>Sale versus lease (for sellers and/or lessors)<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/SalesVersusLease/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/SalesVersusLease/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 17 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">17</td>
                            <td>Section 481(a) adjustments<span class="styDotLn" style="float:none;
                  padding-left:3mm;">.........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/Section481aAdjustments/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/Section481aAdjustments/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 18 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">18</td>
                            <td>Unearned/deferred revenue<span class="styDotLn" style="float:none;
                  padding-left:3mm;">.........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/UnearnedDeferredRevenue/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/UnearnedDeferredRevenue/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/UnearnedDeferredRevenue/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/UnearnedDeferredRevenue/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 19 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">19</td>
                            <td>Income recognition from long-term contracts<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeRecognitionLTContracts/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeRecognitionLTContracts/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 20 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">20</td>
                            <td>Original issue discount and other imputed interest<span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 21a -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell" align="left">21a</td>
                            <td style="padding-top:.5mm;">Income statement gain/loss on sale, exchange,
                      abandonment, worthlessness, or other disposition of
                      assets other than inventory and pass-through entities
                          <span class="styDotLn" style="float:none;padding-left:1mm;">.</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncmStmtGainLossAstNotInvntry/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncmStmtGainLossAstNotInvntry/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/IncmStmtGainLossAstNotInvntry/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
                                <span style="width:1mm"/>
                            </td>
                        </tr>
                        <!-- Part II - Line 21b -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;padding-left:3.5mm;"/>b</td>
                            <td style="padding-top:.5mm;">Gross capital gains from Schedule D, excluding
                              amounts from pass-through entities
                          <span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 21c -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;padding-left:3.5mm;"/>c</td>
                            <td style="padding-top:.5mm;">Gross capital losses from Schedule D, excluding
              amounts from pass-through entities, abandonment
              losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 21d -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;padding-left:3.5mm;"/>d</td>
                            <td style="padding-top:.5mm;">Net gain/loss reported on Form 4797, line 17,
excluding amounts from pass-through entities,
abandonment losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:3mm;">.........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/
              GainLossReportedOnForm4797/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/
              GainLossReportedOnForm4797/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/
              GainLossReportedOnForm4797/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 21e -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;padding-left:3.5mm;"/>e</td>
                            <td style="padding-top:.5mm;">Abandonment losses
          <span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/AbandonmentLosses/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/AbandonmentLosses/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 21f -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;padding-left:3.5mm;"/>f</td>
                            <td>Worthless stock losses (attach details)
<!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/WorthlessStockLosses"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:0px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              WorthlessStockLosses/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              WorthlessStockLosses/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              WorthlessStockLosses/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 21g -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;padding-left:3.5mm;"/>g</td>
                            <td style="padding-top:.5mm;">Other gain/loss on disposition of assets other than inventory
          <span class="styDotLn" style="float:none;padding-left:3mm;"/>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/
              OthGainLossAssetsNotInventory/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              OthGainLossAssetsNotInventory/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3
              /IncomeLossItems/
              OthGainLossAssetsNotInventory/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 22 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">22</td>
                            <td style="padding-top:.5mm; font-size:8.5px;">Other income (loss) items with differences (attach schedule)
<!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 23 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">23</td>
                            <td>
                                <span class="styBoldText" style="font-weight:bold">Total income (loss) items. </span>
                                <span style="font-weight:normal">Combine lines 1 through
             22</span>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalIncomeLossItems/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalIncomeLossItems/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalIncomeLossItems/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalIncomeLossItems/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 24 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">24</td>
                            <td>
                                <span class="styBoldText" style="font-weight:bold">Total expense/deduction items. </span>
                                <span style="font-weight:normal"> (from Part III,</span>
                                <br/>
                                <span style="font-weight:normal"> line 30) (see instructions)</span>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell"><span>(</span>
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                                <span>)</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell"><span>(</span>
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                                <span>)</span>
                            </td>
                        </tr>
                        <!-- Part II - Line 25 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">25</td>
                            <td style="padding-top:.5mm;">Other items with no differences
                           <span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/OthItemsWithNoDifferences/IncomePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell" style="border-bottom-width:1px;">
                                <span style="width:1mm"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/IncomeLossItems/OthItemsWithNoDifferences/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part II - Line 26 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">26</td>
                            <td>
                                <span class="styBoldText" style="font-weight:bold">Reconciliation totals. </span>
                                <span style="font-weight:normal">Combine lines 23 through 25</span>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
             ReconciliationTotals/IncomeLossPerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
              ReconciliationTotals/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
                IncomeLossItems/
              ReconciliationTotals/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              IncomeLossItems/
             ReconciliationTotals/IncomeLossPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </table>
                    <div style="width:187mm;height:4mm;"/>
                    <div style="width:165mm;margin-left:7mm;">
                        <span class="styBoldText">Note.</span> 
         Line 26, column (a), must equal the amount on Part I, line 11, and column (d) must equal Form 1065, page 5,<br/>
Analysis of Net Income (Loss), line 1.</div>
                    <div class="styBB" style="width:187mm;"/>
                    <div class="pageEnd" style="width:187mm;">
                        <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1065) 2008</div>
                    </div>
                    <!-- Page 3 -->
                    <!-- Page 3 Header -->
                    <div class="styBB" style="width:187mm;">
                        <div style="float:left;">Schedule M-3 (Form 1065) 2008</div>
                        <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
                        </div>
                    </div>
                    <!-- Name and EIN Line -->
                    <div class="styBB" style="width:187mm;">
                        <!-- Name -->
                        <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
          Name of partnership<br/>
                            <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ExpenseDeductionItems/PartnershipName/BusinessNameLine1"/>
                            </xsl:call-template>
                            <br/>
                            <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ExpenseDeductionItems/PartnershipName/BusinessNameLine2"/>
                            </xsl:call-template>
                        </div>
                        <!-- Employer Identification Number -->
                        <div style="width:47mm;float:right;clear:none;">
                            <span class="styBoldText">Employer identification number</span>
                            <br/>
                            <br/>
                            <xsl:call-template name="PopulateEIN">
                                <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ExpenseDeductionItems/PartnershipEIN"/>
                            </xsl:call-template>
                        </div>
                    </div>
                    <!-- Part 3 - Header -->
                    <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;
                        border-top-width:1px; border-right-width:0px;border-left-width:0px;
                        padding-top:0;float:left;">
                        <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm .5mm
                      .25mm .5mm;">Part III</span>
                        <span class="styPartDesc" style="width:170mm;">
Reconciliation of Net Income (Loss) per Income Statement of Partnership With Income (Loss) per
Return—Expense/Deduction Items
        </span>
                        <xsl:call-template name="SetFormLinkInline">
                            <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ExpenseDeductionItems"/>
                        </xsl:call-template>
                    </div>
                    <!-- Part III Table -->
                    <table class="styTable" id="IRS1065ScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible entities With Taxable Income per Return—Expense/Deduction Items " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
                        <tr>
                            <th class="styTableThead" style="width:6mm"/>
                            <th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;">Expense/Deduction Items</th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">(a)</span>
                                <br/> Expense per<br/> Income Statement <br/>
                            </th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">(b)</span>
                                <br/> Temporary<br/> Difference</th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">(c)</span>
                                <br/> Permanent<br/> Difference</th>
                            <th class="styIRS1065ScheduleM3TheadCell">
                                <span class="styBoldText">(d)</span>
                                <br/> Deduction per<br/> Tax Return <br/>
                            </th>
                        </tr>
                        <!-- Part III - Line 1 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>1</td>
                            <td>State and local current income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/
              ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 2 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>2</td>
                            <td>State and local deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/
              ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 3 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>3</td>
                            <td style="padding-top:.5mm;">Foreign current income tax expense (other than foreign withholding taxes)
          <span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 4 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>4</td>
                            <td>Foreign deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/
              ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 5 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>5</td>
                            <td>Equity-based compensation<span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherEquityBasedCompensation/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherEquityBasedCompensation/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherEquityBasedCompensation/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherEquityBasedCompensation/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 6 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>6</td>
                            <td>Meals and entertainment<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 7 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>7</td>
                            <td>Fines and penalties<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 8 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>8</td>
                            <td>Judgments, damages, awards, and similar costs
          <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
            ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 9 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;"/>9</td>
                            <td>Guaranteed payments<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/GuaranteedPayments/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/GuaranteedPayments/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/GuaranteedPayments/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/GuaranteedPayments/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 10 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">10</td>
                            <td>Pension and profit-sharing<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 11 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">11</td>
                            <td>Other post-retirement benefits<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 12 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">12</td>
                            <td>Deferred compensation<span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 13 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">13</td>
                            <td>Charitable contribution of cash and tangible property<span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 14 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">14</td>
                            <td>Charitable contribution of intangible property<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 15 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">15</td>
                            <td style="padding-top:.5mm;">Organizational expenses as per Regulations Sections 1.709-2(a)
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OrganizationalExpenses/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OrganizationalExpenses/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OrganizationalExpenses/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OrganizationalExpenses/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 16 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">16</td>
                            <td style="padding-top:.5mm;">Syndication expenses as per Regulations Sections 1.709-2(b)
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/SyndicationExpenses/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/SyndicationExpenses/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/SyndicationExpenses/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/SyndicationExpenses/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 17 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">17</td>
                            <td style="padding-top:.5mm;">Current year acquisition/reorganization
                           investment banking fees
         <!--<span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>-->
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/
              ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/ExpenseDeductionItems/
               CYAcquisReorgInvstBankingFees/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 18 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">18</td>
                            <td style="padding-top:.5mm;">Current year acquisition/reorganization legal and
                          accounting fees<span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 19 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">19</td>
                            <td>Amortization/impairment of goodwill<span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortizationImpairmentGoodwill/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortizationImpairmentGoodwill/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortizationImpairmentGoodwill/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 20 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">20</td>
                            <td style="padding-top:.5mm;">Amortization of acquisition, reorganization, and
                           start-up costs<span class="styDotLn" style="float:none;padding-left:3mm;">.................</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 21 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">21</td>
                            <td>Other amortization or impairment write-offs<span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 22 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">22</td>
                            <td>Section 198 environmental remediation costs<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Sect198EnvrmtRemediationCosts/
              ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Sect198EnvrmtRemediationCosts/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Sect198EnvrmtRemediationCosts/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Sect198EnvrmtRemediationCosts/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 23a -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell" align="left">23a</td>
                            <td>Depletion—Oil &amp; Gas<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DepletionOilGas/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DepletionOilGas/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DepletionOilGas/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3ShadedCell">
                                <span style="width:1mm"/>
                            </td>
                        </tr>
                        <!-- Part III - Line 23b -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">
                                <span style="width:1.5mm;padding-left:3.5mm;"/>b</td>
                            <td>Depletion—Other than Oil &amp; Gas<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DepletionOtherThanOilGas/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DepletionOtherThanOilGas/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DepletionOtherThanOilGas/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/DepletionOtherThanOilGas/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 24 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">24</td>
                            <td>
         Intangible drilling &amp; development costs <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/IntangibleDrillingAndDevCosts/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/IntangibleDrillingAndDevCosts/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/IntangibleDrillingAndDevCosts/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/IntangibleDrillingAndDevCosts/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 25 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">25</td>
                            <td>
         Depreciation<span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Depreciation/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Depreciation/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Depreciation/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/Depreciation/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 26 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">26</td>
                            <td>Bad debt expense<span class="styDotLn" style="float:none;padding-left:3mm;">.............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/BadDebtExpense/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/BadDebtExpense/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/BadDebtExpense/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/BadDebtExpense/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 27 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">27</td>
                            <td>Interest expense (attach Form 8916-A)  
                                 <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/InterestExpense"/>
                                 </xsl:call-template>
                            <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/InterestExpense/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/InterestExpense/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/InterestExpense/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/InterestExpense/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 28 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">28</td>
                            <td>Purchase versus lease (for purchasers and/or lessees)
          <span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 29 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">29</td>
                            <td style="padding-top:.5mm;">Other expense/deduction items with differences
                            (attach schedule)
            <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <!-- Part III - Line 30 -->
                        <tr>
                            <td class="styIRS1065ScheduleM3NumberCell">30</td>
                            <td style="padding-top:.5mm;font-weight:bold">Total expense/deduction items.
          <span style="font-weight:normal">Combine lines 1
through 29. Enter here and on Part II, line 24, reporting
positive amounts as negative and negative amounts as
positive 
                               <!-- Form Link -->
                                <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences"/>
                                </xsl:call-template>
                                <span class="styDotLn" style="float:none;padding-left:3mm;">...................</span>
          </span>
          <div style="width:187mm;border-style:solid; border-bottom-width:2px;
                        border-top-width:0px; border-right-width:0px;border-left-width:0px;
                        padding-top:0;float:left;"/>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/TotalExpenseDeductionItems/ExpensePerIncomeStatement"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/TotalExpenseDeductionItems/TemporaryDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/TotalExpenseDeductionItems/PermanentDifference"/>
                                </xsl:call-template>
                            </td>
                            <td class="styIRS1065ScheduleM3Cell">
                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3/
              ExpenseDeductionItems/TotalExpenseDeductionItems/DeductionPerTaxReturn"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </table>
                    
                    <div class="pageEnd" style="width:187mm;">
                        <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1065) 2008</div>
                    </div>
                    <!-- Left Over Data Table -->
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
                            <xsl:with-param name="TargetNode" select="$Form1065ScheduleM3"/>
                            <xsl:with-param name="DescWidth" select="100"/>
                        </xsl:call-template>
                    </table>
                    <!-- END Left Over Table -->
                    <!-- Additional Data Table-->
                    <!-- Separated Data for D -->
                    <xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleM3/ReportableEntityPartners/Item) &gt;2)">
                        <br/>
                        <span class="styRepeatingDataTitle">Form 1065 Schedule M3, Line D</span>
                        <table class="styDepTbl" style="font-size:7pt;">
                            <thead class="styTableThead">
                                <!-- Label the Column Headers -->
                                <tr class="styDepTblHdr">
                                    <th class="styDepTblCell" scope="col" valign="middle">Name of Reportable Entity Partner</th>
                                    <th class="styDepTblCell" scope="col" valign="middle">Identifying Number</th>
                                    <th class="styDepTblCell" scope="col" align="center" valign="middle">Maximum Percentage Owned or Deemed Owned</th>
                                </tr>
                            </thead>
                            <tfoot/>
                            <tbody>
                                <xsl:for-each select="$Form1065ScheduleM3/ReportableEntityPartners/Item">
                                    <tr style="border-color:black;">
                                        <!-- Define background colors to the rows -->
                                        <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                        <!-- First Column -->
                                        <td class="styTableCellText" align="center">
                                            <div style="width:120mm;">
                                                <span style="float:left;">
                                                    <xsl:if test="NameOfReportableEntityPartner">
                                                        <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="NameOfReportableEntityPartner"/>
                                                        </xsl:call-template>
                                                    </xsl:if>
                                                </span>
                                            </div>
                                        </td>
                                        <!-- Second Column -->
                                        <td class="styTableCellText">
                                            <div style="width:36mm;" align="center">
                                                <span style="">
                                                    <xsl:choose>
                                                        <xsl:when test="PartnerSSN">
                                                            <xsl:call-template name="PopulateSSN">
                                                                <xsl:with-param name="TargetNode" select="PartnerSSN"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:when test="PartnerEIN">
                                                            <xsl:call-template name="PopulateEIN">
                                                                <xsl:with-param name="TargetNode" select="PartnerEIN"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:call-template name="PopulateText">
                                                                <xsl:with-param name="TargetNode" select="MissingSSNEINReason"/>
                                                            </xsl:call-template>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </span>
                                            </div>
                                        </td>
                                        <!-- Third Column -->
                                        <td class="styTableCellCtr">
                                            <div style="width:30mm;" align="center">
                                                <span style="">
                                                    <xsl:call-template name="PopulatePercent">
                                                        <xsl:with-param name="TargetNode" select="MaximumPercentageOfDeemedOwnr"/>
                                                    </xsl:call-template>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </xsl:if>
                    <!-- /Separated Data for D -->
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
