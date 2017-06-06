<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS5329Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form5329Data" select="$RtnDoc/IRS5329"/>
  <!-- ////////////////////////////////////////////////////////////// (Template:  CreateBox) -->
  <xsl:template name="CreateBox">
    <xsl:param name="TargetNode"/>
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
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when><xsl:otherwise>padding-top:6px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:6px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$TargetNode">
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
      </xsl:if>
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
            <xsl:with-param name="RootElement" select="local-name($Form5329Data)"/>
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
        <meta name="Description" content="IRS Form 5329"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS5329Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS5329">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
              <div style="padding-top:1mm;">
                Form<span class="styFormNumber">  5329</span>
              </div>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form5329Data"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service (99)</span>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
              <div class="styMainTitle" style="height:8mm;">
                Additional Taxes on Qualified Plans<br/>(Including IRAs) and Other Tax-Favored Accounts
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold;">
                  <div style="width:100%;height:5mm;padding-left:35px;">
                    <div style="width:80mm;height:5mm;">
                      <br/>
                      <img src="{$ImagePath}/5329_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040 or Form 1040NR.<br/>
                      <img src="{$ImagePath}/5329_Bullet_Sm.gif" alt="SmallBullet"/> 
                      See separate instructions.
                    </div>
                  </div>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;border-left-width:2px;">
              <div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
              <div class="styTY">20<span class="styTYColor">11</span>
              </div>
              <div style="margin-left:3mm;text-align:left;font-size:7pt;">
                Attachment<br/>Sequence No. 
                <span class="styBoldText" style="font-size:9pt;">29</span>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
              Name of individual subject to additional tax. If married filing jointly, see instructions.<br/>
              <xsl:choose>
				  <xsl:when test="$Form5329Data/PersonName">
					  <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="$Form5329Data/PersonName"/>
					  </xsl:call-template>
				  </xsl:when>
				  <xsl:otherwise>
					  <xsl:call-template name="PopulateReturnHeaderFiler">
						  <xsl:with-param name="TargetNode">Name</xsl:with-param>
						  <xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
					  </xsl:call-template>
				  </xsl:otherwise>
              </xsl:choose>
            </div>
            <div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
              Your social security number
              <br/>
              <span style="font-weight:normal;text-align:left;width:100%">
                <xsl:choose>
				  <xsl:when test="$Form5329Data/SSN">
					  <xsl:call-template name="PopulateSSN">
						  <xsl:with-param name="TargetNode" select="$Form5329Data/SSN"/>
					  </xsl:call-template>
				  </xsl:when>
				  <xsl:otherwise>
					  <xsl:call-template name="PopulateReturnHeaderFiler">
						  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
						  <xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
					  </xsl:call-template>
				  </xsl:otherwise>
              </xsl:choose>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <!-- Begin Top Section -->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS5329LineItem" style="height:18mm;">
              <!-- Left Panel -->
              <div class="styIRS5329LineItem" style="width:28%;float:left;height:18mm;">
                <!-- Text -->
                <div class="styIRS5329LineItem" style="width:83%;float:left;font-size:8pt;padding:7px, 0px 7px 0px;">
                  <span class="styBoldText">
                    Fill in Your Address Only<br/>
                    If You Are Filing This<br/>
                    Form by Itself and Not<br/>
                    With Your Tax Return<br/>
                  </span>
                </div>
                <!-- Image -->
                <div class="styIRS5329LineItem" style="width:17%;float:left;padding:7px 0px 7px 8px;border-right-width:1px;border-color:black;height:100%">
                  <img src="{$ImagePath}/5329_Bullet_Lg.gif" alt="SmallBullet"/>
                </div>
              </div>
              <!-- Right Panel -->
              <div class="styIRS5329LineItem" style="width:72%;float:left;height:18mm;">
                <div class="styIRS5329LineItem" style="width:100%;border-bottom-width:1px;border-color:black;height:50%;">
                  <div class="styIRS5329LineItem" style="width:118mm;height:100%;float:left;padding-left:4px;">
                    Home address (number and street), or P.O. box if mail is not delivered to your home
                    <br/>
                    <xsl:if test="$RtnHdrData/Filer/USAddress">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
                      </xsl:call-template>
                      <xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2">
						  <br/>
						  <xsl:call-template name="PopulateReturnHeaderFiler">
							 <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
						  <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
                      </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="$RtnHdrData/Filer/ForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
                      </xsl:call-template>
                      <xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine2">
						  <br/>
						  <xsl:call-template name="PopulateReturnHeaderFiler">
							 <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                          <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
                      </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </div>
                  <div class="styIRS5329LineItem" style="width:15mm;height:100%;float:right;border-left-width:1px;border-color:black;padding-left:5px;">
                    Apt. no. <br/>
                  </div>
                </div>
                <div class="styIRS5329LineItem" style="width:100%;height:50%;">
                  <div class="styIRS5329LineItem" style="width:83mm;height:100%;float:left;padding-left:4px;">
                    City, town or post office, state, and ZIP code
                    <br/>
                    <xsl:if test="$RtnHdrData/Filer/USAddress">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">State</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressZip</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$RtnHdrData/Filer/ForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressProvinceOrState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressZip</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">Country</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressCountry</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </div>
                  <div class="styIRS5329LineItem" style="width:50mm;height:100%;float:right;border-left-width:1px;border-color:black;padding-left:5px;padding-top:3px;">
                    If this is an amended<br/>return, check here
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:6px"/>
                      <img src="{$ImagePath}/5329_Bullet_Sm.gif" alt="SmallBullet"/>
                      <span style="width:5px"/>
                      <span>
						  <xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5329Data/AmendedInd"/>
								<xsl:with-param name="BackupName">IRS5329AmendedReturnInd</xsl:with-param>
						  </xsl:call-template>
						  <input type="checkbox" class="styCkbox" alt="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form5329Data/AmendedInd"/>
								  <xsl:with-param name="BackupName">IRS5329AmendedReturnInd</xsl:with-param>
								</xsl:call-template>
						  </input>
                      </span>
                      <span style="width:2mm;"/>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form5329Data/AmendedReturnInd"/>
                          <xsl:with-param name="BackupName">IRS5329AmendedReturnInd</xsl:with-param>
                        </xsl:call-template>
                      </label>
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            If you <b>only</b> owe the additional 10% tax on early distributions, you may be able to report this tax directly on Form 1040, line 58, or<br/>
            Form 1040NR, line 56, without filing Form 5329. See the instructions for Form 1040, line 58, or for Form 1040NR, line 56.
          </div>
          <!-- End Top Section -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part I                                                  -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Early Distributions<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if you took a taxable distribution before you reached age 59½ from a qualified retirement plan (including an IRA) or 
                modified endowment contract (unless you are reporting this tax directly on Form 1040 or Form 1040NR—see above). You may also have
                to complete this part to indicate that you qualify for an exception to the additional tax on early distributions or for certain Roth IRA
                distributions (see instructions).
              </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (1) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">1</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Early distributions included in income. For Roth IRA distributions, see instructions
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/EarlyDistributionsAmt"/>
                <xsl:with-param name="Number">1</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (2) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">2</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Early distributions included on line 1 that are not subject to the additional tax (see instructions).<br/>
                  Enter the appropriate exception number from the instructions:
                  <span style="width:3px;"/>
                  <span style="border-width:0px 0px 1px 0px;border-style:solid;border-color:black;width:8mm;text-align:center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form5329Data/EarlyDistriExceptionReasonCd"/>
                    </xsl:call-template>
                  </span>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:21px"/>.
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
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/EarlyDistriNotSubjectToTaxAmt"/>
                    <xsl:with-param name="Number">2</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (3) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">3</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Amount subject to additional tax. Subtract line 2 from line 1
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/EarlyDistriSubjectToTaxAmt"/>
                <xsl:with-param name="Number">3</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (4) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">4</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  <b>Additional tax.</b> Enter 10% (.10) of line 3. Include this amount on Form 1040, line 58, or Form<br/>
                  1040NR, line 56
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
                  <b>Caution:</b>
                  <span class="styItalicText">If any part of the amount on line 3 was a distribution from a SIMPLE IRA, you may have<br/>
                  to include 25% of that amount on line 4 instead of 10% (see instructions).</span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/IRAEarlyDistributionsTaxAmt"/>
                    <xsl:with-param name="Number">4</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">6.5mm</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 0px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part II                                                 -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Certain Distributions From Education Accounts<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if you included an amount in income, on Form 1040 or Form 1040NR, line 21, from a Coverdell 
                education savings account (ESA) or a qualified tuition program (QTP).
              </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (5) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">5</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Distributions included in income from Coverdell ESAs and QTPs
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/EducAcctDistributionAmt"/>
                <xsl:with-param name="Number">5</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (6) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">6</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Distributions included on line 5 that are not subject to the additional tax (see instructions)
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/EducAcctDistriNotSubjToTaxAmt"/>
                <xsl:with-param name="Number">6</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (7) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">7</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Amount subject to additional tax. Subtract line 6 from line 5
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/EducAcctDistriSubjectToTaxAmt"/>
                <xsl:with-param name="Number">7</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (8) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">8</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  <b>Additional tax.</b> Enter 10% (.10) of line 7. Include this amount on Form 1040, line 58, or Form 1040NR, line 56
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/EducIRADistributionsTaxAmt"/>
                    <xsl:with-param name="Number">8</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part III                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part III</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Excess Contributions to Traditional IRAs<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if you contributed more to your traditional IRAs for 2011 than is allowable or you had an amount on<br/>
                line 17 of your 2010 Form 5329.
              </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (9) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">9</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Enter your excess contributions from line 16 of your 2010 Form 5329 (see instructions). If zero, go<br/>
                  to line 15
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
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContriPriorYearAmt"/>
                    <xsl:with-param name="Number">9</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (10) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">10</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  If your traditional IRA contributions for 2011 are less than your<br/>
                  maximum allowable contribution, see instructions. Otherwise, enter -0-
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContriCreditAmt"/>
                    <xsl:with-param name="Number">10</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (11) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">11</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  2011 traditional IRA distributions included in income (see instructions)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:4px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/IRADistriIncludedInIncomeAmt"/>
                    <xsl:with-param name="Number">11</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (12) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">12</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  2011 distributions of prior year excess contributions (see instructions)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:6px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContriWithdrawnAmt"/>
                    <xsl:with-param name="Number">12</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (13) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">13</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Add lines 10, 11, and 12
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
                  </span>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContriAdjustmentAmt"/>
                <xsl:with-param name="Number">13</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (14) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">14</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Prior year excess contributions. Subtract line 13 from line 9. If zero or less, enter -0-
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContriPrYrAdjustAmt"/>
                <xsl:with-param name="Number">14</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (15) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">15</div>
                <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Excess contributions for 2011 (see instructions)
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
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContriCurrentYearAmt"/>
                  <xsl:with-param name="Number">15</xsl:with-param>
                </xsl:call-template>
            </div>
            <!-- (16) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">16</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                Total excess contributions. Add lines 14 and 15
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContriTotalAmt"/>
                <xsl:with-param name="Number">16</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (17) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">17</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  <b>Additional tax.</b> Enter 6% (.06) of the <b>smaller</b> of line 16 <b>or</b> the value of your traditional IRAs on December 31, 2011
                  (including 2011 contributions made in 2012). Include this amount on Form 1040, line 58, or Form 1040NR, line 56 .
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/IRAExcessContribTaxAmt"/>
                    <xsl:with-param name="Number">17</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part IV                                                 -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part IV</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Excess Contributions to Roth IRAs<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if you contributed more to your Roth IRAs for 2011 than is allowable or you had an amount on line 25<br/>
                of your 2010 Form 5329.
              </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styTBB" style="width:187mm;">
            <!-- (18) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">18</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Enter your excess contributions from line 24 of your 2010 Form 5329 (see instructions). If zero, go to <br/>line 23
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
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRAExcessContriPriorYrAmt"/>
                    <xsl:with-param name="Number">18</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (19) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">19</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  If your Roth IRA contributions for 2011 are less than your maximum<br/>
                  allowable contribution, see instructions. Otherwise, enter -0-
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:13px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRAExcessContriCreditAmt"/>
                    <xsl:with-param name="Number">19</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (20) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">20</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  2011 distributions from your Roth IRAs (see instructions)
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRADistriIncludedInCYAmt"/>
                    <xsl:with-param name="Number">20</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (21) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem" style="page-break-after:always;">
              <div class="styIRS5329LNLeftNumBox">21</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Add lines 19 and 20
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRAExcessContriAdjustAmt"/>
                <xsl:with-param name="Number">21</xsl:with-param>
              </xsl:call-template>
            </div>
            
            <!-- (22) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">22</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Prior year excess contributions. Subtract line 21 from line 18. If zero or less, enter -0-
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRAExcessContriPYWthdrwAmt"/>
                <xsl:with-param name="Number">22</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (23) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">23</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Excess contributions for 2011 (see instructions)
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRAExcessContriCYAmt"/>
                <xsl:with-param name="Number">23</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (24) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">24</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Total excess contributions. Add lines 22 and 23
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRAExcessContriTotalAmt"/>
                <xsl:with-param name="Number">24</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (25) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">25</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  <b>Additional tax.</b> Enter 6% (.06) of the <b>smaller</b> of line 24 <b>or</b> the value of your Roth IRAs on December 31, 2011
                  (including 2011 contributions made in 2012). Include this amount on Form 1040, line 58, or Form 1040NR, line 56 .
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/RothIRAExcessContribTaxAmt"/>
                    <xsl:with-param name="Number">25</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">
                For Privacy Act and Paperwork Reduction Act Notice, see your tax return instructions.
              </span>
            </div>
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">5329</span> (2011)
            </div>
            <div style="float:right;text-align:center;width:26mm;font-size:7pt;">
              Cat. No. 13329Q
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">
              Form 5329 (2011)<span style="width:148mm;"/>
            </div>
            <div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part V                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part V</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Excess Contributions to Coverdell ESAs<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if the contributions to your Coverdell ESAs for 2011 were more than is allowable or you had an amount
                on line 33 of your 2010 Form 5329.
              </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (26) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">26</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Enter the excess contributions from line 32 of your 2010 Form 5329 (see instructions). If zero, go to<br/>
                  line 31
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
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/ESAExcessContriPriorYearAmt"/>
                    <xsl:with-param name="Number">26</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (27) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">27</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  If the contributions to your Coverdell ESAs for 2011 were less than the<br/>
                  maximum allowable contribution, see instructions. Otherwise, enter -0-
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/ESAExcessContriCreditAmt"/>
                    <xsl:with-param name="Number">27</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (28) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">28</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  2011 distributions from your Coverdell ESAs (see instructions)
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/ESADistriIncludedInCYAmt"/>
                    <xsl:with-param name="Number">28</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (29) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">29</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Add lines 27 and 28
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/ESAExcessContriAdjustmentAmt"/>
                <xsl:with-param name="Number">29</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (30) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">30</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Prior year excess contributions. Subtract line 29 from line 26. If zero or less, enter -0-
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/ESAExcessContriPYWthdrwAmt"/>
                <xsl:with-param name="Number">30</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (31) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">31</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Excess contributions for 2011 (see instructions)
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/ESAExcessContriCYAmt"/>
                <xsl:with-param name="Number">31</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (32) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">32</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  Total excess contributions. Add lines 30 and 31
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
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/ESAExcessContriTotalAmt"/>
                <xsl:with-param name="Number">32</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (33) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">33</div>
              <div class="styIRS5329LNDesc" style="padding-top:.75mm;padding-left:3mm;width:143mm;height:100%;">
                  <b>Additional tax.</b> Enter 6% (.06) of the <b>smaller</b> of line 32 <b>or</b> the value of your Coverdell ESAs on
                  December 31, 2011 (including 2011 contributions made in 2012). Include this amount on Form
                  1040, line 58, or Form 1040NR, line 56
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
                    <span style="width:11px"/>.
                  </span>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">6mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/EducIRAExcessContribTaxAmt"/>
                <xsl:with-param name="Number">33</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part VI                                                 -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part VI</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Excess Contributions to Archer MSAs<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if you or your employer contributed more to your Archer MSAs for 2011 than is allowable or you had
                an amount on line 41 of your 2010 Form 5329.
              </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (34) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">34</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Enter the excess contributions from line 40 of your 2010 Form 5329 (see instructions). If zero, go to <br/>
                  line 39
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/ArcherMSAExcessContriPrYrAmt"/>
                    <xsl:with-param name="Number">34</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (35) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">35</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  If the contributions to your Archer MSAs for 2011 are less than the<br/>
                  maximum allowable contribution, see instructions. Otherwise, enter -0-
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/ArcherMSAExcessContriCreditAmt"/>
                    <xsl:with-param name="Number">35</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (36) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">36</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  2011 distributions from your Archer MSAs from Form 8853, line 8
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/TaxableArcherMSADistriAmt"/>
                    <xsl:with-param name="Number">36</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (37) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">37</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Add lines 35 and 36
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/ArcherMSAExcessContriAdjAmt"/>
                <xsl:with-param name="Number">37</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (38) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">38</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Prior year excess contributions. Subtract line 37 from line 34. If zero or less, enter -0-
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/ArcherMSAExContriPYWthdrwAmt"/>
                <xsl:with-param name="Number">38</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (39) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">39</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Excess contributions for 2011 (see instructions)
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/ArcherMSAExcessContriCYAmt"/>
                <xsl:with-param name="Number">39</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (40) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">40</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Total excess contributions. Add lines 38 and 39
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/ArcherMSAExcessContriTotalAmt"/>
                <xsl:with-param name="Number">40</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (41) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">41</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  <b>Additional tax.</b> Enter 6% (.06) of the <b>smaller</b> of line 40 <b>or</b> the value of your Archer MSAs on <br/>
                  December 31, 2011 (including 2011 contributions made in 2012). Include this amount on Form
                  1040, line 58, or Form 1040NR, line 56
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">6mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/MSAExcessContribTaxAmt"/>
                <xsl:with-param name="Number">41</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part VII                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part VII</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Excess Contributions to Health Savings Accounts (HSAs)<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if you, someone on your behalf, or your employer contributed more to your HSAs for 2011 than is
                allowable or you had an amount on line 49 of your 2010 Form 5329.
              </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <!-- (42) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">42</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Enter the excess contributions from line 48 of your 2010 Form 5329. If zero, go to line 47
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/HSAExcessContriPriorYearAmt"/>
                <xsl:with-param name="Number">42</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (43) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">43</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  If the contributions to your HSAs for 2011 are less than the maximum<br/>
                  allowable contribution, see instructions. Otherwise, enter -0-
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:13px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:4mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/HSAExcessContriCreditAmt"/>
                    <xsl:with-param name="Number">43</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (44) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">44</div>
              <div class="styIRS5329LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  2011 distributions from your HSAs from Form 8889, line 16
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/TaxableHSADistributionAmt"/>
                    <xsl:with-param name="Number">44</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (45) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">45</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Add lines 43 and 44
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/HSAExcessContriAdjustmentAmt"/>
                <xsl:with-param name="Number">45</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (46) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">46</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Prior year excess contributions. Subtract line 45 from line 42. If zero or less, enter -0-
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/HSAExcessContriPYAdjustedAmt"/>
                <xsl:with-param name="Number">46</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (47) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">47</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Excess contributions for 2011 (see instructions)
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/HSAExcessContriCurrentYearAmt"/>
                <xsl:with-param name="Number">47</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (48) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">48</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Total excess contributions. Add lines 46 and 47
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                <xsl:with-param name="TargetNode" select="$Form5329Data/HSAExcessContriTotalAmt"/>
                <xsl:with-param name="Number">48</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (49) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">49</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  <b>Additional tax.</b> Enter 6% (.06) of the <b>smaller</b> of line 48 <b>or</b> the value of your HSAs on December 31, 2011
                  (including 2011 contributions made in 2012). Include this amount on Form 1040, line 58, or Form 1040NR, line 56
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/HSAExcessContribTaxAmt"/>
                    <xsl:with-param name="Number">49</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part VII                                                -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part VIII</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Additional Tax on Excess Accumulation in Qualified Retirement Plans (Including IRAs)<br/>
              <span class="styNormalText" style="font-size:6.5pt;">
                Complete this part if you did not receive the minimum required distribution from your qualified retirement plan.
              </span>
            </div>
          </div>
          <!-- Body -->
            <!-- (50) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">50</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Minimum required distribution for 2011 (see instructions)
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/QlfyRetirePlanMinRqrDistriAmt"/>
                <xsl:with-param name="Number">50</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (51) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">51</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Amount actually distributed to you in 2011
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/QlfyRetirePlanActualDistriAmt"/>
                <xsl:with-param name="Number">51</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (52) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem">
              <div class="styIRS5329LNLeftNumBox">52</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  Subtract line 51 from line 50. If zero or less, enter -0-
                  <xsl:if test="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtAmt">
                    <span style="width:5px"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Waive Tax On Ex Accum QRP Statement Amount</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtAmt"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtCd">
                    <span style="width:5px"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Waive Tax On Ex Accum QRP Statement Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtCd"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
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
                    <xsl:if test="not($Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtAmt)">
                      <span style="width:11px"/>.
                    </xsl:if>
                    <xsl:if test="not($Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtCd)">
                      <span style="width:11px"/>.
                    </xsl:if>
                  </span>
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form5329Data/QlfyRetirePlanExcessAccumAmt"/>
                <xsl:with-param name="Number">52</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (53) ////////////////////////////////////////////////////-->
            <div class="styIRS5329LineItem" style="border-bottom:1 solid black;">
              <div class="styIRS5329LNLeftNumBox">53</div>
              <div class="styIRS5329LNDesc" style="width:143mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="width:auto;height:100%;">
                  <b>Additional tax.</b> Enter 50% (.50) of line 52. Include this amount on Form 1040, line 58, or Form 1040NR, line 56
                </div>
              </div>
              <div class="styIRS5329LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS5329LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS5329LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form5329Data/RtmntAnntyExcessContribTaxAmt"/>
                    <xsl:with-param name="Number">53</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Signature                                                   -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
            <div class="styIRS5329LineItem" style="border-bottom:1 solid black;">
              <div class="styIRS5329LNDesc" style="width:39mm;height:100%;padding:0px 0px 0px 0px;border-right-width:1px;border-color:black;">
                <span class="styBoldText" style="font-size:7.5pt;padding:16px 0px 16px 0px;height:100%">
                  Sign Here Only If You<br/>
                  Are Filing This Form by<br/>
                  Itself and Not With Your<br/>
                  Tax Return
                </span>
              </div>
              <div class="styIRS5329LNDesc" style="width:147mm;height:100%;padding:0px 0px 0px 5px;">
                Under penalties of perjury, I declare that I have examined this form, including accompanying attachments, and to the best of my
                knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which
                preparer has any knowledge.
                <br/><br/><br/>
                <span class="styIRS5329LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">
                  <img src="{$ImagePath}/5329_Bullet_Md.gif" alt="MediumBullet"/>
                </span>
                <span class="styIRS5329LNDesc" style="width:85mm;padding:0px 0px 0px 5px;">
                  <span class="styIRS5329LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;"/>
                  <span class="styIRS5329LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
                    Your signature
                  </span>
                </span>
                <span class="styIRS5329LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">
                  <img src="{$ImagePath}/5329_Bullet_Md.gif" alt="MediumBullet"/>
                </span>
                <span class="styIRS5329LNDesc" style="width:50mm;padding:0px 0px 0px 5px;">
                  <span class="styIRS5329LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;"/>
                  <span class="styIRS5329LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
                    Date
                  </span>
                </span>
              </div>
            </div>
            <!-- Printing error fix. -->
			<div class="pageEnd" style="width:187mm;font-size:0pt;height:0mm;"/>
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Paid Preparer Section                                           -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <div class="styTBB" style="width:187mm;font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
              <span class="styMainTitle" style="font-size:11pt;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;padding-left:3px;">
                Print/Type preparer's name<br/>
                <span>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/PreparerPersonName"/>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
                  </xsl:call-template>
                  </span>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
                Preparer's signature
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
                    </xsl:call-template>
                    Check 
                    <span>
                    <xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
                    </xsl:call-template>
                    <input class="styCkbox" type="checkbox" alt="Checkbox" style="height:4mm;width:4mm;">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    </span>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerSSN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/PTIN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/STIN">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">STIN</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
                  <span class="styGenericDiv" style="padding-left:3px;">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/5329_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
                    </xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/5329_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                  <span style="width:4px;"/>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerFirmIDNumber">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$RtnHdrData/PaidPreparerInformation/MissingEINReason">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
                  <div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
                  <img src="{$ImagePath}/5329_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                      <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                      <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerUSAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">State</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerForeignAddress">
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">City</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
                      </xsl:call-template>,
                      <span style="width:2px;"/>
                      <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                        <xsl:with-param name="TargetNode">Country</xsl:with-param>
                        <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </div>
                </div>
                <div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
                <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">Phone</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
                  </xsl:call-template>
                  <xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
                    <xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
                    <xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">5329</span> (2011)
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
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form5329Data"/>
              <xsl:with-param name="DescWidth" select="130"/>
            </xsl:call-template>
            <xsl:if test="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtAmt">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part VIII, Line 52 - Waive Tax On Ex Accum QRP Statement Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtAmt"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part VIII, Line 52 - Waive Tax On Ex Accum QRP Statement Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form5329Data/QlfyRetirePlanExcessAccumAmt/@waiveTaxOnExAccumQRPStmtCd"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
