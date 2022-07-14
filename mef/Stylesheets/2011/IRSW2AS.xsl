<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRSW2ASStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormW2ASData" select="$RtnDoc/IRSW2AS"/>
  
<!-- template to make vertical word code -->  
  <!-- ////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template name="CreateVerticalWord">
  
  <span style="width:2mm;float:left;font-size:5pt">
											C<br/>
											o<br/>
											d<br/>
											e
											</span>
  </xsl:template>
  <!-- Create Form Header -->
  <!-- ////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template name="CreateFormHeader">
    <div class="styGenericDiv" style="width:187mm;border-width:0px 0px 0px 0px;">
      <!-- Left (Top) -->
      <div class="styGenericDiv" style="width:60%;height:13mm;border-left-width:0px;">
        <div class="styGenericDiv" style="width:30%;height:100%;border-left-width:0px;">
          <span class="styBoldText" style="width:100%;padding-top:1.5mm;">Form<span style="width:auto;font-family:arial;font-size:20pt;padding-left:3mm;">W-2AS</span></span>
        </div>
        <div class="styGenericDiv" style="width:43%;height:100%;border-left-width:0px;">
          <span class="styMainTitle" style="font-size:10pt;width:100%;text-align:left;padding-top:1.5mm;padding-left:1.5mm">
            American Samoa<br/>
            Wage and Tax Statement
          </span>
        </div>
        <div class="styGenericDiv" style="width:27%;height:100%;border-left-width:0px;">
          <div class="styTY" style="float:left;clear:none;height:100%;font-size:25pt;padding-top:1mm;padding-left:7mm;">
            20<span class="stytycolor">11</span></div>
        </div>
      </div>
      <!-- Right -->
      <div class="styGenericDiv" style="width:40%;height:24mm;float:right;border-left-width:0px;">
        <span class="styAgency" style="font-size:7.5pt;font-family:Arial;width:100%;text-align:right;float:right;padding-top:1.5mm;">
          Department of the Treasury<img src="{$ImagePath}/W2AS_Short_Line.gif" alt="Line image"/>Internal Revenue Service
        </span>
        <span class="styBoldText" style="width:100%;text-align:right;">
          <br/>
          For Privacy Act and Paperwork Reduction Act<br/>
          Notice, see the separate instructions.
        </span>
        <span class="styNormalText" style="width:100%;text-align:right;padding-top:1mm;">
          <b>Cat. No.</b> 10140H
        </span>
      </div>
      <!-- Left (Bottom) -->
      <div class="styGenericDiv" style="width:60%;height:11mm;border-left-width:0px;">
        <b>Copy A For Social Security Administration</b><img src="{$ImagePath}/W2AS_Short_Line.gif" alt="Line image"/>Send this entire page with Copy A of<br/>
        Form W-3SS to the Social Security Administration; photocopies are <b>not</b> acceptable.
      </div>
    </div>
    <br/>
    <div class="pageEnd" style="width:187mm;font-size:7pt;font-family:arial;text-align:center;">
        Do Not Cut, Fold, or Staple Forms on This Page
        <img src="{$ImagePath}/W2AS_Short_Line.gif" alt="Line image"/>
        Do Not Cut, Fold, or Staple Forms on This Page
    </div>
  </xsl:template>
  <!-- Create Line 12 Table Rows -->
  <!-- ////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template name="CreateLine12TableRows">
    <xsl:param name="AddAdditionalMessage"/>
    <xsl:param name="TargetNode"/>
    <xsl:param name="Letter"/>
    <!-- IsLast -->
    <xsl:variable name="IsLast">
      <xsl:if test="((position() = last()) and $TargetNode and $Letter &gt;= 'd') or (not($TargetNode) and ($Letter = 'd'))">
        border-bottom-width:0px;
      </xsl:if>
    </xsl:variable>
    <tr>
      <xsl:attribute name="style">
        width:100%;height:auto;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
      <td class="styIRSW2ASTableCell">
        <xsl:attribute name="style">
        width:100%;<xsl:value-of select="$IsLast"/></xsl:attribute>
        <xsl:if test="(position() != 1) or ($Letter != 'a')">
          <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
            <div class="styIRSW2ASLNLeftNumBox" style="width:auto;padding-left:1.2mm;">
              <xsl:value-of select="concat('12', $Letter)"/>
            </div>
          </div>
        </xsl:if>
        <div class="styIRSW2ASLNDesc" style="width:100%;text-align:center;height:32px">
          <div class="styIRSW2ASCleanDiv" style="width:4%;border-left-width:0px;height:100%;padding:0px 0px 0px 0px;">
            <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;border-right-width:0px;padding-bottom:.1mm">c o d e</div>
          </div>
          <div class="styIRSW2ASCleanDiv" style="width:20%;height:100%;padding-top:1mm;border-left-width:0px;">
            <div class="styIRSW2ASLNDesc" style="width:auto;text-align:center;padding-left:3mm;">
              <xsl:if test="$TargetNode">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseCd"/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>
          <div class="styIRSW2ASCleanDiv">
            <xsl:attribute name="style">
              width:auto;height:100%;padding-top:1mm;float:right;padding-right:3mm;
              <xsl:if test="$AddAdditionalMessage">
                padding-top:0mm;
              </xsl:if>
            </xsl:attribute>
            <div class="styIRSW2ASLNDesc" style="width:26mm;">
              <xsl:if test="$TargetNode">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseAmt"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$AddAdditionalMessage">
                <xsl:if test="((count($FormW2ASData/NonUSEmployersUseGrp) &gt;4) and ($Print = $Separated))">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/NonUSEmployersUseGrp"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
            </div>
          </div>
        </div>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="CreateLine12TableRowsColored">
    <xsl:param name="TargetNode"/>
    <xsl:param name="Letter"/>
    <!-- IsLast -->
    <xsl:variable name="IsLast">
      <xsl:if test="position() = last()">
        border-bottom-width:0px;
      </xsl:if>
    </xsl:variable>
    <tr>
      <xsl:attribute name="style">
        width:100%;height:5mm;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
      <td class="styIRSW2ASTableCell" style="width:50%;text-align:center;height:5mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseCd"/>
        </xsl:call-template>
      </td>
      <td class="styIRSW2ASTableCell" style="width:50%;text-align:right;border-left-width:1px;height:5mm;padding-right:1mm">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode/EmployersUseAmt"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!-- Create Line 14 Table Rows -->
  <!-- ////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template name="CreateLine14TableRows">
    <xsl:param name="AddAdditionalMessage"/>
    <xsl:param name="TargetNode"/>
    <xsl:param name="Letter"/>
    <!-- IsLast -->
    <xsl:variable name="IsLast">
      <xsl:if test="position() = last()">
        border-bottom-width:0px;
      </xsl:if>
    </xsl:variable>
    <tr>
      <xsl:attribute name="style">
        height:20.7mm;border-right-width:0px;border-left-width:0px;width:100%;<xsl:value-of select="$IsLast"/></xsl:attribute>
      <td class="styIRSW2ASTableCell">
        <xsl:attribute name="style">
        width:100%;border-left-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
        <xsl:if test="$Letter and not($AddAdditionalMessage)">
          <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
            <div class="styIRSW2ASLNLeftNumBox" style="width:auto;padding-left:1.2mm;">
              <xsl:value-of select="$Letter"/>
            </div>
          </div>
        </xsl:if>
        <div class="styIRSW2ASLNDesc" style="width:100%;text-align:center;padding:0px 0px 0px 0px;height:auto;">
          <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;padding-top:0px;border-left-width:0px;">
            <div class="styIRSW2ASLNDesc" style="width:100%;text-align:left;word-wrap:break-word;height:8mm;padding-top:0px;">
              <xsl:if test="$TargetNode">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$TargetNode/Description"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$AddAdditionalMessage">
                <xsl:if test="((count($FormW2ASData/OtherDeductsBenefits) &gt;1) and ($Print = $Separated))">
                  <span style="width:100%;text-align:center;">
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$FormW2ASData/OtherDeductsBenefits"/>
                    </xsl:call-template>
                  </span>
                </xsl:if>
              </xsl:if>
            </div>
          </div>
          <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;padding-top:0px;text-align:center;border-left-width:0px;">
            <div class="styIRSW2ASLNDesc" style="width:100%;padding-top:0px;height:2.5mm;">
              <xsl:if test="$TargetNode">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$TargetNode/Amount"/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>
        </div>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="CreateLine14TableRowsColored">
    <xsl:param name="TargetNode"/>
    <xsl:param name="Letter"/>
    <!-- IsLast -->
    <xsl:variable name="IsLast">
      <xsl:if test="position() = last()">
        border-bottom-width:0px;
      </xsl:if>
    </xsl:variable>
    <tr>
      <xsl:attribute name="style">
        width:100%;height:5mm;border-right-width:0px;<xsl:value-of select="$IsLast"/></xsl:attribute>
      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
      <td class="styIRSW2ASTableCell" style="width:75%;text-align:left;height:5mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$TargetNode/Description"/>
        </xsl:call-template>
      </td>
      <td class="styIRSW2ASTableCell" style="width:25%;text-align:right;padding-right:1mm;border-left-width:1px;height:5mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode/Amount"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!-- Populate Left Over Checkbox-->
  <!-- ////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template name="PopulateLeftOverCheckbox">
    <xsl:param name="Desc"/>
    <xsl:param name="TargetNode"/>
    <xsl:param name="BackupName"/>
    <xsl:param name="DescWidth">100</xsl:param>
    <xsl:param name="AmountWidth" select="187 - $DescWidth"/>
    <xsl:if test="$TargetNode">
      <tr>
        <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
              <xsl:with-param name="BackupName">
                <xsl:value-of select="$BackupName"/>
              </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="$Desc"/>:
          </label>
        </td>
        <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
          <input class="styCkbox" type="checkbox" style="width:4mm;">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
              <xsl:with-param name="BackupName">
                <xsl:value-of select="$BackupName"/>
              </xsl:with-param>
            </xsl:call-template>
          </input>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormW2ASData)"/>
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
        <meta name="Description" content="IRS Form W2AS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRSW2ASStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRSW2AS">
          <xsl:call-template name="DocumentHeader"/>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
            <!-- Header -->
            <div class="styGenericDiv" style="width:187mm;border-bottom:1px solid black;border-left:1px solid black; border-right:1px solid black;height:8mm">
              <!-- 22222 -->
              <div class="styIRSW2ASCleanDiv" style="width:12%;height:100%;border-left-width:0px;text-align:center;">
                <span class="styBoldText" style="font-size:12pt;width:100%;padding-top:2.5mm;">22222</span>
              </div>
              <!-- Void Checkbox -->
              <div class="styIRSW2ASCleanDiv" style="width:10%;height:100%;text-align:center;border-right-width:1px;">
                <span style="width:100%;padding-top:3mm;">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormW2ASData/VoidInd"/>
                      <xsl:with-param name="BackupName">FormW2ASDataVoidInd</xsl:with-param>
                    </xsl:call-template>
                    Void
                  </label>
                  <span style="width:4px;"/>
                  <input class="styCkbox" type="checkbox" style="width:4mm;">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$FormW2ASData/VoidInd"/>
                      <xsl:with-param name="BackupName">FormW2ASDataVoidInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
              </div>
              <!-- (a) ////////////////////////////////////////////////////-->
              <div class="styIRSW2ASCleanDiv" style="width:28%;height:100%;border-width:2px 2px 2px 2px;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">a</div>
                  <div class="styIRSW2ASLNDesc" style="width:auto;">Employee's social security number</div>
                </div>
                <span style="text-align:center;width:100%;">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployeeSSN"/>
                  </xsl:call-template>
                </span>
              </div>
              <!-- For Official Use Only -->
              <div class="styIRSW2ASCleanDiv" style="width:28%;height:100%;">
                <div class="styIRSW2ASLNDesc" style="width:100%;font-size:8pt;padding-left:5px;">
                  <div class="styIRSW2ASCleanDiv" style="width:auto;border-left-width:0px;">
                    <span class="styBoldText">For Official Use Only</span>
                  </div>
                  <div class="styIRSW2ASCleanDiv" style="width:auto;border-left-width:0px;padding-left:5px;">
                    <img src="{$ImagePath}/W2AS_Bullet.gif" alt="Bullet"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Corrected W2 American Samoa Indicator</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormW2ASData/CorrectedW2AmericanSamoaInd"/>
                    </xsl:call-template>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$FormW2ASData/StandardOrNonStandardCd"/>
					</xsl:call-template>
                  </div>
                  <div class="styIRSW2ASLNDesc" style="width:100%;border-left-width:0px;">
                    <span class="styBoldText">OMB No. 1545-0008</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- (b)(1)(2) ////////////////////////////////////////////////////-->
            <div class="styGenericDiv" style="width:187mm;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;height:8mm">
              <!-- (b) Employer identification number (EIN)-->
              <div class="styIRSW2ASCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">b</div>
                  <div class="styIRSW2ASLNDesc" style="width:auto;">Employer identification number (EIN)</div>
                </div>
                <div class="styIRSW2ASLNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployerEIN"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- (1) Wages, tips, other compensation-->
              <div class="styIRSW2ASCleanDiv" style="width:25%;height:100%;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">1</div>
                  <div class="styIRSW2ASLNDesc" style="width:auto;">Wages, tips, other compensation</div>
                </div>
                <div class="styIRSW2ASLNDesc" style="width:100%;text-align:right;padding-right:1mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/WagesAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- (2) Samoa income tax withheld-->
              <div class="styIRSW2ASCleanDiv" style="width:24%;height:100%;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">2</div>
                  <div class="styIRSW2ASLNDesc" style="width:auto;">Samoa income tax withheld</div>
                </div>
                <div class="styIRSW2ASLNDesc" style="width:100%;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/AmericanSamoaWithholdingAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (c)(3)(4)(5)(6)(7)(8) /////////////////////////////////////-->
            <div class="styGenericDiv" style="width:187mm;height:24mm;border-left:1px solid black;border-right:1px solid black">
              <!-- (c) Employer's name, address, and ZIP code-->
              <div class="styIRSW2ASCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">c</div>
                  <div class="styIRSW2ASLNDesc" style="width:auto;">Employer's name, address, and ZIP code</div>
                </div>
                <div class="styGenericDiv" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployerName/BusinessNameLine1"/>
                  </xsl:call-template>
                  <xsl:if test="$FormW2ASData/EmployerName/BusinessNameLine2">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployerName/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:if>
                  <br/>
                  <xsl:choose>
                    <xsl:when test="$FormW2ASData/EmployerUSAddress">
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployerUSAddress"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployerOtherForeignAddress"/>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                  <br/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Employer Name Control</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployerNameControl"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styIRSW2ASCleanDiv" style="width:49.9%;height:100%;border-left-width:0px;">
                <!-- (3)(4) -->
                <div class="styIRSW2ASLineItemBB">
                  <!-- (3) Social security wages-->
                  <div class="styIRSW2ASCleanDiv" style="width:50%;height:100%;">
                    <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                      <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">3</div>
                      <div class="styIRSW2ASLNDesc" style="width:auto;">Social security wages</div>
                    </div>
                    <div class="styIRSW2ASLNDesc" style="width:100%;text-align:right;padding-right:1mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/SocialSecurityWagesAmt"/>
                      </xsl:call-template>
                    </div>
                  </div>
                  <!-- (4) Social security tax withheld-->
                  <div class="styIRSW2ASCleanDiv" style="width:49%;height:100%;">
                    <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                      <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">4</div>
                      <div class="styIRSW2ASLNDesc" style="width:auto;">Social security tax withheld</div>
                    </div>
                    <div class="styIRSW2ASLNDesc" style="width:100%;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/SocialSecurityTaxAmt"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- (5)(6) -->
                <div class="styIRSW2ASLineItemBB">
                  <!-- (5) Medicare wages and tips-->
                  <div class="styIRSW2ASCleanDiv" style="width:50%;height:100%;">
                    <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                      <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">5</div>
                      <div class="styIRSW2ASLNDesc" style="width:auto;">Medicare wages and tips</div>
                    </div>
                    <div class="styIRSW2ASLNDesc" style="width:100%;text-align:right;padding-right:1mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/MedicareWagesAndTipsAmt"/>
                      </xsl:call-template>
                    </div>
                  </div>
                  <!-- (6) Medicare tax withheld-->
                  <div class="styIRSW2ASCleanDiv" style="width:49%;height:100%;">
                    <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                      <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">6</div>
                      <div class="styIRSW2ASLNDesc" style="width:auto;">Medicare tax withheld</div>
                    </div>
                    <div class="styIRSW2ASLNDesc" style="width:100%;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/MedicareTaxWithheldAmt"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- (7)(8) -->
                <div class="styIRSW2ASLineItemBB" style="border-bottom-width:0px;">
                  <!-- (7) Social security tips-->
                  <div class="styIRSW2ASCleanDiv" style="width:50%;height:100%;">
                    <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                      <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">7</div>
                      <div class="styIRSW2ASLNDesc" style="width:auto;">Social security tips</div>
                    </div>
                    <div class="styIRSW2ASLNDesc" style="width:100%;text-align:right;padding-right:1mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/SocialSecurityTipsAmt"/>
                      </xsl:call-template>
                    </div>
                  </div>
                  <!-- (8) -->
                  <div class="styIRSW2ASCleanDiv" style="width:49.9%;height:100%;background-color:lightgrey;">
                    <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                      <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;background-color:white;">8</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- (d)(9)(10) ////////////////////////////////////////////////////-->
            <div class="styGenericDiv" style="width:187mm;height:8mm;border-left:1px solid black;border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black">
              <!-- (d) Control number-->
              <div class="styIRSW2ASCleanDiv" style="width:50%;height:100%;border-left-width:0px;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">d</div>
                  <div class="styIRSW2ASLNDesc" style="width:auto;">Control number</div>
                </div>
                <div class="styIRSW2ASLNDesc" style="width:100%;padding-left:7.5mm;padding-right:1mm;word-wrap:break-word;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormW2ASData/ControlNumber"/>
                  </xsl:call-template>
                </div>
              </div>
              <!-- (9) -->
              <div class="styIRSW2ASCleanDiv" style="width:25%;height:100%;background-color:lightgrey;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;background-color:white;">9</div>
                </div>
              </div>
              <!-- (10)-->
              <div class="styIRSW2ASCleanDiv" style="width:24.9%;height:100%;background-color:lightgrey;">
                <div class="styIRSW2ASCleanDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;background-color:white;">10</div>
                </div>
              </div>
            </div>
            <!-- ////////////////////////////////////////////////////-->
            <div class="styGenericDiv" style="width:187mm;height:52mm;">
              <div class="styGenericDiv" style="width:93.8mm;height:100%;border-left-width:0px;border-left:1px solid black;border-right:1px solid black;border-bottom:1px solid black;">
                <!-- (e) Employee's first name and initial // Last Name // Suff.-->
                <div class="styGenericDiv" style="height:25%;width:100%;">
                  <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">e</div>
                  <div class="styGenericDiv" style="; width:39mm;padding-top:.6mm;">
                    <span style="font-family:Arial;">Employee's first name and initial</span> <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployeeName"/>
                    </xsl:call-template>                    
                  </div>
                  <div class="styGenericDiv" style="width:39mm;padding-top:.6mm;padding-left:2mm;">
                    Last name
                  </div>
                  <div class="styGenericDiv" style="width:7mm;padding-top:.6mm;padding-left:2mm;">
                    Suff.
                  </div>
                </div>
                
                <!-- (f) Employee's address and ZIP code-->
                <div class="styGenericDiv" style="width:100%;height:75%;border-left-width:0px;">
                  <div class="styGenericDiv" style="width:100%;padding-left:7mm;padding-top:2mm;word-wrap:break-word;height:40%;">
                    <xsl:if test="$FormW2ASData/EmployeeUSAddress">
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployeeUSAddress"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$FormW2ASData/EmployeeOtherForeignAddress">
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployeeOtherForeignAddress"/>
                      </xsl:call-template>
                    </xsl:if>
                  </div>
                  <span style="width:100%;height:18.8mm;"/>
                  <div class="styGenericDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                    <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">f</div>
                    <div class="styGenericDiv" style="width:auto;">Employee's address and ZIP code</div>
                  </div>
                </div>
              </div>
              <div class="styGenericDiv" style="width:46.5mm;border-right:1px solid black;height:100%">
                <!-- (11) Nonqualified plans-->
                <div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black;">
                  <div class="styGenericDiv" style="width:100%;height:auto;border-width:0px 0px 0px 0px;">
                    <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">11</div>
                    <div class="styGenericDiv" style="width:auto;">Nonqualified plans</div>
                  </div>
                  <div class="styGenericDiv" style="width:100%;text-align:center;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2ASData/NonqualifiedPlansAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                
				 <!-- (13) Statutory Employee / Retirement Plan / Third-party Sick Pay-->
                <div class="styGenericDiv" style="width:100%;height:25%;border-bottom-width:1px;border-left-width:0px;">
                    <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">13</div>
                    <div class="styGenericDiv" style="width:auto;">
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$FormW2ASData/StatutoryEmployeeInd"/>
                          <xsl:with-param name="BackupName">FormW2ASDataStatutoryEmployeeInd</xsl:with-param>
                        </xsl:call-template>
                        <span style="font-size:6pt">Statutory<br/>employee<br/>
                        </span>
                      </label>
                      <input class="styCkbox" type="checkbox" style="width:4mm;">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$FormW2ASData/StatutoryEmployeeInd"/>
                          <xsl:with-param name="BackupName">FormW2ASDataStatutoryEmployeeInd</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </div>
                    <span style="width:3mm;float:left;"/>
                    <div class="styGenericDiv" style="width:auto;">
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$FormW2ASData/RetirementPlanInd"/>
                          <xsl:with-param name="BackupName">FormW2ASDataRetirementPlanInd</xsl:with-param>
                        </xsl:call-template>
                        <span style="font-size:6pt">Retirement<br/>plan<br/>
                        </span>
                      </label>
                      <input class="styCkbox" type="checkbox" style="width:4mm;">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$FormW2ASData/RetirementPlanInd"/>
                          <xsl:with-param name="BackupName">FormW2ASDataRetirementPlanInd</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </div>
                    <span style="width:3mm;float:left;"/>
                    <div class="styGenericDiv" style="width:auto;">
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$FormW2ASData/ThirdPartySickPayInd"/>
                          <xsl:with-param name="BackupName">FormW2ASDataThirdPartySickPayInd</xsl:with-param>
                        </xsl:call-template>
                        <span style="font-size:6pt">Third-party<br/>sick pay<br/>
                        </span>
                      </label>
                      <input class="styCkbox" type="checkbox" style="width:4mm;">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$FormW2ASData/ThirdPartySickPayInd"/>
                          <xsl:with-param name="BackupName">FormW2ASDataThirdPartySickPayInd</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </div>
                </div>
                <!-- (14) Other header-->
                  <div style="width:100%;height:50%;border-bottom:1px solid black;border-top:1px solid black;">
                    <div class="styIRSW2ASLNLeftNumBox" style="padding-right:9px;">14</div>
                    <div class="styGenericDiv" style="">Other</div>
					
                 <span style="padding-top:2mm">
                 <xsl:choose>
					<xsl:when test="(count($FormW2ASData/OtherDeductsBenefits) &lt;=1)">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormW2ASData/OtherDeductsBenefits/Description"/>
						</xsl:call-template>
						<span style="width:3px"/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormW2ASData/OtherDeductsBenefits/Amount"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<span>See Separate Data Table</span>
					</xsl:otherwise>
				</xsl:choose>
				</span>
            </div>
				
            
             </div>
			
            
             <!-- (12 a...) See the separate instructions-->
             
				 <div class="styGenericDiv" style="width:46.5mm;height:100%">
					 <xsl:choose>
							<xsl:when test="count($FormW2ASData/NonUSEmployersUseGrp) &lt;= 4">
								<xsl:for-each select="$FormW2ASData/NonUSEmployersUseGrp">
									<div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black;border-right:1px solid black;">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12<xsl:number value="position()" format="a"/>
											<xsl:call-template name="CreateVerticalWord"/>
										<br/><br/> 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EmployersUseCd"/>
											</xsl:call-template>
										</span>
										
										<span style="text-align:right;width:35mm;height:100%;">
											<xsl:if test="position() = 1">
												<span style="font-family:Arial;padding-right:6px;">See instructions for box 12 </span>
											</xsl:if>
											<br/><br/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:for-each>
								<xsl:if test="count($FormW2ASData/NonUSEmployersUseGrp) = 0">
									<div class="styGenericDiv" style="width:100%;height:24%;border-bottom:1px solid black;border-right:1px solid black;">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12a
											<xsl:call-template name="CreateVerticalWord"/>
										</span>
										<span style="text-align:right;width:33mm;height:100%;">
											<span style="font-family:Arial;padding-right:6px;">See instructions for box 12 </span>
										</span>
									</div>
								</xsl:if>
								<xsl:if test="count($FormW2ASData/NonUSEmployersUseGrp) &lt;= 1">
									<div class="styGenericDiv" style="width:100%;height:25.5%;border-bottom:1px solid black; border-right:1px solid black">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12b
										<xsl:call-template name="CreateVerticalWord"/>
										</span>
									</div>
								</xsl:if>
								<xsl:if test="count($FormW2ASData/NonUSEmployersUseGrp) &lt;= 2">
									<div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black; border-right:1px solid black">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12c
											<xsl:call-template name="CreateVerticalWord"/>
										</span>
									</div>
								</xsl:if>
								<xsl:if test="count($FormW2ASData/NonUSEmployersUseGrp) &lt;= 3">
									<div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black; border-right:1px solid black">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12d
											<xsl:call-template name="CreateVerticalWord"/>
										</span>
										<span></span>
									</div>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black; border-right:1px solid black">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12a
											<xsl:call-template name="CreateVerticalWord"/>
										</span>
										<span style="text-align:right;width:35mm;height:100%;">
											<span style="font-family:Arial;padding-right:6px;">See instructions for box 12 </span><br/><br/>
											See Additional Data Table
										</span>
									</div>
								<div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black; border-right:1px solid black">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12b
											<xsl:call-template name="CreateVerticalWord"/>
										</span>
									</div>
									<div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black; border-right:1px solid black">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12c
											<xsl:call-template name="CreateVerticalWord"/>
										</span>
									</div>
									<div class="styGenericDiv" style="width:100%;height:25%;border-bottom:1px solid black; border-right:1px solid black">
										<span style="width:11mm;border-right:1px solid black;height:100%;font-weight:bold;">12d
											<xsl:call-template name="CreateVerticalWord"/>
										</span>
									</div>
							</xsl:otherwise>
						</xsl:choose>
				 </div>
               </div>

          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <xsl:call-template name="CreateFormHeader"/>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->


          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <xsl:variable name="TableWidth">100</xsl:variable>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormW2ASData"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:if test="$FormW2ASData/CorrectedW2AmericanSamoaInd">
              <xsl:call-template name="PopulateLeftOverCheckbox">
                <xsl:with-param name="Desc">Corrected W2 American Samoa Indicator</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormW2ASData/CorrectedW2AmericanSamoaInd"/>
                <xsl:with-param name="BackupName">FormW2ASDataCorrectedW2AmericanSamoaInd</xsl:with-param>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line C - Employer Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2ASData/EmployerNameControl"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2ASData/StandardOrNonStandardCd"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
          </table>
          <!-- Separated Data for Line 12 -->
          <xsl:if test="($Print = $Separated) or  (count($FormW2ASData/NonUSEmployersUseGrp) &gt; 4)">
            <span class="styRepeatingDataTitle">
              Form W-2AS - Line 12
            </span>
            <table class="styDepTbl" cellspacing="0">
              <thead>
                <tr class="styDepTblHdr">
                  <th class="styIRSW2ASTableCell" scope="col" style="width:50%;height:5mm;color:white;">Code</th>
                  <th class="styIRSW2ASTableCell" scope="col" style="width:50%;height:5mm;color:white;border-left-width:1px;">Amount</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$FormW2ASData/NonUSEmployersUseGrp">
                  <xsl:variable name="Letter">
                    <xsl:number format="a"/>
                  </xsl:variable>
                  <xsl:call-template name="CreateLine12TableRowsColored">
                    <xsl:with-param name="Letter" select="$Letter"/>
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- Separated Data for Line 14 -->
          <xsl:if test="($Print = $Separated) or  (count($FormW2ASData/OtherDeductsBenefits) &gt; 1)">
            <span class="styRepeatingDataTitle">
              Form W-2AS - Line 14 - Other
            </span>
            <table class="styDepTbl" cellspacing="0">
              <thead>
                <tr class="styDepTblHdr">
                  <th class="styIRSW2ASTableCell" scope="col" style="width:75%;height:5mm;color:white;">Description</th>
                  <th class="styIRSW2ASTableCell" scope="col" style="width:25%;height:5mm;color:white;border-left-width:1px;">Amount</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$FormW2ASData/OtherDeductsBenefits">
                  <xsl:variable name="Letter">
                    <xsl:number format="a"/>
                  </xsl:variable>
                  <xsl:call-template name="CreateLine14TableRowsColored">
                    <xsl:with-param name="Letter" select="$Letter"/>
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
