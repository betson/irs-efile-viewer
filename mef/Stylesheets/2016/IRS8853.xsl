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
    <xsl:param name="Height">4mm</xsl:param>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        padding:.75mm 0mm .25mm 0mm;
        border-right-width:0px;
        height:4mm;<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
        <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>  
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:4mm;<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
        <xsl:choose>
			<xsl:when test="$TargetNode">
				<xsl:choose>
					<xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when>
					<xsl:otherwise>padding-top:3px;</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>padding-top:2px;</xsl:otherwise>
			</xsl:choose><xsl:if test="$AmountBoxStyle">
			<xsl:value-of select="$AmountBoxStyle"/>
			</xsl:if>
	  </xsl:attribute>
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
        </xsl:when>
      </xsl:choose>
    </div>
  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
      <body class="styBodyClass" style="width:187mm;">
        <form name="IRS8853">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styFNBox" style="width:28mm;height:21mm;border-right-width:1.5px;">
              <div style="padding-top:1mm;">
                Form<span class="styFormNumber" style="padding-left:2mm;">  8853</span><br/>
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
			<div class="styAgency" style="padding-top:2mm;padding-bottom:0mm;">
					Department of the Treasury<br/>
					Internal Revenue Service (99)
			</div>   
            </div>
            <div class="styFTBox" style="width:128mm;height:21mm;">
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
                      <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Information about Form 8853 and its separate instructions is available at <br/>
					  <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8853" title="Link to IRS.gov"><i>www.irs.gov/form8853.</i></a><br/>
                      <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040 or Form 1040NR.                      
                    </div>
                  </div>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:31mm;height:21mm;border-left-width:1.5px;">
              <div class="styOMB" style="width:31mm;height:4mm;padding-top:0mm;border-bottom:1 solid black;font:7pt;">OMB No. 1545-0074</div>
              <div class="styTaxYear">20<span class="styTYColor">16</span></div>
			  <div class="stySequence" style="padding-left:2mm;padding-bottom:.5mm;"> Attachment<br/>Sequence No. <b style="font-size:9pt;">39</b>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;border-bottom-width:.39mm;">
            <div class="styNameBox" style="width:89mm;height:10mm;font-weight:normal;font-size:7pt;">
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
              <div class="styIRS8853LNDesc" style="width:35%;padding-left:0px;">
                <span style="font-weight:normal;width:100%;padding-top:6mm;">
                  <xsl:choose>
                    <xsl:when test="normalize-space($Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MSAHolderSSN) !=''">
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
            <div class="styIRS8853LineItem" style="height:4mm;font-size:8pt;padding-top:.25mm;">
              <b>Section A.<span style="padding-left:2mm;">Archer MSAs.</span></b> If you have only a Medicare Advantage MSA, skip Section A and complete Section B.
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part I                                                  -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;height:11mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:12mm;height:4mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:4mm;font-weight:normal;">
              <b>Archer MSA Contributions and Deductions.</b> See instructions before completing this part. If you are filing jointly and both you and your spouse have 
              high deductible health plans with self-only coverage, complete a separate Part I for each spouse.
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (Line 1) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">1</div>
              <div class="styIRS8853LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:4mm;">
                  Total employer contributions to your Archer MSA(s) for 2016
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:4mm;padding:0mm 0mm 0mm .75mm;">
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAEmployerContriAmt"/>
				  </xsl:call-template>
                  <!--Dotted Line-->                
				<span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1.25mm;">.....</span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:4mm;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAEmployerContriAmt"/>
                    <xsl:with-param name="Number">1</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (Line 2) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:7mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">2</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Archer MSA contributions you made for 2016, including those made from January 1, 2017,<br/>
                  through April 18, 2017, that were for 2016. Do not include rollovers (see instructions)
                  <!--Dotted Line-->                  
    			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 2.5mm 0mm 1.5mm;">.......</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                 <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAContributionAmt"/>
                <xsl:with-param name="Number">2</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 3) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.75mm;">3</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:4mm;">
                  Limitation from the Line 3 Limitation Chart and Worksheet in the instructions
                  <!--Dotted Line-->                  
				<span class="styDotLn" style="float:none;clear:none;padding:.5mm 2.5mm 0mm 1.5mm;">..........</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAContriLimitationAmt"/>
                <xsl:with-param name="Number">3</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 4) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">4</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Compensation (see instructions) from the employer maintaining the high deductible health plan. (If<br/>
                  self-employed, enter your earned income from the trade or business under which the high deductible health<br/>
                  plan was established.)
                  <!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1.5mm;">...........................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/HDHPEmployerCompensationAmt"/>
                <xsl:with-param name="Number">4</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 5) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1.25mm;">5</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:.75mm 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Archer MSA deduction.</b> Enter the <b>smallest</b> of line 2, 3, or 4 here. Also include this amount on<br/>
                  Form 1040, line 36, or Form 1040NR, line 35. On the dotted line next to Form 1040, line 36, or<br/>
                  Form 1040NR, line 35, enter &#8220;MSA&#8221; and the amount
                  <!--Dotted Line-->
 				<span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1.5mm;">..................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:7.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:7.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADeductionAmt"/>
                <xsl:with-param name="Number">5</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS8853LineItem" style="height:5.5mm;">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:1.5mm 0mm 0mm 3mm;">
                  <b>Caution:</b> If line 2 is more than line 5, you may have to pay an additional tax (see instructions).
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part II                                                   -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:13mm;height:4mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:4mm;">
              Archer MSA Distributions
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (Line 6a) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;padding-right:0px;">6a</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Total distributions you and your spouse received in 2016 from all Archer MSAs (see instructions)
                  <!--Dotted Line-->
    			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1.5mm;">....</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TotalArcherMSADistributionAmt"/>
                <xsl:with-param name="Number">6a</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 6b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">b</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;padding-top:.5mm;">
                  Distributions included on line 6a that you rolled over to another Archer MSA or a health savings<br/>
                  account. Also include any excess contributions (and the earnings on those excess contributions)<br/>
                  included on line 6a that were withdrawn by the due date of your return (see instructions)
                  <!--Dotted Line-->
     			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1.5mm;">......</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADistriRollOverAmt"/>
                <xsl:with-param name="Number">6b</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 6c) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;padding-right:0px;">c</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Subtract line 6b from line 6a
                 <!--Dotted Line-->
     			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 2.5mm 0mm 1.5mm;">.........................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSANetDistributionAmt"/>
                <xsl:with-param name="Number">6c</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 7) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">7</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Unreimbursed qualified medical expenses (see instructions)
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
     			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1.5mm;">...............</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSAUnreimbQualMedExpAmt"/>
                <xsl:with-param name="Number">7</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 8) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10.5mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;" >8</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Taxable Archer MSA distributions.</b> Subtract line 7 from line 6c. If zero or less, enter -0-. Also<br/>
                  include this amount in the total on Form 1040, line 21, or Form 1040NR, line 21. On the dotted<br/>
                  line next to line 21, enter &#8220;MSA&#8221; and the amount
                  <!--Dotted Line-->
     			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1.5mm;">...................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TaxableArcherMSADistriAmt"/>
                <xsl:with-param name="Number">8</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 9a) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:8.5mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">9a</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  If any of the distributions included on line 8 meet any of the <b>Exceptions to the Additional 20% Tax</b> (see instructions), check here
                  <!--Dotted Line-->
      			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">.........................</span>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet" style="padding-bottom:.5mm;"/>
                  <span style="width:.5mm;"/>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataArcherMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <input class="styCkbox" type="checkbox" alt="Exceptions to the Additional 20% Tax Checkbox" style="width:3mm;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/ArcherMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataArcherMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:8mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:8mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 9b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:14mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">b</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Additional 20% tax</b> (see instructions). Enter 20% (.20) of the distributions included on line 8 that<br/>
                  are subject to the additional 20% tax. Also include this amount in the total on Form 1040, line 62, or <br/>
                  Form 1040NR, line 60. Check box c on Form 1040, line 62, or box b on Form 1040NR, line 60. Enter<br/>
                  "MSA" and the amount on the line next to the box
                  <!--Dotted Line-->
       			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">..................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">9mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">height:10mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:10mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
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
          <div style="width:187mm;border-top:1.25px solid black;" class="styBB">
            <!-- Content -->
            <div class="styIRS8853LNDesc" style="width:16mm;height:11mm;font-size:8pt;padding-left:0px;border-width-top:1.5px;">
              <b>Section B.</b>
            </div>
            <div style="padding-top:.5mm;padding-left:3mm;width:171mm;font-size:8pt;">
              <b>Medicare Advantage MSA Distributions.</b> If you are filing jointly and both you and your spouse received
              distributions in 2016 from a Medicare Advantage MSA, complete a separate Section B for each spouse (see
              instructions). 
            </div>
          </div>
          <!-- Body -->
          <div class="styTBB" style="width:187mm;">
            <!-- (Line 10) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;" >10</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Total distributions you received in 2016 from all Medicare Advantage MSAs (see instructions)
                  <span style="width:.5mm;"/>
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TotalMedicareMSADistriAmt"/>
				  </xsl:call-template>    
                  <span style="width:.75mm;"/>				                
                  <!--Dotted Line-->
        			 <span class="styDotLn" style="float:none;clear:none;padding:.0mm 0mm 0mm .75mm;">....</span>
                </div>        			 
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TotalMedicareMSADistriAmt"/>
                <xsl:with-param name="Number">10</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 11) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;">11</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Unreimbursed qualified medical expenses (see instructions)
                  <!--Dotted Line-->
         			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MedicareMSAUnrmbQualMedExpAmt"/>
                <xsl:with-param name="Number">11</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 12) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10.5mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">12</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Taxable Medicare Advantage MSA distributions.</b> Subtract line 11 from line 10. If zero or less,<br/>
                  enter -0-. Also include this amount in the total on Form 1040, line 21, or Form 1040NR, line 21.<br/>
                  On the dotted line next to line 21, enter &#8220;Med MSA&#8221; and the amount
                  <!--Dotted Line-->
          			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">.............</span>
              </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/TaxableMedicareMSADistriAmt"/>
                <xsl:with-param name="Number">12</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 13a) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:8mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">13a</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  If any of the distributions included on line 12 meet any of the <b>Exceptions to the Additional 50% Tax</b> (see instructions), check here
                  <!--Dotted Line-->
       			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">.........................</span>
                  <img src= "{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet" style="padding-bottom:.5mm;"/>
                  <span style="width:.5mm;"/>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MedicareMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataMedicareMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <input class="styCkbox" type="checkbox" alt="Exceptions to the Additional 50% Tax Checkbox" style="width:3mm;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/ArcherMSAAndMedcrAdvntgMSAGrp/MedicareMSADistriMeetTaxExcInd"/>
                      <xsl:with-param name="BackupName">Form8853DataMedicareMSADistriMeetTaxExcInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 13b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:16mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;padding-right:0px;">b</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Additional 50% tax</b>. Enter 50% (.50) of the distributions included on line 12 that are subject to <br/>
                  the additional 50% tax. See instructions for the amount to enter if you had a Medicare Advantage MSA<br/>
                  at the end of 2015. Also include this amount in the total on Form 1040, line 62, or Form 1040NR, line 60.<br/>
                  Check box c on Form 1040, line 62, or box b on Form 1040NR, line 60. Enter "Med MSA" and the amount<br/>
                  on the line next to the box
                  <!--Dotted Line-->
        			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">..........................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:12mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:12mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
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
     		  <span style="width:17mm;"/>
				  Cat. No. 24091H               
            </div>
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">8853</span> (2016)
            </div>
          </div>
 		  <p style="page-break-before: always"/>
          <!-- END Page Break and Footer-->
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">
              Form 8853 (2016)
            </div>
            <span style="width:105mm;"/>
            <span style="width:45mm;font-size:7pt;padding-right:5mm;">
              Attachment Sequence No. 
				  <span class="styBoldText" style="font-size:8pt;padding-left:1.5mm;">39</span>
			</span>
           <div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">2</span>
           </div>
          </div>
          <!-- END Page Header -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:120mm;height:8mm;font-weight:normal;font-size:7pt;">
              Name of policyholder (as shown on Form 1040)<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsurancePolicyHolderNm"/>
              </xsl:call-template>
            </div>
            <div style="height:6mm;width:67mm;height:4mm;padding:0px 0px 0px 0px;font-size:7pt;" class="styEINBox">
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
            <div class="styIRS8853LNDesc" style="width:16mm;font-size:8pt;padding-left:0px;text-align:center;">
              <b>Section C.</b>
            </div>
            <div style="width:171mm;height:8mm;font-size:8pt;padding:.5mm 0mm 0mm 3mm;">
              <b>Long-Term Care (LTC) Insurance Contracts.</b> See<b> Filing Requirements for Section C</b> in the instructions before completing this section.
            </div>
          </div>
          <!-- Body -->
          <div class="styTBB" style="width:187mm;">
            <!-- /////////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:181mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>If more than one Section C is attached, check here</b>
                </div>
                <div class="styIRS8853LNDesc" style="width:auto;float:none;clear:none;padding:.25mm 0mm 0mm 1mm">
                  <!--Dotted Line-->
          			 <span class="styDotLn">........................</span>
                </div>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet" style="padding-bottom:.5mm;"/>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/Form8853LTCMultipleCopiesInd"/>
                      <xsl:with-param name="BackupName">Form8853DataForm8853LTCMultipleCopiesInd</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <input class="styCkbox" type="checkbox" alt="More than on Section C attached Checkbox" style="width:3mm;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/Form8853LTCMultipleCopiesInd"/>
                      <xsl:with-param name="BackupName">Form8853DataForm8853LTCMultipleCopiesInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
              </div>
            </div>
            <!-- (Line 14a-b) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:2mm;"/>
			<div class="styIRS8853LineItem" style="height:4mm;">            
              <div class="styIRS8853LNLeftNumBox" style="padding:.5mm 0mm 0mm 1.25mm;">14a</div>
              <div class="styIRS8853LNDesc" style="width:181mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:27mm;height:100%;">
                  Name of insured
                  <span style="width:.5mm;"/>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
                <div class="styIRS8853LNDesc" style="width:67mm;height:100%;padding-right:3mm;border-color:black;border-style:dotted;border-bottom-width:1px;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNm"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControlTxt">
                    <span style="width:.5mm;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Part II, Section C, Line 14a - LTC Insured Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControlTxt"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
                <div class="styIRS8853LNDesc" style="width:52mm;height:100%;">
                  <b>b</b>
                  <span style="width:1mm;"/>Social security number of insured
                  <span style="width:.5mm;"/>
                  <img src="{$ImagePath}/8853_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
                <div class="styIRS8853LNDesc" style="width:33mm;height:100%;border-color:black;border-style:dotted;border-bottom-width:1px;text-align:center;padding-left:0px;">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredSSN"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (Line 15) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10.5mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">15</div>
              <div class="styIRS8853LNDesc" style="width:153mm;">
                In 2016, did anyone other than you receive payments on a per diem or other periodic basis under a<br/>
                qualified LTC insurance contract covering the insured or receive accelerated death benefits under a life<br/>
                insurance policy covering the insured?
                  <xsl:choose>
                    <xsl:when test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd/@referenceDocumentName">
                      <span style="width:.5mm;"/>
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                    </xsl:otherwise>
                  </xsl:choose>
        			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">........................</span>
              </div>
              <div class="styIRS8853LNDesc" style="width:28mm;padding-top:6.5mm;">
                <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" alt="Yes Checkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd">
                      <xsl:call-template name="PopulateYesCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuranceOtherPaymentInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <label>
                 <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                  </xsl:call-template>                
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd">
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                      <xsl:with-param name="BackupName">IRS8853LTCInsuranceOtherPaymentInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styBoldText">Yes</span>
                </label>
                <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                <span style="width:2.5mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" alt="No Checkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd">
                      <xsl:call-template name="PopulateNoCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuranceOtherPaymentInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <label>
                 <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceOtherPaymentInd"/>
                  </xsl:call-template>                
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
            <!-- (Line 16) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:11.5mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;" >16</div>
              <div class="styIRS8853LNDesc" style="width:153mm">
                Was the insured a terminally ill individual?
        			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">.......................</span>
              </div>
              <div class="styIRS8853LNDesc" style="width:28mm;padding-bottom:6mm;">
                <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" alt="Yes Checkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                      <xsl:call-template name="PopulateYesCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <label>
				  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                  </xsl:call-template>                
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                      <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styBoldText">Yes</span>
                </label>
                <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                <span style="width:2.5mm;"/>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" alt="No Checkbox">
                    <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                      <xsl:call-template name="PopulateNoCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                        <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </input>
                </span>
                <label>
                 <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                  </xsl:call-template>                
                  <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd">
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredTerminallyIllInd"/>
                      <xsl:with-param name="BackupName">IRS8853LTCInsuredTerminallyIllInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <span class="styBoldText">No</span>
                </label>
                <br/>
			    <div class="styIRS8853LNDesc" style="width:181mm;padding:0mm 0mm 1mm 3mm;float:right;clear:none;">              
					 <b>Note:</b> If &#8220;Yes&#8221; and the <b>only</b> payments you received in 2016 were accelerated death benefits that were paid
					  to you because the insured was terminally ill, skip lines 17 through 25 and enter -0- on line 26.              
				</div>                                
              </div>
            </div>
            <!-- (Line 17) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10.5mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">17</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Gross LTC payments received on a per diem or other periodic basis. Enter the total of the<br/>
                  amounts from box 1 of all Forms 1099-LTC you received with respect to the insured on which the<br/>
                  &#8220;Per diem&#8221; box in box 3 is checked
                  <!--Dotted Line-->
        			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">.......................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:3.25mm;border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.25mm;border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:3.25mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.25mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCGrossPaymentsReceivedAmt"/>
                <xsl:with-param name="Number">17</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS8853LineItem" style="height:16mm;">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Caution: Do not</b> use lines 18 through 26 to figure the taxable amount of benefits paid under an<br/>
                  LTC insurance contract that is not a <b>qualified</b> LTC insurance contract. Instead, if the benefits are<br/>
                  not excludable from your income (for example, if the benefits are not paid for personal injuries or<br/>
                  sickness through accident or health insurance), report the amount not excludable as income on<br/>
                  Form 1040, line 21.
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:16mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:16mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 18) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;">18</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Enter the part of the amount on line 17 that is from <b>qualified</b> LTC insurance contracts
          		 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">.......</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuranceQualifiedAmt"/>
                <xsl:with-param name="Number">18</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 19) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.75mm;">19</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Accelerated death benefits received on a per diem or other periodic basis. Do not include any<br/>
                  amounts you received because the insured was terminally ill (see instructions)
                  <!--Dotted Line-->
         			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">..........</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:3.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/AcceleratedDeathBenefitRcvdAmt"/>
                <xsl:with-param name="Number">19</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS8853LineItem">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 20) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;">20</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Add lines 18 and 19
                  <!--Dotted Line-->
         			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">............................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/TotalLTCAndDeathBenefitRcvdAmt"/>
                <xsl:with-param name="Number">20</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:7mm;">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Note:</b> If you checked &#8220;Yes&#8221; on line 15 above, see <b>Multiple Payees</b> in
                  the instructions before completing lines 21 through 25.
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:8mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">height:7mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (Line 21) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;">21</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Multiply $340 by the number of days in the LTC period
                  <!--Dotted Line-->
       			 <span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">........</span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="height:6.5mm;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="height:6.5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">height:6.5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCDaysMultiplyByPerDiemAmt"/>
                    <xsl:with-param name="Number">21</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (Line 22) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">22</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Costs incurred for qualified LTC services provided for the insured<br/>
                  during the LTC period (see instructions)
                  <!--Dotted Line-->
        			<span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">............</span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
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
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (Line 23) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;">23</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Enter the <b>larger</b> of line 21 or line 22
                   <!--Dotted Line-->
         			<span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">.............</span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LargerCalcOrActualLTCCostsAmt"/>
                    <xsl:with-param name="Number">23</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (Line 24) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:7mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">24</div>
              <div class="styIRS8853LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Reimbursements for qualified LTC services provided for the insured<br/>
                  during the LTC period
                  <!--Dotted Line-->
         			<span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">..................</span>
                </div>
              </div>
              <div class="styIRS8853LNDesc" style="width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="AmountBoxStyle">height:5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">height:5mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8853LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCReimbursementAmt"/>
                    <xsl:with-param name="Number">24</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div class="styIRS8853LineItem" style="height:6mm;">
              <div class="styIRS8853LNLeftNumBox"/>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Caution:</b> If you received any reimbursements from LTC contracts<br/>
                  issued before August 1, 1996, see instructions.
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:6mm;border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:6mm;border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 25) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:4mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:1mm;">25</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  Per diem limitation. Subtract line 24 from line 23
                  <!--Dotted Line-->
          			<span class="styDotLn" style="float:none;clear:none;padding:.5mm 0mm 0mm 1mm;">...................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCPerDiemLimitationAmt"/>
                <xsl:with-param name="Number">25</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (Line 26) ////////////////////////////////////////////////////-->
            <div class="styIRS8853LineItem" style="height:10mm;">
              <div class="styIRS8853LNLeftNumBox" style="padding-top:.5mm;">26</div>
              <div class="styIRS8853LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8853LNDesc" style="width:auto;height:100%;">
                  <b>Taxable payments.</b> Subtract line 25 from line 20. If zero or less, enter -0-. Also include this<br/>
                  amount in the total on Form 1040, line 21. On the dotted line next to line 21, enter &#8220;LTC&#8221; and the<br/>
                  <span style="float:left;clear:none;padding-right:0px;">amount</span>
                  <!--Dotted Line-->
          			<span class="styDotLn" style="float:none;clear:none;padding:.25mm 0mm 0mm 1mm;">................................</span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">height:6mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">height:6mm;border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>              
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCTaxablePaymentsAmt"/>
                <xsl:with-param name="Number">26</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:20px;"/>
              Form <span class="styBoldText" style="font-size:7pt;"> 8853 </span> (2016)
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
          <xsl:variable name="TableWidth">110</xsl:variable>
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
            <xsl:if test="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControlTxt">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part II, Section C, Line 14a - LTC Insured Name Control</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form8853Data/SectCLTCInsuranceCntrctGrp/LTCInsuredNameControlTxt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:if>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>