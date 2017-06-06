<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120SScheduleM3Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1120SScheduleM3" select="$RtnDoc/IRS1120SScheduleM3"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120SScheduleM3)"/>
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
        <meta name="Description" content="IRS Form 1120S Schedule M3"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120SScheduleM3Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120SScheduleM3">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Header - Form1120SSchM3 Number, Title, and Year -->
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:23mm;border-right-width:2px;">
              <span class="styFormNumber" style="font-size:10pt;">SCHEDULE M-3(Form 1120S)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3"/>
                </xsl:call-template>
              </span>
              <span class="styAgency" style="height:5mm;padding-top:7mm;">
         <span style="width:25mm;"> Department of the Treasury </span>
          Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:23mm;">
              <div class="styMainTitle">Net Income (Loss) Reconciliation for Corporations<br/>
                             With Total Assets of $10 Million or More</div>
              <div class="styFST" style="height:5mm;">
                <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
                Attach to Form 1120S.<br/>
                <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
                Information about Schedule M-3 (Form 1120S) and its separate instructions is available at www.irs.gov/form1120S.<br/>
                </div>                
            </div>            
            <div class="styTYBox" style="width:30mm;height:23mm;border-left-width:2px;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0130</div>
              <div class="styTY" style="height:11mm;padding-top:4mm;">20<span class="styTYColor">13</span>
              </div>
            </div>
          </div>
          <!--  Name and Employer identification number  -->
          <div class="styTBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
            Name of corporation<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="$Form1120SScheduleM3/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/MissingEINReasonCd"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
          </div>
          <!-- Part I - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;           border-right-width:0px;border-left-width:0px;padding-top:2mm;float:left;">
            <span class="styPartName" style="height:1mm;width:12mm;">Part I</span>
            <span style="width:175mm;" class="styPartDesc">
              <span style="width:3mm;"/>Financial Information and Net Income (Loss) Reconciliation <span style="font-weight:normal;">(see instructions)</span><br/>
            </span>
          </div>
          <!-- Line 1a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">1a</div>
            <div class="styLNDesc" style="width:179mm;">
       Did the corporation prepare a certified audited non-tax-basis income statement for 
       the period ending with or within this tax year? (See instructions if multiple non-tax-basis income statements are prepared.)</div>
          </div>
          <!-- Line 1a - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
 <xsl:with-param name="BackupName">CorpPrepCertAuditedIncomeStmtYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
 <xsl:with-param name="BackupName">CorpPrepCertAuditedIncomeStmtYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
        Skip line 1b and complete lines 2 through 11 with respect to that income statement.
        </div>
          </div>
          <!-- Line 1a - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
               <xsl:with-param name="BackupName">CorpPrepCertAuditedIncomeStmtNo</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
               <xsl:with-param name="BackupName">CorpPrepCertAuditedIncomeStmtNo</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
          Go to line 1b.
        </div>
          </div>
          <!-- Line 1b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b</div>
            <div class="styLNDesc" style="width:179mm;">
           Did the corporation prepare a non-tax-basis income statement for that period?</div>
          </div>
          <!-- Line 1b - Yes -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
               <xsl:with-param name="BackupName">CorpPrepIncomeStatementYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
               <xsl:with-param name="BackupName">CorpPrepIncomeStatementYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
            Complete lines 2 through 11 with respect to that income statement.
        </div>
          </div>
          <!-- Line 1b - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
            <xsl:with-param name="BackupName">CorpPrepIncomeStatementNo</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
            <xsl:with-param name="BackupName">CorpPrepIncomeStatementNo</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
         Skip lines 2 through 3b and enter the corporation’s net income (loss) per its books and records on line 4a.
        </div>
          </div>
          <!-- Line 2 -->
          <div style="width:187mm;padding-top:2mm;">
            <div class="styLNLeftNumBoxSD">2</div>
            <div class="styLNDesc" style="width:179mm;">Enter the income statement period:
          <span style="width:3mm"/>Beginning<span style="width:3mm"/>
              <span style="width:25mm;border-bottom:solid 1px;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeStatementBeginningDt"/>
                </xsl:call-template>
              </span>
              <span style="width:8mm"/>Ending<span style="width:3mm"/>
              <span style="width:25mm;border-bottom:solid 1px;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeStatementEndingDt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Line 3a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">3a</div>
            <div class="styLNDesc" style="width:179mm;">
          Has the corporation’s income statement been restated for the income statement period on line 2?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 3a  YES-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
              <xsl:with-param name="BackupName">CorpIncomeStatementRestatedYes</xsl:with-param>      
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
              <xsl:with-param name="BackupName">CorpIncomeStatementRestatedYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
          (If  &#8220;Yes,&#8221; attach an explanation and the amount of each item restated.)
        </div>
          </div>
          <!-- Line 3a - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
                   <xsl:with-param name="BackupName">CorpIncomeStatementRestatedNo</xsl:with-param>               
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
                   <xsl:with-param name="BackupName">CorpIncomeStatementRestatedNo</xsl:with-param> 
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
          </div>
          <!-- Line 3b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b</div>
            <div class="styLNDesc" style="width:179mm;">Has the corporation's income
         statement been restated for any of the five income statement periods preceding
          the period<br/> on line 2?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                 <xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingYes</xsl:with-param>   
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                 <xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingYes</xsl:with-param> 
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>          
          (If  &#8220;Yes,&#8221; attach an explanation and the amount of each item restated.)
        </div>
          </div>
          <!-- Line 3b - No -->
          <div class="styBB" style="width:187mm;padding-bottom:2mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                                 <xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingNo</xsl:with-param>    
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                                 <xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingNo</xsl:with-param> 
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
          </div>
          <!-- Line 4a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">4a</div>
              <div class="styLNDesc" style="width:131mm;">Worldwide consolidated net income (loss)
           from income statement source identified in Part I, line 1</div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">4a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/WorldwideCnsldtNetIncmLossAmt"/>
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
              <div class="styLNDesc" style="width:131mm;padding-top:.5mm;">Indicate accounting standard used for line 4a (see instructions):</div>
              <span class="styDotLn" style="float:none;padding-left:2px;" valign="bottom"/>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
            </div>
          </div>
          <!-- L4b r2 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm;"/>
              </div>
              <!--Check Box 1 -->
              <div class="styLNDesc" style="width:131mm;padding-top:.5mm;">(1)
               <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/GAAPInd"/>
                   <xsl:with-param name="BackupName">Form1120SScheduleM3/GAAP</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/GAAPInd"/>
                   <xsl:with-param name="BackupName">Form1120SScheduleM3/GAAP</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">GAAP</span>
                </label>
                <!--Check Box 2 -->
                <span style="width:12mm;"/>(2)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IFRSInd"/>
               <xsl:with-param name="BackupName">Form1120SScheduleM3/IFRS</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IFRSInd"/>
                    <xsl:with-param name="BackupName">Form1120SScheduleM3/IFRS</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">IFRS</span>
                </label>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
              </div>
              <!--Close Check box 1 -->
              <span class="styDotLn" style="float:none;padding-left:2px;" valign="bottom"/>
            </div>
            <!--close float left -->
          </div>
          <!-- close L4b r2 -->
          <!-- L4b r3 -->
          <div style="width:187mm;padding-bottom:.0mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">
                <span style="width:1.5mm;"/>
              </div>
              <div class="styLNDesc" style="width:138mm;padding-top:.5mm;">(3)
                <!--NOTE- this check box for Tax-basis is not present on the PDF submit with work request WSP-08-0870 -->
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/TaxBasisInd"/>
               <xsl:with-param name="BackupName">TaxBasis</xsl:with-param>     
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/TaxBasisInd"/>
<xsl:with-param name="BackupName">TaxBasis</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Tax-basis</span>
                </label>
                <!--Check Box 4 -->
                <span style="width:7mm;"/>(4)
              <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/OtherInd"/>
                    <xsl:with-param name="BackupName">Other</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/OtherInd"/>
                      <xsl:with-param name="BackupName">Other</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Other (specify)</span>
                  <span style="width:1.5mm;"/>
                  <!-- A straight Line -->
                  <span style="width:77mm;border-bottom:solid 1px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/OtherInd/@methodOfAccountingOtherDesc"/>
                    </xsl:call-template>
                  </span>
                </label>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="background-color:lightgrey;"/>
                <div class="styLNAmountBox" style="background-color:lightgrey;"/>
              </div>
              <!--Close Check box 1 -->
              <span class="styDotLn" style="float:none;padding-left:2px;" valign="bottom"/>
            </div>
            <!--close float left -->
          </div>
          <!-- close L4b r3 -->
          <!-- blank line -->
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 5a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">5a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income from nonincludible foreign entities (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
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
                <span style="float:left;">Net loss from nonincludible foreign entities (attach statement and enter as a positive amount)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 6a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">6a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income from nonincludible U.S. entities (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">6a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
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
                <span style="float:left;">Net loss from nonincludible U.S. entities (attach statement and enter as a positive amount)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetLossNonincludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">6b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetLossNonincludibleUSEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 7a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">7a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other  foreign disregarded entities (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 7b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">
                <span style="width:1.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">
                Net income (loss) of other U.S. disregarded entities (except qualified subchapter S subsidiaries) <span style="float:left;">(attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">7b</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
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
                <span style="float:left;">Net income (loss) of other qualified subchapter S subsidiaries (QSubs) (attach statement)
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncmOthQlfySbchptrSbsdrsAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncmOthQlfySbchptrSbsdrsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 8 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">8</div>
              <div class="styLNDesc" style="width:137mm;height:8mm">
          Adjustment to eliminations of transactions between includible entities and nonincludible entities
              <span style="float:left;">(attach statement)           
               <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/AdjustmentToEliminateTransAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/AdjustmentToEliminateTransAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 9 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">9</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Adjustment to reconcile income statement period to tax year (attach statement)
                <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">9</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 10 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">10</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Other adjustments to reconcile to amount on line 11 (attach statement) 
            <!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/OtherAdjustmentsToReconcileAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/OtherAdjustmentsToReconcileAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L11 R1 blank -->
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:2mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- L11 R2 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">
                 <!-- Exception #33352 PDF is wrong lines 4 should be Lines 4a-->
                  <span class="styBoldText">Net income (loss) per income statement of the corporation.</span> Combine lines 4a through 10 </span>
                 
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">11</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/NetIncomeLossPerIncomeStmtAmt"/>
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
                <span class="styBoldText">Note </span>Part I, line 11, must equal Part II, line 26, column (a). 
              </div>
            </div>
            <div style="float:right;">
              <div style="width:40mm;"/>
            </div>
            <!-- close float right -->
          </div>
          <!--Blank Line -->
          <div class="styBB" style="width:187mm;"/>
          <!-- L12 R1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">12</div>
              <div class="styLNDesc" style="width:179mm;">
                Enter the total amount (not just the corporation’s share) of the assets and
                  liabilities of all entities included or removed on the following lines: 
              </div>
            </div>
          </div>
          <!-- L12 R2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div style="width:50mm;"/>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <div class="styLNAmountBox" style="width:50mm;text-align:center;border-width:1px;border-right-width:0px;">Total Assets
                </div>
                <div class="styLNAmountBox" style="width:50mm;text-align:center;border-width:1px;">Total Liabilities
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
                <div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
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
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntIncldWorldwideCnsldtAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntIncldWorldwideCnsldtLiabAmt"/>
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
                <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
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
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntRmvdNonincludibleFrgnAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntRmvdNonincludblFrgnLiabAmt"/>
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
                <div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
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
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntRmvdNonincludibleUSLiabAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntRmvdNonincludibleUSAstAmt"/>
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
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntIncldOtherIncludibleAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EntIncldOtherIncludibleLiabAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- close width -->
            </div>
            <!-- close float right -->
          </div>
          <!--Blank Row -->
          <div class="styTBB" style="width:187mm;"/>
          <!-- Page 1 Footer -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="width:95mm;float:left;font-size:6pt;">For Paperwork Reduction Act Notice,see the Instructions for Form 1120S.</div>
            <div style="width:25mm;float:left;">Cat. No. 39666W</div>
            <div class="styBoldText" style="float:right;">Schedule M-3 (Form 1120S) 2013</div>
          </div>
          <!-- Page 2 -->
          <!-- Page 2 Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:2px">
            <div style="float:left;">Schedule M-3 (Form 1120S) 2013</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <!-- Name and EIN  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name of corporation<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="$Form1120SScheduleM3/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/MissingEINReasonCd"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
          </div>
          <!-- Part 2 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
            <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">Part II</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of the Corporation With Total <br/>
              <span style="width:3mm;"/>Income (Loss) per Return <span style="font-weight:normal;">(see instructions)</span>
            </span>
          </div>
          <!-- Part II Table -->
          <table class="styTable" id="IRS1120SScheduleM3PartIITable" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporations With Taxable Income per Return " cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
            <tr>
              <th class="styTableThead" scope="col" style="width:6mm"/>
              <th class="styTableThead" scope="col" style="width:81mm;text-align:center;font-size:8pt;font-weight:normal;">
                           Income (Loss) Items</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">
                           (a)</span>
                <br/> Income (Loss) per<br/> Income Statement</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">
                           (b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">
                           (c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">
                           (d)</span>
                <br/> Income (Loss) per<br/> Tax Return</th>
            </tr>
            <!-- Part II - Line 1 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>1</td>
              <td>
              <span style="float:left;">Income (loss) from equity method foreign corporations  </span>
              <span style="float:left;">(attach statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 2 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>2</td>
              <td>
              <span style="float:left;">Gross foreign dividends not previously taxed
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 3 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>3</td>
              <td>
              <span style="float:left;">Subpart F, QEF, and similar income inclusions (attach </span>
              <span style="float:left;">statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 4 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>4</td>
              <td>
                <span style="float:left;">Gross foreign distributions previously taxed (attach </span>
                <span style="float:left;">statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 5 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>5</td>
              <td>
                <span style="float:left;">Income (loss) from equity method U.S. corporations</span>
                <span style="float:left;">(attach statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 6 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>6</td>
              <td>U.S. dividends not eliminated in tax consolidation
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/USDivNotEliminatedTaxConsol"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/USDivNotEliminatedTaxConsol/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/USDivNotEliminatedTaxConsol/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 7 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>7</td>
              <td style="white-space:nowrap;">
                 Income (loss) from U.S. partnerships (attach statement) 
       <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossUSPartnerships"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossUSPartnerships/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 8 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>8</td>
              <td>
              <span style="float:left;">Income (loss) from foreign partnerships (attach </span> 
              <span style="float:left;white-space:nowrap;">statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossForeignPartnerships"/>
                </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 9 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>9</td>
              <td style="padding-top:.5mm;">
              <span style="float:left;">Income (loss) from other pass-through entities (attach</span>
              <span style="float:left;">statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossPassThroughEntities"/>
                </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 10 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">10</td>
              <td>
              <span style="float:left;padding-right:10px;">Items relating to reportable transactions (attach </span>
              <span style="float:left;white-space:nowrap;"> details)
               <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 11 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">11</td>
              <td>
              <span style="float:left;">Interest income (attach Form 8916-A)
              <!-- form link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/InterestIncomeForm8916AGrp"/>
                </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 12 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">12</td>
              <td>
                <span style="float:left;">Total accrual to cash adjustment</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalAccrualCashAdjustmentGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 13 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">13</td>
              <td>
                 <span style="float:left;">Hedging transactions</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/HedgingTransactions/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/HedgingTransactions/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 14 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">14</td>
              <td>
               <span style="float:left;">Mark-to-market income (loss)</span>
               <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 15 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">15</td>
              <td>
                 <span style="float:left;">Cost of goods sold (attach Form 8916-A)
           <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp"/>
                </xsl:call-template></span>
               <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/CostOfGoodsSoldNNGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 16 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">16</td>
              <td>
				  <span style="float:left;">Sale versus lease (for sellers and/or lessors)</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SalesVersusLease/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SalesVersusLease/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 17 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">17</td>
              <td>
				  <span style="float:left;">Section 481(a) adjustments</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/Section481aAdjustments/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/Section481aAdjustments/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 18 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">18</td>
              <td>
                  <span style="float:left;">Unearned/deferred revenue</span>
                  <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/UnearnedDeferredRevenueGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 19 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">19</td>
              <td>
				  <span style="float:left;">Income recognition from long-term contracts</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeRecognitionLTContracts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeRecognitionLTContracts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 20 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">20</td>
              <td>Original issue discount and other imputed interest</td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21a -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">21a</td>
              <td style="padding-top:.5mm;">
                     Income statement gain/loss on sale, exchange,
                      abandonment, worthlessness, or other disposition of
                      assets other than inventory and pass-through entities
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncmStmtGainLossAstNotInvntry/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncmStmtGainLossAstNotInvntry/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/IncmStmtGainLossAstNotInvntry/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 21b -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">b</td>
              <td style="padding-top:.5mm;">
                    <span style="float:left;">Gross capital gains from Schedule D, excluding</span>
                    <span style="float:left;white-space:nowrap;">amounts from pass-through entities</span>
                    <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21c -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">c</td>
              <td style="padding-top:.5mm;">
				  <span style="float:left;">Gross capital losses from Schedule D, excluding</span>
				  <span style="float:left;">amounts from pass-through entities, abandonment</span>
				  <span style="float:left;">losses, and worthless stock losses</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21d -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">d</td>
              <td style="padding-top:.5mm;">
                    <span style="float:left;">Net gain/loss reported on Form 4797, line 17, excluding amounts from pass-through entities,abandonment losses,</span> 
                    <span style="float:left;">and worthless stock losses</span>
                    <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
                    </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GainLossReportedOnForm4797/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GainLossReportedOnForm4797/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/GainLossReportedOnForm4797/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21e -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">e</td>
              <td style="padding-top:.5mm;">
                 <span style="float:left;">Abandonment losses</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/AbandonmentLosses/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/AbandonmentLosses/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21f -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">f</td>
              <td>
                <span style="float:left;">Worthless stock losses (attach details)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/WorthlessStockLosses"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/WorthlessStockLosses/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/WorthlessStockLosses/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/WorthlessStockLosses/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21g -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">g</td>
              <td style="padding-top:.5mm;">
                 <span style="float:left;padding-right:10px;">Other gain/loss on disposition of assets other than </span>
                 <span style="float:left;">inventory</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthGainLossAssetsNotInventory/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthGainLossAssetsNotInventory/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthGainLossAssetsNotInventory/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 22 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">22</td>
              <td style="padding-top:.5mm;">
              <span style="float:left;">Other income (loss) items with differences (attach </span>
              <span style="float:left;">statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthIncmLossItemsDifferences"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">23</td>
              <td>
                <span class="styBoldText" style="font-weight:bold">Total income (loss) items. </span>
                <span style="font-weight:normal">Combine lines 1 through 22</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalIncomeLossItems/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalIncomeLossItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalIncomeLossItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalIncomeLossItems/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 24 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">24</td>
              <td>
                <span class="styBoldText" style="font-weight:bold">Total expense/deduction items </span>
                <span style="font-weight:normal">(from Part III, line 32)</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 25 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">25</td>
              <td>
                <span style="font-weight:normal;float:left;">Other items with no differences</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 26 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">26</td>
              <td>
                <span class="styBoldText" style="font-weight:bold">Reconciliation totals. </span>
                <span style="font-weight:normal">Combine lines 23 through 25</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ReconciliationTotals/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ReconciliationTotals/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ReconciliationTotals/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3IncomeLossItems/ReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <br/>
          <div class="styBB" style="width:187mm;padding-left:11mm">
            <span class="styBoldText">Note.</span> 
         Line 26, column (a), must equal the amount on Part I, line 11, and column (d) must equal Form 1120S, Schedule K, line 18.</div>
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120S) 2013</div>
          </div>
          <!-- Page 3 -->
          <!-- Page 3 Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div style="float:left;">Schedule M-3 (Form 1120S) 2013</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name of corporation<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="$Form1120SScheduleM3/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/MissingEINReasonCd"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
          </div>
          <!-- Part 3 - Header -->
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;                         border-top-width:1px; border-right-width:0px;border-left-width:0px;                         padding-top:0;float:left;">
            <span class="styPartName" style="height:1mm;width:14mm;padding: .25mm .5mm                       .25mm .5mm;">Part III</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>
              Reconciliation of Net Income (Loss) per Income Statement of the Corporations With Total <br/>
              <span style="width:3mm;"/>Income (Loss) per Return—Expense/Deduction Items <span style="font-weight:normal;">(see instructions)</span>
            </span>
          </div>
          <!-- Part III Table -->
          <table class="styTable" id="IRS1120SScheduleM3PartIII" summary="Reconciliation of Net Income (Loss) per Income Statement of Includible Corporation With Taxable Income per Return—Expense/Deduction Items (see instructions)" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm;">
            <tr>
              <th class="styTableThead" scope="col" style="width:6mm"/>
              <th class="styTableThead" scope="col" style="width:81mm;text-align:center;font-size:8pt;font-weight:normal;">Expense/Deduction Items</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(a)</span>
                <br/> Expense per<br/> Income Statement</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col">
                <span class="styBoldText">(d)</span>
                <br/> Deduction per<br/> Tax Return</th>
            </tr>
            <!-- Part III - Line 1 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>1</td>
              <td>
              <span style="float:left;">U.S. current income tax expense</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 2 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>2</td>
              <td>
				  <span style="float:left;">U.S. deferred income tax expense</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USDeferredIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USDeferredIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USDeferredIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 3 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>3</td>
              <td>
              <span style="float:left;">State and local current income tax expense</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 4 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>4</td>
              <td>
				  <span style="float:left;">State and local deferred income tax expense</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 5 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>5</td>
              <td style="padding-top:.5mm;">
                 <span style="float:left;">Foreign current income tax expense (other than foreign </span>
                 <span style="float:left;"> withholding taxes)</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 6 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>6</td>
              <td>
              <span style="float:left;">Foreign deferred income tax expense</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignDeferredIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignDeferredIncmTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignDeferredIncmTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 7 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>7</td>
              <td>
              <span style="float:left;">Equity-based compensation</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 8 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>8</td>
              <td>
              <span style="float:left;">Meals and entertainment</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 9 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>9</td>
              <td>
                 <span style="float:left;">Fines and penalties </span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 10 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">10</td>
              <td>
                <span style="float:left;">Judgments, damages, awards, and similar costs</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 11 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">11</td>
              <td>
              <span style="float:left;">Pension and profit-sharing</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 12 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">12</td>
              <td>
				  <span style="float:left;">Other post-retirement benefits</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 13 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">13</td>
              <td>
              <span style="float:left;">Deferred compensation</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 14 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">14</td>
              <td>
                 <span style="float:left;">Charitable contribution of cash and tangible property</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 15 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">15</td>
              <td>
              <span style="float:left;">Charitable contribution of intangible property</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 16 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">16</td>
              <td>
              <span style="float:left;">Current year acquisition or reorganization investment</span>
              <span style="float:left;">banking fees</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 17 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">17</td>
              <td style="padding-top:.5mm;">
                <span style="float:left;">Current year acquisition or reorganization legal and</span>
                <span style="float:left;">accounting fees</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 18 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">18</td>
              <td>
                 <span style="float:left;">Current year acquisition/reorganization other costs</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 19 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">19</td>
              <td>
				  <span style="float:left;">Amortization/impairment of goodwill</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortizationImpairmentGoodwill/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortizationImpairmentGoodwill/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortizationImpairmentGoodwill/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 20 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">20</td>
              <td style="padding-top:.5mm;">
                    <span style="float:left;white-space:nowrap;">Amortization of acquisition, reorganization, and</span>
                    <span style="float:left;white-space:nowrap;">start-up costs</span>
                    <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 21 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">21</td>
              <td>
              <span style="float:left;">Other amortization or impairment write-offs</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 22 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">22</td>
              <td>
				  <span style="float:left;">Reserved</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
               <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
               <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
               <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 23a -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">23a</td>
              <td>
              <span style="float:left;">Depletion—Oil and Gas</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOilGas/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOilGas/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOilGas/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part III - Line 23b -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">b</td>
              <td>
                 <span style="float:left;">Depletion—Other than Oil and Gas</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 24 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">24</td>
              <td>
                 <span style="float:left;">Depreciation</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepreciationGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepreciationGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepreciationGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepreciationGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 25 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">25</td>
              <td>
              <span style="float:left;">Bad debt expense</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 26 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">26</td>
              <td>
               <span style="float:left;"> Interest expense (attach Form 8916-A) 
           <!-- form link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 27 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">27</td>
              <td>
                 <span style="float:left;">Corporate owned life insurance premiums</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CorpOwnedLifeInsurancePremiums/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CorpOwnedLifeInsurancePremiums/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CorpOwnedLifeInsurancePremiums/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CorpOwnedLifeInsurancePremiums/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 28 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">28</td>
              <td>
                Purchase versus lease (for purchasers and/or lessees)          
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 29 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">29</td>
              <td style="padding-top:.5mm;">
              <span style="float:left;">Research and development costs</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ResearchAndDevelopmentCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ResearchAndDevelopmentCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ResearchAndDevelopmentCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ResearchAndDevelopmentCosts/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 30 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">30</td>
              <td>
              <span style="float:left;">Section 118 exclusion (attach statement)
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 31 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">31</td>
              <td style="padding-top:.5mm;">
             <span style="float:left;">Other expense/deduction items with differences  </span>
             <span style="float:left;white-space:nowrap;">(attach statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 32 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="border-bottom-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;border-right-width:0px">32</td>
              <td style="padding-top:.5mm;font-weight:bold;border-bottom-width:1px;border-color:black;border-style:solid;border-left-width:0px;border-top-width:0px;border-right-width:0px">Total expense/deduction items.
          <span style="font-weight:normal">Combine lines 1 through 31. Enter here and on Part II, line 24, reporting positive amounts as negative and negative amounts as positive. </span>
                <!--<span class="styDotLn" style="float:none;padding-left:3mm;">............</span>-->
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120S) 2013</div>
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
              <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>