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
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120PCScheduleM3)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
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
            <div class="styFNBox" style="width:32mm;height:19.5mm;border-right-width:2px;">
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
            <div class="styFTBox" style="width:125mm;height:19.5mm;font-size:11pt;text-align:center;">
              <div class="styMainTitle" style="font-size:11pt;">Net Income (Loss) Reconciliation for U.S. Property and Casualty  
                <br/>
                   Insurance Companies With Total Assets of $10 Million or More
               </div>
              <div class="styFST" style="height:5mm;font-size:7pt;">
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> Attach to Form 1120-PC.<br/>
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> See separate instructions.<br/>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:21mm;border-left-width:2px;">
              <div class="styOMB" style="height:6mm;padding-top:1.5mm;">OMB No. 1545-1027</div>
              <div class="styTY" style="height:13.5mm;padding-top:2mm;">20<span class="styTYColor">08</span>
              </div>
            </div>
          </div>
          <!-- End Header - Form Number, Title, and Year -->
          <!-- start check box line  -->
          <div style="width:187mm;">
            Check applicable box(es): 
            <!--Check Box 1 -->
            <!-- Note: Check box 1 Non-consolidate return is present for form 1120PC Sch-3 schema only, is not availabel in 1120PC E&A Schema -->
            <span style="padding-left:8mm">(1)</span>
            <span style="width:5px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NonConsolidatedReturn"/>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NonConsolidatedReturn"/>
              </xsl:call-template>
		   Non-consolidated return
		</label>
            <!--Check Box 2 -->
            <!-- Note: Check box 2 Consolidated return is present for form 1120PC Sch-M3 Schema only, is not availabel in 1120PC E&A Schema -->
            <span style="padding-left:20mm">(2)</span>
            <span style="width:5px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ConsolidatedReturn"/>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ConsolidatedReturn"/>
              </xsl:call-template>
	         Consolidated return (Form 1120-PC only)
		</label>
          </div>
          <!--Check Box 3 -->
          <div class="styBB" style="width:187mm;">
            <span style="padding-left:41mm">(3)</span>
            <span style="width:5px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/DormantSubsidiariesSchAttached"/>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/DormantSubsidiariesSchAttached"/>
              </xsl:call-template>
		  Mixed 1120/L/PC group
	     </label>
            <span style="padding-left:21.1mm">(4)</span>
            <span style="width:5px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Mixed1120LPCGroup"/>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Mixed1120LPCGroup"/>
              </xsl:call-template>
		  Dormant subsidiaries schedule attached
	      </label>
          </div>
          <!-- End check boxes line  -->
          <!--  Name -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
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
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
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
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/MissingEINReason"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpFiledSECForm10K"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpFiledSECForm10K"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpFiledSECForm10K"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpFiledSECForm10K"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpFiledSECForm10K"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpFiledSECForm10K"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpFiledSECForm10K"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpFiledSECForm10K"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpPrepCertAuditedIncomeStmt"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpPrepIncomeStatement"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeStatementBegngDate"/>
                </xsl:call-template>
              </span>
              <span style="width:8mm"/>Ending<span style="width:3mm"/>
              <span style="width:25mm;border-bottom:solid 1px;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeStatementEndDate"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
                (If “Yes,” attach an explanation and the amount of each item restated.)
              <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpIncomeStatementRestated"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
                (If “Yes,” attach an explanation and the amount of each item restated.)
              <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpIncmStmtRestated5Preceding"/>
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
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
                  <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/CorpVotingCommonStockPubTraded"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
                If “No,” go to line 4a.
            </div>
            <!-- close description line -->
          </div>
          <!-- L3b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b
            </div>
            <div class="styLNDesc" style="width:113mm;">Enter the symbol of the corporation’s primary U.S. publicly traded voting common stock
              <span class="styDotLn" style="float:none;">..........................</span>
            </div>
            <div style="width:25mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:center;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrimaryStockSymbol"/>
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
            <div style="width:45mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:center;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/CorpPrimaryStockCUSIPNumber"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/WorldwideCnsldtNetIncomeLoss"/>
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
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/GAAP"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/GAAP"/>
                    <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/GAAP"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">GAAP</span>
                </label>
                <!--Check Box 2 -->
                <span style="width:3mm;"/>(2)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IFRS"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IFRS"/>
                    <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/IFRS"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">IFRS</span>
                </label>
                <!--Check Box 3 -->
                <span style="width:3mm;"/>(3)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Statutory"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Statutory"/>
                    <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/Statutory"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Statutory</span>
                </label>
                <!--Check Box 4 -->
                <span style="width:3mm;"/>(4)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Other"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Other"/>
                    <xsl:with-param name="BackupName" select="Form1120PCScheduleM3/Other"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Other (specify)</span>
                  <span style="width:1.5mm;"/>
                  <!-- A straight Line -->
                  <span style="width:35mm;border-bottom:solid 1px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/Other/@description"/>
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
                <span style="float:left;">Net income from nonincludible foreign entities (attach schedule)
                <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmNonincludibleForeignEnt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">5a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmNonincludibleForeignEnt"/>
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
                <span style="float:left;">Net loss from nonincludible foreign entities (attach schedule and enter as a positive amount)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleForeignEnt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleForeignEnt"/>
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
                <span style="float:left;">Net income from nonincludible U.S. entities (attach schedule)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmNonincludibleUSEntities"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">6a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmNonincludibleUSEntities"/>
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
                <span style="float:left;">Net loss from nonincludible U.S. entities (attach schedule and enter as a positive amount)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleUSEntities"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">6b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossNonincludibleUSEntities"/>
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
                <span style="float:left;">Net income (loss) of other includible foreign disregarded entities (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmOthIncludibleFrgnEnt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmOthIncludibleFrgnEnt"/>
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
                <span style="float:left;">Net income (loss) of other includible U.S. disregarded entities (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmOthIncludibleUSEntities"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncmOthIncludibleUSEntities"/>
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
                <span style="float:left;">Net income (loss) of other includible corporations(attach schedule)
              <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossOtherIncludibleCorp"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetLossOtherIncludibleCorp"/>
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
                <span style="float:left;">(attach schedule)           
           <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjToEliminateTransactions"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjToEliminateTransactions"/>
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
                <span style="float:left;">Adjustment to reconcile income statement period to tax year (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjRecnclIncmStmtYearToTaxYear"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">9</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/AdjRecnclIncmStmtYearToTaxYear"/>
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
                <span style="float:left;">Intercompany dividend adjustments to reconcile to line 11 (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IntercompanyDivAdjToReconcile"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IntercompanyDivAdjToReconcile"/>
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
                <span style="float:left;">Other statutory accounting adjustments to reconcile to line 11 (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherStryAccountingToReconcile"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherStryAccountingToReconcile"/>
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
                <span style="float:left;">Other adjustments to reconcile to amount on line 11 (attach schedule)
                  <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherAdjToReconcile"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/OtherAdjToReconcile"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/NetIncomeLossPerIncomeStmt"/>
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
              <div style="width:50mm;"/>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
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
              <div style="width:50mm;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">a </div>
                <div class="styLNDesc" style="width:42mm;">
                 Included on Part I, line 4
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldWorldwideCnsldtAssets"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldWorldwideCnsldtLiab"/>
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
              <div style="width:50mm;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">b </div>
                <div class="styLNDesc" style="width:42mm;">
                  Removed on Part I, line 5
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludibleForgnAst"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludibleForgnLiab"/>
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
              <div style="width:50mm;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">c </div>
                <div class="styLNDesc" style="width:42mm;">
                    Removed on Part I, line 6
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludibleUSAssets"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntRmvdNonincludibleUSLiab"/>
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
              <div style="width:50mm;">
                <div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
                <div class="styLNDesc" style="width:42mm;">
                 Included on Part I, line 7
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldOthIncludibleAssets"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/EntIncldOthIncludibleLiab"/>
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
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="width:110mm;float:left;">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-PC</div>
            <div style="width:25mm;float:left;">Cat. No. 39664A</div>
            <div class="styBoldText" style="float:right;">Schedule M-3 (Form 1120-PC) 2008</div>
          </div>
          <!-- Page 2 -->
          <!-- Page 2 Header -->
          <div class="styBB" style="width:187mm;border-bottom:solid 2px;">
            <div style="float:left;">Schedule M-3 (Form 1120-PC) 2008</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <div class="styBB" style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
              Name of corporation (common parent, if consolidated return)<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:47mm;float:right;clear:none;padding-left:1mm;">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- start check box L1  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
              Check applicable box(es): <span style="width:3mm;"/>
              <!-- Check box 1 -->
              <b>(1)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedGroup2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedGroup2"/>
                </xsl:call-template>
		     Consolidated group
		 </label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 2 -->
              <b>(2)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ParentCorporation2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ParentCorporation2"/>
                </xsl:call-template>
		     Parent corp
		   </label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check  box 3 -->
              <b>(3)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedEliminations2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ConsolidatedEliminations2"/>
                </xsl:call-template>
		     Consolidated eliminations
		   </label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 4 -->
              <b>(4)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryCorporation2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryCorporation2"/>
                </xsl:call-template>
		     Subsidiary corp
		   </label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 5 -->
              <b>(5)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Mixed1120LPCGroup2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Mixed1120LPCGroup2"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCGroup2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCGroup2"/>
                </xsl:call-template>
              </label>
		  1120-PC group	
           	</div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 7 -->
              <b>(7)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCEliminations2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Is1120PCEliminations2"/>
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
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryName2/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryName2/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubsidiaryEIN2"/>
              </xsl:call-template>
              <xsl:if test="$Form1120PCScheduleM3/ IncomeLossItems/MissingEINReason !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MissingEINReason"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
            <!--Close EIN -->
          </div>
          <!-- Close Name and EIN Line -->
          <!-- Part 2 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:2px;border-top-width:2px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
            <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">Part II</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With<br/>
              <span style="width:2mm;"/>Taxable Income per Return <span style="font-weight:normal;">(see instructions)</span>
            </span>
          </div>
          <!-- Part II Table -->
          <table class="styTable" id="IRS1120PCScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
            <!--Table R1 -table header -->
            <tr>
              <th class="styTableThead" style="width:6mm"/>
              <th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;">
               Income (Loss) Items<br/>
                <span style="font-size:7pt;font-weight:normal;">(Attach schedules for lines 1 through 11)</span>
              </th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(a)</span>
                <br/> Income (Loss) per<br/> Income Statement<br/>
              </th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(d)</span>
                <br/> Income (Loss) per<br/> Tax Return<br/>
              </th>
            </tr>
            <!-- Part II - L1 -->
            <!-- Table R2 L1 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>1</td>
              <td>Income (loss) from equity method foreign corporations
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.................</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifference"/>
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
              <td>Gross foreign dividends not previously taxed
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L3 -->
            <!-- Table R4 L3 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>3</td>
              <td>Subpart F, QEF, and similar income inclusions
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L4 -->
            <!-- Table R5 L4 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>4</td>
              <td>Section 78 gross-up
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section78GrossUp/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L5 -->
            <!-- Table R6 L5 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>5</td>
              <td>Gross foreign distributions previously taxed
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifference"/>
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
              <td>Income (loss) from equity method U.S. corporations
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">................</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifference"/>
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
              <td>U.S. dividends not eliminated in tax consolidation
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L8 -->
            <!-- Table R9 L8 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>8</td>
              <td>Minority interest for includible corporations
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/PermanentDifference"/>
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
              <td>Income (loss) from U.S. partnerships 
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">................</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L10 -->
            <!-- Table R11 L10 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">10</td>
              <td>Income (loss) from foreign partnerships 
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L11 -->
            <!-- Table R12 L11 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">11</td>
              <td style="padding-top:.5mm;">Income (loss) from other pass-through entities 
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L12 -->
            <!-- Table R13 L12 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">12</td>
              <td>Items relating to reportable transactions (attach details)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatingReportableTrans"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatingReportableTrans/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatingReportableTrans/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatingReportableTrans/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ItemsRelatingReportableTrans/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L13 -->
            <!-- Table R14 L13 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">13</td>
              <td>Interest income (attach Form 8916-A)
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncome"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncome/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncome/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncome/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/InterestIncome/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L14 -->
            <!--Table R15 L14 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">14</td>
              <td>Hedging transactions<span class="styDotLn" style="float:none;
                  padding-left:3mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L15 -->
            <!-- Table R16 L15 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">15</td>
              <td>Mark-to-market income (loss)<span class="styDotLn" style="float:none;
                  padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L16 -->
            <!-- Table R17 L16 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">16</td>
              <td>Premium income (attach schedule)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PremiumIncome/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L17 -->
            <!-- Table R18 L17 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">17</td>
              <td>Sale versus lease (for sellers and/or lessors)<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L18 -->
            <!-- Table R19 L18 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">18</td>
              <td>Section 481(a) adjustments<span class="styDotLn" style="float:none;
                  padding-left:3mm;">.........</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section481aAdjustments/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section481aAdjustments/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L19 -->
            <!-- Table R20 L19 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">19</td>
              <td>Income from a special loss discount account<span class="styDotLn" style="float:none;
                  padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-top-width:0mm;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmSpecialLossDiscountAccount/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmSpecialLossDiscountAccount/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmSpecialLossDiscountAccount/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L20 -->
            <!-- Table R21 L20 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">20</td>
              <td>Income recognition from long-term contracts<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L21 -->
            <!-- Table R22 L21 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">21</td>
              <td>Original issue discount and other imputed interest
          <span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L22 -->
            <!-- Table R23 L22 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">22</td>
              <td>Reserved for future use<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
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
              <td style="padding-top:.5mm;">Income statement gain/loss on sale, exchange,
                      abandonment, worthlessness, or other disposition of
                      assets other than pass-through entities
                      <span class="styDotLn" style="float:none;padding-left:1mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/IncmStmtGainLossDisposAst/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:1px;border-top-width:1px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - L23b -->
            <!-- Table R25 L23b -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:7px;padding-top:0px;">
                <span style="width:1.5mm;"/>b</td>
              <td style="padding-top:.5mm;">Gross capital gains from Schedule D, excluding
                              amounts from pass-through entities
                          <span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23c -->
            <!--Table R26 L23c -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;">
                <span style="width:1.5mm;"/>c</td>
              <td style="padding-top:.5mm;">Gross capital losses from Schedule D, excluding
                amounts from pass-through entities, abandonment losses, and worthless stock losses
                <span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23d -->
            <!--Table R27 L23d -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;">
                <span style="width:1.5mm;"/>d</td>
              <td style="padding-top:.5mm;">Net gain/loss reported on Form 4797, line 17,
                excluding amounts from pass-through entities,
                abandonment losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23e -->
            <!-- Table R28 L23e -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:3px;padding-top:0px;">
                <span style="width:1.5mm;"/>e</td>
              <td style="padding-top:.5mm;">Abandonment losses
                <span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/AbandonmentLosses/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/AbandonmentLosses/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23f -->
            <!-- Table R29 L23f -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:.5px;">
                <span style="width:1.5mm;"/>f</td>
              <td>Worthless stock losses (attach details)
              <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/WorthlessStockLosses/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L23g -->
            <!-- Table R30 L23g -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:8px;padding-top:0px;">
                <span style="width:1.5mm;"/>g</td>
              <td style="padding-top:.5mm;">Other gain/loss on disposition of assets
                <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthGainLossDisposAssets/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthGainLossDisposAssets/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthGainLossDisposAssets/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L24 -->
            <!--Table R31 L24 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">24</td>
              <td style="padding-top:.5mm;">Capital loss limitation and carryforward used
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/CapLossLimitationAndCfwdUsed/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 25 -->
            <!-- Table R32 L25 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">25</td>
              <td>Other income (loss) items with differences (attach schedule)
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L26 -->
            <!-- Table R33 L26 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">26</td>
              <td style="padding-top:.5mm;">
                <b>Total income (loss) items. </b>Combine lines 1 through 25
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L27 -->
            <!-- Table R34 L27 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">27</td>
              <td>
                <span class="styBoldText" style="font-weight:bold">Total expense/deduction items</span>
                <span> (from Part III, line 39) </span>
                <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L28 -->
            <!--Table R35 L28 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">28</td>
              <td>Other items with no differences 
         <span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L29a -->
            <!-- Table R36 L29a -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell" style="padding-bottom:2mm;">29a</td>
              <td style="padding-top:.5mm;">Mixed groups, see instructions. All others, combine lines 26 through 28
                <span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/PCInsSubgroupRecnclTotals/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L29b -->
            <!--Table R37 L29b -->
            <tr>
              <td class="styLNLeftNumBox">
                <span style="width:3.5mm"/>b</td>
              <td style="padding-top:.5mm;">1120 subgroup reconciliation totals
               <span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L29c -->
            <!-- Table R38 L29c -->
            <tr>
              <td class="styLNLeftNumBox">
                <span style="width:3.5mm"/>c</td>
              <td style="padding-top:.5mm;">Life insurance subgroup reconciliation totals
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/LifeInsSubgroupRecnclTotals/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/LifeInsSubgroupRecnclTotals/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/LifeInsSubgroupRecnclTotals/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/LifeInsSubgroupRecnclTotals/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - L30 -->
            <!-- Table R39 L30 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">30</td>
              <td>
                <span class="styBoldText" style="font-weight:bold">Reconciliation totals. </span>
                <span style="font-weight:normal">Combine lines 29a through 29c</span>
                <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/IncomeLossItems/ReconciliationTotals/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!-- Table R40 L 30 Note -->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <span class="styBoldText" style="margin-left:10mm;">Note.</span> 
         	  Line 30, column (a), must equal the amount on Part I, line 11, and column (d) must equal Form 1120-PC, Schedule A, line 35.
           </div>
          <!-- Page 2 END -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-PC) 2008</div>
          </div>
          <!-- Page 3 -->
          <!-- Page 3 Header -->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <div style="float:left;">Schedule M-3 (Form 1120-PC) 2008</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <div class="styBB" style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;">
              Name of corporation (common parent, if consolidated return)<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:47mm;float:right;clear:none;">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- Start check boxes line  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           	Check applicable box(es): <span style="width:3mm;"/>
              <!-- Check box 1 -->
              <b>(1)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedGroup3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedGroup3"/>
                </xsl:call-template>
		     Consolidated group
		</label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 2 -->
              <b>(2)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParentCorporation3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParentCorporation3"/>
                </xsl:call-template>
		      Parent corp
		  </label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 3 -->
              <b>(3)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedEliminations3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ConsolidatedEliminations3"/>
                </xsl:call-template>
		     Consolidated eliminations
		</label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 4 -->
              <b>(4)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryCorporation3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryCorporation3"/>
                </xsl:call-template>
		     Subsidiary corp
		</label>
            </div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 5 -->
              <b>(5)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroup3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroup3"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCGroup3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCGroup3"/>
                </xsl:call-template>
              </label>
		    1120-PC group	
           	</div>
            <div class="styGenericDiv" style="padding-left:3mm;">
              <!-- Check box 7 -->
              <b>(7)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCEliminations3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Is1120PCEliminations3"/>
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
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryName3/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryName3/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/SubsidiaryEIN3"/>
              </xsl:call-template>
              <xsl:if test="$Form1120PCScheduleM3/ExpenseDeductionItems/MissingEINReason !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MissingEINReason"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
            <!--Close EIN -->
          </div>
          <!-- Close subsidiary  Name and EIN Line -->
          <!-- Part 3 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:2px;border-top-width:2px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
            <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm .5mm .25mm .5mm;">Part III</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With 
              <br/>
              <span style="width:2mm;"/>Taxable Income per Return—Expense/Deduction Items
              <span style="font:normal;">(see instructions)</span>
            </span>
          </div>
          <!-- Part III Table -->
          <table class="styTable" id="IRS1120PCScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return—Expense/Deduction Items " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
            <!-- Table R1 -->
            <tr>
              <th class="styTableThead" style="width:6mm"/>
              <th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;">Expense/Deduction Items</th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(a)</span>
                <br/> Expense per<br/> Income Statement</th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120PCScheduleM3TheadCell">
                <span class="styBoldText">(d)</span>
                <br/> Deduction per<br/> Tax Return</th>
            </tr>
            <!-- Part III - L1 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>1</td>
              <td>U.S. current income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USCurrentIncomeTaxExpense/PermanentDifference"/>
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
              <td>U.S. deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/USDeferredIncomeTaxExpense/PermanentDifference"/>
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
              <td>State and local current income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L4 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>4</td>
              <td>State and local deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/PermanentDifference"/>
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
              <td style="padding-top:.5mm;">Foreign current income tax expense (other than foreign withholding taxes)
          <span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L6 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>6</td>
              <td>Foreign deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/PermanentDifference"/>
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
              <td>Foreign withholding taxes<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ForeignWithholdingTaxes/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L8 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>8</td>
              <td>Stock option expense<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/StockOptionExpense/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - 9 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">
                <span style="width:1.5mm;"/>9</td>
              <td>Other equity-based compensation
          <span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherEquityBasedCompensation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L10 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">10</td>
              <td>Meals and entertainment<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainment/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainment/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainment/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/MealsAndEntertainment/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L11 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">11</td>
              <td>Fines and penalties<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/FinesAndPenalties/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L12 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">12</td>
              <td>Judgments, damages, awards, and similar costs
          <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L13 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">13</td>
              <td>Parachute payments<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ParachutePayments/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L14 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">14</td>
              <td>Compensation with section 162(m) limitation<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CompWithSect162mLimitation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L15 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">15</td>
              <td>Pension and profit-sharing<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PensionAndProfitSharing/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L16 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">16</td>
              <td>Other post-retirement benefits<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherPostRetirementBenefits/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L17 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">17</td>
              <td>Deferred compensation<span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DeferredCompensation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L18 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">18</td>
              <td>Charitable contribution of cash and tangible property<span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitbleContriCashTngblProp/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L19 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">19</td>
              <td>Charitable contribution of intangible property<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriIntangibleProp/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L20 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">20</td>
              <td>Charitable contribution limitation/carryforward<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CharitableContriLimitationCfwd/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L21 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">21</td>
              <td>Write-off of premium receivables<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/WriteOffPremiumReceivables/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L22 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">22</td>
              <td>Guarantee fund assessments<span class="styDotLn" style="float:none;padding-left:3mm;">.........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/GuaranteeFundAssessments/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L23 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">23</td>
              <td style="padding-top:.5mm;">Current year acquisition or reorganization investment banking fees
          <span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgInvstBankingFees/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L24 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">24</td>
              <td style="padding-top:.5mm;">Current year acquisition or reorganization legal and accounting fees
          <span class="styDotLn" style="float:none;padding-left:3mm;">.............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgLegalAcctFees/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L25 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">25</td>
              <td>Current year acquisition/reorganization other costs<span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CYAcquisReorgOtherCosts/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L26 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">26</td>
              <td style="padding-top:.5mm;">Amortization of acquisition, reorganization, and start-up costs<span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L27 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">27</td>
              <td style="padding-top:.5mm;">Amortization/impairment of goodwill, insurance in force and ceding commissions
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L28 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">28</td>
              <td>Other amortization or impairment write-offs<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L29 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">29</td>
              <td>Discounting of unpaid losses (section 846) (attach schedule)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DiscountingOfUnpaidLosses/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L30 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">30</td>
              <td>Reduction of loss deduction (section 832(b)(5)(B))
         <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ReductionOfLossDeduction/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ReductionOfLossDeduction/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/ReductionOfLossDeduction/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L31 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">31</td>
              <td>Depreciation<span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Depreciation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Depreciation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Depreciation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/Depreciation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L32 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">32</td>
              <td>Bad debt expense and/or agency balances written off<span class="styDotLn" style="float:none;padding-left:3mm;">..................</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L33 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">33</td>
              <td>Deduction from a special loss discount account
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DedSpecialLossDiscountAccount/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DedSpecialLossDiscountAccount/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DedSpecialLossDiscountAccount/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L34 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">34</td>
              <td>Corporate owned life insurance premiums
                <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L35 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">35</td>
              <td>Purchase versus lease (for purchasers and/or lessees)
                <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/PurchaseVersusLease/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L36 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">36</td>
              <td>Interest expense (attach Form 8916-A)
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpense"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/InterestExpense/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L37 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">37</td>
              <td>Domestic production activities deduction
                <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120PCScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DomesticProductionActyDed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DomesticProductionActyDed/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/DomesticProductionActyDed/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L38 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">38</td>
              <td style="padding-top:.5mm;">Other expense/deduction items with differences (attach schedule)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - L39 -->
            <tr>
              <td class="styIRS1120PCScheduleM3NumberCell">39</td>
              <td style="padding-top:.5mm;font-weight:bold">Total expense/deduction items.
                <span style="font-weight:normal">Combine lines 1 through 38. Enter here and on Part II, line 27, reporting positive amounts as negative and negative amounts as positive.</span>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.................</span>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120PCScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM3/ExpenseDeductionItems/TotalExpenseDeductionItems/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!-- Page 3 End -->
          <div class="pageEnd" style="width:187mm;border-top:2px solid black;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-PC) 2008</div>
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
