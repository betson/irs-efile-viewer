<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120PCScheduleM3Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1120PCScheduleM3" select="$RtnDoc/IRS1120PCScheduleM3"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120PCScheduleM3)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching   -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1120-PC Schedule M3"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!-- HINTS: To unit test separated data format - comment out the if statement for Print -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120PCScheduleM3Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120PCScheduleM3">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Header - Form1120PCSchM3 Number, Title, and Year -->
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:32mm;height:21mm;border-right-width:2px;">
              <span class="styFormNumber" style="font-size:10pt;">SCHEDULE M-3<br/>(Form 1120-PC)</span>
              <br/>
              <!-- Form Link - Push Pin under the form number box-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency" style="height:5mm;padding-top:2mm;">
                Department of the Treasury<br/>
                Internal Revenue Service
              </span>
            </div>
            <div class="styFTBox" style="width:125mm;height:21mm;font-size:11pt;text-align:center;">
              <div class="styMainTitle" style="font-size:11pt;">Net Income (Loss) Reconciliation for U.S. Property and Casualty  
                <br/>
                   Insurance Companies With Total Assets of $10 Million or More
               </div>
              <div class="styFST" style="height:5mm;font-size:7pt;">
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> Attach to Form 1120-PC.<br/>
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> Information about Schedule M-3 (Form 1120-PC) and its separate instructions is at 
                <a href="http://www.irs.gov/form1120PC" title="Link to IRS.gov"><i>www.IRS.gov/form1120PC</i></a>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:21mm;border-left-width:2px;">
              <div class="styOMB" style="height:6mm;padding-top:1.5mm;">OMB No. 1545-1027</div>
              <div class="styTY" style="height:13.5mm;padding-top:2mm;">20<span class="styTYColor">13</span>
              </div>
            </div>
          </div>
          <!-- End Header - Form Number, Title, and Year -->
          <!-- start check box line  -->
          <div style="width:187mm;">
            <span style="width:35.5mm;">Check applicable box(es): </span>
            <!--Check Box 1 -->
            <!-- Note: Check box 1 Non-consolidate return is present for form 1120PC Sch-3 schema only, is not availabel in 1120PC E&A Schema -->
            <span style="padding-left:10mm">(1)</span>
            <span style="width:5px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NonConsolidatedReturnInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3NonConsolidatedReturn</xsl:with-param>
              </xsl:call-template>
            </input>
            <label style="width:45mm">
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NonConsolidatedReturnInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3NonConsolidatedReturn</xsl:with-param>
              </xsl:call-template>
		   Non-consolidated return
		</label>
            <!--Check Box 2 -->
            <!-- Note: Check box 2 Consolidated return is present for form 1120PC Sch-M3 Schema only, is not availabel in 1120PC E&A Schema -->
            <span style="padding-left:4mm">(2)</span>
            <span style="width:5px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ConsolidatedReturnInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedReturn</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ConsolidatedReturnInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedReturn</xsl:with-param>
              </xsl:call-template>
	         Consolidated return (Form 1120-PC only)
		</label>
          </div>
          <!--Check Box 3 -->
          <div class="styBB" style="width:187mm;">
            <span style="width:35.5mm"/>
            <span style="padding-left:10mm">(3)</span>
            <span style="width:5px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/DormantSubsidiariesSchAttInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3DormantSubsidiariesSchAttached</xsl:with-param>
              </xsl:call-template>
            </input>
            <label style="width:44.6mm">
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/DormantSubsidiariesSchAttInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3DormantSubsidiariesSchAttached</xsl:with-param>
              </xsl:call-template>
		Mixed 1120/L/PC group
	     </label>
            <span style="padding-left:4.3mm">(4)</span>
            <span style="width:1.4mm;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Mixed1120LPCGroupInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3Mixed1120LPCGroup</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Mixed1120LPCGroupInd"/>
                <xsl:with-param name="BackupName">IRS1120PCScheduleM3Mixed1120LPCGroup</xsl:with-param>
              </xsl:call-template>
		  Dormant subsidiaries schedule attached
	      </label>
          </div>
          <!-- End check boxes line  -->
          <!--  Name -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;height:8.5mm">
              Name of corporation (common parent, if consolidated return)
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- EIN -->
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;height:8.5mm;width:46mm;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="$Form1120PCScheduleM3/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/MissingEINReasonCd"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
            <!-- Close EIN div -->
          </div>
          <!-- Close Name and EIN Div -->
          <!--  End Name and Employer indentification number  -->
          <!-- Part I - Header -->
          <div class="styBB" style="width:187mm;">
            <span class="styPartName" style="width:16mm;">Part I</span>
            <span class="styPartDesc" style="width:150mm;">
              Financial Information and Net Income (Loss) Reconciliation <span style="font=normal;">(see instructions)</span>
            </span>
          </div>
          <!-- L1a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">1a</div>
            <div class="styLNDesc" style="width:179mm;">
              Did the corporation file SEC Form 10-K for its income statement period ending with or within this tax year?
            </div>
          </div>
          <!-- L1a - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationFiledSECForm10KInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationFiledSECForm10KInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpFiledSECForm10K</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationFiledSECForm10KInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpFiledSECForm10K</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
                Skip lines 1b and 1c and complete lines 2a through 11 with respect to that SEC Form 10-K.
            </div>
            <!-- Close description line -->
          </div>
          <!-- L 1a - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationFiledSECForm10KInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationFiledSECForm10KInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpFiledSECForm10K</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationFiledSECForm10KInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpFiledSECForm10K</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
                Go to line 1b. See instructions if multiple non-tax-basis income statements are prepared.
            </div>
            <!-- Close description line -->
          </div>
          <!-- L1b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b
            </div>
            <div class="styLNDesc" style="width:179mm;">Did the corporation prepare a certified audited non-tax-basis income statement for that period?</div>
          </div>
          <!-- L1b - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
                Skip line 1c and complete lines 2a through 11 with respect to that income statement.
            </div>
            <!-- close description line -->
          </div>
          <!-- L1b - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepCertAuditedIncomeStmt</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
                Go to line 1c.
            </div>
            <!-- Close description line -->
          </div>
          <!-- L1c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>c
            </div>
            <div class="styLNDesc" style="width:179mm;">Did the corporation prepare a non-tax-basis income statement for that period?
           </div>
          </div>
          <!-- L1c - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationPreparedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationPreparedIncmStmtInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepIncomeStatement</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationPreparedIncmStmtInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepIncomeStatement</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
                Complete lines 2a through 11 with respect to that income statement.
            </div>
            <!-- Close description line -->
          </div>
          <!-- L1c - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationPreparedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationPreparedIncmStmtInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepIncomeStatement</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationPreparedIncmStmtInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpPrepIncomeStatement</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
                Skip lines 2a through 3c and enter the corporation’s net income (loss) per its books and records on line 4a. 
            </div>
            <!-- close description line -->
          </div>
          <!-- L2a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">2a</div>
            <div class="styLNDesc" style="width:179mm;">Enter the income statement period:
            <span style="width:3mm"/>Beginning<span style="width:3mm"/>
              <!-- A straight Line -->
              <span style="width:25mm;border-bottom:solid 1px;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeStatementBeginningDt"/>
                </xsl:call-template>
              </span>
              <span style="width:8mm"/>Ending<span style="width:3mm"/>
              <span style="width:25mm;border-bottom:solid 1px;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeStatementEndingDt"/>
                </xsl:call-template>
              </span>
            </div>
            <!-- close description line -->
          </div>
          <!-- L2b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b
            </div>
            <div class="styLNDesc" style="width:179mm;">Has the corporation’s income statement been restated for the income statement period on line 2a?
            </div>
          </div>
          <!-- L2b - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationIncmStmtRestatedInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationIncmStmtRestatedInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncomeStatementRestated</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationIncmStmtRestatedInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncomeStatementRestated</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
                (If "Yes," attach an explanation and the amount of each item restated.)
              <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationIncmStmtRestatedInd"/>
              </xsl:call-template>
            </div>
            <!-- close description line -->
          </div>
          <!-- L2b - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationIncmStmtRestatedInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationIncmStmtRestatedInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncomeStatementRestated</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationIncmStmtRestatedInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncomeStatementRestated</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
            <!-- close description line -->
          </div>
          <!-- L2c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>c
            </div>
            <div class="styLNDesc" style="width:179mm;">
              Has the corporation’s income statement been restated for any of the five income statement periods preceding the period on line 2a?
            </div>
          </div>
          <!-- L2c - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
                (If "Yes," attach an explanation and the amount of each item restated.)
              <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5PrecInd"/>
              </xsl:call-template>
            </div>
            <!-- close description line -->
          </div>
          <!-- L2c - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpIncmStmtRestated5Preceding</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
            <!-- close description line -->
          </div>
          <!-- L3a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">3a</div>
            <div class="styLNDesc" style="width:179mm;">Is any of the corporation’s voting common stock publicly traded?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationVtngComStkPubTrdInd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- L3a - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationVtngComStkPubTrdInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationVtngComStkPubTrdInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationVtngComStkPubTrdInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>
            </div>
            <!-- close description line -->
          </div>
          <!-- L3a - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationVtngComStkPubTrdInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationVtngComStkPubTrdInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorporationVtngComStkPubTrdInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3CorpVotingCommonStockPubTraded</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
                If "No," go to line 4a.
            </div>
            <!-- close description line -->
          </div>
          <!-- L3b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b
            </div>
            <div class="styLNDesc" style="width:113mm;">Enter the symbol of the corporation’s primary U.S. publicly traded voting common stock
              <span class="styDotLn" style="float:none;"></span>
            </div>
            <div style="width:25mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/StockSymbolCd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- L3c -->
          <div class="styBB" style="width:187mm;padding-bottom:3mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>c
            </div>
            <div class="styLNDesc" style="width:113mm;">Enter the nine-digit CUSIP number of the corporation’s primary publicly traded voting common stock
              <span class="styDotLn" style="float:none;">.......................</span>
            </div>
            <div style="width:45mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CUSIPNum"/>
              </xsl:call-template>
            </div>
          </div>
          <!--<div class="styBB" style="width:187mm;"></div>-->
          <!-- L4a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">4a</div>
              <div class="styLNDesc" style="width:130mm;padding-top:.5mm;">Worldwide consolidated net income (loss) from income statement source identified in Part I, line 1</div>
              <!--<span class="styDotLn" style="float:none;padding-left:2px;" valign="bottom">.</span>-->
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">4a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/WorldwideCnsldtNetIncmLossAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L4b r1 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm;"/>b
              </div>
              <div class="styLNDesc" style="width:90mm;padding-top:.5mm;">Indicate accounting standard used for line 4a (see instructions):</div>
              <span class="styDotLn" style="float:none;padding-left:2px;" valign="bottom"/>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
            </div>
            <!-- close float right -->
          </div>
          <!-- L4b r2 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm;"/>
              </div>
              <!--Check Box 1 -->
              <div class="styLNDesc" style="width:130mm;padding-top:.5mm;">(1)
               <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/GAAPInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3GAAP</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/GAAPInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3GAAP</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">GAAP</span>
                </label>
                <!--Check Box 2 -->
                <span style="width:1.5mm"/>(2)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IFRSInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3IFRS</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IFRSInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3IFRS</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">IFRS</span>
                </label>
                <!--Check Box 3 -->
                <span style="width:1.5mm"/>(3)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/StatutoryInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3Statutory</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/StatutoryInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3Statutory</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Statutory</span>
                </label>
                <!--Check Box 4 -->
                <span style="width:1.5mm"/>(4)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3Other</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1mm"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherInd"/>
                    <xsl:with-param name="BackupName">IRS1120PCScheduleM3Other</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Other (specify)</span>
                  <span style="width:1.5mm;"/>
                  <!-- A straight Line -->
                  <span style="width:35mm;border-bottom:solid 1px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherInd/@otherDesc"/>
                    </xsl:call-template>
                  </span>
                </label>
              </div>
              <!--Close Check box 1 -->
            </div>
            <!--close float left -->
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
            </div>
            <!-- close float right -->
          </div>
          <!-- close L4b r2 -->
          <!-- L5a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">5a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income from nonincludible foreign entities (attach statement)
                <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">5a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L5b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm;"/>b
              </div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net loss from nonincludible foreign entities (attach statement and enter as a positive amount)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L6a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">6a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income from nonincludible U.S. entities (attach statement)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="yellow;height:4.5mm;">6a</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L6b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>b
              </div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net loss from nonincludible U.S. entities (attach statement and enter as a positive amount)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:4.5mm;">6b</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleUSEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L7a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">7a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other includible foreign disregarded entities (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="yellow;height:4.5mm;">7a</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L7b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other includible U.S. disregarded entities (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="yellow;height:4.5mm;">7b</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L7c -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>c
              </div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other includible corporations(attach statement)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossOtherIncludibleCorpAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="yellow;height:4.5mm;">7c</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossOtherIncludibleCorpAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L8 R1 blank 
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>-->
          <!-- L8 R2 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">8</div>
              <div class="styLNDesc" style="width:138mm;height:8mm">Adjustment to eliminations of transactions between includible entities and nonincludible entities 
                <span style="float:left;">(attach statement)           
           <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjustmentToEliminateTransAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjustmentToEliminateTransAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L9 R1 blank 
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div> -->
          <!-- L9 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">9</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Adjustment to reconcile income statement period to tax year (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">9</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L10a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">10a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Intercompany dividend adjustments to reconcile to line 11 (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IntercompanyDivAdjToRecnclAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="yellow;height:4.5mm;">10a</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IntercompanyDivAdjToRecnclAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L10b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">
                <span style="width:3.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Other statutory accounting adjustments to reconcile to line 11 (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherStatutoryAcctToRecnclAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="yellow;height:4.5mm;">10b</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherStatutoryAcctToRecnclAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L10c -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">
                <span style="width:3.5mm"/>c</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Other adjustments to reconcile to amount on line 11 (attach statement)
                  <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherAdjustmentsToReconcileAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="yellow;height:4.5mm;">10c</div>
              <div class="styLNAmountBox" style="yellow;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherAdjustmentsToReconcileAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L11 R1 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">
                  <span class="styBoldText">Net income (loss) per income statement of includible corporations.</span> Combine lines 4a through 10c </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">11</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L11 Note -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:137mm;">
                <span class="styBoldText">Note </span>Part I, line 11, must equal the amount on Part II, line 30, column (a) and on Schedule M-2, line 2.
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:40mm;"/>
            </div>
            <!-- close float right -->
          </div>
          <!--Blank line -->
          <div class="styBB" style="width:187mm;"/>
          <!-- L12 R1-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">12</div>
            <div class="styLNDesc" style="width:179mm;">
                Enter the total amount (not just the corporation’s share) of the assets and
                  liabilities of all entities included or removed on the following lines. 
            </div>
          </div>
          <!-- L12 R2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div style="width:70mm;"/>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:116mm;">
                <div class="styLNAmountBox" style="width:50mm;text-align:center;border-left-width: 0px;">Total Assets
                </div>
                <div class="styLNAmountBox" style="width:50mm;text-align:center;border-left-width: 0px;">Total Liabilities
                </div>
              </div>
              <!-- close width -->
            </div>
            <!-- close float right -->
          </div>
          <!-- L12 Ra-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div style="width:70mm;float:left;;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">a </div>
                <div class="styLNDesc" style="width:59mm;">
                <span style="float:left;"> Included on Part I, line 4
</span>
             <span class="styDotLn" style="padding-left:2mm;">......</span>
             <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/>         
               </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:116mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldWorldwideCnsldtAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldWorldwideCnsldtLiabAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- close width -->
            </div>
            <!-- close float right -->
          </div>
          <!-- L12 Rb-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div style="width:70mm;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">b </div>
                <div class="styLNDesc" style="width:59mm;">
                 <span style="float:left;"> Removed on Part I, line 5
</span>
             <span class="styDotLn" style="padding-left:1.5mm;">......</span>
             <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/>         
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:116mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludibleFrgnAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludblFrgnLiabAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- close width -->
            </div>
            <!-- close float right -->
          </div>
          <!-- L12 Rc-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div style="width:70mm;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">c </div>
                <div class="styLNDesc" style="width:59mm;">
                <span style="float:left;"> Removed on Part I, line 6
</span>
             <span class="styDotLn" style="padding-left:1.5mm;">......</span>
             <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/>    
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:116mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludibleUSAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludibleUSLiabAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- close width -->
            </div>
            <!-- close float right -->
          </div>
          <!-- L12 Rd-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div style="width:70mm;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
                <div class="styLNDesc" style="width:59mm;">
             <span style="float:left;">  Included on Part I, line 7
</span>
             <span class="styDotLn" style="padding-left:2mm;">......</span>
             <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> 
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:116mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldOtherIncludibleAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldOtherIncludibleLiabAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- close width -->
            </div>
            <!-- close float right -->
          </div>
          <!-- Blank Line -->
          <div class="styTBB" style="width:187mm;"/>
          <!-- Page 1 Footer -->
          <div class="pageEnd" style="width:187mm;float:none;">
            <div class="styBoldText" style="width:110mm;float:left;">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-PC</div>
            <div style="width:25mm;float:left;">Cat. No. 39664A</div>
            <div class="styBoldText" style="float:right;">Schedule M-3 (Form 1120-PC) 2013</div>
          </div>
          <!-- Page 2 -->
          <!-- Page 2 Header -->
          <div class="styBB" style="width:187mm;border-bottom:solid 2px;float:none;">
            <div style="float:left;">Schedule M-3 (Form 1120-PC) 2013</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <div class="styBB" style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
              Name of corporation (common parent, if consolidated return)<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:47mm;float:right;clear:none;padding-left:1mm;">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EIN"/>
                    </xsl:call-template>
            </div>
          </div>
          <!-- start check box L1  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
              Check applicable box(es): <span style="width:1mm;"/>
              <!-- Check box 1 -->
              <b>(1)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedGroup2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedGroup2</xsl:with-param>
                </xsl:call-template>
		     Consolidated group
		 </label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;">
              <!-- Check box 2 -->
              <b>(2)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ParentCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ParentCorporation2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ParentCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ParentCorporation2</xsl:with-param>
                </xsl:call-template>
		     Parent corp
		   </label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;">
              <!-- Check  box 3 -->
              <b>(3)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedEliminations2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedEliminations2</xsl:with-param>
                </xsl:call-template>
		     Consolidated eliminations
		   </label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;">
              <!-- Check box 4 -->
              <b>(4)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3SubsidiaryCorporation2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3SubsidiaryCorporation2</xsl:with-param>
                </xsl:call-template>
		     Subsidiary corp
		   </label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;width:39mm;">
              <!-- Check box 5 -->
              <b>(5)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Mixed1120LPCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Mixed1120LPCGroup2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Mixed1120LPCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Mixed1120LPCGroup2</xsl:with-param>
                </xsl:call-template>
		    Mixed1120/L/PCgroup
		 </label>
            </div>
          </div>
          <!-- close check box line -->
          <!-- end check box L1  -->
          <!-- start sub-consolidated check boxes L2  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           	Check if a sub-consolidated: <span style="width:5mm;"/>
              <!-- Check box 6 -->
              <b>(6)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCGroup2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCGroup2</xsl:with-param>
                </xsl:call-template>
              </label>
		  1120-PC group	
           	</div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 7 -->
              <b>(7)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCEliminations2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCEliminations2</xsl:with-param>
                </xsl:call-template>
              </label>
		   1120-PC eliminations
           	</div>
          </div>
          <!-- End sub-consolidated check boxes L2  -->
          <!-- Subsidiary Name and EIN Line -->
          <div style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;border-top:solid 1px">Name of subsidiary (if consolidated return)
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryBusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryBusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryEIN"/>
              </xsl:call-template>
              <xsl:if test="$Form1120PCScheduleM3/IncomeLossItems/MissingEINReasonCd !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MissingEINReasonCd"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
            <!--Close EIN -->
          </div>
          <!-- Close Name and EIN Line -->
          <!-- Part 2 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:2px;border-top-width:2px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
            <span class="styPartName" style="height:4mm;width:14mm;">Part II</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With<br/>
              <span style="width:2mm;"/>Taxable Income per Return <span style="font-weight:normal;">(see instructions)</span>
            </span>
          </div>
          <!-- Part II Table -->
          <table class="styTable" id="IRS1120PCScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
            <!--Table R1 -table header -->
            <tr>
              <th class="styTableThead" scope="col" style="width:8mm;float:left;height:6mm;"/>
              <th class="styTableThead" scope="col" style="width:79mm;text-align:center;font-size:8pt;height:8mm;float:left;">
               Income (Loss) Items<br/>
                <span style="font-size:7pt;font-weight:normal;">(Attach statements for lines 1 through 11)</span>
              </th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col" style="float:left;clear:none;">
                <span class="styBoldText">(a)</span>
                <br/> Income (Loss) per<br/> Income Statement<br/>
              </th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col" style="float:left;">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col" style="float:left;">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col" style="float:left;">
                <span class="styBoldText">(d)</span>
                <br/> Income (Loss) per<br/> Tax Return<br/>
              </th>
            </tr>
            <!-- Part II - L1 -->
            <!-- Table R2 L1 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>1
               </td>
              <td   style="float:left;width:79mm;">
               Income (loss) from equity method foreign <span style="font-size:6pt;">corporations</span> 
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
                </xsl:call-template>
<!--                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>-->
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - L2 -->
            <!-- Table R3 L2 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>2</td>
              <td style="width:79mm;float:left;">Gross foreign dividends not previously taxed
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L3 -->
            <!-- Table R4 L3 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>3</td>
              <td  style="width:79mm;float:left;">Subpart F, QEF, and similar income inclusions
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L4 -->
            <!-- Table R5 L4 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>4</td>
              <td style="width:79mm;float:left;">Section 78 gross-up
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L5 -->
            <!-- Table R6 L5 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>5</td>
              <td style="width:79mm;float:left;">Gross foreign distributions previously taxed
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - L6 -->
            <!-- Table R7 L6 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>6</td>
              <td style="width:79mm;float:left;">
              Income (loss) from equity method U.S. corporations
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - L7 -->
            <!-- Table R8 L7 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>7</td>
              <td style="width:79mm;float:left;">U.S. dividends not eliminated in tax consolidation
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L8 -->
            <!-- Table R9 L8 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>8</td>
              <td style="width:79mm;float:left;">Minority interest for includible corporations
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - L9 -->
            <!-- Table R10 L9 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>9
              </td>
              <td style="width:79mm;float:left;">Income (loss) from U.S. partnerships 
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L10 -->
            <!-- Table R11 L10 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">10</td>
              <td style="width:79mm;float:left;">Income (loss) from foreign partnerships 
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L11 -->
            <!-- Table R12 L11 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">11</td>
              <td style="padding-top:.5mm;width:79mm;float:left;">Income (loss) from other pass-through entities 
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L12 -->
            <!-- Table R13 L12 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">12</td>
              <td style="width:79mm;float:left;">
                 <span style="float:left;padding-right:5mm;">Items relating to reportable transactions (attach </span>
                 <span style="float:left;">statement)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp"/>
                </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L13 -->
            <!-- Table R14 L13 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">13</td>
              <td style="width:79mm;float:left;">Interest income (attach Form 8916-A)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L14 -->
            <!--Table R15 L14 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">14</td>
              <td style="width:79mm;float:left;">Hedging transactions<span class="styDotLn" style="float:right;                   padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L15 -->
            <!-- Table R16 L15 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">15</td>
              <td style="width:79mm;float:left;">Mark-to-market income (loss)<span class="styDotLn" style="float:right;                   padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L16 -->
            <!-- Table R17 L16 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">16</td>
              <td style="width:79mm;float:left;">Premium income (attach statement)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L17 -->
            <!-- Table R18 L17 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">17</td>
              <td style="width:79mm;float:left;">Sale versus lease (for sellers and/or lessors)<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L18 -->
            <!-- Table R19 L18 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">18</td>
              <td style="width:79mm;float:left;">Section 481(a) adjustments<span class="styDotLn" style="float:right;                   padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section481aAdjustments/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section481aAdjustments/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L19 -->
            <!-- Table R20 L19 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">19</td>
              <td style="width:79mm;float:left;">Income from a special loss discount account<span class="styDotLn" style="float:right;                   padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-top-width:0mm;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmSpecialLossDiscountAccount/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmSpecialLossDiscountAccount/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmSpecialLossDiscountAccount/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L20 -->
            <!-- Table R21 L20 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">20</td>
              <td style="width:79mm;float:left;">Income recognition from long-term contracts<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L21 -->
            <!-- Table R22 L21 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">21</td>
              <td style="width:79mm;float:left;">Original issue discount and other imputed interest
          <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L22 -->
            <!-- Table R23 L22 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">22</td>
              <td style="width:79mm;float:left;">Reserved for future use<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - L23a -->
            <!-- Table R24 L23a -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">23a</td>
              <td style="padding-top:.5mm;width:79mm;float:left;">
                      Income statement gain/loss on sale, exchange,
                      abandonment, worthlessness, or other disposition of
                      assets other than pass-through entities
                      <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:1px;border-top-width:1px;height:10mm;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - L23b -->
            <!-- Table R25 L23b -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:7px;padding-top:0px;width:8mm;">
                <span style="width:1.5mm;"/>b</td>
              <td style="padding-top:.5mm;width:79mm;float:left;">
                 Gross capital gains from Schedule D, excluding  
                 amounts from pass-through entities
                 <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px; height:7mm;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell"  style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell"  style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23c -->
            <!--Table R26 L23c -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;width:8mm;">
                <span style="width:1.5mm;"/>c</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
               Gross capital losses from Schedule D, excluding
                amounts from pass-through entities, abandonment 
                losses, and worthless stock losses
                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px; height:10mm;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell"  style="height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell"  style="height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell"  style="height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23d -->
            <!--Table R27 L23d -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;width:8mm;">
                <span style="width:1.5mm;"/>d</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">Net gain/loss reported on Form 4797, line 17,
                excluding amounts from pass-through entities,
                abandonment losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;height:10mm;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:10mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23e -->
            <!-- Table R28 L23e -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:3px;padding-top:0px;width:8mm;">
                <span style="width:1.5mm;"/>e</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Abandonment losses
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/AbandonmentLosses/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/AbandonmentLosses/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23f -->
            <!-- Table R29 L23f -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:.5px;width:8mm;">
                <span style="width:1.5mm;"/>f</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
              Worthless stock losses (attach statement)
              <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23g -->
            <!-- Table R30 L23g -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:1.2mm;width:8mm;">
                <span style="width:1.5mm;"/>g</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Other gain/loss on disposition of assets
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthGainLossDisposAssets/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthGainLossDisposAssets/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthGainLossDisposAssets/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L24 -->
            <!--Table R31 L24 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">24</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Capital loss limitation and carryforward used
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 25 -->
            <!-- Table R32 L25 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">25</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Other income (loss) items with differences (attach 
               statement)
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L26 -->
            <!-- Table R33 L26 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">26</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                <b>Total income (loss) items. </b>Combine lines 1 through 25
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L27 -->
            <!-- Table R34 L27 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">27</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                <span class="styBoldText" style="font-weight:bold">Total expense/deduction items</span>
                <span> (from Part III, line 41) </span>
<!--                <span class="styDotLn" style="float:right;padding-right:1mm;"/>-->
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L28 -->
            <!--Table R35 L28 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">28</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Other items with no differences 
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L29a -->
            <!-- Table R36 L29a -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell" style="padding-bottom:2mm;">29a</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Mixed groups, see instructions. All others, combine 
                lines 26 through 28
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:8mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MixedGroupsAllOthers/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:8mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MixedGroupsAllOthers/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:8mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MixedGroupsAllOthers/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:8mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MixedGroupsAllOthers/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L29b -->
            <!--Table R37 L29b -->
            <tr>
              <td class="styLNLeftNumBox" style="width:8mm;">
                <span style="width:3.5mm"/>b</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 1120 subgroup reconciliation totals
               <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L29c -->
            <!-- Table R38 L29c -->
            <tr>
              <td class="styLNLeftNumBox" style="width:8mm;">
                <span style="width:3.5mm"/>c</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Life insurance subgroup reconciliation totals
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InsSubgroupRecnclTotals/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InsSubgroupRecnclTotals/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InsSubgroupRecnclTotals/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InsSubgroupRecnclTotals/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L30 -->
            <!-- Table R39 L30 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">30</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                
                  <span class="styBoldText" style="font-weight:bold;">Reconciliation totals. </span>
                  <span style="font-weight:normal">Combine lines 29a through 29c</span>
          
                <span class="styDotLn" style="float:right;padding-right:1mm;"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!-- Table R40 L 30 Note -->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <span class="styBoldText" style="margin-left:10mm;">Note.</span> 
         	  Line 30, column (a) must equal the amount on Part I, line 11, and column (d) must equal Form 1120-PC, Schedule A, line 35.
           </div>
          <!-- Page 2 END -->
          <div class="pageEnd" style="width:187mm;float:none;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-PC) 2013</div>
          </div>
          <!-- Page 3 -->
          <!-- Page 3 Header -->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;float:none;">
            <div style="float:left;">Schedule M-3 (Form 1120-PC) 2013</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <div class="styBB" style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
              Name of corporation (common parent, if consolidated return)<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:47mm;float:right;clear:none;">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
             <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EIN"/>
                    </xsl:call-template>
            </div>
          </div>
          <!-- Start check boxes line  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           	Check applicable box(es): <span style="width:1mm;"/>
              <!-- Check box 1 -->
              <b>(1)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedGroup3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedGroup3</xsl:with-param>
                </xsl:call-template>
		     Consolidated group
		</label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;">
              <!-- Check box 2 -->
              <b>(2)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParentCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ParentCorporation3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParentCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ParentCorporation3</xsl:with-param>
                </xsl:call-template>
		      Parent corp
		  </label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;">
              <!-- Check box 3 -->
              <b>(3)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedEliminations3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3ConsolidatedEliminations3</xsl:with-param>
                </xsl:call-template>
		     Consolidated eliminations
		</label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;">
              <!-- Check box 4 -->
              <b>(4)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3SubsidiaryCorporation3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryCorporationInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3SubsidiaryCorporation3</xsl:with-param>
                </xsl:call-template>
		     Subsidiary corp
		</label>
            </div>
            <div class="styGenericDiv" style="padding-left:1mm;">
              <!-- Check box 5 -->
              <b>(5)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Mixed1120LPCGroup3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Mixed1120LPCGroup3</xsl:with-param>
                </xsl:call-template>
		      Mixed1120/L/PCgroup
		</label>
            </div>
          </div>
          <!-- End check box L1  -->
          <!-- Start sub-consolidated check boxes L2  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           	Check if a sub-consolidated: <span style="width:5mm;"/>
              <!-- Check box 6 -->
              <b>(6)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCGroup3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCGroupInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCGroup3</xsl:with-param>
                </xsl:call-template>
              </label>
		    1120-PC group	
           	</div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 7 -->
              <b>(7)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCEliminations3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCEliminationsInd"/>
                  <xsl:with-param name="BackupName">IRS1120PCScheduleM3Is1120PCEliminations3</xsl:with-param>
                </xsl:call-template>
              </label>
		   1120-PC eliminations
           	</div>
          </div>
          <!-- End sub-consolidated check boxes L2  -->
          <!-- Subsidiary Name and EIN Line -->
          <div style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;border-top:solid 1px;">
                Name of subsidiary (if consolidated return)
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryBusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryBusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryEIN"/>
              </xsl:call-template>
              <xsl:if test="$Form1120PCScheduleM3/ExpenseDeductionItems/MissingEINReasonCd !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MissingEINReasonCd"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
            <!--Close EIN -->
          </div>
          <!-- Close subsidiary  Name and EIN Line -->
          <!-- Part 3 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:2px;border-top-width:2px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;page-break-after:always;">
            <span class="styPartName" style="height:5mm;width:14mm;padding: .25mm .5mm .25mm .5mm;">Part III</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With 
              <br/>
              <span style="width:2mm;"/>Taxable Income per Return—Expense/Deduction Items
              <span style="font:normal;">(see instructions)</span>
            </span>
          </div>
          <!-- Part III Table -->
          <table class="styTable" id="IRS1120PCScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return—Expense/Deduction Items " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;page-break-inside:auto;">
            <!-- Table R1 -->
            <tr>
              <th class="styTableThead" scope="col" style="width:8mm;height:4mm;float:left;'"/>
              <th class="styTableThead" scope="col" style="width:79mm;text-align:center;font-size:8pt;float:left;">Expense/Deduction Items</th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(a)</span>
                <br/> Expense per<br/> Income Statement</th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(d)</span>
                <br/> Deduction per<br/> Tax Return</th>
            </tr>
            <!-- Part III - L1 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>1</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 U.S. current income tax expense
                 <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - L2 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>2</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">U.S. deferred income tax expense<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            
          <!-- Part III - L3 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>3</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 State and local current income tax expense
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L4 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>4</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 State and local deferred income tax expense
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - L5 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>5</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
              Foreign current income tax expense (other than foreign
              withholding taxes)
              <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!-- Part III - L6 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>6</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">Foreign deferred income tax expense<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - L7 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>7</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">Foreign withholding taxes<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L8 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>8</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Stock option expense
                 <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - 9 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>9</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Other equity-based compensation
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L10 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">10</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Meals and entertainment
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainmentGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L11 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">11</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Fines and penalties
                 <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L12 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">12</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Judgments, damages, awards, and similar costs
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L13 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">13</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
               Parachute payments
                 <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L14 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">14</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Compensation with section 162(m) limitation
                 <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L15 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">15</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Pension and profit-sharing
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L16 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">16</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Other post-retirement benefits
                 <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L17 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">17</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
               Deferred compensation
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L18 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">18</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Charitable contribution of cash and tangible property
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L19 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">19</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Charitable contribution of intangible property
                 <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L20 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">20</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
              Charitable contribution limitation/carryforward
              <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L21 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">21</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Write-off of premium receivables
                 <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L22 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">22</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
               Guarantee fund assessments
                <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L23 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">23</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">            
               Current year acquisition or reorganization investment 
               banking fees          
                <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L24 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">24</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Current year acquisition or reorganization legal and accounting fees
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L25 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">25</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Current year acquisition/reorganization other costs
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L26 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">26</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Amortization of acquisition, reorganization, and start-up costs
                 <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L27 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">27</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Amortization/impairment of goodwill, insurance in force and ceding commissions
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L28 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">28</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Other amortization or impairment write-offs
                 <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L29 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">29</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Discounting of unpaid losses (section 846) (attach 
                 <span style="float:left;">statement)
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L30 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">30</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Reduction of loss deduction (section 832(b)(5)(B))
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ReductionOfLossDeduction/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ReductionOfLossDeduction/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ReductionOfLossDeduction/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L31 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">31</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Depreciation
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DepreciationGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DepreciationGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DepreciationGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DepreciationGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L32 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">32</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Bad debt expense and/or agency balances written off
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L33 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">33</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Deduction from a special loss discount account
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DedSpecialLossDiscountAccount/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DedSpecialLossDiscountAccount/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DedSpecialLossDiscountAccount/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L34 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">34</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Corporate owned life insurance premiums
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L35 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">35</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Purchase versus lease (for purchasers and/or lessees)
                <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L36 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">36</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Interest expense (attach Form 8916-A)
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpenseForm8916AGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L37 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">37</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Domestic production activities deduction
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DomesticProductionActyDedGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DomesticProductionActyDedGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DomesticProductionActyDedGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L38 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">38</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Research and development costs
    
            
                <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ResearchAndDevelopmentCosts/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L39 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">39</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                 Section 118 exclusion (attach statement)
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Section118Exclusion"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Section118Exclusion/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Section118Exclusion/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Section118Exclusion/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Section118Exclusion/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L40 -->

            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">40</td>
              <td style="padding-top:.5mm;style;width:79mm;float:left;">
                Other expense/deduction items with differences (attach
                statement)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences"/>
                </xsl:call-template>
           <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="height:7mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L41 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">41</td>
              <td style="padding-top:.5mm;font-weight:bold;width:79mm;float:left;">
              <div>
                Total expense/deduction items.
                <span style="font-weight:normal;">Combine lines 1 through 40. Enter here and on Part II, line 27, reporting positive amounts as negative and negative amounts as positive.</span>
             </div>
                </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;height:12mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;height:12mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;height:12mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;height:12mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!-- Page 3 End -->
          <div class="pageEnd" style="width:187mm;border-top:2px solid black;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-PC) 2013</div>
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
              <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>