<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS982Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form982Data" select="$RtnDoc/IRS982"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form982Data)"/>
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
        <meta name="Description" content="IRS Form 982"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
       <!-- * {box-sizing:border-box;}
          input[type=checkbox] {box-sizing:content-box;}
          span {display:inline-block;}-->  
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm">
        <form name="Form982">
          <!-- WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:22mm;">
            <div class="styFNBox" style="width:31mm;height:22mm;">
              <div style="padding-top:.5mm;">
                Form<span class="styFormNumber">982</span>                
              </div>
              <div style="padding-top:.5mm; font-size:6pt;">(Rev. March 2018)
              <br/>              
              <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form982Data"/>
                </xsl:call-template>
              </div>
              <div >
                <span class="styAgency" style="font-size:6pt;">Department of the Treasury</span>
                <span class="styAgency" style="font-size:6pt;">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:20mm;padding-top:3.5mm;">
              <!-- Changed the title font-size to reflect the size on the pdf -->
              <div class="styMainTitle" style="height:6mm">Reduction of Tax Attributes Due to Discharge of <br> Indebtedness (and Section 1082 Basis Adjustment)</br>
              </div> 
              <div class="styFBT" style="padding-top:3mm; font-size:7.5pt;">
              <img src="{$ImagePath}/982_Bullet.gif" alt="Bullet Image"/>Attach this form to your income tax return.
              <br/>
                <img src="{$ImagePath}/982_Bullet.gif" alt="Bullet Image"/> Go to <i><a href="http://www.irs.gov/form982">www.irs.gov/Form982</a></i> for instructions and the latest information.<br/>
               
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:22mm;">
              <div class="styOMB" style="height:10mm;">
                <br/>OMB No. 1545-0046<br/>
                <br/>
              </div>
              <div class="stySequence" style="height:6mm;padding-top:1mm;">
            Attachment<br/>Sequence No. <span class="styBoldText" style="font-size:8pt;">94</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styFNBox" style="width:144mm;height:10mm;">
              Name shown on return<br/>
              <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
			  <xsl:choose>
			  <!-- Name from 1120/990/1065 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<!-- Name from 1040 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<!-- Name from 1041 Return Header -->
				<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
				  </xsl:call-template>
				</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
				  </xsl:call-template>
				  <br/>
				</xsl:when> 
			  </xsl:choose>
            </div>
            <div class="styGenericDiv" style="width:42mm;height:4mm;padding-left:1mm;">
              <span class="styBoldText">Identifying number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
				<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
				<xsl:choose>
		          <xsl:when test="$RtnHdrData/Filer/EIN">
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:otherwise>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
					</xsl:call-template>
				  </xsl:otherwise>
				</xsl:choose>
			  </span>
            </div>
          </div>
          <!-- End Name and Identifying Number Section-->
          <!-- Begin Part I Title -->
          <div class="styBB" style="width:187mm;height: 8mm;">
            <div class="styPartName" style="margin-top: 2mm; margin-bottom: 2mm">Part I</div>
            <div class="styPartDesc" style="padding-top: 2mm">General Information
          <span class="styNormalText"> (see instructions)</span>
            </div>
          </div>
          <!-- End Part I Title -->
          <!-- Begin Part I Body -->
          <div class="styBB" style="width:187mm;">
            <!-- L1 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">1</div>
              <div class="styLNDesc" style="width:139mm;">
            Amount excluded is due to (check applicable box(es)): 
          </div>
            </div>
            <!-- L1a -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">a</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <span style="float:left;"><label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtInATitle11CaseInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtInATitle11Case</xsl:with-param>
                  </xsl:call-template>Discharge of indebtedness in a title 11 case </label></span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...........................</span>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" alt="Discharge Indebtedness Title11" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtInATitle11CaseInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtInATitle11Case</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>
            <!-- L1b -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <span style="float:left;"><label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgIndbtExtentInsolventInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtToExtentInsolvent</xsl:with-param>
                  </xsl:call-template>Discharge of indebtedness to the extent insolvent (not in a title 11 case) </label></span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">..................</span>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" alt="Discharge Indebtedness Extent Insolvent" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgIndbtExtentInsolventInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtToExtentInsolvent</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>
            <!-- L1c -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <span style="float:left;"><label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DischargeOfQlfyFarmIndbtInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQualifiedFarmIndbt</xsl:with-param>
                  </xsl:call-template>Discharge of qualified farm indebtedness </label></span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...........................</span>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" alt="Dischard Qualified Farm Indebtedness " class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DischargeOfQlfyFarmIndbtInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQualifiedFarmIndbt</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>
            <!-- L1d -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">d</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <span style="float:left;"><label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgQlfyRealPropBusIndbtInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyRealPropBusIndbt</xsl:with-param>
                  </xsl:call-template>Discharge of qualified real property business indebtedness </label></span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.......................</span>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" alt="Discharge Qualified Real Property Indebtedness" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgQlfyRealPropBusIndbtInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyRealPropBusIndbt</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>
            <!-- L1e -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:7mm;padding-left:4mm;">e</div>
              <div class="styLNDesc" style="width:170mm;height:7mm;">
                <span style="float:left;"><label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DischargeOfQualifiedPrinResInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyPrincipalResidence</xsl:with-param>
                  </xsl:call-template>Discharge of qualified principal residence indebtedness (<b>Caution:</b> see instructions before checking this box if debt was <br/>discharged after 2017)</label><span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.................................</span></span>
                <!--Dotted Line-->
			    
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:7mm;text-align:left;padding-top:2mm;">
                <input type="checkbox" alt="Discharge Qualified Principal Residence Indebtedness" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DischargeOfQualifiedPrinResInd"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyPrincipalResidence</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </div>
            <!-- L2 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">2</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Total amount of discharged indebtedness excluded from gross income </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...........</span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4mm;">2</div>
                <div class="styLNAmountBox" style="height:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TotalDischargedIndebtednessAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L3 -->
            <div style="width:187mm;">
              <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styLNDesc" style="width:154.5mm;height:4.5mm;">
                Do you elect to treat all real property described in section 1221(a)(1), relating to property held for sale to customers in the ordinary course of a trade or business, as if it were depreciable property?
            <!--Dotted Line-->
                <span style="letter-spacing:3.3mm;font-weight:bold;">.............</span>
              </div>
              </div>
              <div style="float:right;clear:none;">
              <!-- Yes or No check boxes -->
              <div class="styLNDesc" style="width:12mm;height:7.5mm; padding-top:3.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBoxInd"/>
                  </xsl:call-template>
                  <input type="checkbox" alt="Yes" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBoxInd"/>
                      <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:2px"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBoxInd"/>
                    <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                  </xsl:call-template>            
                 Yes            
              </label>
              </div>
              <div class="styLNDesc" style="width:12mm;height:7.5mm; padding-top:3.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBoxInd"/>
                  </xsl:call-template>
                  <input type="checkbox" alt="No" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBoxInd"/>
                      <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:2px"/>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBoxInd"/>
                    <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                  </xsl:call-template>            
                 No            
              </label>
              </div>
            </div>
            </div>
          </div>
          <!-- End Part I Body -->
          <!-- Begin Part II Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="margin-top: 2mm; margin-bottom: 2mm;">Part II</div>
            <div class="styPartDesc" style="width:170mm;height:18mm;padding-top:2mm;padding-bottom:2mm;">
              Reduction of Tax Attributes.<span class="styNormalText"> You must attach a description of any transactions resulting in the reduction in basis under section
          1017. See Regulations section 1.1017-1 for basis reduction ordering rules, and, if applicable, required partnership
          consent statements. (For additional information, see the instructions for Part II.)</span>
            </div>
          </div>
          <!-- End Part II Title -->
          <!-- Begin Part II Body -->
          <div class="styBB" style="width:187mm;">
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:146.75mm;height:4mm;">
                <span class="styBoldText">Enter amount excluded from gross income:</span>
              </div>
              <!-- Empty number box lines on the right -->
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4mm;"/>
              </div>
            </div>
            <!-- L4 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">4</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> 
                For a discharge of qualified real property business indebtedness applied to reduce the basis of depreciable real
				<span style="float:left;">property </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...............................</span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm;">4</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcldForDschrgQlfyRealPropAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L5 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">5</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> 
                That you elect under section 108(b)(5) to apply first to reduce the basis (under section 1017) of depreciable
				<span style="float:left;">property 
				  <!-- Form to Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedUnderSection108b5Amt"/>
                </xsl:call-template>
				</span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">..........................</span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm;">5</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedUnderSection108b5Amt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L6 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">6</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> 
                Applied to reduce any net operating loss that occurred in the tax year of the discharge or carried over to the 
				<span style="float:left;">tax year of the discharge </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">........................</span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">6</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedToReduceNOLAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L7 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:7.5mm; padding-top:3.5mm">7</div>
              <div class="styLNDesc" style="width:139mm; height:7.5mm; padding-top:3.5mm">
                <span style="float:left;">Applied to reduce any general business credit carryover to or from the tax year of the discharge </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...</span>
              </div>
              <!-- Float the empty number box lines to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">7</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedToReduceGenBusCrAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L8 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">8</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> 
                Applied to reduce any minimum tax credit as of the beginning of the tax year immediately after the tax year 
                <span style="float:left;">of the discharge </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">............................</span>              
			  </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">8</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedToReduceMinimumTxCrAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L9 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">9</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> 
                Applied to reduce any net capital loss for the tax year of the discharge, including any capital loss carryovers 
				<span style="float:left;">to the tax year of the discharge </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">......................</span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">9</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedToReduceNetCapLossAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L10a -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">10a</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> 
                Applied to reduce the basis of nondepreciable and depreciable property if not reduced on line 5. 
                <span class="styItalicText">
                <span style="float:left;">DO NOT  use in the case of discharge of qualified farm indebtedness </span></span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">............</span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">10a</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedToReduceBasisOfPropAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L10b -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:7.5mm; padding-top=3.5mm;padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:139mm;height:7.5mm; padding-top=3.5mm;">
                <span style="float:left;">Applied  to reduce the basis of your principal residence. 
                <i>Enter amount here ONLY if line 1e is checked </i></span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">10b</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedToReducePrinResAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L11 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">11</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">For a discharge of qualified farm indebtedness applied to reduce the basis of:</div>
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4mm;"/>
              </div>
            </div>
            <!-- L11a -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="padding-left:4mm;height7.5mm;">a</div>
              <div class="styLNDesc" style="width:139mm;">
                Depreciable property used or held for use in a trade or business or for the production of income if not 
				<span style="float:left;">reduced on line 5 </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...........................</span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">11a</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DepreciablePropUsedOrHeldAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L11b -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:7.5mm; padding-top:3.5mm; padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:139mm;height:7.5mm; padding-top:3.5mm;">
			    <span style="float:left;">Land used or held for use in a trade or business of farming </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...............</span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm">11b</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/LandUsedOrHeldAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L11c -->
            <div style="width:187mm;height:7.5mm;">
              <div class="styLNLeftLtrBox" style="height:7.5mm; padding-top:3.5mm;padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:139mm;height:7.5mm; padding-top:3.5mm;">
                <span style="float:left;">Other property used or held for use in a trade or business or for the production of income </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.....</span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm;">11c</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/OtherPropertyUsedOrHeldAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L12 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:7.5mm; padding-top:3.5mm">12</div>
              <div class="styLNDesc" style="width:139mm;height:7.5mm; padding-top:3.5mm;">
                <span style="float:left;">Applied to reduce any passive activity loss and credit carryovers from the tax year of the discharge </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">..</span> 
              </div>
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top:3.5mm;">12</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/PassiveActyLossAndCrCyovAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L13 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:7.5mm; padding-top:3.5mm;">13</div>
              <div class="styLNDesc" style="width:139mm;height:7.5mm; padding-top:3.5mm;"> 
				<span style="float:left;">Applied to reduce any foreign tax credit carryover to or from the tax year of the discharge </span>
                <!--Dotted Line-->
			    <span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">.....</span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="height:7.5mm; padding-top:3.5mm;">13</div>
                <div class="styLNAmountBoxNBB" style="height:7.5mm; padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ForeignCreditCarryoverAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- End Part II Body -->
          <!-- Begin Part III Title -->
          <div class="styBB" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
            <div class="styPartName" style="height:4mm;">Part III</div>
            <div class="styPartDesc">Consent of Corporation to Adjustment of Basis of Its Property Under Section 1082(a)(2)</div>
          </div>
          <!-- End Part III Title -->
          <!-- Begin Part III Body -->
          <div style="width:187mm;">
            <div class="styNormalText" style="padding-top:1.5mm;">  
            <!--<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>-->
          Under section 1081(b), the corporation named above has excluded $ 
          <span style="width:60mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form982Data/ExcludedUnderSectPtIII1081BAmt"/>
                </xsl:call-template>
              </span>
           from its gross income for the tax year beginning 
          <span style="width:60mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form982Data/TaxYearBeginDt"/>
                </xsl:call-template>
              </span>
              and ending 
          <span style="width:60mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form982Data/TaxYearEndDt"/>
                </xsl:call-template>
              </span>
               . Under that section, the corporation consents to have the basis of its property adjusted in accordance with the regulations prescribed under section 1082(a)(2) in effect at the time of filing its income tax return for that year.  The corporation is organized under the laws of 
          <span style="width:70mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form982Data/IncorporationStateCd"/>
                </xsl:call-template>
              </span>
          .</div>
          </div>
          <div class="styBB" style="width:187mm;">
            <span style="width:20mm"/>
            <span style="font-size:6pt;">(State of incorporation)</span>
          </div>
          <!-- End Part III Body -->
          <!-- Note at the bottom of the page -->
          <div class="styBB" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
            <div style="font-size:9pt;">
              <span class="styBoldText">Note: </span><span style="width:.5mm;"/>
              <span class="styItalicText"> You must attach a description of the transactions resulting in the nonrecognition of gain under section 1081.</span>
            </div>
          </div>
          <!-- End note at the bottom of the page -->
          <!-- Begin Footer -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
            <span style="width:28mm;"/>
            Cat. No. 17066E 
            <span style="width:15mm;"/>
            Form 
            <span class="styBoldText">982</span> (Rev. 3-2018)
          </div>
          <!-- End Footer -->
          <br/>
          <div class="pageEnd"/>
          <!-- Begin Left Over Table -->
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
              <xsl:with-param name="TargetNode" select="$Form982Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- End Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>