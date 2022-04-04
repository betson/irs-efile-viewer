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
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
      <head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
	    <!--  Updated 05/21/2014 (WT) UWR 101606 for R9.5_D2   -->
	    <!--  Updated 06/14/2014 (WT) UWR 112664 for R9.5_D3   -->
	    <!--  Updated 08/28/2014 (WT) UWR 117755 for R9.5_D4   -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120SScheduleM3Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm;">
        <form name="Form1120SScheduleM3">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Header - Form1120SSchM3 Number, Title, and Year -->
          <div class="styTBB" style="width:187mm;border-bottom-width: 0px;">
            <div class="styFNBox" style="width:33mm;height:21mm;border-right-width:1px;">
              <span class="styFormNumber" style="font-size:10pt;">SCHEDULE M-3(Form 1120S)
								<span class="styAgency" style="font-weight:bold; ">(Rev. December 2019)
									<!-- Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM3"/>
									</xsl:call-template>
									<span class="styAgency" style="padding-top:3mm;">Department of the Treasury 
									Internal Revenue Service</span>
							</span>
						</span>
            </div>
            <div class="styFTBox" style="width:123mm;height:21mm;">
              <div class="styMainTitle">Net Income (Loss) Reconciliation for S Corporations With Total Assets of $10 Million or More</div>
              <div class="styFST" style="height:5mm;">
					<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Medium right pointing arrow"/>Attach to Form 1120S.<br/>
					 <span style="text-align:center;margin-left:0mm;font-weight:bold;padding-top:3.5mm;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Medium right pointing arrow"/> 
									<b>
									Go to <a style="text-decoration:none;color:black" href="http://www.irs.gov/form1120s" title="Link to IRS.gov">
										<i>www.irs.gov/Form1120s</i> for instructions and the latest information.
									</a></b>
								</span>
						<br/>
                </div>                
            </div>            
            <div class="styTYBox" style="width:30mm;height:21mm;border-left-width:1px;">
              <div style="padding-top:7mm; font-size:7pt;font-weight:bold;padding-left:1mm">OMB No. 1545-0123</div>
            </div>
          </div>
          <!--  Name and Employer identification number  -->
          <div class="styBB" style="width:187mm;border-top-width: 2px;">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">Name of corporation<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine2Txt"/>
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
          <div style="width:187mm;height:8mm;border-style:solid; border-bottom-width:1px;
              border-top-width:0px;border-right-width:0px;border-left-width:0px;padding-top:2mm;float:left;">
            <span class="styPartName" style="height:4mm;width:12mm;">Part I</span>
            <span style="width:175mm;" class="styPartDesc">
              <span style="width:3mm;"/>Financial Information and Net Income (Loss) Reconciliation <span style="font-weight:normal;">(see instructions)
              </span>
              <br/>
            </span>
          </div>
          <!-- Line 1a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">1a</div>
            <div class="styLNDesc" style="width:179mm;height:6mm;">Did the corporation prepare a certified audited non-tax-basis income statement for  the period ending with or within this tax year? See instructions if multiple non-tax-basis income statements are prepared.</div>
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
               <input type="checkbox" alt="Corporation Prepare Certified Audited Income Statement Indicator Yes" class="styCkbox">
              
           <!-- <xsl:call-template name="PopulateCheckbox">-->
                <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
				    <xsl:with-param name="BackupName">CorpPrepCertAuditedIncomeStmtIndYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <!--<xsl:call-template name="PopulateLabel">-->
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
				  <xsl:with-param name="BackupName">CorpPrepCertAuditedIncomeStmtLabelYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label> Skip line 1b and complete lines 2 through 11 with respect to that income statement.
			</div>
          </div>
          

	
          <!-- Line 1a - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
                </xsl:call-template>
                <input type="checkbox" alt="Corporation Prepare Certified Audited Income Statement Indicator No" class="styCkbox">  
				<!--<xsl:if test="CorpPrepCertAuditedIncmStmtInd !='X'">-->
                 <xsl:call-template name="PopulateNoCheckbox">
            <!-- <xsl:call-template name="PopulateCheckbox">-->
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
				    <xsl:with-param name="BackupName">CorpPrepCertAuditedIncomeStmtNo</xsl:with-param>
                  </xsl:call-template><!--</xsl:if>-->
                </input>
              </span>
              <label>
                <!--<xsl:call-template name="PopulateLabel">-->
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpPrepCertAuditedIncmStmtInd"/>
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
            <div class="styLNDesc" style="width:179mm;">Did the corporation prepare a non-tax-basis income statement for that period?</div>
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
                <input type="checkbox" alt="Corporation Prepare Income Statement Indicator Yes" class="styCkbox">
                 <!-- <xsl:call-template name="PopulateCheckbox">-->
                 <xsl:call-template name="PopulateYesCheckbox"> 
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
				    <xsl:with-param name="BackupName">CorpPrepIncomeStatementIndYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
               <!-- <xsl:call-template name="PopulateLabel">-->
              <xsl:call-template name="PopulateLabelYes"> 
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
				  <xsl:with-param name="BackupName">CorpPrepIncomeStatementLabelYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>Complete lines 2 through 11 with respect to that income statement.
			</div>
          </div>
          <!-- Line 1b - No -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
                </xsl:call-template>
				  <input type="checkbox" alt="Corporation Prepare Income Statement Indicator No" class="styCkbox">
                 <!-- <xsl:call-template name="PopulateCheckbox">-->
                 <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
					<xsl:with-param name="BackupName">CorpPrepIncomeStatementIndNo</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <!--<xsl:call-template name="PopulateLabel">-->
                 <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/CorporationPreparedIncmStmtInd"/>
				  <xsl:with-param name="BackupName">CorpPrepIncomeStatementLabelNo</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>Skip lines 2 through 3b and enter the corporation’s net income (loss) per its books and records on line 4a.
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
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeStatementEndingDt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Line 3a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">3a</div>
            <div class="styLNDesc" style="width:179mm;">Has the corporation’s income statement been restated for the income statement period on line 2?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
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
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
                </xsl:call-template>
                <input type="checkbox" alt="Corporation’s Income Statement Restated Indicator Yes" class="styCkbox">
                 <!-- <xsl:call-template name="PopulateCheckbox">-->
                 <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
					  <xsl:with-param name="BackupName">CorpIncomeStatementRestatedIndYes</xsl:with-param>      
                  </xsl:call-template>
                </input>
              </span>
              <label>
               <!-- <xsl:call-template name="PopulateLabel">-->
                <xsl:call-template name="PopulateLabelYes"> 
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
				  <xsl:with-param name="BackupName">CorpIncomeStatementRestatedLabelYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>If  &#8220;Yes,&#8221; attach an explanation and the amount of each item restated.
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
                <input type="checkbox" alt="Corporation’s Income Statement Restated Indicator No" class="styCkbox">
                <!--  <xsl:call-template name="PopulateCheckbox">-->
                 <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
                   <xsl:with-param name="BackupName">CorpIncomeStatementRestatedIndNo</xsl:with-param>               
                  </xsl:call-template>
                </input>
              </span>
              <label>
               <!-- <xsl:call-template name="PopulateLabel">-->
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorporationIncmStmtRestatedInd"/>
                   <xsl:with-param name="BackupName">CorpIncomeStatementRestatedLabelNo</xsl:with-param> 
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
          </div>
          <!-- Line 3b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">
              <span style="width:1.5mm"/>b</div>
            <div class="styLNDesc" style="width:179mm;height:6mm;">Has the corporation's income statement been restated for any of the five income statement periods immediately preceding
			  the period<br/> on line 2?
            <!-- Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
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
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                </xsl:call-template>
                <input type="checkbox" alt="Corporation's Income Statement Restated 5 Preceding Indicator Yes" class="styCkbox">
                <!--  <xsl:call-template name="PopulateCheckbox">-->
                 <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
					<xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingIndYes</xsl:with-param>   
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <!--<xsl:call-template name="PopulateLabel">-->
               <xsl:call-template name="PopulateLabelYes"> 
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                 <xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingLabelYes</xsl:with-param> 
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">Yes.</span>
              </label>If  &#8220;Yes,&#8221; attach an explanation and the amount of each item restated.
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
                <input type="checkbox" alt="Corporation's Income Statement Restated 5 Preceding Indicator No" class="styCkbox">
                <!--  <xsl:call-template name="PopulateCheckbox">-->
                <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                      <xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingIndNo</xsl:with-param>    
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <!--<xsl:call-template name="PopulateLabel">-->
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/CorpIncmStmtRestated5PrecInd"/>
                     <xsl:with-param name="BackupName">CorpIncmStmtRestated5PrecedingLabelNo</xsl:with-param> 
                </xsl:call-template>
                <span class="styBoldText" style="padding-left:1mm;">No.</span>
              </label>
            </div>
          </div>
          <!-- Line 4a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">4a</div>
				  <div class="styLNDesc" style="width:124mm;">Worldwide consolidated net income (loss) from income statement source identified in Part I, line 1
				  </div>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
			  </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">4a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/WorldwideCnsldtNetIncmLossAmt"/>
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
              <div class="styLNDesc" style="width:138.45mm;padding-top:.5mm;">(1)
               <input type="checkbox" alt="GAAP" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/GAAPInd"/>
                   <xsl:with-param name="BackupName">Form1120SScheduleM3/GAAP</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/GAAPInd"/>
                   <xsl:with-param name="BackupName">Form1120SScheduleM3/GAAP</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">GAAP</span>
                </label>
                <!--Check Box 2 -->
                <span style="width:12mm;"/>(2)
				  <input type="checkbox" alt="IFRS" class="styCkbox">
					  <xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IFRSInd"/>
						  <xsl:with-param name="BackupName">Form1120SScheduleM3/IFRS</xsl:with-param>
					  </xsl:call-template>
                  </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
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
              <div class="styLNDesc" style="width:138.45mm;padding-top:.5mm;">(3)
                <!--NOTE- this check box for Tax-basis is not present on the PDF submit with 
                               work request WSP-08-0870 -->
                <input type="checkbox" alt="Tax-basis" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/TaxBasisInd"/>
               <xsl:with-param name="BackupName">TaxBasis</xsl:with-param>     
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/TaxBasisInd"/>
					<xsl:with-param name="BackupName">TaxBasis</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Tax-basis</span>
                </label>
                <!--Check Box 4 -->
                <span style="width:7mm;"/>(4)
                <input type="checkbox" alt="Other" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/OtherInd"/>
                    <xsl:with-param name="BackupName">Other</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:1.5mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/OtherInd"/>
                      <xsl:with-param name="BackupName">Other</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-left:.5px;">Other (specify)</span>
                  <span style="width:1.5mm;"/>
                  <!-- A straight Line -->
                  <span style="width:67mm;border-bottom:solid 1px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode"
                       select="$Form1120SScheduleM3/OtherInd/@methodOfAccountingOtherDesc"/>
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
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
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
                    <xsl:with-param name="TargetNode" 
                    select="$Form1120SScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/NetIncmNonincludibleFrgnEntAmt"/>
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
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetLossNonincludibleFrgnEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
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
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">6a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncomeNonincludibleUSEntAmt"/>
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
                <span style="float:left;">Net loss from nonincludible U.S. entities
                 (attach statement and enter as a positive amount)
				<!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetLossNonincludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
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
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- Line 7a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">7a</div>
              <div class="styLNDesc" style="width:137mm;">
                <span style="float:left;">Net income (loss) of other  foreign disregarded 
                entities (attach statement)
				<!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncmOthIncludibleFrgnEntAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 7b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">
                <span style="width:1.5mm"/>b</div>
              <div class="styLNDesc" style="width:137mm;">Net income (loss) of other U.S. disregarded entities (except qualified subchapter S subsidiaries) 
                <span style="float:left;">(attach statement)
				<!-- Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">7b</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncomeOthIncludibleUSEntAmt"/>
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
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncmOthQlfySbchptrSbsdrsAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">7c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncmOthQlfySbchptrSbsdrsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
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
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/AdjustmentToEliminateTransAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/AdjustmentToEliminateTransAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
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
                    <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">9</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/AdjRecnclIncmStmtYrToTYAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
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
                    <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/OtherAdjustmentsToReconcileAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">10</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/OtherAdjustmentsToReconcileAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L11 R1 blank -->
          <div style="width:187mm;">
            <div style="float:right;">
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- L11 R2 -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:138mm;height:8mm;">
                <span style="float:left;">
                  <span class="styBoldText">Net income (loss) per income statement of the corporation.
                  </span> Combine lines 4 through 10 </span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
				  <br/>
				  <b>Note: </b>Part I, line 11, must equal Part II, line 26, column (a) or Schedule M-1, line 1. See instructions.
              </div>
            </div>
            <div style="float:right;">
              <div class="styLNRightNumBox">11</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/NetIncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- close float right -->
          </div>
          <!-- L11 Note -->
          <!-- L12 R1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">12</div>
              <div class="styLNDesc" style="width:179mm;">Enter the total amount (not just the corporation’s share) of the assets and liabilities of all entities included or removed on the following lines: 
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
                <div class="styLNAmountBox"  style="width:50mm;text-align:center;border-width:1px;border-right-width:0px;">
                Total Assets
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
                <div class="styLNDesc" style="width:42mm;">Included on Part I, line 4
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/EntIncldWorldwideCnsldtAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/EntIncldWorldwideCnsldtLiabAmt"/>
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
                <div class="styLNDesc" style="width:42mm;">Removed on Part I, line 5
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/EntRmvdNonincludibleFrgnAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/EntRmvdNonincludblFrgnLiabAmt"/>
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
                <div class="styLNDesc" style="width:42mm;">Removed on Part I, line 6
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/EntRmvdNonincludibleUSLiabAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/EntRmvdNonincludibleUSAstAmt"/>
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
                <div class="styLNDesc" style="width:42mm;">Included on Part I, line 7
                  </div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div style="width:137mm;">
                <!--Assets column -->
                <div class="styLNAmountBox" style="width:50mm;border-bottom-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/EntIncldOtherIncludibleAstAmt"/>
                  </xsl:call-template>
                </div>
                <!--Liabilities column -->
                <div class="styLNAmountBox" style="width:50mm;border-right-width:1px;border-bottom-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/EntIncldOtherIncludibleLiabAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- close width -->
            </div>
            <!-- close float right -->
          </div>
          <!--Blank Row -->
          <div class="styTBB" style="width:187mm;border-bottom-width: 2px;height:4mm;"/>
          <!-- Page 1 Footer -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" 
            style="width:95mm;float:left;font-size:6pt;">For Paperwork Reduction Act Notice, see the Instructions for Form 1120S.	</div>
            <div style="width:25mm;float:left;">Cat. No. 39666W</div>
            <div class="styBoldText" style="float:right;">Schedule M-3 (Form 1120S) (Rev. 12-2019)</div>
          </div>
          <p style="page-break-before: always"/>
          <!-- Page 2 -->
          <!-- Page 2 Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:1px">
            <div style="float:left;">Schedule M-3 (Form 1120S) (Rev. 12-2019)</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <!-- Name and EIN  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">Name of corporation<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/BusinessName/BusinessNameLine2Txt"/>
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
          <div style="width:187mm;height:8mm;border-style:solid;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
            <span class="styPartName" style="height:4mm;width:14mm;padding: .25mm 1mm .25mm 1mm;">
            Part II</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of the Corporation With Total Income <br/>
              <span style="width:3mm;"/>(Loss) per Return 
              <span style="padding-left:1mm;font-weight:normal;">
              (see instructions)</span>
            </span>
          </div>
          <!-- Part II Table -->
          <div style="width:187mm;">
          <!-- 05/02/2016 WT: Removed summary= code because JAWS read the summary text --> 
          <table class="styIRS1120ScheduleM3_styTable" id="IRS1120SScheduleM3PartIITable"
            cellspacing="0" cellpadding="0" style="width:187mm;">
          <!--<table class="styIRS1120ScheduleM3_styTable" id="IRS1120SScheduleM3PartIITable"
                 summary="Reconciliation of Net Income (Loss) per Income Statement of the 
                 Corporations With Total Income (loss) per Return " cellspacing="0" cellpadding="0" 
                  style="width:187mm;">-->
            <tr>
              <th class="styIRS1120ScheduleM3TheadCell" scope="col" style="width:6mm;border:none;" />
			  <th class="styIRS1120ScheduleM3TheadCell" scope="col" style="width:81mm; height:auto;text-align:center;font-size:8pt;border:none;" >
				<span style="font-weight:normal">Income (Loss) Items<br/>(Attach statements for lines 1 through 10)
				</span>
				</th>                    
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:31mm;font-weight:normal;">
                <span class="styBoldText">(a)</span>
                <br/> Income (Loss) per<br/> Income Statement</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:25mm;font-weight:normal;">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:25mm;font-weight:normal;">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:25mm;font-weight:normal;">
                <span class="styBoldText">(d)</span>
                <br/> Income (Loss) per<br/> Tax Return</th>
            </tr>
            <!-- Part II - Line 1 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>1</td>
              <td>
              <span style="float:left;padding-left:2mm;">Income (loss) from equity method foreign corporations  </span>             
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp"/>
                </xsl:call-template>               
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/                   IncomeLossEquityMethodFrgnCorp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossEquityMethodFrgnCorp/PermanentDifferenceAmt"/>
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
              <span style="float:left;padding-left:2mm;">Gross foreign dividends not previously taxed
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/
                   TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossFrgnDividendsNotPrevTaxed/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 3 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>3</td>
              <td>
              <span style="float:left;padding-left:2mm;">Subpart F, QEF, and similar income inclusions       
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn"/>
                </xsl:call-template></span>    
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/SubpartFQEFSimilarIncmInclsn/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 4 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>4</td>
              <td>
                <span style="float:left;padding-left:2mm;">Gross foreign distributions previously taxed               
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed"/>
                </xsl:call-template></span> 
                <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossForeignDistriPrevTaxed/PermanentDifferenceAmt"/>
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
                <span style="float:left;padding-left:2mm;">Income (loss) from equity method U.S. corporations              
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossEquityMethodUSCorp/PermanentDifferenceAmt"/>
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
              <td>
              <span style="float:left;padding-left:2mm;">U.S. dividends not eliminated in tax consolidation         
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/USDivNotEliminatedTaxConsol/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 7 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>7</td>
              <td style="white-space:nowrap;">
              <span style="float:left;padding-left:2mm;">Income (loss) from U.S. partnerships                   
			   <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" 
                  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossUSPartnerships"/>
                </xsl:call-template>
              </span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>              
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossUSPartnerships/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 8 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>8</td>
              <td>
              <span style="float:left;padding-left:2mm;">Income (loss) from foreign partnerships             
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships"/>
                </xsl:call-template></span>               
                <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossForeignPartnerships/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 9   -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>9</td>
              <td style="padding-top:.5mm;">
              <span style="float:left;padding-left:2mm;">Income (loss) from other pass-through entities             
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities"/>
                </xsl:call-template></span>                
                <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeLossPassThroughEntities/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 10 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">10</td>
              <td>
              <span style="float:left;padding-left:2mm;padding-right:10px;">
              Items relating to reportable transactions             
               <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/ItemsRelatedReportableTransGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 11 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">11</td>
              <td>
              <span style="float:left;padding-left:2mm;">Interest income (see instructions)
              <!-- form link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp"/>
                </xsl:call-template>
                </span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/InterestIncomeForm8916AGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 12 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">12</td>
              <td>
                <span style="float:left;padding-left:2mm;">Total accrual to cash adjustment</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/TotalAccrualCashAdjustmentGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/TotalAccrualCashAdjustmentGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/TotalAccrualCashAdjustmentGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/TotalAccrualCashAdjustmentGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 13 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">13</td>
              <td>
                 <span style="float:left;padding-left:2mm;">Hedging transactions</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/HedgingTransactions/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/HedgingTransactions/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/HedgingTransactions/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 14 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">14</td>
              <td>
               <span style="float:left;padding-left:2mm;">Mark-to-market income (loss)</span>
               <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" 
                  select="$Form1120SScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/
                  IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/MarkToMarketIncomeLoss/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 15 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">15</td>
              <td>
               <span style="float:left;padding-left:2mm;">Cost of goods sold (see instructions)
			   <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/CostOfGoodsSoldNNGrp"/>
                </xsl:call-template></span>
               <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/CostOfGoodsSoldNNGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/CostOfGoodsSoldNNGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/CostOfGoodsSoldNNGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/CostOfGoodsSoldNNGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 16 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">16</td>
              <td>
				  <span style="float:left;padding-left:2mm;">Sale versus lease (for sellers and/or lessors)</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"     select="$Form1120SScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/SalesVersusLease/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell"  scope="col">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/SalesVersusLease/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/SalesVersusLease/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 17 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">17</td>
              <td>
				  <span style="float:left;padding-left:2mm;">Section 481(a) adjustments</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/Section481aAdjustments/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/Section481aAdjustments/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/Section481aAdjustments/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 18 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">18</td>
              <td>
                  <span style="float:left;padding-left:2mm;">Unearned/deferred revenue</span>
                  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/UnearnedDeferredRevenueGrp/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/UnearnedDeferredRevenueGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/UnearnedDeferredRevenueGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/UnearnedDeferredRevenueGrp/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 19 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">19</td>
              <td>
				  <span style="float:left;padding-left:2mm;">Income recognition from long-term contracts</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"
                   select="$Form1120SScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/
                   IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/IncomeRecognitionLTContracts/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 20 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">20</td>
              <td style="padding-top:.5mm;padding-left:2mm;">Original issue discount and other imputed interest
				  <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>              
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IncomeLossItems/OrigIssueDiscountOthImputedInt/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21a -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">21a</td>
              <td style="padding-top:.5mm;padding-left:2mm;">Income statement gain/loss on sale, exchange, abandonment, worthlessness, or other disposition of assets
                     other than inventory and pass-through entities
                    <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/IncmStmtGainLossAstNotInvntry/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/IncmStmtGainLossAstNotInvntry/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"     select="$Form1120SScheduleM3/IncomeLossItems/IncmStmtGainLossAstNotInvntry/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
            </tr>
            <!-- Part II - Line 21b -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">b</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
                    <span style="float:left;">Gross capital gains from Schedule D, excluding amounts from pass-through entities
						<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
                    </span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossCapitalGainsFromSchD/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21c -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">c</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
				  <span style="float:left;">Gross capital losses from Schedule D, excluding amounts from pass-through entities, abandonment losses, and worthless stock losses
					  <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
				  </span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GrossCapitalLossesFromSchD/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21d -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">d</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
                    <span style="float:left;">Net gain/loss reported on Form 4797, line 17, excluding amounts from pass-through entities, abandonment losses, and worthless stock losses                   
						<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
					</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/GainLossReportedOnForm4797/ IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21e -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">e</td>
             <td style="padding-top:.5mm;padding-left:2mm;">
                 <span style="float:left;">Abandonment losses</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/AbandonmentLosses/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/AbandonmentLosses/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/AbandonmentLosses/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21f -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">f</td>
              <td>
                <span style="float:left;padding-left:2mm;">Worthless stock losses (attach statement)
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/WorthlessStockLosses"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:0px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/WorthlessStockLosses/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/WorthlessStockLosses/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/WorthlessStockLosses/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 21g -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col" style="padding-left:5mm">g</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
                    <span style="float:left;">Other gain/loss on disposition of assets other than inventory          
					<!--<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>-->
					</span>
              </td>  
             <!-- <td style="padding-top:.5mm;padding-left:2mm;">
                 <span style="float:left;padding-right:12px;">
                 Other gain/loss on disposition of assets other than inventory
					<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
                 </span>
              </td>-->
              <td class="styIRS1120SScheduleM3ShadedCell" scope="col" style="border-bottom-width:1px;">
                <span style="width:1mm"/>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthGainLossAssetsNotInventory/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthGainLossAssetsNotInventory/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthGainLossAssetsNotInventory/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 22 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">22</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
              <span style="float:left;">Other income (loss) items with differences (attach </span><br/>
              <span style="float:left;">statement)
            <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OthIncmLossItemsDifferences/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 23 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">23</td>
              <td>
                <span style="padding-top:.5mm;padding-left:2mm;"><b>Total income (loss) items. </b>Combine lines 1 through 22</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/TotalIncomeLossItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/TotalIncomeLossItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/TotalIncomeLossItems/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 24 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">24</td>
              <td>
                <span style="padding-top:.5mm;padding-left:2mm;"><b>Total expense/deduction items </b>(from Part III, line 32)</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/TotalExpenseDeductionItems/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 25 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">25</td>
              <td>
                <span style="font-weight:normal;float:left;padding-left:2mm;">Other items with no differences</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerIncomeStmtAmt"/>
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
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/OtherItemsNoDifferences/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part II - Line 26 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">26</td>
              <td>
                <span style="padding-top:.5mm;padding-left:2mm;"><b>Reconciliation totals. </b>Combine lines 23 through 25</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IncomeLossItems/ReconciliationTotals/
                   IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
               <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IncomeLossItems/ReconciliationTotals/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/ReconciliationTotals/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IncomeLossItems/ReconciliationTotals/IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          </div>
          <br/>
          <br/>
          <div class="styBB" style="width:187mm;padding-left:8mm;padding-top:1mm;border-bottom-width: 2px;">
            <span class="styBoldText">Note:</span> Line 26, column (a), must equal Part I, line 11, and column (d) must equal Form 1120S, Schedule K, line 18.</div>
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120S) (Rev. 12-2019)</div>
          </div>
          <p style="page-break-before: always"/>
          <!-- Page 3 -->
          <!-- Page 3 Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:1px;">
            <div style="float:left;">Schedule M-3 (Form 1120S) (Rev. 12-2019)</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
            </div>
          </div>
          <!-- Name and EIN Line -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name of corporation<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/BusinessName/BusinessNameLine2Txt"/>
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
          <div style="width:187mm;height:8mm;border-style:solid;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;padding-top:0;float:left;">
            <span class="styPartName" 
            style="height:4mm;width:14mm;padding: .25mm .5mm  .25mm .5mm;">Part III</span>
            <span class="styPartDesc" style="width:170mm;">
              <span style="width:2mm;"/>Reconciliation of Net Income (Loss) per Income Statement of the Corporation With Total Income<br/>
              <span style="width:2mm;"/> (Loss) per Return—Expense/Deduction Items 
              <span style="padding-left:1mm;font-weight:normal;">(see instructions)</span>
            </span>
          </div>
          <!-- Part III Table -->
          <div style="width:187mm;">
          <!-- 05/02/2016 WT: Removed summary= code because JAWS read the summary text --> 
          <table class="styTable" id="IRS1120SScheduleM3PartIII"  cellspacing="0" cellpadding="0" 
          style="font-size:7pt;width:187mm;clear:all;">
          <!--<table class="styTable" id="IRS1120SScheduleM3PartIII" summary="Reconciliation of 
                Net Income   (Loss) per Income Statement of Corporation With Total Income (loss) 
                per Return—Expense/Deduction Items (see instructions)" cellspacing="0" 
               cellpadding="0" style="font-size:7pt;width:187mm;clear:all;">-->
            <tr>
              <th scope="col" class="styIRS1120ScheduleM3TheadCell" style="width:6mm;border:none;"/>
              <th scope="col" class="styIRS1120ScheduleM3TheadCell"  style="width:81mm;text-align:center;font-size:8pt;border:none;font-weight:normal;">
               Expense/Deduction Items</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:25mm;font-weight:normal;">
                <span class="styBoldText">(a)</span>
                <br/> Expense per<br/> Income Statement</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:25mm;font-weight:normal;">
                <span class="styBoldText">(b)</span>
                <br/> Temporary<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:25mm;font-weight:normal;">
                <span class="styBoldText">(c)</span>
                <br/> Permanent<br/> Difference</th>
              <th class="styIRS1120SScheduleM3TheadCell" scope="col" style="width:25mm;font-weight:normal;">
                <span class="styBoldText">(d)</span>
                <br/> Deduction per<br/> Tax Return</th>
            </tr>
            <!-- Part III - Line 1 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" style="width:6mm;">
                <span style="width:1.5mm;"/>1</td>
              <td style="width:81mm; text-align:left;border:none;padding-left:2mm;">U.S. current income tax expense
              <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" style="width:25mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" style="width:25mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/
                  TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" style="width:25mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/
                   PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
             <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USCurrentIncomeTaxExpenseGrp/
                   DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 2 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>2</td>
              <td>
				  <span style="float:left;padding-left:2mm;">U.S. deferred income tax expense</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USDeferredIncomeTaxExpense/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USDeferredIncomeTaxExpense/
                   TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/USDeferredIncomeTaxExpense/
                  PermanentDifferenceAmt"/>
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
              <span style="float:left;left;padding-left:2mm;">State and local current income tax expense</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalCurrIncomeTaxExpense/
                  DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 4 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>4</td>
              <td>
				  <span style="float:left;left;padding-left:2mm;">State and local deferred income tax expense</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/
                   TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/StateLocalDefrdIncmTaxExpense/
                  PermanentDifferenceAmt"/>
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
              <td style="padding-top:.5mm;left;padding-left:2mm;">
                 <span style="float:left;">Foreign current income tax expense (other than foreign </span>
                 <span style="float:left;"> withholding taxes)</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"     select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/
                   TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/
                   PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignCurrentIncomeTaxExpense/
                   DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 6 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>6</td>
              <td>
              <span style="float:left;left;padding-left:2mm;">Foreign deferred income tax expense</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignDeferredIncmTaxExpense/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignDeferredIncmTaxExpense/
                   TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ForeignDeferredIncmTaxExpense/
                   PermanentDifferenceAmt"/>
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
              <span style="float:left;left;padding-left:2mm;">Equity-based compensation</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/
                   TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/
                   PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/EquityBasedCompensationGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 8 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>8</td>
              <td>
              <span style="float:left;left;padding-left:2mm;">Meals and entertainment</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/MealsAndEntertainmentGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 9 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">
                <span style="width:1.5mm;"/>9</td>
              <td>
                 <span style="float:left;left;padding-left:2mm;">Fines and penalties </span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/FinesAndPenalties/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 10 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">10</td>
              <td>
                <span style="float:left;left;padding-left:2mm;">Judgments, damages, awards, and similar costs</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/JudgmentsDamagesAwardsSmlrCost/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 11 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">11</td>
              <td>
              <span style="float:left;left;padding-left:2mm;">Pension and profit-sharing</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PensionAndProfitSharing/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 12 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">12</td>
              <td>
				  <span style="float:left;left;padding-left:2mm;">Other post-retirement benefits</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"
                   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/
                   PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" 
                  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherPostRetirementBenefits/
                  DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 13 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">13</td>
              <td>
              <span style="float:left;left;padding-left:2mm;">Deferred compensation</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" 
                  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/
                  TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" 
                  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DeferredCompensation/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 14 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">14</td>
              <td>
                 <span style="float:left;left;padding-left:2mm;"> Charitable contribution of cash and tangible property</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/
                  TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/
                   PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitbleContriCashTngblProp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 15 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">15</td>
              <td>
              <span style="float:left;left;padding-left:2mm;">Charitable contribution of intangible property</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CharitableContriIntangibleProp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 16 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">16</td>
              <td>
              <span style="float:left;padding-left:2mm;">Current year acquisition or
               reorganization investment</span>
              <span style="float:left;padding-left:2mm;">banking fees</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgInvstBankingFees/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 17 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">17</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
                <span style="float:left;">Current year acquisition or reorganization legal and</span>
                <span style="float:left;">accounting fees</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgLegalAcctFees/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 18 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">18</td>
              <td>
                 <span style="float:left;padding-left:2mm;">Current year acquisition/reorganization other costs</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CYAcquisReorgOtherCosts/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 19 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">19</td>
              <td>
				  <span style="float:left;padding-left:2mm;">Amortization/impairment of goodwill</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
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
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortizationImpairmentGoodwill/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortizationImpairmentGoodwill/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 20 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">20</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
                    <span style="float:left;white-space:nowrap;">
                    Amortization of acquisition, reorganization, and start-up costs</span>
                    <span class="styDotLn" style="float:right;padding-right:1mm;"></span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/AmortzAcquisReorgStartupCosts/PermanentDifferenceAmt"/>
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
              <span style="float:left;padding-left:2mm;">Other amortization or impairment write-offs</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherAmortzImpairmentWriteOffs/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 22 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">22</td>
              <td>
				  <span style="float:left;padding-left:2mm;">Reserved</span>
				  <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
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
              <span style="float:left;padding-left:2mm;">Depletion—Oil &#038; Gas</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOilGas/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOilGas/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOilGas/PermanentDifferenceAmt"/>
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
                 <span style="float:left;padding-left:2mm;">Depletion—Other than Oil &#038; Gas</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/ ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/ TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" 
                  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepletionOtherThanOilGas/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 24 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">24</td>
              <td>
                 <span style="float:left;padding-left:2mm;">Depreciation</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
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
             <!--   <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepreciationGrp/DepletionOilGas/TemporaryDifferenceAmt"/>
                </xsl:call-template>-->
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepreciationGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/DepreciationGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 25 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">25</td>
              <td>
              <span style="float:left;padding-left:2mm;">Bad debt expense</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/
                   TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/
                  PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/BadDebtExpnsAgencyBalWrttnOff/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 26 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">26</td>
              <td>
               <span style="float:left;padding-left:2mm;">Interest expense (see instructions) 
			   <!-- form link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/InterestExpenseForm8916AGrp/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 27 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">27</td>
              <td>
                 <span style="float:left;padding-left:2mm;">Corporate owned life insurance premiums</span>
                 <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CorpOwnedLifeInsurancePremiums/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CorpOwnedLifeInsurancePremiums/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/CorpOwnedLifeInsurancePremiums/PermanentDifferenceAmt"/>
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
                 <span style="float:left;padding-left:2mm;">Purchase versus lease (for purchasers and/or lessees)
                 </span>          
                <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/PurchaseVersusLease/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 29 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">29</td>
              <td style="padding-top:.5mm;">
              <span style="float:left;padding-left:2mm;">Research and development costs</span>
              <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"
                   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/
                   ResearchAndDevelopmentCosts/
                   ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ResearchAndDevelopmentCosts/ TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ResearchAndDevelopmentCosts/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/ResearchAndDevelopmentCosts/
                   DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 30 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">30</td>
              <td>
              <span style="float:left;padding-left:2mm;">Section 118 exclusion (attach statement)
                 <!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" 
                  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode"   select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/Section118Exclusion/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 31 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" scope="col">31</td>
              <td style="padding-top:.5mm;padding-left:2mm;">
             <span style="float:left;">Other expense/deduction items with differences  </span>
             <span style="float:left;white-space:nowrap;">(attach statement)
				<!-- Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences"/>
                </xsl:call-template></span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/OtherExpnsDedItemsDifferences/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
            <!-- Part III - Line 32 -->
            <tr>
              <td class="styIRS1120SScheduleM3NumberCell" style="padding-bottom:7mm">32</td>
              <td style="padding-top:.5mm;padding-left:2mm;border-style:solid;border-bottom-width:2px;border-top-width:0px;border-right-width:0px;border-left-width:0px;padding-top:0;">
				  <b>Total expense/deduction items.  </b> Combine lines 1 through 31. Enter here and on Part II, line 24, reporting positive amounts as negative and negative amounts as positive
				  <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>          
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col" style="border-bottom-width: 2px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/ExpensePerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col" style="border-bottom-width: 2px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"  select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/TemporaryDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col" style="border-bottom-width: 2px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/PermanentDifferenceAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS1120SScheduleM3Cell" scope="col" style="border-bottom-width: 2px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode"    select="$Form1120SScheduleM3/IRS1120SSchM3ExpenseDedItems/TotalExpenseDeductionItems/DeductionPerTaxReturnAmt"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          </div>
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="float:right;padding-top:1mm;">Schedule M-3 (Form 1120S) (Rev. 12-2019)</div>
          </div>
          <!-- Left Over Data Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">Additional Data        
			</div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" TabIndex="1" type="button" 
              value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
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