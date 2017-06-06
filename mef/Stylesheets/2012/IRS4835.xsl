<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS4835Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form4835Data" select="$RtnDoc/IRS4835"/>
  <!-- ////////////////////////////////////////////////////////////// (Template:  CreateBox) -->
  <xsl:template name="CreateBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="StaticText"/>
    <xsl:param name="Number"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Width">29mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:choose>
        <xsl:when test="$TargetNode">
          <xsl:choose>
            <xsl:when test="$PopulateAsText">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="$TargetNode/@referenceDocumentId">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:when>
        <xsl:when test="$StaticText">
          <xsl:value-of select="$StaticText"/>
        </xsl:when>
      </xsl:choose>
    </div>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:right;
        padding:2px 0px 0px 0px;
        border-right-width:0px;font-size:8pt;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template:  GenerateEmptyItems) -->
  <xsl:template name="GenerateEmptyItems">
    <xsl:param name="Number"/>
    <xsl:param name="MaxCount"/>
  
	
    <xsl:if test="$Number and ($Number &lt;= $MaxCount)">
      <xsl:choose>
        <xsl:when test="$Number = $MaxCount">
          <xsl:call-template name="CreateOtherExpensesItem">
            <xsl:with-param name="Letter">
              <xsl:number value="$Number" format="a"/>
            </xsl:with-param>
            <xsl:with-param name="Style">border-bottom-width:0px;</xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="CreateOtherExpensesItem">
            <xsl:with-param name="Letter">
              <xsl:number value="$Number" format="a"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:call-template name="GenerateEmptyItems">
        <xsl:with-param name="Number" select="$Number + 1"/>
        <xsl:with-param name="MaxCount" select="$MaxCount"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- ////////////////////////////////////////////////////////////// (Template:  CreateOtherExpensesItem) -->
  <xsl:template name="CreateOtherExpensesItem">
    <xsl:param name="TargetNode"/>
    <xsl:param name="Style"/>
    <xsl:param name="Letter"/>
    <div class="styIRS4835LineItem">
      <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">
        <xsl:value-of select="$Letter"/>
        
      </div>
      <div class="styIRS4835LNDesc" style="width:47mm;height:3.9mm;">
        <span style="width:43mm;height:3.9mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
		  <xsl:if test="($Letter = 'g') and $Form4835Data/Section263AIndicatorCd">
              <span style="width:4px;"/>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Part II - Line 30 (g) - Section 263A Indicator Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form4835Data/Section263AIndicatorCd"/>
              </xsl:call-template>
          </xsl:if>
          <xsl:if test="$TargetNode">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$TargetNode/Description"/>
            </xsl:call-template>
            
          </xsl:if>
        </span>
      </div>
      <div class="styIRS4835CleanDiv" style="width:37mm;height:3.9mm;padding:0px 0px 0px 0px;float:right;">
        <div class="styIRS4835CleanDiv" style="width:100%;height:3.9mm;float:right;">
          <xsl:choose>
            <xsl:when test="$TargetNode">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Number">
                  <xsl:value-of select="concat('30', $Letter)"/>
                </xsl:with-param>
                <xsl:with-param name="TargetNode" select="$TargetNode/Amount"/>
                <xsl:with-param name="AmountBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Number">
                  <xsl:value-of select="concat('30', $Letter)"/>
                </xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">
                  <xsl:value-of select="$Style"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form4835Data)"/>
          </xsl:call-template>
        </title>
        <!--  No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 4835"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS4835Style"/>
            <xsl:call-template name="AddOnStyle"/>
         </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS4835" style="font-family:arial;">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
              <div style="padding-top:1mm;">
                Form<span class="styFormNumber">  4835</span>
              </div>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form4835Data"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service (99)</span>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
              <div class="styMainTitle" style="height:8mm;">
                Farm Rental Income and Expenses
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold;">
                  <div style="width:100%;height:5mm;padding-left:5px;">
                    <div style="width:100%;height:auto;">
                      <b>(Crop and Livestock Shares (Not Cash) Received by Landowner (or Sub-Lessor))<br/>
                      (Income not subject to self-employment tax)
                      <br/>
                        <br/>
                        <img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040 or Form 1040NR.
                      <span style="width:20mm;"/>
                        <img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet"/> 
                      See instructions.</b>
                    </div>
                  </div>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;border-left-width:2px;">
              <div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
              <div class="styTY">20<span class="styTYColor">12</span>
              </div>
              <div style="margin-left:3mm;text-align:left;font-size:7pt;">
                Attachment<br/>Sequence No. 
                <span class="styBoldText" style="font-size:9pt;">37</span>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;height:16mm;">
            <div class="styNameBox" style="width:137mm;height:100%;font-weight:normal;font-size:7pt;">
              Name(s) shown on tax return<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">Name</xsl:with-param>
              </xsl:call-template>
            </div>
            <div style="width:50mm;height:50%;padding:0px 0px 0px 2mm;font-size:7pt;border-width:0px 0px 1px 0px;border-color:black;border-style:solid;" class="styEINBox">
              Your social security number
              <br/>
              <span style="font-weight:normal;text-align:center;width:100%;padding-top:2px;">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
                  <xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            <div style="width:50mm;height:50%;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
              Employer ID number (EIN), if any
              <br/>
              <span style="font-weight:normal;text-align:center;width:100%;padding-top:2px;">
                <xsl:choose>
                  <xsl:when test="$Form4835Data/EIN">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form4835Data/EIN"/>
                      <xsl:with-param name="BackupName">IRS4835EIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <!-- (A) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem">
              <div class="styIRS4835LNLeftNumBox" style="text-align:left;padding-left:3px;">A</div>
              <div class="styIRS4835CleanDiv" style="width:153mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Did you actively participate in the operation of this farm during 2012 (see instructions)?
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:28mm;height:100%;padding:3px 0px 0px 0px;float:right;">
                <span style="width:7px;"/>
                <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/MateriallyParticipateIndicator"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form4835Data/MateriallyParticipateIndicator"/>
                      <xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:4px;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/MateriallyParticipateIndicator"/>
                    <xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
                  </xsl:call-template>
                  Yes
                </label>
                <span style="width:6mm;"/>
                <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/MateriallyParticipateIndicator"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form4835Data/MateriallyParticipateIndicator"/>
                      <xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:4px;"/>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/MateriallyParticipateIndicator"/>
                    <xsl:with-param name="BackupName">IRS4835MateriallyParticipateIndicator</xsl:with-param>
                  </xsl:call-template>
                  No
                </label>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part I                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
            <!-- Content -->
            <div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;">
              <div class="styPartName" style="width:15mm;">Part I</div>
              <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
                Gross Farm Rental Income<img src="{$ImagePath}/4835_Short_Line.gif" alt="Short Line"/>Based on Production.
                <span class="styNormalText"> Include amounts converted to cash or the equivalent.</span>
              </div>
            </div>
          </div>
          <!-- Body -->
            <!-- (1) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox">1</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Income from production of livestock, produce, grains, and other crops
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">1</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/LivestockAndCropIncomeAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (2a) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:113mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">2a</div>
              <div class="styIRS4835LNDesc" style="width:auto;height:auto;">
                Cooperative distributions (Form(s) 1099-PATR)
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">2a</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CooperativeDistributions"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (2b) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:74mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">2b</div>
              <div class="styIRS4835LNDesc" style="width:auto;height:auto;">
                Taxable amount
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">2b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CooperativeDistriTxblAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (3a) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:113mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">3a</div>
              <div class="styIRS4835LNDesc" style="width:auto;height:auto;font-family:Arial;">
                Agricultural program payments (see instructions)
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">3a</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/AgriculturalProgramPayments"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (3b) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:74mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">3b</div>
              <div class="styIRS4835LNDesc" style="width:auto;height:auto;">
                Taxable amount
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">3b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/AgriculturalProgramPymtTxblAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (4) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox">4</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Commodity Credit Corporation (CCC) loans (see instructions):
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (4a) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">a</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    CCC loans reported under election
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">4a</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CCCLoansReportedUnderElection"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (4b) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:113mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">b</div>
              <div class="styIRS4835CleanDiv" style="width:67mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    CCC loans forfeited
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">4b</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CCCLoansForfeited"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (4c) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:74mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">4c</div>
              <div class="styIRS4835LNDesc" style="width:auto;height:auto;">
                Taxable amount
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">4c</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CCCLoansForfeitedTaxableAmount"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (5) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox">5</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Crop insurance proceeds and federal crop disaster payments (see instructions):
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (5a) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:113mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">a</div>
              <div class="styIRS4835CleanDiv" style="width:67mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Amount received in 2012
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 5mm 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">5a</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-right-width:1px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CropInsProceedsAndDisasterPymt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (5b) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:74mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">5b</div>
              <div class="styIRS4835LNDesc" style="width:auto;height:auto;">
                Taxable amount
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">5b</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CropInsProcAndDsstrPymtTxblAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div class="styGenericDiv" style="width:187mm">
            <!-- (5c) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:100mm;float:left;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">c</div>
              <div class="styIRS4835LNDesc" style="width:94mm;height:auto;">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/ElectionToDeferCropInsProc"/>
                    <xsl:with-param name="BackupName">IRS4835ElectionToDeferCropInsProc</xsl:with-param>
                  </xsl:call-template>
                  If election to defer to 2013 is attached, check here
                  <span style="width:4px;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/ElectionToDeferCropInsProc"/>
                  </xsl:call-template>
                  <span style="width:4px;"/>
                  <img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet"/>
                  <span style="width:5px;"/>
                </label>
                <input class="styCkbox" type="checkbox" style="width:4mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/ElectionToDeferCropInsProc"/>
                    <xsl:with-param name="BackupName">IRS4835ElectionToDeferCropInsProc</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>
            <!-- (5d) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:87mm;float:right;">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">5d</div>
              <div class="styIRS4835LNDesc" style="width:auto;height:auto;">
                Amount deferred from 2011
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">5d</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/CropInsProcDeferredFromPrevTY"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            </div>
            <!-- (6) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox">6</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Other income, including federal and state gasoline or fuel tax credit or refund (see instructions)
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">6</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/OtherIncmIncludingGasFuelTaxCr"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (7) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm;border-bottom:1px solid black">
              <div class="styIRS4835LNLeftNumBox">7</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Gross farm rental income. Add amounts in the right column for lines 1 through 6. Enter the<br/>
                    total here and on Schedule E (Form 1040), line 42.
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">7</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/GrossFarmRentalIncomeAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part II                                                 -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
            <!-- Content -->
            <div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;">
              <div class="styPartName" style="width:15mm;">Part II</div>
              <div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
                Expenses<img src="{$ImagePath}/4835_Short_Line.gif" alt="Short Line"/>Farm Rental Property.
                <span class="styNormalText">Do not include personal or living expenses.</span>
              </div>
            </div>
          </div>
          <!-- Body -->
            <div class="styGenericDiv" style="width:93.5mm;height:100%;border-right:1px black solid;">
              <!-- (8) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">8</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      <span style="font-family:arial narrow;">
                      Car and truck expenses (see<br/>
                      Schedule F (Form 1040)<br/>
                      instructions). Also attach <b>Form 4562</b>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:8mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">8</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/CarAndTruckExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (9) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">9</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Chemicals
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">9</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/ChemicalsExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (10) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">10</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Conservation expenses (see<br/>
                      instructions)
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:17px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">10</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/ConservationExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (11) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">11</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Custom hire (machine work)
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">11</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/CustomHireExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (12) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">12</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Depreciation and section 179<br/>
                      expense deduction not<br/>
                      claimed elsewhere
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:20px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:8mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">12</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/DeprecAndSect179ExpnsDeduction"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (13) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">13</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Employee benefit programs other<br/>
                      than on line 21 (see Schedule F<br/>
                      (Form 1040) instructions)
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:6px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:8mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">13</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/EmployeeBenefitProgramExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (14) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">14</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Feed
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">14</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/FeedPurchasedExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (15) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">15</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Fertilizers and lime
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">15</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/FertilizerAndLimeExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (16) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">16</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Freight and trucking
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">16</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/FreightAndTruckingExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (17) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">17</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Gasoline, fuel, and oil
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">17</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/GasolineFuelAndOilExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (18) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">18</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Insurance (other than health)
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">18</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/InsuranceExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (19) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">19</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Interest:
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (19a) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">a</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Mortgage (paid to banks, etc.)
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">19a</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/MortgageInterestExpenseAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (19b) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">b</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Other
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Part II - Line 19b - Attachment Indicator Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$Form4835Data/OtherInterestExpenses/@attachmentIndicatorCd"/>
                      </xsl:call-template>
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">19b</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/OtherInterestExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (20) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">20</div>
                <div class="styIRS4835CleanDiv" style="width:50mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Labor hired (less employment<br/>
                      credits) (see Schedule F (Form<br/>
                      1040) instructions)
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:4px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:8mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding-top:2mm</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding-top:2mm</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">20</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/LaborHiredExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <div class="styIRS4835LineItem">
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv">
                    <xsl:attribute name="style">
                      width:100%;float:right;
                      <xsl:variable name="cnt" select="count($Form4835Data/OtherExpense)"/><xsl:choose><xsl:when test="($Print != $Separated) and ($cnt &gt;7)">height:<xsl:value-of select="5.25+($cnt - 7)*5"/>mm;border-top-width:1px;</xsl:when><xsl:otherwise>height:4mm;</xsl:otherwise></xsl:choose>
                    </xsl:attribute>
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
            </div>
            <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
            <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
            <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
            <div class="styGenericDiv" style="width:93.5mm;height:100%;">
              <!-- (21) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">21</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Pension and profitsharing<br/>
                      plans
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:7px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">21</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/PensionAndPrftSharingExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (22) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">22</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Rent or lease:
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (22a) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">a</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Vehicles, machinery, and<br/>
                      equipment (see<br/>
                      instructions)
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:8px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:8mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">22a</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/VehMachAndEquipRentLeaseExpnss"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (22b) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">b</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Other (land, animals, etc.)
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">22b</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/OtherRentOrLeaseExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (23) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">23</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Repairs and maintenance
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">23</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/RepairsAndMaintenanceExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (24) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">24</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Seeds and plants
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">24</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/SeedsAndPlantsExpnss"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (25) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">25</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Storage and warehousing
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">25</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/StorageAndWarehousingExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (26) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">26</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Supplies
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">26</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/SuppliesExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (27) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">27</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Taxes
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">27</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/TaxesExpense"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (28) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">28</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Utilities
                    </div>
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 8px 0px 0px;">
                      <!--Dotted Line-->
                      <span class="styBoldText">.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">28</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/UtilitiesExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (29) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">29</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Veterinary, breeding,<br/>
                      and medicine
                      <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:5px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                        <span style="width:11px"/>.
                      </span>
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">100%</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    </xsl:call-template>
                  </div>
                  <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Number">29</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form4835Data/VtrnryBreedingMedicineExpenses"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (30) ////////////////////////////////////////////////////-->
              <div class="styIRS4835LineItem">
                <div class="styIRS4835LNLeftNumBox">30</div>
                <div class="styIRS4835CleanDiv" style="width:47mm;height:auto;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                    <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                      Other expenses<br/>
                      (specify):
                    </div>
                  </div>
                </div>
                <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                  <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:right;">
                    <xsl:call-template name="CreateBox">
                      <xsl:with-param name="Height">9mm</xsl:with-param>
                      <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                      <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- (30a-g) ////////////////////////////////////////////////////-->
              <xsl:variable name="NumberOfOtherExpenseGrp" select="count($Form4835Data/OtherExpense)"/>
              <xsl:choose>
				<xsl:when test="($Print != $Separated) or ($NumberOfOtherExpenseGrp &lt;= 7)">
				  <xsl:for-each select="$Form4835Data/OtherExpense">
					<xsl:variable name="Letter">
					  <xsl:number format="a"/>
					</xsl:variable>
					<xsl:choose>
					  <xsl:when test="(position() = last()) and ($NumberOfOtherExpenseGrp &gt;=7)">
						<xsl:call-template name="CreateOtherExpensesItem">
						  <xsl:with-param name="TargetNode" select="."/>
						  <xsl:with-param name="Letter">
							<xsl:value-of select="$Letter"/>
						  </xsl:with-param>
						  <xsl:with-param name="Style">border-bottom-width:0px;height:6.2mm;</xsl:with-param>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:call-template name="CreateOtherExpensesItem">
						  <xsl:with-param name="TargetNode" select="."/>
						  <xsl:with-param name="Letter">
							<xsl:value-of select="$Letter"/>
						  </xsl:with-param>
						</xsl:call-template>
					  </xsl:otherwise>
					</xsl:choose>
				  </xsl:for-each>
				  <xsl:if test="$NumberOfOtherExpenseGrp &lt;7">
					<xsl:call-template name="GenerateEmptyItems">
					  <xsl:with-param name="Number" select="$NumberOfOtherExpenseGrp + 1"/>
					  <xsl:with-param name="MaxCount" select="7"/>
					</xsl:call-template>
				  </xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<div class="styIRS4835LineItem">
					  <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">
						a
					  </div>
					  <div class="styIRS4835LNDesc" style="width:47mm;height:5mm;">
						<span style="width:43mm;height:4mm;border-style:dashed;border-color:black;border-width:0px 0px 1px 0px;">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
							  <xsl:with-param name="TargetNode" select="$Form4835Data/OtherExpense"/>
							</xsl:call-template>
						</span>
					  </div>
					  <div class="styIRS4835CleanDiv" style="width:37mm;height:5mm;padding:0px 0px 0px 0px;float:right;">
						<div class="styIRS4835CleanDiv" style="width:100%;height:5mm;float:right;">
						  <xsl:call-template name="CreateBox">
							<xsl:with-param name="Number">
							  <xsl:value-of select="concat('30', 'a')"/>
							</xsl:with-param>
						  </xsl:call-template>
						</div>
					  </div>
					</div>
					<xsl:call-template name="GenerateEmptyItems">
						<xsl:with-param name="Number">2</xsl:with-param>
						<xsl:with-param name="MaxCount">7</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			  </xsl:choose>
            </div>
            <!-- (31) ////////////////////////////////////////////////////-->
			<div class="styIRS4835LineItem" style="width:187mm;border-top:1px solid black;">
              <div class="styIRS4835LNLeftNumBox">31</div>
              <div class="styIRS4835CleanDiv" style="width:auto;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:82mm;height:100%;">
                    <b>Total expenses.</b> Add lines 8 through 30g (see instructions)
                  </div>
                  <div class="styIRS4835LNDesc" style="width:62mm;height:100%;text-align:right;padding:0px 10mm 0px 0px;">
					<!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:5px"/>
                      <img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet" style="10px"/> 
                    </span>
                  </div>
                </div>
				<!--<div class="styIRS4835LNDesc" style="width:0px;"/>-->
				<div class="styIRS4835CleanDiv" style="width:37mm;height:100%;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">31</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/TotalExpenses"/>
                  </xsl:call-template>
                </div>
			  </div>
            </div>
			
			
			
			
			

<!--
            <div class="styIRS4835LineItem" style="width:187mm;border-top:1px solid black;float:none;clear:both">
              <div class="styIRS4835LNLeftNumBox">31</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    <b>Total expenses.</b> Add lines 8 through 30g (see instructions)
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10mm 0px 0px;clear:both">
-->
					<!--Dotted Line-->
<!--
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:5px"/>
                      <img src="{$ImagePath}/4835_Bullet_Sm.gif" alt="SmallBullet" style="9px"/> 
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:none;clear:both">
                <div class="styIRS4835CleanDiv" style="width:100%;height:100%;float:center;clear:both">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">31</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/TotalExpenses"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
-->
            <!-- (32) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox">32</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    <b>Net farm rental income or (loss).</b> Subtract line 31 from line 7. If the result is income, enter it<br/>
                    here and on Schedule E (Form 1040), line 40. If the result is a loss, you <b>must</b> go to lines 33 and 34
                    <xsl:if test="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd">
                      <span style="width:4px;"/>
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Part II - Line 32 - Passive Activity Loss Literal Code</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd"/>
                      </xsl:call-template>
                    </xsl:if>
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:5px"/>.
                      <xsl:if test="not($Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd)">
                        <span style="width:11px"/>.
                      </xsl:if>
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:4mm;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">32</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/NetFarmRentalIncomeOrLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Line 33 -->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox">33</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    Did you receive a subsidy in 2012? (See instructions)
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styLNRightNumBox" style="font-size:8pt;padding:3px 0px 0px 0px;height:5mm;width:8.3mm;border-right:1px solid black">33</div>
              <div class="styIRS4835CleanDiv" style="width:28.5mm;height:100%;padding-left:3mm;padding-top:1mm;padding-bottom:0;border-bottom:1px solid black">
                <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                <span>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
                      <xsl:with-param name="BackupName">IRS4835SubsidyReceivedInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:4px;"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
                    <xsl:with-param name="BackupName">IRS4835SubsidyReceivedInd</xsl:with-param>
                  </xsl:call-template>
                  Yes
                </label>
                <span style="width:2mm;"/>
                <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                <span>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
                      <xsl:with-param name="BackupName">IRS4835SubsidyIndicator</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:4px;"/>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form4835Data/SubsidyReceivedInd"/>
                    <xsl:with-param name="BackupName">IRS4835SubsidyIndicator</xsl:with-param>
                  </xsl:call-template>
                  No
                </label>
              </div>
              
            </div>
            <!-- (34a-34b) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm">
              <div class="styIRS4835LNLeftNumBox">34</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    If line 32 is a loss, check the box that describes your investment in this activity<br/>
                    (see instructions)
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:13px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3px 0px 0px;">
                    <img src="{$ImagePath}/4835_Bracket_Sm.gif" alt="SmallBullet"/> 
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:50%;float:right;">
                  <div class="styLNAmountBox" style="width:29mm;height:5mm;border-right-width:0px;border-left-width:0px;float:right;text-align:left;padding-right:0px;font-size:8.5pt;border-bottom-width:0px;">
                      <input type="checkbox" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form4835Data/AllInvestmentIsAtRisk"/>
                          <xsl:with-param name="BackupName">IRS4835AllInvestmentIsAtRisk</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form4835Data/AllInvestmentIsAtRisk"/>
                        <xsl:with-param name="BackupName">IRS4835AllInvestmentIsAtRisk</xsl:with-param>
                      </xsl:call-template>
                      <span style="font-size:6pt;font-family:arial narrow;">All investment is at risk.</span>
                    </label>
                  </div>
                  <div class="styLNRightNumBox" style="font-size:8pt;float:right;padding:3px 0px 0px 0px;border-right-width:0px;height:5mm;border-left-width:0px;border-bottom-width:0px;">34a</div>                
                </div>
                <div class="styIRS4835CleanDiv" style="width:100%;height:50%;float:right;">
                  <div class="styLNAmountBox" style="width:29mm;height:100%;border-right-width:0px;border-left-width:0px;float:right;text-align:left;padding-right:0px;font-size:8.5pt;">
                      <input type="checkbox" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form4835Data/SomeInvestmentIsNotAtRisk"/>
                          <xsl:with-param name="BackupName">IRS4835SomeInvestmentIsNotAtRisk</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form4835Data/SomeInvestmentIsNotAtRisk"/>
                        <xsl:with-param name="BackupName">IRS4835SomeInvestmentIsNotAtRisk</xsl:with-param>
                      </xsl:call-template>
                      <span style="font-size:6pt;font-family:arial narrow;">Some investment is not at risk.</span>
                    </label>
                  </div>
                  <div class="styLNRightNumBox" style="font-size:8pt;float:right;padding:3px 0px 0px 0px;border-right-width:0px;height:100%;border-left-width:0px;">34b</div>               
                </div>
              </div>
            </div>
            <!-- (34c) ////////////////////////////////////////////////////-->
            <div class="styIRS4835LineItem" style="width:187mm;border-bottom:1px solid black">
              <div class="styIRS4835LNLeftNumBox" style="padding-right:0px;">c</div>
              <div class="styIRS4835CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
                <div class="styIRS4835LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS4835LNDesc" style="width:auto;height:100%;">
                    You may have to complete <b>Form 8582</b> to determine your deductible loss, regardless of which<br/>
                    box you checked (see instructions). If you checked box 34b, you <b>must</b> complete <b>Form 6198</b><br/>
                    before going to Form 8582. In either case, enter the deductible loss here and on Schedule E<br/>
                    (Form 1040), line 40
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:19px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS4835CleanDiv" style="width:37mm;height:100%;padding:0px 0px 0px 0px;float:right;">
                <div class="styIRS4835CleanDiv" style="width:100%;height:12mm;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS4835CleanDiv" style="width:100%;height:auto;float:right;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Number">34c</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form4835Data/FarmRentalDeductibleLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;clear:both;">
 			<div style="float:left;">
				<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
				<span style="width:13mm;"/>                        
				Cat. No. 13117W
			</div>
			<div style="float:right;">
				<span style="width:40px;"/>  
				Form <span class="styBoldText" style="font-size:8pt;">4835</span> (2012)
			</div>
          </div>
          <!-- END Page Break and Footer-->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <xsl:variable name="TableWidth">100</xsl:variable>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form4835Data"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Part II - Line 19b - Attachment Indicator Code</xsl:with-param>
				<xsl:with-param name="DescWidth" select="$TableWidth"/>
				<xsl:with-param name="TargetNode" select="$Form4835Data/OtherInterestExpenses/@attachmentIndicatorCd"/>
            </xsl:call-template>
            <xsl:if test="$Form4835Data/Section263AIndicatorCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part II - Line 30 (g) - Section 263A Indicator Code</xsl:with-param>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
                <xsl:with-param name="TargetNode" select="$Form4835Data/Section263AIndicatorCd"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part II - Line 32 - Passive Activity Loss Literal Code</xsl:with-param>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
                <xsl:with-param name="TargetNode" select="$Form4835Data/NetFarmRentalIncomeOrLossAmt/@passiveActivityLossLiteralCd"/>
              </xsl:call-template>
            </xsl:if>
          </table>
          <xsl:if test="($Print = $Separated) and (count($Form4835Data/OtherExpense) &gt; 7)">
			<span class="styRepeatingDataTitle">Form 4835, Line 30 -  Other Expense</span>
				<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:100mm;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:10%;">
								Letter
							</th>
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:55%;">
								Description
							</th>
							<th class="styDepTblCell" scope="col" rowspan="2" style="width:35%;">
								Amount
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$Form4835Data/OtherExpense">
							<xsl:variable name="Letter">
								<xsl:number format="a"/>
							</xsl:variable>
							<tr style="border-color:black;height:6mm;">
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<td class="styTableCellText" style="width:10%;text-align:center;">
									<xsl:value-of select="$Letter"/>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellText" style="width:55%;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Description"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellText" style="width:35%;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Amount"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
