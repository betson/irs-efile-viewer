<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8853Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8853Data" select="$RtnDoc/IRS8853"/>
  <!-- ////////////////////////////////////////////////////////////// (Template:  CreateBox) -->
  <xsl:template name="CreateBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="StaticTextBefore"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="Number"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Width">29mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when><xsl:otherwise>padding-top:6px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:2px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:choose>
        <xsl:when test="$TargetNode">
          <xsl:value-of select="$StaticTextBefore"/>
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
      </xsl:choose>
    </div>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:right;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8853Data)"/>
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
        <meta name="Description" content="IRS Form 8853"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8853Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS8853">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
              <div style="padding-top:1mm;">
                Form<span class="styFormNumber">  8853</span>
              </div>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8853Data"/>
              </xsl:call-template>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
				  <xsl:with-param name="Desc">Header Top Left - MSA Holder Death Indicator</xsl:with-param>
				  <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MSAHolderDeathInd"/>
              </xsl:call-template>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
				  <xsl:with-param name="Desc">Header Top Left - MSA Calculations Explanation Statement Code</xsl:with-param>
				  <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MSACalculationsExplnStmtCd"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service (99)</span>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
              <div class="styMainTitle" style="height:8mm;">
                Archer MSAs and<br/>
                Long-Term Care Insurance Contracts
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold;">
                  <div style="width:100%;height:5mm;padding-left:0px;">
                    <div style="width:110mm;height:5mm;">
                      <br/>
                      <br/>
                      <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040 or Form 1040NR.
                      <span style="width:6px;"/>
                      <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/> 
                      See separate instructions.
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
                <span class="styBoldText" style="font-size:9pt;">39</span>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:89mm;height:11mm;font-weight:normal;font-size:7pt;">
              Name(s) shown on return<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">Name</xsl:with-param>
              </xsl:call-template>
            </div>
            <div style="height:8mm;width:97mm;height:4mm;padding:0px 0px 0px 0px;font-size:7pt;" class="styEINBox">
              <div class="styIRS8853LNDesc" style="width:65%;padding-left:3px;">
                <span class="styNormalText">
                  Social security number of MSA<br/>
                  account holder. If both spouses<br/>
                  have MSAs, see instructions
                  <span style="width:3px;"/>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                </span>
              </div>
              <div class="styIRS8853LNDesc" style="width:35%;padding-left:0px;vertical-align:middle;">
                <span style="font-weight:normal;text-align:center;width:100%;padding-top:3mm;">
                  <xsl:choose>
                    <xsl:when test="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MSAHolderSSN">
                      <xsl:call-template name="PopulateSSN">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MSAHolderSSN"/>
                        <xsl:with-param name="BackupName">Form8853DataMSAHolderSSN</xsl:with-param>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateSSN">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
                        <xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </div>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS8853LineItem" style="font-size:8pt;">
              <b>Section A. Archer MSAs.</b> If you have only a Medicare Advantage MSA, skip Section A and complete Section B.
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part I                                                  -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;height:4mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Archer MSA Contributions and Deductions. <span class="styNormalText">See instructions before completing this part. If<br/>
              you are filing jointly and both you and your spouse have high deductible health plans with self-only coverage,<br/>
              complete a separate Part I for each spouse.</span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (1) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">1</div>
              <div class="styIRS8853LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Total employer contributions to your Archer MSA(s) for 2012
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAEmployerContriAmt"/>
                    <xsl:with-param name="Number">1</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (2) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">2</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Archer MSA contributions you made for 2012, including those made from January 1, 2013,<br/>
                  through April 15, 2013, that were for 2012. Do not include rollovers (see instructions)
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">3.2mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAContributionAmt"/>
                <xsl:with-param name="Number">2</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (3) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">3</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Limitation from the Line 3 Limitation Chart and Worksheet in the instructions
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    .
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAContriLimitationAmt"/>
                <xsl:with-param name="Number">3</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (4) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">4</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Compensation (see instructions) from the employer maintaining the high deductible<br/>
                  health plan. (If self-employed, enter your earned income from the trade or business under which<br/>
                  the high deductible health plan was established.)
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">6mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/HDHPEmployerCompensationAmt"/>
                <xsl:with-param name="Number">4</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (5) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">5</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Archer MSA deduction.</b> Enter the <b>smallest</b> of line 2, 3, or 4 here. Also include this amount on<br/>
                  Form 1040, line 36, or Form 1040NR, line 35. On the dotted line next to Form 1040, line 36, or<br/>
                  Form 1040NR, line 35, enter “MSA” and the amount
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:20px"/>.
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">6mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADeductionAmt"/>
                <xsl:with-param name="Number">5</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Caution:</b>
                  <span class="styItalicText">If line 2 is more than line 5, you may have to pay an additional tax (see instructions).</span>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part II                                                   -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Archer MSA Distributions
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (6a) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">6a</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Total distributions you and your spouse received in 2012 from all Archer MSAs (see instructions)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:10px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TotalArcherMSADistributionAmt"/>
                <xsl:with-param name="Number">6a</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (6b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">b</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Distributions included on line 6a that you rolled over to another Archer MSA or a health savings<br/>
                  account. Also include any excess contributions (and the earnings on those excess contributions)<br/>
                  included on line 6a that were withdrawn by the due date of your return (see instructions)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:10px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">6mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADistriRollOverAmt"/>
                <xsl:with-param name="Number">6b</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (6c) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">c</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Subtract line 6b from line 6a
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSANetDistributionAmt"/>
                <xsl:with-param name="Number">6c</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (7) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">7</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Unreimbursed qualified medical expenses (see instructions)
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    .
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAUnreimbQualMedExpAmt"/>
                <xsl:with-param name="Number">7</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (8) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">8</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Taxable Archer MSA distributions.</b> Subtract line 7 from line 6c. If zero or less, enter -0-. Also<br/>
                  include this amount in the total on Form 1040, line 21, or Form 1040NR, line 21. On the dotted<br/>
                  line next to line 21, enter “MSA” and the amount
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:20px"/>.
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">6mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TaxableArcherMSADistriAmt"/>
                <xsl:with-param name="Number">8</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (9a) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">9a</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  If any of the distributions included on line 8 meet any of the <b>Exceptions to the Additional</b>
                  <br/>
                  <b>20% Tax</b> (see instructions), check here
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
                    <span style="width:6px"/>
                  </span>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                  <span style="width:5px"/>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataArcherMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <input class="styCkbox" type="checkbox" style="width:4mm;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataArcherMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">3.2mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (9b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">b</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Additional 20% tax</b> (see instructions). Enter 20% (.20) of the distributions included<br/>
                  on line 8 that are subject to the additional 20% tax. Also include this amount in the total on Form<br/>
                  1040, line 60, or Form 1040NR, line 59. On the dotted line next to Form 1040, line 60, or Form<br/>
                  1040NR, line 59, enter “MSA” and the amount
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:10px"/>.
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">9mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAAddnlDistriTaxAmt"/>
                <xsl:with-param name="Number">9b</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin SECTION B.                                            -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styIRS8853LNDesc" style="width:21mm;font-size:8pt;padding-left:0px;text-align:center;">
              <b>Section B.</b>
            </div>
            <div class="styPartDesc" style="padding-left:3mm;width:166mm;">
              Medicare Advantage MSA Distributions. <span class="styNormalText">If you are filing jointly and both you and your spouse received
              distributions in 2012 from a Medicare Advantage MSA, complete a separate Section B for each spouse (see
              instructions).</span>
            </div>
          </div>
          <!-- Body -->
          <div class="styTBB" style="width:187mm;">
            <!-- (10) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">10</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Total distributions you received in 2012 from all Medicare Advantage MSAs (see instructions)
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    .
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TotalMedicareMSADistriAmt"/>
                <xsl:with-param name="Number">10</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (11) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">11</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Unreimbursed qualified medical expenses (see instructions)
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    .
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MedicareMSAUnrmbQualMedExpAmt"/>
                <xsl:with-param name="Number">11</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (12) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">12</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Taxable Medicare Advantage MSA distributions.</b> Subtract line 11 from line 10. If zero or less,<br/>
                  enter -0-. Also include this amount in the total on Form 1040, line 21, or Form 1040NR, line 21.<br/>
                  On the dotted line next to line 21, enter “Med MSA” and the amount
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:10px"/>.
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">6mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TaxableMedicareMSADistriAmt"/>
                <xsl:with-param name="Number">12</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (13a) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">13a</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  If any of the distributions included on line 12 meet any of the <b>Exceptions to the Additional</b>
                  <br/>
                  <b>50% Tax</b> (see instructions), check here
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:14px"/>.
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
                    <span style="width:6px"/>
                  </span>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                  <span style="width:5px"/>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MedicareMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataMedicareMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <input class="styCkbox" type="checkbox" style="width:4mm;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MedicareMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataMedicareMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">3.2mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (13b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">b</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Additional 50% tax</b> (see instructions). Enter 50% (.50) of the distributions included on line 12 <br/>
                  that are subject to the additional 50% tax. Also include this amount in the total on Form1040, line 60, <br/>
                  or Form 1040NR, line 59. On the dotted line next to Form 1040, line 60, or Form 1040NR, line 59, <br/>
                  enter “Med MSA” and the amount
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:8px"/>.
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">9mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MedicareMSAAddnlDistriTaxAmt"/>
                <xsl:with-param name="Number">13b</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">
                For Paperwork Reduction Act Notice, see your tax return instructions.
              </span>
            </div>
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">8853</span> (2012)
            </div>
            <div style="float:right;text-align:center;width:26mm;font-size:7pt;">
              Cat. No. 24091H
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">
              Form 8853 (2012)
            </div>
            <div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
            <span style="float:right;width:20mm;"/>
            <div style="float:right;text-align:center;width:40mm;font-size:7pt;">
              Attachment Sequence No. <span class="styBoldText" style="font-size:8pt;">39</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:89mm;height:8mm;font-weight:normal;font-size:7pt;">
              Name of policyholder (as shown on Form 1040)<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsurancePolicyHolderName"/>
              </xsl:call-template>
            </div>
            <div style="height:6mm;width:97mm;height:4mm;padding:0px 0px 0px 0px;font-size:7pt;" class="styEINBox">
              <div class="styIRS8853LNDesc" style="width:65%;padding-left:3px;">
                <span class="styNormalText">
                  Social security number of<br/>
                  policyholder
                  <span style="width:3px;"/>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                </span>
              </div>
              <div class="styIRS8853LNDesc" style="width:35%;padding-left:0px;vertical-align:middle;">
                <span style="font-weight:normal;text-align:center;width:100%;padding-top:3mm;">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsurancePolicyHolderSSN"/>
                  </xsl:call-template>
                </span>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin SECTION C.                                            -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styIRS8853LNDesc" style="width:21mm;font-size:8pt;padding-left:0px;text-align:center;">
              <b>Section C.</b>
            </div>
            <div class="styPartDesc" style="padding-left:3mm;width:166mm;">
              Long-Term Care (LTC) Insurance Contracts. <span class="styNormalText">See</span> Filing Requirements for Section C <span class="styNormalText">in the <br/>
              instructions before completing this section.</span>
            </div>
          </div>
          <!-- Body -->
          <div class="styTBB" style="width:187mm;">
            <!-- /////////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="padding-top:3px;">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:181mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>If more than one Section C is attached, check here</b>
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    .
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
                    <span style="width:6px"/>
                  </span>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                  <span style="width:5px"/>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/Form8853LTCMultipleCopiesInd"/>
                      <xsl:with-param name="BackupName">Form8853DataForm8853LTCMultipleCopiesInd</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <input class="styCkbox" type="checkbox" style="width:4mm;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/Form8853LTCMultipleCopiesInd"/>
                      <xsl:with-param name="BackupName">Form8853DataForm8853LTCMultipleCopiesInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
            </div>
            <!-- (14a-b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox" style="padding-right:0px;">14a</div>
              <div class="styIRS8853LNDesc" style="width:181mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:17%;height:100%;">
                  Name of insured
                  <span style="width:5px"/>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
                <div class="styIRS8853LNDesc" style="width:36%;height:100%;border-color:black;border-style:dotted;border-bottom-width:1px;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredName"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControl">
                    <span style="width:5px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">LTC Insured Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControl"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
                <div class="styIRS8853LNDesc" style="width:31%;height:100%;">
                  <b>b</b>
                  <span style="width:5px;"/>Social security number of insured
                  <span style="width:5px"/>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
                <div class="styIRS8853LNDesc" style="width:16%;height:100%;border-color:black;border-style:dotted;border-bottom-width:1px;text-align:center;padding-left:0px;">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredSSN"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (15) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">15</div>
              <div class="styIRS8853LNDesc" style="width:144mm">
                In 2012, did anyone other than you receive payments on a per diem or other periodic basis under a<br/>
                qualified LTC insurance contract covering the insured or receive accelerated death benefits under a life<br/>
                insurance policy covering the insured?
                <span style="width:1px"/>
                <span class="styBoldText">
                  <xsl:choose>
                    <xsl:when test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd/@referenceDocumentName">
                      <span style="width:11px"/>
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <span style="width:16px"/>.
                    </xsl:otherwise>
                  </xsl:choose>
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
              <div class="styIRS8853LNDesc" style="width:35mm;padding-top:8mm;">
                <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd">
                      <xsl:call-template name="PopulateYesCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuranceOtherPaymentInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <span style="width:1mm;"/>
                <label>
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd">
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                      <xsl:with-param name="BackupName">IRS8853LTCInsuranceOtherPaymentInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styBoldText">Yes</span>
                </label>
                <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                <span style="width:10mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd">
                      <xsl:call-template name="PopulateNoCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuranceOtherPaymentInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <span style="width:1mm;"/>
                <label>
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd">
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                      <xsl:with-param name="BackupName">IRS8853LTCInsuranceOtherPaymentInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styBoldText">No</span>
                </label>
                <br/>
              </div>
            </div>
            <!-- (16) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">16</div>
              <div class="styIRS8853LNDesc" style="width:144mm">
                Was the insured a terminally ill individual?
                <span style="width:1px"/>
                <span class="styBoldText">
                  <span style="width:17px"/>.
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
                <b>Note:</b>
                <span class="styItalicText">If “Yes” and the <b>only</b> payments you received in 2012 were accelerated death benefits that were paid
                to you because the insured was terminally ill, skip lines 17 through 25 and enter -0- on line 26.</span>
              </div>
              <div class="styIRS8853LNDesc" style="width:35mm;padding-top:4px;">
                <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                      <xsl:call-template name="PopulateYesCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <span style="width:1mm;"/>
                <label>
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                      <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styBoldText">Yes</span>
                </label>
                <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                <span style="width:10mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                      <xsl:call-template name="PopulateNoCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <span style="width:1mm;"/>
                <label>
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                      <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styBoldText">No</span>
                </label>
                <br/>
              </div>
            </div>
            <!-- (17) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">17</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Gross LTC payments received on a per diem or other periodic basis. Enter the total of the<br/>
                  amounts from box 1 of all Forms 1099-LTC you received with respect to the insured on which the<br/>
                  “Per diem” box in box 3 is checked
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:3px"/>.
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">2mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">3.2mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCGrossPaymentsReceivedAmt"/>
                <xsl:with-param name="Number">17</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Caution:</b>
                  <span style="width:1mm;"/>
                  <span class="styItalicText">
                  <b>Do not</b> use lines 18 through 26 to figure the taxable amount of benefits paid under an<br/>
                  LTC insurance contract that is not a <b>qualified</b> LTC insurance contract. Instead, if the benefits are<br/>
                  not excludable from your income (for example, if the benefits are not paid for personal injuries or<br/>
                  sickness through accident or health insurance), report the amount not excludable as income on<br/>
                  Form 1040, line 21.</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">17.5mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (18) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">18</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Enter the part of the amount on line 17 that is from <b>qualified</b> LTC insurance contracts
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceQualifiedAmt"/>
                <xsl:with-param name="Number">18</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (19) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">19</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Accelerated death benefits received on a per diem or other periodic basis. Do not include any<br/>
                  amounts you received because the insured was terminally ill (see instructions)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:4px"/>.
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">3.1mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/AcceleratedDeathBenefitRcvdAmt"/>
                <xsl:with-param name="Number">19</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS8853LineItem">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">3.1mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (20) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">20</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Add lines 18 and 19
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/TotalLTCAndDeathBenefitRcvdAmt"/>
                <xsl:with-param name="Number">20</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Note:</b><span style="width:3px;"/><span class="styItalicText">If you checked “Yes” on line 15 above, see <b>Multiple Payees</b> in
                  the instructions before completing lines 21 through 25.</span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (21) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">21</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Multiply $310 by the number of days in the LTC period
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:7px"/>
                  </span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCDaysMultiplyByPerDiemAmt"/>
                    <xsl:with-param name="Number">21</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (22) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">22</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Costs incurred for qualified LTC services provided for the insured<br/>
                  during the LTC period (see instructions)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:10px"/>.
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
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCCostIncurredAmt"/>
                    <xsl:with-param name="Number">22</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (23) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">23</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Enter the <b>larger</b> of line 21 or line 22
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                    <span style="width:7px"/>
                  </span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LargerCalcOrActualLTCCostsAmt"/>
                    <xsl:with-param name="Number">23</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (24) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">24</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Reimbursements for qualified LTC services provided for the insured<br/>
                  during the LTC period
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:17px"/>.
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
                    <span style="width:7px"/>
                  </span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCReimbursementAmt"/>
                    <xsl:with-param name="Number">24</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Caution:</b><span style="width:5px;"/><span class="styItalicText">If you received any reimbursements from LTC contracts<br/>
                  issued before August 1, 1996, see instructions.</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">12mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (25) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">25</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Per diem limitation. Subtract line 24 from line 23
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCPerDiemLimitationAmt"/>
                <xsl:with-param name="Number">25</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (26) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem">
              <div class="styIRS8853LNLeftNumBox">26</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Taxable payments.</b> Subtract line 25 from line 20. If zero or less, enter -0-. Also include this<br/>
                  amount in the total on Form 1040, line 21. On the dotted line next to line 21, enter “LTC” and the<br/>
                  <span style="float:left;clear:none;padding-right:0px;">amount</span>
                  <!--Dotted Line-->
                  <span class="styBoldText" style="text-align:right;float:right;padding:0px 3mm 0px 0px;">
                    .
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
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">7mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCTaxablePaymentsAmt"/>
                <xsl:with-param name="Number">26</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:20px;"/>
              Form<span class="styBoldText" style="font-size:7pt;"> 8853 </span>(2012)
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
              <xsl:with-param name="TargetNode" select="$Form8853Data"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
				  <xsl:with-param name="Desc">Header Top Left - MSA Holder Death Indicator</xsl:with-param>
				  <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MSAHolderDeathInd"/>
				  <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
				  <xsl:with-param name="Desc">Header Top Left - MSA Calculations Explanation Statement Code</xsl:with-param>
				  <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MSACalculationsExplnStmtCd"/>
				  <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControl">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part II, Section C., Line 14a - LTC Insured Name Control</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControl"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:if>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
