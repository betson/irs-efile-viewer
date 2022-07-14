<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120LSchM3EliminationsOrAdjStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1120LScheduleM3" select="$RtnDoc/IRS1120LSchM3EliminationsOrAdj"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120LScheduleM3)"/>
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
        <meta name="Description" content="IRS Form 1120-L Schedule M3 Eliminations Or Adjustments"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
      
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120LSchM3EliminationsOrAdjStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120LSchM3EliminationsOrAdj">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Header - Form1120LSchM3 Number, Title, and Year -->
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:17.5mm;border-right-width:2px;">
              <span class="styFormNumber" style="font-size:10pt;">SCHEDULE M-3<br/>(Form 1120-L)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3"/>
                </xsl:call-template>
              </span>
              <span class="styAgency" style="height:5mm;padding-top:2mm;">
          Department of the Treasury<br/>
          Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:17.5mm;">
              <div class="styMainTitle">Net Income (Loss) Reconciliation for U.S. Life Insurance 
<br/>
                             Companies With Total Assets of $10 Million or More</div>
              <div class="styFST" style="height:5mm;">
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> Attach to Form 1120-L.<br/>
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4" height="7" alt="Bullet"/> See separate instructions.<br/>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:17.5mm;border-left-width:2px;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0128</div>
              <div class="styTY" style="height:11mm;padding-top:1.5mm;">20<span class="styTYColor">08</span>
              </div>
            </div>
          </div>
          <!-- End Header - Form Number, Title, and Year -->
          <!-- End Header - Form Number, Title, and Yr -->
          <!--  Name -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name of corporation (common parent, if consolidated return)
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!--EIN-->
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="$Form1120LScheduleM3/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/MissingEINReason"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                <!--       <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>    -->
              </span>
            </div>
          </div>
          <!--  End Name and Employer indentification number  -->
          <!-- start check box line  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv" style="padding-left:10mm;">
           	Check applicable box(es): <span style="padding-left:10mm">(1)</span>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
							NonConsolidatedReturn"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
							NonConsolidatedReturn"/>
                </xsl:call-template>
					Non-consolidated return
					 </label>
            </div>
            <div class="styGenericDiv" style="padding-left:20mm;">
           		 (2)
           			<input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ConsolidatedReturn"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ConsolidatedReturn"/>
                </xsl:call-template>
					Consolidated return (Form 1120-L only)
					</label>
            </div>
          </div>
          <div class="styBB" style="width:187mm;font-size:6pt;padding-left:27.9mm">
            <div class="styGenericDiv" style="padding-left:11.5mm;">
              <span style="padding-left:10mm">
           	(3)</span>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
							Mixed1120LPCGroup"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
							Mixed1120LPCGroup"/>
                </xsl:call-template>
				    	Mixed 1120/L/PC group
	    </label>
            </div>
            <div class="styGenericDiv" style="padding-left:21mm;">
           		 (4)
           			<input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
							DormantSubsidiariesSchAttached"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
							DormantSubsidiariesSchAttached"/>
                </xsl:call-template>
					Dormant subsidiaries schedule attached
					</label>
            </div>
          </div>
          <!-- end check box line  -->
          <!-- Part I - Header -->
          <div style="width:187mm;height:4mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
            <span class="styPartName" style="height:4mm;width:12mm;">Part I</span>
            <span style="width:140mm;" class="styPartDesc">
              <span style="width:3mm;"/>Financial Information and Net Income (Loss) Reconciliation
          <span style="font-weight:normal">(see instructions)</span>
            </span>
            <br/>
          </div>
          <!-- Line 1a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">1a</div>
            <div class="styLNDesc" style="width:179mm;">
        Did the corporation file SEC Form 10-K for its income statement period 
        ending with or within this tax year?</div>
          </div>
          <!-- Line 1a - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpFiledSECForm10K"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                CorpFiledSECForm10K"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpFiledSECForm10K"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/CorpFiledSECForm10K"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
          Skip lines 1b and 1c and complete lines 2a through 11 with respect to that SEC Form 10-K.
        </div>
          </div>
          <!-- Line 1a - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpFiledSECForm10K"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                CorpFiledSECForm10K"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpFiledSECForm10K"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/
              CorpFiledSECForm10K"/>
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
            <div class="styLNDesc" style="width:179mm;">Did the corporation prepare
         a certified audited inon-tax-basis income statement for that period?</div>
          </div>
          <!-- Line 1b - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepCertAuditedIncomeStmt"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                CorpPrepCertAuditedIncomeStmt"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepCertAuditedIncomeStmt"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/
              CorpPrepCertAuditedIncomeStmt"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
          Skip line 1c and complete lines 2a through 11 with respect to that income statement.
        </div>
          </div>
          <!-- Line 1b - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepCertAuditedIncomeStmt"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                CorpPrepCertAuditedIncomeStmt"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepCertAuditedIncomeStmt"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/
              CorpPrepCertAuditedIncomeStmt"/>
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
            <div class="styLNDesc" style="width:179mm;">Did the corporation prepare a non-tax-basis income statement for that period? 
        </div>
          </div>
          <!-- Line 1c - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepIncomeStatement"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                CorpPrepIncomeStatement"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepIncomeStatement"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/
              CorpPrepIncomeStatement"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
          Complete lines 2a through 11 with respect to that income statement.
        </div>
          </div>
          <!-- Line 1c - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepIncomeStatement"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                CorpPrepIncomeStatement"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              CorpPrepIncomeStatement"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/
              CorpPrepIncomeStatement"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
          Skip lines 2a through 3c and enter the corporation’s net income (loss) per its books
           and records on line 4a. </div>
          </div>
          <!-- Line 2a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">2a</div>
            <div class="styLNDesc" style="width:179mm;">Enter the income statement period:
          <span style="width:3mm"/>Beginning<span style="width:3mm;"/>
              <span style="width:25mm;border-bottom:solid 1px;text-align:center">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeStatementBegngDate"/>
                </xsl:call-template>
              </span>
              <span style="width:8mm"/>Ending<span style="width:3mm"/>
              <span style="width:25mm;border-bottom:solid 1px;text-align:center">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeStatementEndDate"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Line 2b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b</div>
            <div class="styLNDesc" style="width:179mm;">Has the corporation’s income statement been restated for the income statement period on line 2a?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncomeStatementRestated"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 2b - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
          (If “Yes,” attach an explanation and the amount of each item restated.)
          
        </div>
          </div>
          <!-- Line 2b - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/CorpIncomeStatementRestated"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
          </div>
          <!-- Line 2c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>c</div>
            <div class="styLNDesc" style="width:179mm;">Has the corporation’s income
         statement been restated for any of the five income statement periods preceding
          the period<br/> on line 2a?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 2c - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
          (If “Yes,” attach an explanation and the amount of each item restated.)
        </div>
          </div>
          <!-- Line 2c - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/CorpIncmStmtRestated5Preceding"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
          </div>
          <!-- Line 3a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">3a</div>
            <div class="styLNDesc" style="width:179mm;">Is any of the corporation’s voting common stock publicly traded?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 3a - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>
            </div>
          </div>
          <!-- Line 3a - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                  <xsl:with-param name="BackupName" select="Form1120LScheduleM3/CorpVotingCommonStockPubTraded"/>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
          If “No,” go to line 4a.
        </div>
          </div>
          <!-- Line 3b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b</div>
            <div class="styLNDesc" style="width:113mm;">Enter the symbol of the corporation’s primary U.S. publicly traded voting common stock
          <span class="styDotLn" style="float:none;">..........................</span>
            </div>
            <div style="width:25mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:center;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrimaryStockSymbol"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 3c -->
          <div class="styBB" style="width:187mm;padding-bottom:3mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>c</div>
            <div class="styLNDesc" style="width:113mm;">Enter the nine-digit CUSIP number of the corporation’s primary publicly traded voting common stock
          <span class="styDotLn" style="float:none;">.......................</span>
            </div>
            <div style="width:45mm;height:4.5mm;border: solid 1px;margin-top:1.5mm;float:left;margin-left:3mm;text-align:center;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/CorpPrimaryStockCUSIPNumber"/>
              </xsl:call-template>
            </div>
          </div>
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
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/WorldwideCnsldtNetIncomeLoss"/>
                </xsl:call-template>
              </div>
            </div>
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
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/GAAP"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/GAAP"/>
                    <xsl:with-param name="BackupName" select="Form1120LScheduleM3/GAAP"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">GAAP</span>
                </label>
                <!--Check Box 2 -->
                <span style="width:3mm;"/>(2)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IFRS"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IFRS"/>
                    <xsl:with-param name="BackupName" select="Form1120LScheduleM3/IFRS"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">IFRS</span>
                </label>
                <!--Check Box 3 -->
                <span style="width:3mm;"/>(3)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/Statutory"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/Statutory"/>
                    <xsl:with-param name="BackupName" select="Form1120LScheduleM3/Statutory"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Statutory</span>
                </label>
                <!--Check Box 4 -->
                <span style="width:3mm;"/>(4)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/Other"/>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/Other"/>
                    <xsl:with-param name="BackupName" select="Form1120LScheduleM3/Other"/>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Other (specify)</span>
                  <span style="width:1.5mm;"/>
                  <!-- A straight Line -->
                  <span style="width:35mm;border-bottom:solid 1px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/Other/@description"/>
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
          <!-- Line 5a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">5a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income from nonincludible foreign entities (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmNonincludibleForeignEnt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">5a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmNonincludibleForeignEnt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 5b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net loss from nonincludible foreign entities (attach schedule and enter as a positive amount)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleForeignEnt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">5b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleForeignEnt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 6a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">6a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income from nonincludible U.S. entities (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmNonincludibleUSEntities"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">6a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmNonincludibleUSEntities"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 6b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net loss from nonincludible U.S. entities (attach schedule and enter as a positive amount)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleUSEntities"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">6b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossNonincludibleUSEntities"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 7a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">7a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other includible foreign disregarded entities (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmOthIncludibleFrgnEnt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmOthIncludibleFrgnEnt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 7b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other includible U.S. disregarded entities (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmOthIncludibleUSEntities"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncmOthIncludibleUSEntities"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 7c -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>c</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other includible corporations (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossOtherIncludibleCorp"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetLossOtherIncludibleCorp"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 8 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">8</div>
              <div class="styLNDesc" style="width:137mm;height:8mm">Adjustment to eliminations of transactions between includible entities and nonincludible entities 
                  <span style="float:left;">(attach schedule)           
           <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjToEliminateTransactions"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjToEliminateTransactions"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 9 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">9</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Adjustment to reconcile income statement period to tax year (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjRecnclIncmStmtYearToTaxYear"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">9</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/AdjRecnclIncmStmtYearToTaxYear"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 10a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">10a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Intercompany dividend adjustments to reconcile to line 11 (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IntercompanyDivAdjToReconcile"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IntercompanyDivAdjToReconcile"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- 10b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Other statutory accounting adjustments to reconcile to line 11 (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherStryAccountingToReconcile"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherStryAccountingToReconcile"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- 10c -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>c</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Other adjustments to reconcile to amount on line 11 (attach schedule)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherAdjToReconcile"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/OtherAdjToReconcile"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L11 R2 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:137mm;">
                <span class="styBoldText">Net income (loss) per income statement of includible corporations.</span> Combine lines 4a through 10c
                <!--<span class="styDotLn" style="float:none;">..</span>-->
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">11</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeLossPerIncomeStmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L11 Note -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:137mm;">
                <span class="styBoldText">Note </span>Part I, line 11, must equal the amount
                 on Part II, line 30, column (a). 
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:40mm;"/>
            </div>
            <!-- close float right -->
          </div>
          <!-- L12 R1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">12</div>
              <div class="styLNDesc" style="width:179mm;">
                Enter the total amount (not just the corporation’s share) of the assets and
                  liabilities of all entities included or removed on the following lines. 
              </div>
            </div>
            <!--<div style="float:right;">
            <div class="styLNRightNumBoxNBB">12</div>
              <div class="styLNAmountBoxNBB">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/NetIncomeLossPerIncomeStmt"/>
                </xsl:call-template>
              </div>
            </div>close float right -->
          </div>
          <!-- L12 R2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div style="width:50mm;"/>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <div class="styLNAmountBox" style="width:50mm;text-align:center;border-left-width: 0px;font-size:7.5pt;">
                  <b>Total Assets</b>
                </div>
                <div class="styLNAmountBox" style="width:50mm;text-align:center;border-left-width: 0px;font-size:7.5pt;">
                  <b>Total Liabilities</b>
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
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldWorldwideCnsldtAssets"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldWorldwideCnsldtLiab"/>
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
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludibleForgnAst"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludibleForgnLiab"/>
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
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludibleUSAssets"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntRmvdNonincludibleUSLiab"/>
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
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldOthIncludibleAssets"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EntIncldOthIncludibleLiab"/>
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
            <div class="styBoldText" style="width:110mm;float:left;">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-L.</div>
            <div style="width:25mm;float:left;">Cat. No. 39668S</div>
            <div class="styBoldText" style="float:right;">Schedule M-3 (Form 1120-L) 2008</div>
          </div>
          <!-- Page 2 -->
          <!-- Page 2 Header -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;">Schedule M-3 (Form 1120-L) 2008</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
            </div>
          </div>
          <!--  Name -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name of corporation (common parent, if consolidated return)
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- EIN -->
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="$Form1120LScheduleM3/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/MissingEINReason"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
            <!-- Close EIN div -->
          </div>
          <!-- Close Name and EIN Div -->
          <!--  End Name and Employer indentification number  -->
          <!-- start check box line  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           		Check applicable box(es): <b>(1)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedGroup2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedGroup2"/>
                </xsl:call-template>
						Consolidated group
					 </label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(2)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ParentCorporation2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ParentCorporation2"/>
                </xsl:call-template>
						Parent corp
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(3)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedEliminations2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/ConsolidatedEliminations2"/>
                </xsl:call-template>
						Consolidated eliminations
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(4)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryCorporation2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryCorporation2"/>
                </xsl:call-template>
						Subsidiary corporation
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(5)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Mixed1120LPCGroup2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Mixed1120LPCGroup2"/>
                </xsl:call-template>
					Mixed 1120/L/PCgroup
					</label>
            </div>
          </div>
          <!-- end check box line 1  -->
          <!-- start check box line2  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           	Check if a sub-consolidated: <span style="width:5mm;"/>
              <b>(6)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120LGroup2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120LGroup2"/>
                </xsl:call-template>
              </label>
				1120-L group	
           	</div>
            <div class="styGenericDiv" style="padding-left:5mm;">
              <b>(7)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120LEliminations2"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Is1120LEliminations2"/>
                </xsl:call-template>
              </label>
		       	1120-L eliminations
           	</div>
          </div>
          <!-- end check box line2  -->
          <!-- Subsidiary Name and EIN Line -->
          <div style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;
                           border-top:solid 1px">Name of subsidiary (if consolidated return)<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
            IncomeLossItems/SubsidiaryName2/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryName2/
          BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SubsidiaryName2/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <xsl:choose>
                <xsl:when test="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryEIN2">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubsidiaryEIN2"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MissingEINReason"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Part 2 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
            <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">Part II</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With<br/>
              <span style="width:2mm;"/>Taxable Income per Return
        </span>
          </div>
          <!-- Part II Table -->
          <table class="styTable" id="IRS1120LScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
            <tr>
              <th class="styTableThead" style="width:6mm"/>
              <th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;">Income (Loss) Items<br/>
                <span style="font-size:7pt;font-weight:normal;">(Attach schedules for lines 1 through 11)</span>
              </th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">
                           (a)</span>
                <br/> Income (Loss) per<br/> Income Statement <br/>
              </th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">
                           (b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">
                           (c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">
                           (d)</span>
                <br/> Income (Loss) per<br/> Tax Return <br/>
              </th>
            </tr>
            <!-- Part II - Line 1 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>1</td>
              <td>Income (loss) from equity method foreign corporations
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.................</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 2 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>2</td>
              <td>Gross foreign dividends not previously taxed
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 3 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>3</td>
              <td>Subpart F, QEF, and similar income inclusions
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 4 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>4</td>
              <td>Section 78 gross-up
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/Section78GrossUp/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 5 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>5</td>
              <td>Gross foreign distributions previously taxed
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 6 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>6</td>
              <td>Income (loss) from equity method U.S. corporations
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 7 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>7</td>
              <td>U.S. dividends not eliminated in tax consolidation
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 8 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>8</td>
              <td>Minority interest for includible corporations
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/MinorityInterestIncludibleCorp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 9 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>9</td>
              <td>Income (loss) from U.S. partnerships 
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 10 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">10</td>
              <td>Income (loss) from foreign partnerships 
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossForeignPartnerships"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 11 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">11</td>
              <td style="padding-top:.5mm;">Income (loss) from other pass-through entities
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 12 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">12</td>
              <td>Items relating to reportable transactions (attach details)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/ItemsRelatingReportableTrans/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 13 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">13</td>
              <td>Interest income (attach Form 8916-A)
                 <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/InterestIncome"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/InterestIncome/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/InterestIncome/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/InterestIncome/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/InterestIncome/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 14 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">14</td>
              <td>Accrual of bond discount<span class="styDotLn" style="float:none;padding-left:3mm;">.........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AccrualBondDiscount/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AccrualBondDiscount/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AccrualBondDiscount/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AccrualBondDiscount/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 15 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">15</td>
              <td>Hedging transactions<span class="styDotLn" style="float:none;
                  padding-left:3mm;">...........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/HedgingTransactions/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/HedgingTransactions/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 16 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">16</td>
              <td>Mark-to-market income (loss)<span class="styDotLn" style="float:none;
                  padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                     IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 17 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">17</td>
              <td>Deferred and uncollected premiums<span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3
              /IncomeLossItems/DeferredUncollectedPremiums/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/DeferredUncollectedPremiums/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/DeferredUncollectedPremiums/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/DeferredUncollectedPremiums/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 18 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">18</td>
              <td>Sale versus lease (for sellers and/or lessors)<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SalesVersusLease/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SalesVersusLease/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 19 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">19</td>
              <td>Section 481(a) adjustments<span class="styDotLn" style="float:none;
                  padding-left:3mm;">.........</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/Section481aAdjustments/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/Section481aAdjustments/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 20 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">20</td>
              <td>Amortization of interest maintenance reserve<span class="styDotLn" style="float:none;
                  padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AmortizationIntMaintReserve/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AmortizationIntMaintReserve/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AmortizationIntMaintReserve/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 21 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">21</td>
              <td>Income recognition from long-term contracts<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 22 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">22</td>
              <td>Market discount reclassification<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MarketDiscountReclassification/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MarketDiscountReclassification/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MarketDiscountReclassification/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23a -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">23a</td>
              <td style="padding-top:.5mm;">Income statement gain/loss on sale, exchange,
                      abandonment, worthlessness, or other disposition of
                      assets other than pass-through entities
                          <span class="styDotLn" style="float:none;padding-left:1mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncmStmtGainLossDisposAst/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncmStmtGainLossDisposAst/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/IncmStmtGainLossDisposAst/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 23b -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:7px;padding-top:0px;">
                <span style="width:1.5mm;"/>b</td>
              <td style="padding-top:.5mm;">Gross capital gains from Schedule D, excluding
                              amounts from pass-through entities
                          <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23c -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;">
                <span style="width:1.5mm;"/>c</td>
              <td style="padding-top:.5mm;">Gross capital losses from Schedule D, excluding
              amounts from pass-through entities, abandonment
              losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23d -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:19px;padding-top:0px;">
                <span style="width:1.5mm;"/>d</td>
              <td style="padding-top:.5mm;">Net gain/loss reported on Form 4797, line 17,
                           excluding amounts from pass-through entities,
                           abandonment losses, and worthless stock losses
            <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/
              GainLossReportedOnForm4797/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/
              GainLossReportedOnForm4797/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/
              GainLossReportedOnForm4797/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23e -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:3px;padding-top:0px;">
                <span style="width:1.5mm;"/>e</td>
              <td style="padding-top:.5mm;">Abandonment losses
          <span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AbandonmentLosses/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AbandonmentLosses/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23f -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:.5px;">
                <span style="width:1.5mm;"/>f</td>
              <td>Worthless stock losses (attach details)
          
<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/WorthlessStockLosses"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              WorthlessStockLosses/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              WorthlessStockLosses/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              WorthlessStockLosses/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23g -->
            <tr>
              <td class="styLNLeftNumBoxSD" style="padding-bottom:8px;padding-top:0px;">
                <span style="width:1.5mm;"/>g</td>
              <td style="padding-top:.5mm;">Other gain/loss on disposition of assets
          <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/
              OthGainLossDisposAssets/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              OthGainLossDisposAssets/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3
              /IncomeLossItems/
              OthGainLossDisposAssets/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 24 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">24</td>
              <td style="padding-top:.5mm;">Capital loss limitation and carryforward used
                <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/
              CapLossLimitationAndCfwdUsed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/CapLossLimitationAndCfwdUsed/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/CapLossLimitationAndCfwdUsed/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 25 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">25</td>
              <td>Other income (loss) items with differences (attach schedule)
          <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 26 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">26</td>
              <td style="padding-top:.5mm; font-size:8.5px;">
                <b>Total income (loss) items. </b>Combine lines 1 through 25
        
<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/TotalIncomeLossItems"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">..</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/TotalIncomeLossItems/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/TotalIncomeLossItems/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/TotalIncomeLossItems/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/TotalIncomeLossItems/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 27 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">27</td>
              <td>
                <span class="styBoldText" style="font-weight:normal">
                  <b>Total expense/deduction items</b> (from Part III, line 39) </span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              TotalExpenseDeductionItems/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 28 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell" style="padding-bottom:2mm;">28</td>
              <td>Other items with no differences 
          <span style="font-weight:normal">(from Part III, line 36)</span>
                <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/IncomeLossItems/
              OtherItemsNoDifferences/IncomePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              OtherItemsNoDifferences/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 29a -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell" style="padding-bottom:2mm;">29a</td>
              <td style="padding-top:.5mm;">Mixed groups, see instructions. All others, combine lines 26 through 28.
                           <span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MixedGroupsAllOthers/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MixedGroupsAllOthers/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MixedGroupsAllOthers/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MixedGroupsAllOthers/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 29b -->
            <tr>
              <td class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>b</td>
              <td style="padding-top:.5mm;">1120 subgroup reconciliation totals
           <span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SubgroupReconciliationTotals/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SubgroupReconciliationTotals/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SubgroupReconciliationTotals/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 29c -->
            <tr>
              <td class="styLNLeftNumBoxSD">
                <span style="width:1.5mm"/>c</td>
              <td style="padding-top:.5mm;">PC insurance subgroup reconciliation totals
                           <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/PCInsSubgroupRecnclTotals/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/MixedGroupsAllOthers/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/SubgroupReconciliationTotals/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/PCInsSubgroupRecnclTotals/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 30 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">30</td>
              <td>
                <span class="styBoldText" style="font-weight:bold">Reconciliation totals. </span>
                <span style="font-weight:normal">Combine lines 29a through 29c</span>
                <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
             ReconciliationTotals/IncomeLossPerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
              ReconciliationTotals/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
                IncomeLossItems/
              ReconciliationTotals/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              IncomeLossItems/
             ReconciliationTotals/IncomeLossPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!-- Table R40 L 30 Note -->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <span class="styBoldText" style="margin-left:10mm;">Note.</span> 
         	  Line 30, column (a), must equal the amount on Part I, line 11, and column (d) must equal Form 1120L, page 1,  line 20. </div>
          <!-- Page 2 END -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-L) 2008</div>
          </div>
          <!-- Page 3 -->
          <!-- Page 3 Header -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;">Schedule M-3 (Form 1120-L) 2008</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
            </div>
          </div>
          <!--  Name -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name of corporation (common parent, if consolidated return)
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <!-- EIN -->
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="$Form1120LScheduleM3/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/MissingEINReason"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
            <!-- Close EIN div -->
          </div>
          <!-- Close Name and EIN Div -->
          <!--  End Name and Employer indentification number  -->
          <!-- start check box line  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           		Check applicable box(es):<b>(1)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedGroup3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedGroup3"/>
                </xsl:call-template>
						Consolidated group
					 </label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(2)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParentCorporation3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ParentCorporation3"/>
                </xsl:call-template>
						Parent corp
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(3)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedEliminations3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ConsolidatedEliminations3"/>
                </xsl:call-template>
						Consolidated eliminations
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(4)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryCorporation3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryCorporation3"/>
                </xsl:call-template>
						Subsidiary corporation
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:2mm;">
              <b>(5)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroup3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Mixed1120LPCGroup3"/>
                </xsl:call-template>
					Mixed 1120/L/PC group
					</label>
            </div>
          </div>
          <!-- end check box line 1  -->
          <!-- start check box line2  -->
          <div style="width:187mm;font-size:6pt;">
            <div class="styGenericDiv">
           	Check if a sub-consolidated: 
           	<span style="width:6mm;"/>
              <b>(6)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LGroup3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LGroup3"/>
                </xsl:call-template>
              </label>
					1120-L group
           	</div>
            <div class="styGenericDiv" style="padding-left:8mm;">
              <b>(7)</b>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LEliminations3"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/Is1120LEliminations3"/>
                </xsl:call-template>
              </label>
				1120-L eliminations	
           	</div>
          </div>
          <!-- end check box line2  -->
          <!-- Subsidiary Name and EIN Line -->
          <div style="width:187mm;">
            <!-- Name -->
            <div style="width:138mm;height:8mm;border-right:solid 1px;float:left;clear:none;border-top:solid 1px;">
          Name of subsidiary (if consolidated return)<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryName3/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryName3/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryName3/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </div>
            <!-- Employer Identification Number -->
            <div style="width:48.9mm;float:right;clear:none;border-top:solid 1px;padding-left:2mm">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:choose>
                <xsl:when test="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryEIN3">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/SubsidiaryEIN3"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/MissingEINReason"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Part 3 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;
                        border-top-width:1px; border-right-width:0px;border-left-width:0px;
                        padding-top:0;float:left;">
            <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm .5mm .25mm .5mm;">Part III</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With <br/>
              <span style="width:2mm;"/>Taxable Income per Return—Expense/Deduction Items
        </span>
          </div>
          <!-- Part III Table -->
          <table class="styTable" id="IRS1120LScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return—Expense/Deduction Items " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
            <tr>
              <th class="styTableThead" style="width:6mm"/>
              <th class="styTableThead" style="width:81mm;text-align:center;font-size:8pt;">Expense/Deduction Items</th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">(a)</span>
                <br/> Expense per<br/> Income Statement<br/>
              </th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120LScheduleM3TheadCell">
                <span class="styBoldText">(d)</span>
                <br/> Deduction per<br/> Tax Return<br/>
              </th>
            </tr>
            <!-- Part III - Line 1 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>1</td>
              <td>U.S. current income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/USCurrentIncomeTaxExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/USCurrentIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/USCurrentIncomeTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 2 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>2</td>
              <td>U.S. deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">.......</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/USDeferredIncomeTaxExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/USDeferredIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/USDeferredIncomeTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 3 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>3</td>
              <td>State and local current income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 4 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>4</td>
              <td>State and local deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/StateLocalDefrdIncmTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 5 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>5</td>
              <td style="padding-top:.5mm;">Foreign current income tax expense (other than foreign withholding taxes)
          <span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 6 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>6</td>
              <td>Foreign deferred income tax expense<span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignDeferredIncmTaxExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 7 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>7</td>
              <td>Foreign withholding taxes<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignWithholdingTaxes/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignWithholdingTaxes/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignWithholdingTaxes/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ForeignWithholdingTaxes/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 8 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>8</td>
              <td>Equity-based compensation
          
              <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
            ExpenseDeductionItems/EquityBasedCompensation"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/EquityBasedCompensation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/EquityBasedCompensation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/EquityBasedCompensation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/EquityBasedCompensation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 9 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">
                <span style="width:1.5mm;"/>9</td>
              <td>Capitalization of deferred acquisition costs
          <span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CapDeferredAcquisitionCosts/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CapDeferredAcquisitionCosts/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CapDeferredAcquisitionCosts/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 10 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">10</td>
              <td>Amortization of deferred acquisition costs<span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortzDeferredAcquisitionCosts/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortzDeferredAcquisitionCosts/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortzDeferredAcquisitionCosts/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 11 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">11</td>
              <td>Meals and entertainment<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/MealsAndEntertainment/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 12 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">12</td>
              <td>Fines and penalties<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/FinesAndPenalties/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 13 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">13</td>
              <td>Judgments, damages, awards, and similar costs
          <span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 14 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">14</td>
              <td>Parachute payments<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ParachutePayments/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ParachutePayments/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ParachutePayments/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ParachutePayments/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 15 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">15</td>
              <td>Compensation with section 162(m) limitation<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CompWithSect162mLimitation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CompWithSect162mLimitation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CompWithSect162mLimitation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CompWithSect162mLimitation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 16 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">16</td>
              <td>Pension and profit-sharing<span class="styDotLn" style="float:none;padding-left:3mm;">..........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PensionAndProfitSharing/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 17 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">17</td>
              <td>Other post-retirement benefits<span class="styDotLn" style="float:none;padding-left:3mm;">........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherPostRetirementBenefits/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 18 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">18</td>
              <td>Deferred compensation<span class="styDotLn" style="float:none;padding-left:3mm;">...........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/DeferredCompensation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 19 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">19</td>
              <td>Charitable contribution of cash and tangible property<span class="styDotLn" style="float:none;padding-left:3mm;">.</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitbleContriCashTngblProp/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 20 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">20</td>
              <td>Charitable contribution of intangible property<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitableContriIntangibleProp/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 21 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">21</td>
              <td>Charitable contribution limitation/carryforward<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitableContriLimitationCfwd/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitableContriLimitationCfwd/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CharitableContriLimitationCfwd/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 22 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">22</td>
              <td>Change in section 807(c)(1) tax reserves<span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/ChangeSection807c1TaxReserves/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ChangeSection807c1TaxReserves/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/
              ChangeSection807c1TaxReserves/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/
              ChangeSection807c1TaxReserves/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 23 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">23</td>
              <td style="padding-top:.5mm;">Change in section 807(c)(2) tax reserves
          <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ChangeSection807c2TaxReserves/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ChangeSection807c2TaxReserves/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ChangeSection807c2TaxReserves/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/ExpenseDeductionItems/
               ChangeSection807c2TaxReserves/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 24 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">24</td>
              <td style="padding-top:.5mm;">Change in all other section 807(c) tax reserves<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              
              ExpenseDeductionItems/ChgAllOtherSection807cTaxRsrv/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ChgAllOtherSection807cTaxRsrv/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ChgAllOtherSection807cTaxRsrv/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/ChgAllOtherSection807cTaxRsrv/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 25 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">25</td>
              <td>Section 807(f) adjustments for change in computing
reserves<span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Sect807fAdjChangeComputingRsrv/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Sect807fAdjChangeComputingRsrv/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Sect807fAdjChangeComputingRsrv/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 26 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">26</td>
              <td>Section 807(a)(2)(B) tax reserve amount with respect to
policyholder share of tax-exempt interest<span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Section807a2BTaxReservesAmount/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Section807a2BTaxReservesAmount/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Section807a2BTaxReservesAmount/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 27 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">27</td>
              <td style="padding-top:.5mm;">Current year acquisition/reorganization costs (attach schedule)
          
            
             <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
            ExpenseDeductionItems/CYAcquisReorgCosts"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgCosts/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgCosts/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgCosts/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CYAcquisReorgCosts/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 28 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">28</td>
              <td>Amortization of acquisition, reorganization, and start-up costs<span class="styDotLn" style="float:none;padding-left:3mm;">................</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 29 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">29</td>
              <td>Amortization/impairment of goodwill, insurance in force and ceding commissions
 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortizationImpairmentGoodwill"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.........</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/AmortizationImpairmentGoodwill/
              ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              ExpenseDeductionItems/AmortizationImpairmentGoodwill/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              ExpenseDeductionItems/AmortizationImpairmentGoodwill/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              ExpenseDeductionItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 30 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">30</td>
              <td>Other amortization or impairment write-offs<span class="styDotLn" style="float:none;padding-left:3mm;">....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 31 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">31</td>
              <td>Section 846 amount
         <span class="styDotLn" style="float:none;padding-left:3mm;">............</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Section846Amount/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Section846Amount/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Section846Amount/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 32 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">32</td>
              <td>Depreciation<span class="styDotLn" style="float:none;padding-left:3mm;">..............</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Depreciation/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Depreciation/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Depreciation/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/Depreciation/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 33 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">33</td>
              <td>Bad debt exp ense/agency balances written off<span class="styDotLn" style="float:none;padding-left:3mm;">...</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 34 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">34</td>
              <td>Corporate owned life insurance premiums
          <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/CorpOwnedLifeInsurancePremiums/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 35 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">35</td>
              <td>Purchase versus lease (for purchasers and/or lessees)
          <span class="styDotLn" style="float:none;padding-left:3mm;"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/PurchaseVersusLease/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 36 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">36</td>
              <td>Interest expense (attach Form 8916-A)
                      <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
             ExpenseDeductionItems/InterestExpense"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/InterestExpense/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/InterestExpense/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/InterestExpense/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/InterestExpense/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 37 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">37</td>
              <td>Domestic production activities deduction
          <span class="styDotLn" style="float:none;padding-left:3mm;">.....</span>
              </td>
              <td class="styIRS1120LScheduleM3ShadedCell" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/DomesticProductionActyDed/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/DomesticProductionActyDed/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/DomesticProductionActyDed/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 38 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">38</td>
              <td style="padding-top:.5mm;">Other expense/deduction items with differences
                            (attach schedule)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences"/>
                </xsl:call-template>
                <span class="styDotLn" style="float:none;padding-left:3mm;">...............</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-color:black;border-top-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 39 -->
            <tr>
              <td class="styIRS1120LScheduleM3NumberCell">39</td>
              <td style="padding-top:.5mm;font-weight:bold">Total expense/deduction items.
          <span style="font-weight:normal">Combine lines 1 through 38. Enter here and on Part II, line 27, reporting positive amounts as negative and negative amounts as positive.</span>
                <span class="styDotLn" style="float:none;padding-left:3mm;">......</span>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              ExpenseDeductionItems/TotalExpenseDeductionItems/ExpensePerIncomeStatement"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/TotalExpenseDeductionItems/TemporaryDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/
              ExpenseDeductionItems/TotalExpenseDeductionItems/PermanentDifference"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120LScheduleM3Cell" style="border-bottom:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3/              ExpenseDeductionItems/TotalExpenseDeductionItems/DeductionPerTaxReturn"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <div class="pageEnd" style="width:187mm;border-top:2px solid black;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120-L) 2008</div>
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
              <xsl:with-param name="TargetNode" select="$Form1120LScheduleM3"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
