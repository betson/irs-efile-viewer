<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8873Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8873"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Form IRS 8873"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8873Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form8873">
          <label/>
          <xsl:call-template name="DocumentHeader"/>
          <!-- Title of Form8873  -->
          <div class="styBB" style="width:187mm;height: 19mm">
            <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 20mm">
      Form <span class="styFormNumber" style="padding-top: 1mm">8873</span>
              <br/>
              <div class="styAgency" style="padding-top: 4mm">Department of the Treasury<br/>Internal Revenue Service</div>
            </div>
            <div class="styFTBox" style="width:125mm">
              <div class="styMainTitle" style="padding-top: 2.5mm; font-size:13pt">Extraterritorial Income Exclusion</div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold">
                <div style="padding-top: 3mm">
                  <img src="{$ImagePath}/8873_Bullet_Sm.gif" alt="SmalllBullet"/> 
          Attach to your tax return.
        </div>
                <div style="padding-top: 1mm">
                  <img src="{$ImagePath}/8873_Bullet_Sm.gif" alt="SmallBullet"/> 
          See separate instructions.
        </div>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1722</div>
              <div class="styTaxYear">20<span class="styTYColor">09</span>
              </div>
              <div class="stySequence">Attachment<br/>Sequence No. <b>126</b>
              </div>
            </div>
          </div>
          <!--  End title of Form 8873 -->
          <!--  Name and Employer identification number  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) as shown on return<br/>
              <div>
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/Name) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/Name/BusinessNameLine1"/>
                    </xsl:call-template>
                    <xsl:if test="normalize-space($FormData/Name/BusinessNameLine2)!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/Name/BusinessNameLine2"/>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
            <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Identifying number</span>
              <br/>
              <br/>
              <div class="styNormalText" style="text-align:left;">
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/IdentifyingNumber) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/IdentifyingNumber"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
          </div>
          <!--  End Name and Employer indentification number  -->
          <!--  Part I -->
          <div class="styBB" style="width: 187mm">
            <div class="styPartName" style="width: 15mm; font-size: 10pt">Part I</div>
            <div class="styPartDesc" style="font-size: 8pt">Elections and Other Information</div>
          </div>
          <!--  End Part I -->
          <!--  Line 1  -->
          <div style="width: 187mm">
            <div style="float:left">
              <div class="styLNLeftNumBox" style="padding-left: 3mm">1</div>
              <div class="styLNDesc" style="width: 167mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/CategoryOfFiler1"/>
                  </xsl:call-template>
        Check the box if you are electing under section 942(a)(3) to exclude a portion of your gross receipts from foreign trading <br/>gross
        receipts on line 15. Attach a schedule indicating which receipts are being excluded
      </label>
                <span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/UnderSection942a3Box"/>
                  </xsl:call-template>
                </span>
                <span style="width:8px"/>
                <span class="styBoldText">
                  <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
              </div>
            </div>
            <div style="float:right; padding-top: 2mm">
              <img src="{$ImagePath}/8873_Bullet_Lg.gif" alt="MediumBullet"/>
              <span style="width: 1mm"/>
              <input type="checkbox" class="styCkbox" name="UnderSection942a3Box">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/UnderSection942a3Box"/>
                  <xsl:with-param name="BackupName">IRS8873UnderSection942a3Box</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/UnderSection942a3Box"/>
                  <xsl:with-param name="BackupName">IRS8873UnderSection942a3Box</xsl:with-param>
                </xsl:call-template>
              </label>
            </div>
          </div>
          <!--  End Line 1  -->
          <!--  Line 2  -->
          <div style="width: 187mm">
            <div style="float:left">
              <span class="styLNLeftNumBox" style="padding-left: 3mm">2</span>
              <div class="styLNDesc" style="width: 167mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/TransInLieuOfFSCPrvsnBox"/>
                    <xsl:with-param name="BackupName">IRS8873TransInLieuOfFSCPrvsnBox</xsl:with-param>
                  </xsl:call-template>Check the box if you are electing to apply the extraterritorial income 
                exclusion provisions to certain transactions involving<br/>a FSC (see instructions). 
                Attach a schedule listing the affected transactions
      </label>
                <span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/TransInLieuOfFSCPrvsnBox"/>
                  </xsl:call-template>
                </span>
                <span style="width:8px"/>
                <span class="styBoldText">
                  <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
              </div>
            </div>
            <div style="float:right; padding-top: 0mm">
              <img src="{$ImagePath}/8873_Bullet_Lg.gif" alt="MediumBullet"/>
              <span style="width: 1mm"/>
              <input type="checkbox" class="styCkbox" name="TransInLieuOfFSCPrvsnBox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/TransInLieuOfFSCPrvsnBox"/>
                  <xsl:with-param name="BackupName">IRS8873TransInLieuOfFSCPrvsnBox</xsl:with-param>
                </xsl:call-template>
              </input>
            </div>
          </div>
          <!--  Line 2  -->
          <!--  Line 3 -->
          <div style="width: 187mm">
            <div style="float:left">
              <span class="styLNLeftNumBox" style="padding-left: 3mm">3</span>
              <div class="styLNDesc" style="width: 167mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/TransInLieuOfFSCPrvsnBox"/>
                    <xsl:with-param name="BackupName">IRS8873TransInLieuOfFSCPrvsnBox</xsl:with-param>
                  </xsl:call-template>Check the box if the taxpayer is a foreign corporation electing to
                 be treated as a domestic corporation (see instructions)
      </label>
                <span style="padding-right: 2.25mm">
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/ToBeTreatedAsADomesticCorpBox"/>
                  </xsl:call-template>
                </span>
                <span class="styBoldText"/>
              </div>
            </div>
            <div style="float:right">
              <img src="{$ImagePath}/8873_Bullet_Lg.gif" alt="MediumBullet"/>
              <span style="width: 1mm"/>
              <input type="checkbox" class="styCkbox" name="TransInLieuOfFSCPrvsnBox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ToBeTreatedAsADomesticCorpBox"/>
                  <xsl:with-param name="BackupName">IRS8873ToBeTreatedAsADomesticCorpBox</xsl:with-param>
                </xsl:call-template>
              </input>
            </div>
          </div>
          <!--  Line 3  -->
          <!--  Line 4a -->
          <div style="width: 187mm">
            <div style="float:left">
              <span class="styLNLeftNumBox" style="padding-left: 3mm">4a</span>
              <div class="styLNDesc" style="width: 152mm">
      Are you excepted from the foreign economic process requirements because your foreign trading gross receipts are $5 million or less?
      <span class="styBoldText">
                  <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
              </div>
            </div>
            <div style="padding-top: 4mm;width:15mm;height:4.5mm;" class="styLNDesc">
              <img src="{$ImagePath}/8873_Bullet_Lg.gif" alt="MediumBullet"/>
              <span style="width: 2px;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$FormData/ExceptedFromFrgnRequirements"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/ExceptedFromFrgnRequirements"/>
                    <xsl:with-param name="BackupName">IRS8873ExceptedFromFrgnRequirements</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1px;"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/ExceptedFromFrgnRequirements"/>
                  <xsl:with-param name="BackupName">IRS8873ExceptedFromFrgnRequirements</xsl:with-param>
                </xsl:call-template>Yes
      </label>
              <span style="width: 2px"/>
            </div>
            <div style="padding-top: 4mm;width:9mm;height:4.5mm;float:right;" class="styLNDesc">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$FormData/ExceptedFromFrgnRequirements"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/ExceptedFromFrgnRequirements"/>
                    <xsl:with-param name="BackupName">IRS8873ExceptedFromFrgnRequirements</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:2px;"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/ExceptedFromFrgnRequirements"/>
                  <xsl:with-param name="BackupName">IRS8873ExceptedFromFrgnRequirements</xsl:with-param>
                </xsl:call-template>No
      </label>
            </div>
          </div>
          <!--  Line 4a  -->
          <!--  Line 4b -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left: 5mm">b</div>
            <div class="styLNDesc">If “No,” check the applicable box to indicate how you met the foreign economic process requirements:</div>
          </div>
          <div style="width: 187mm">
            <div class="styLNDesc" style="margin-left: 4mm">
              <span class="styBoldText">(1)</span>
              <span style="width: 2mm"/>
              <input type="checkbox" class="styCkbox" name="Met50PCTFrgnDirectCostTest">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/Met50PCTFrgnDirectCostTest"/>
                  <xsl:with-param name="BackupName">IRS8873Met50PCTFrgnDirectCostTest</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width: 2mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/Met50PCTFrgnDirectCostTest"/>
                  <xsl:with-param name="BackupName">IRS8873Met50PCTFrgnDirectCostTest</xsl:with-param>
                </xsl:call-template>You met the 50% foreign direct cost test (see instructions).
      </label>
            </div>
          </div>
          <div style="width: 187mm">
            <div class="styLNDesc" style="margin-left: 4mm">
              <span class="styBoldText">(2)</span>
              <span style="width: 2mm"/>
              <input type="checkbox" class="styCkbox" name="MetAlt85PCTFrgnDirectCostTest">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/MetAlt85PCTFrgnDirectCostTest"/>
                  <xsl:with-param name="BackupName">IRS8873MetAlt85PCTFrgnDirectCostTest</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width: 2mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/MetAlt85PCTFrgnDirectCostTest"/>
                  <xsl:with-param name="BackupName">IRS8873MetAlt85PCTFrgnDirectCostTest</xsl:with-param>
                </xsl:call-template>
                You met the alternative 85% foreign direct cost test (see instructions).
      </label>
            </div>
          </div>
          <!--  Line 4b  -->
          <!--  Line 5  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 3mm">5</div>
            <div class="sty8873LongLNDesc" style="float: left; clear:none; padding-top: .5mm">See instructions before completing lines 5a through 5c. <span class="styBoldText"> Note:</span>
              <span class="styItalicText"> 
        For transactions for which the exclusion is determined using<br/>the foreign sale and leasing income method (i.e., line 44 equals line 45), complete only lines 5a and 5c(1).
      </span>
            </div>
          </div>
          <!--  Line 5  -->
          <!-- Line 5a and 5b  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left: 5mm">a</div>
            <div class="styLNDesc" style="width: 75mm">Business activity code
      <span style="width: 40mm; border-style: solid; border-color: black; border-top-width: 0px; 
      border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px">
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/BusinessActivityCode)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/BusinessActivityCode"/>
                    </xsl:call-template>
                    <span style="width: 2px"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/InactiveBusinessActivityCode"/>
                    </xsl:call-template>
                    <span style="width: 2px"/>
                  </xsl:otherwise>
                </xsl:choose>
              </span>
            </div>
            <div class="styLNLeftLtrBox" style="padding-left: 5mm; padding-top: .5mm">b</div>
            <div class="styLNDesc" style="width: 90mm">
              <div style="float:left; valign:top"> Product or product line</div>
              <div style="float: right; width: 55mm; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/ProductOrProductLine"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  Line 5a and 5b  -->
          <!-- Line 5c  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left: 5mm">c</div>
            <div class="styLNDesc" style="padding-top: .75mm">Check the applicable box to indicate the basis of your reporting:</div>
          </div>
          <div style="width: 187mm">
            <div class="styLNDesc" style="margin-left: 4mm">
              <span class="styBoldText">(1)</span>
              <span style="width: 4mm"/>Transaction-by-transaction:</div>
          </div>
          <div style="width: 187mm">
            <div class="styIRS8873LongLNDesc" style="margin-left: 5mm">
              <span class="styBoldText">(a)</span>
              <span style="width: 2mm"/>
              <input type="checkbox" class="styCkbox" name="AggregateOnForm8873Box">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/AggregateOnForm8873Box"/>
                  <xsl:with-param name="BackupName">IRS8873AggregateOnForm8873Box</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width: 2mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/AggregateOnForm8873Box"/>
                  <xsl:with-param name="BackupName">IRS8873AggregateOnForm8873Box</xsl:with-param>
                </xsl:call-template>Aggregate on Form 8873
      </label>
              <span style="width: 4mm"/>
              <span class="styBoldText">(b)</span>
              <span style="width: 2mm"/>
              <input type="checkbox" class="styCkbox" name="AggregateOnTabularScheduleBox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/AggregateOnTabularScheduleBox"/>
                  <xsl:with-param name="BackupName">IRS8873AggregateOnTabularScheduleBox</xsl:with-param>
                </xsl:call-template>
              </input>
              <!-- Label Correction -->
              <span style="width: 2mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/AggregateOnTabularScheduleBox"/>
                  <xsl:with-param name="BackupName">IRS8873AggregateOnTabularScheduleBox</xsl:with-param>
                </xsl:call-template>Aggregate on tabular schedule
     </label>
              <span style="width: 4mm"/>
              <span class="styBoldText">(c)</span>
              <span style="width: 2mm"/>
              <input type="checkbox" class="styCkbox" name="TabularSchOfTransactionsBox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/TabularSchOfTransactionsBox"/>
                  <xsl:with-param name="BackupName">IRS8873TabularSchOfTransactionsBox</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width: 2mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/TabularSchOfTransactionsBox"/>
                  <xsl:with-param name="BackupName">IRS8873TabularSchOfTransactionsBox</xsl:with-param>
                </xsl:call-template>Tabular schedule of transactions
      </label>
              <span style="padding-right: 2.25mm">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/TabularSchOfTransactionsBox"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <div style="width: 187mm; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
            <div class="styLNDesc" style="margin-left: 4mm; width: 175mm">
              <span class="styBoldText">(2)</span>
              <span style="width: 4.25mm"/>
              <input type="checkbox" class="styCkbox" name="GroupOfTransactionsBox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/GroupOfTransactionsBox"/>
                  <xsl:with-param name="BackupName">IRS8873GroupOfTransactionsBox</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width: 2mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/GroupOfTransactionsBox"/>
                  <xsl:with-param name="BackupName">IRS8873GroupOfTransactionsBox</xsl:with-param>
                </xsl:call-template>Group of transactions 
        </label>
            </div>
          </div>
          <!--  Line 5c  -->
          <!--  Part II -->
          <div class="styBB" style="width: 187mm">
            <div class="styPartName" style="width: 15mm; font-size: 10pt">Part II</div>
            <div class="styPartDesc" style="font-size: 8pt">Foreign Trade Income and Foreign Sale and Leasing Income</div>
          </div>
          <!--  End Part II -->
          <!--  Heading -->
          <div style="width: 187mm">
            <div class="styLNDesc" style=" margin-left: 4mm; width: 107mm">
              <span class="styBoldText">Caution:  </span>
              <span class="styItalicText">
        If a related person is also eligible for an extraterritorial income <br/>exclusion, see 
        <span class="styBoldText">Excluded property </span>
         in the instructions.
      </span>
            </div>
            <div class="styLNAmountBox" style="width: 39mm; text-align: center">
              <span class="styBoldText">(a) Foreign Trade<br/>Income</span>
            </div>
            <div class="styLNAmountBox" style="width: 33mm; text-align: center">
              <span class="styBoldText">(b) Foreign Sale and<br/>Leasing Income</span>
            </div>
          </div>
          <!--  Heading-->
          <!--  Line 6  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 3mm">6</div>
            <div class="styIRS8873ShortLNDesc">Sale, exchange, or other disposition of qualifying foreign trade property
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 4.5mm; width: 6mm">6</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SaleExchangeFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height: 4.5mm; border-bottom-width: 1px; width: 33.25mm"/>
          </div>
          <!--  Line 6 -->
          <!-- LIne 7 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 3mm">7</div>
            <div class="styIRS8873ShortLNDesc">
      Enter the amount from line 6, column (a), attributable to the sale of property<br/>
      formerly leased or rented for use by the lessee outside the United States
    </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm; width: 6mm">7</div>
            <div class="styShadingCell" style="height: 8mm; border-bottom-width: 1px; width: 32.75mm"/>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SaleAttrblFrgnSaleLeasingIncm1"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Line 7-->
          <!-- LIne 8  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 3mm">8</div>
            <div class="styIRS8873ShortLNDesc">
      Lease or rental of qualifying foreign trade property for use by the lessee<br/>
      outside the United States. Enter the same amount in both columns
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm; width: 6mm">8</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/LsOrRentalFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width:33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/LsOrRentalFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Line 8 -->
          <!-- LIne 9  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-left: 3mm">9</div>
            <div class="styIRS8873ShortLNDesc">
      Services related and subsidiary to the sale, exchange, or other disposition<br/>
      of qualifying foreign trade property
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm; width: 6mm">9</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ServicesRltdFrgnTradeIncm1"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height: 8mm; border-bottom-width: 1px; width: 33.25mm"/>
          </div>
          <!--Line 9  -->
          <!-- LIne 10  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">10</div>
            <div class="styIRS8873ShortLNDesc">
      Enter the amount from line 9, column (a), attributable to the sale of property<br/>
      formerly leased or rented for use by the lessee outside the United States
    </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm; width: 6mm">10</div>
            <div class="styShadingCell" style="height: 8mm; border-bottom-width: 1px; width: 32.75mm"/>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SaleAttrblFrgnSaleLeasingIncm2"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Line 10  -->
          <!-- LIne 11  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">11</div>
            <div class="styIRS8873ShortLNDesc">
              <span style="font-size: 6pt">
        Services related and subsidiary to the lease of qualifying foreign trade property for<br/>
        use by the lessee outside the United States. Enter the same amount in both columns
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm; width: 6mm">11</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ServicesRltdFrgnTradeIncm2"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SrvcRltdFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Line 11  -->
          <!--  Line 12  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">12</div>
            <div class="styIRS8873ShortLNDesc">
              <span style="font-size:6pt">Engineering or architectural services for construction projects outside the United States</span>
              <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 4.5mm; width: 6mm">12</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ConstructionSrvcFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height: 4.5mm; border-bottom-width: 1px; width: 33.25mm"/>
          </div>
          <!--  Line 12 -->
          <!--  Line 13  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">13</div>
            <div class="styIRS8873ShortLNDesc">Managerial services provided to unrelated persons (see instructions)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 4.5mm; width: 6mm">13</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ManagerialSrvcFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height: 4.5mm; border-bottom-width: 1px; width: 33.25mm"/>
          </div>
          <!--  Line 13 -->
          <!-- LIne 14  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">14</div>
            <div class="styIRS8873ShortLNDesc">
      Enter the sum of the amounts from lines 6, 9, 12, and 13 of column (a)<br/>
      attributable to foreign economic processes. <span class="styBoldText"> Do not </span>include any amounts<br/>
      already included on lines 7, 8, 10, or 11 in column (b)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 10.5mm; padding-top: 7mm; width: 6mm">14</div>
            <div class="styShadingCell" style="height: 10.5mm; border-bottom-width: 1px; width: 32.75mm"/>
            <div class="styLNAmountBox" style="height: 10.5mm; padding-top: 7mm; width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SumAttrblToFrgnEconomicProc"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Line 14  -->
          <!--  Line 15  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">15</div>
            <div class="styIRS8873ShortLNDesc">
              <span class="styBoldText">Foreign trading gross receipts. </span>Add lines 6 through 13 in column (a)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 4.5mm; width: 6mm">15</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignTradingGrossReceipts1"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height: 4.5mm; border-bottom-width: 1px; width: 33.25mm"/>
          </div>
          <!--  Line 15 -->
          <!--  Line 16  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">16</div>
            <div class="styIRS8873ShortLNDesc">Add lines 7 through 14 in column (b)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 4.5mm; width: 6mm">16</div>
            <div class="styShadingCell" style="height: 4.5mm; border-bottom-width: 1px; width: 32.75mm"/>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SumOfFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 16 -->
          <!--  Line 17  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">17</div>
            <div class="styIRS8873ShortLNDesc">
              <span class="styBoldText">Cost of goods sold:</span>
            </div>
            <div class="styLNRightNumBox" style="height: 4.5mm; border-bottom-width: 0px; width: 6mm"/>
            <div class="styLNAmountBox" style="height: 4.5mm; border-bottom-width: 0px; width: 32.75mm"/>
            <div class="styLNAmountBox" style="height: 4.5mm; border-bottom-width: 0px; width: 33.25mm"/>
          </div>
          <!--  Line 17 -->
          <!--  Line 17a  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">a</div>
            <div class="styIRS8873ShortLNDesc">Inventory at beginning of year
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm">17a</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/InvntryBOYFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/InvntryBOYFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17a -->
          <!--  Line 17b  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">b</div>
            <div class="styIRS8873ShortLNDesc">Purchases
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm">17b</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/PurchasesFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/PurchasesFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17b -->
          <!--  Line 17c  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">c</div>
            <div class="styIRS8873ShortLNDesc">Cost of labor
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm">17c</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CostOfLaborFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CostOfLaborFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17c -->
          <!--  Line 17d  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">d</div>
            <div class="styIRS8873ShortLNDesc">Additional section 263A costs (attach schedule)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm;height:4.8mm;">17d</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/Section263AFrgnTradeIncm"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/Section263AFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/Section263AFrgnSaleLeasingIncm"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/Section263AFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17e  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">e</div>
            <div class="styIRS8873ShortLNDesc">Other costs (attach schedule)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm;height:4.8mm;">17e</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/OtherCostsFrgnTradeIncm"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherCostsFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/OtherCostsFrgnSaleLeasingIncm"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherCostsFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17f  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">f</div>
            <div class="styIRs8873ShortLNDesc">Total. Add lines 17a through 17e
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm">17f</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalOfCostFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalOfCostFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17f -->
          <!--  Line 17g  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">g</div>
            <div class="styIRS8873ShortLNDesc">Inventory at end of year
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm">17g</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/InvntryEOYFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/InvntryEOYFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17g -->
          <!--  Line 17h  -->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">h</div>
            <div class="styIRS8873ShortLNDesc">Subtract line 17g from line 17f
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="width: 6mm">17h</div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/NetGdsCostFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/NetGdsCostFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 17h -->
          <!-- LIne 18  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">18</div>
            <div class="styIRS8873ShortLNDesc">
      In column (a), subtract line 17h from line 15. In column (b), subtract line<br/>
      17h from line 16
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm; width: 6mm">18</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SubtractFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SubtractFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Line 18  -->
          <!--  Line 19  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">19</div>
            <div class="styIRS8873ShortLNDesc">Other expenses and deductions (see instructions) (attach schedule)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 4.75mm; width: 6mm">19
    </div>
            <div class="styLNAmountBox" style="width: 32.75mm">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/DeductionsFrgnTradeIncm"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/DeductionsFrgnTradeIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width: 33.25mm">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/DeductionsFrgnSaleLeasingIncm"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/DeductionsFrgnSaleLeasingIncm"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 19 -->
          <!-- LIne 20  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">20</div>
            <div class="styIRS8873ShortLNDesc">
              <span class="styBoldText">Foreign trade income. </span> In column (a), subtract line 19 from line 18. If -0-<br/>
      or less, stop here. You do not qualify for the exclusion
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm; width: 6mm; ">20</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm; width: 32.75mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignTradeIncome1"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height: 8mm; border-bottom-width: 1px; width: 33.25mm"/>
          </div>
          <!--Line 20  -->
          <!-- LIne 21  -->
          <div style="width: 187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <div class="styLNLeftNumBox">21</div>
            <div class="styIRS8873ShortLNDesc">
              <span class="styBoldText">Foreign sale and leasing income.</span> In column (b), subtract line 19 from line 18
    </div>
            <div class="styLNRightNumBox" style="height: 4mm; border-bottom-width: 0px; width: 6mm">21</div>
            <div class="styShadingCell" style="height: 4mm; width: 32.75mm"/>
            <div class="styLNAmountBox" style="border-bottom-width: 0px; width: 33.25mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignSaleAndLeasingIncome1"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Line 21  -->
          <!--  page footer  -->
          <div style="width:187mm">
            <div style="float: left; clear: none;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
            </div>
            <div style="float:right">
      Cat. No. 30732F 
      <span style="width:35px"/>
      Form <b style="font-size:8pt;">8873</b> (2009)
    </div>
          </div>
          <div class="pageEnd"/>
          <!--  pager header  -->
          <div class="styBB" style="width:187mm">
            <div style="float: left; clear: none">Form 8873 (2009)</div>
            <div style="float:right">
      Page <span class="styBoldText" style="font-size: 8pt">2</span>
            </div>
          </div>
          <!--  Part III  -->
          <div class="styBB" style="width: 187mm">
            <div class="styPartName" style="width: 16mm; font-size: 10pt">Part III</div>
            <div class="styPartDesc" style="font-size: 8pt;width:170mm">Marginal Costing 
      <span class="styNormalText" style="font-size: 9pt">(<span class="styBoldText">Note: </span>
                <span class="styItalicText"> If you are <span class="styBoldText">not</span> using Marginal Costing, skip Part III and go to Part IV. </span>)</span>
            </div>
          </div>
          <!--  End Part III -->
          <!--  Section A  -->
          <div class="styBB" style="width: 187mm">
            <div class="styPartDesc" style="padding-left: 0mm">Section A — Foreign Trade Income Using Marginal Costing Method</div>
          </div>
          <!--  Section A  -->
          <!--  Line 22-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">22</div>
            <div class="styIRS8873MedLNDesc">Foreign trading gross receipts. Enter the amount from line 15
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">22</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignTradingGrossReceipts2"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 22-->
          <!--  Line 23-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">23</div>
            <div class="styIRS8873MedLNDesc">Costs and expenses allocable to the amount reported on line 22:</div>
            <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 0px"/>
            <div class="styLNAmountBox" style="border-bottom-width: 0px"/>
          </div>
          <!--  Line 23-->
          <!--  Line 23a-->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">a</div>
            <div class="styIRS8873ShortestLNDesc">Cost of direct material attributable to property sold
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm">23a</div>
            <div class="styLNAmountBox" style="height: 5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CostsAndExpnssDrtMaterialCosts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
            <div class="styLNAmountBox" style="height: 5mm; border-bottom-width: 0px"/>
          </div>
          <!--  Line 23a  -->
          <!--  Line 23b-->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">b</div>
            <div class="styIRS8873ShortestLNDesc">Cost of direct labor attributable to property sold
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">23b</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CostsAndExpnssDrtLaborCosts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width: 1px"/>
            <div class="styLNAmountBox" style="border-bottom-width: 0px"/>
          </div>
          <!--  Line 23b  -->
          <!--  Line 23c-->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">c</div>
            <div class="styIRS8873MedLNDesc">Add lines 23a and 23b
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">23c</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SumOfCostsAndExpenses"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 23c-->
          <!--  Line 24-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">24</div>
            <div class="styIRS8873MedLNDesc">Subtract line 23c from line 22
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">24</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnGroReceiptsMinusCostExpnss"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 24-->
          <!--  Line 25-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">25</div>
            <div class="styIRS8873MedLNDesc">Worldwide gross receipts from sales of the product or product line
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">25</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/WorldwideGroReceiptsFromSales"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 25-->
          <!--  Line 26-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">26</div>
            <div class="styIRS8873MedLNDesc">Costs and expenses allocable to the amount reported on line 25:</div>
            <div class="styLNRightNumBoxNBB" style="background-color: lightgrey"/>
            <div class="styLNAmountBoxNBB"/>
          </div>
          <!--  Line 26-->
          <!--  Line 26a-->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">a</div>
            <div class="styIRS8873ShortestLNDesc">Cost of goods sold attributable to property sold
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm">26a</div>
            <div class="styLNAmountBox" style="height: 5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/CostsAndExpnssForPropertySold"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
            <div class="styLNAmountBox" style="height: 5mm; border-bottom-width: 0px"/>
          </div>
          <!--  Line 26a  -->
          <!--  Line 26b-->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">b</div>
            <div class="styIRS8873ShortestLNDesc">Other expenses and deductions attributable to gross income
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">26b</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherExpnssDedAttrblGroIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="background-color: lightgrey;border-bottom-width: 1px"/>
            <div class="styLNAmountBox" style="border-bottom-width: 0px"/>
          </div>
          <!--  Line 26b  -->
          <!--  Line 26c-->
          <div style="width: 187mm">
            <div class="styLNLeftLtrBox" style="padding-left:4.5mm;">c</div>
            <div class="styIRS8873MedLNDesc">Add lines 26a and 26b
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">26c</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalOfCostsAndExpenses"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 26c-->
          <!--  Line 27-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">27</div>
            <div class="styIRS8873MedLNDesc">
      Subtract line 26c from line 25. (<span class="styBoldText">Note: </span>
              <span class="styItalicText">
        If -0- or less, stop here. You may not use Part III to determine<br/>
        your qualifying foreign trade income. Go to line 37.)
      </span>
              <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm">27</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/WorldWideRcptsMinusCostExpnss"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 27  -->
          <!--  Line 28-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">28</div>
            <div class="styIRS8873MedLNDesc">
      Overall profit percentage. Divide line 27 by line 25. Carry the result to at least three decimal<br/>
      places
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm">28</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm">
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="$FormData/OverallProfitPercentage"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 28  -->
          <!--  Line 29-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">29</div>
            <div class="styIRS8873MedLNDesc">
      Overall profit percentage limitation. Multiply line 22 by line 28
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">29</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OverallProfitPercentageLmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 29  -->
          <!--  Line 30-->
          <div style="width: 187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <div class="styLNLeftNumBox">30</div>
            <div class="styIRS8873MedLNDesc">
              <span class="styBoldText">Foreign trade income using marginal costing.</span>  Enter the <span class="styBoldText">smaller</span>  of line 24 or line 29
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width: 0px">30</div>
            <div class="styLNAmountBox" style="border-bottom-width: 0px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnTradeIncmByMarginalCosting"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 30  -->
          <!--  Section B  -->
          <div class="styBB" style="width: 187mm">
            <div class="styPartDesc" style="padding-left: 0mm">Section B — 15% of Foreign Trade Income Method</div>
          </div>
          <!--  Section B  -->
          <!--  Line 31-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">31</div>
            <div class="styIRS8873MedLNDesc">
      Multiply line 30 by 15% (.15)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">31</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnTradeIncmBy15Percent"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 31  -->
          <!--  Line 32-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">32</div>
            <div class="styIRS8873MedLNDesc">
              <span class="styBoldText">Foreign trade income using full costing. </span>  Enter the amount from line 20
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">32</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnTradeIncmByFullCosting"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 32  -->
          <!--  Line 33-->
          <div style="width: 187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <div class="styLNLeftNumBox">33</div>
            <div class="styIRS8873MedLNDesc">
      Enter the <span class="styBoldText">smaller</span> of line 31 or line 32
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width: 0px">33</div>
            <div class="styLNAmountBox" style="border-bottom-width: 0px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SmallerOfForeignTradeIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 33  -->
          <!--  Section C  -->
          <div class="styBB" style="width: 187mm">
            <div class="styPartDesc" style="padding-left: 0mm">Section C — 1.2% of Foreign Trading Gross Receipts Method</div>
          </div>
          <!--  Section C  -->
          <!--  Line 34  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">34</div>
            <div class="styIRS8873MedLNDesc">
      Multiply line 22 by 1.2% (.012)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">34</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnTrdGrossReceiptsBy1Pnt2Pct"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 34  -->
          <!--  Line 35-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">35</div>
            <div class="styIRS8873MedLNDesc">
      Multiply line 30 by 30% (.30)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">35</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnTradeIncmBy30Percent"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 35  -->
          <!--  Line 36  -->
          <div style="width: 187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <div class="styLNLeftNumBox">36</div>
            <div class="styIRS8873MedLNDesc">
      Enter the <span class="styBoldText">smallest</span> of lines 32, 34, or 35
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width: 0px">36</div>
            <div class="styLNAmountBox" style="border-bottom-width: 0px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SmallestOfFrgnTrdIncomeGroRcpt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 36  -->
          <!--  Part IV  -->
          <div class="styBB" style="width: 187mm">
            <div class="styPartName" style="width: 15mm; font-size: 10pt">Part IV</div>
            <div class="styPartDesc" style="font-size: 8pt">Extraterritorial Income Exclusion (Net of Disallowed Deductions)</div>
          </div>
          <!--  End Part IV -->
          <!--  Line 37-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">37</div>
            <div class="styIRS8873MedLNDesc">
      Enter your foreign trade income from line 20
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">37</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignTradeIncome2"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 37  -->
          <!--  Line 38-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">38</div>
            <div class="styIRS8873MedLNDesc">
      Multiply line 37 by 15% (.15)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">38</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignTradeIncomeBy15Pct"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 38  -->
          <!--  Line 39-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">39</div>
            <div class="styIRS8873ShortestLNDesc">Enter your foreign trading gross receipts from line 15
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm">39</div>
            <div class="styLNAmountBox" style="height: 5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignTradingGrossReceipts3"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
            <div class="styLNAmountBox" style="height: 5mm; border-bottom-width: 0px"/>
          </div>
          <!--  Line 39  -->
          <!--  Line 40 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">40</div>
            <div class="styIRS8873ShortestLNDesc">Multiply line 39 by 1.2% (.012)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm">40</div>
            <div class="styLNAmountBox" style="height: 5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnTradingReceiptsBy1Pnt2Pct"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 5mm; background-color: lightgrey; border-bottom-width: 0px"/>
            <div class="styLNAmountBox" style="height: 5mm; border-bottom-width: 0px"/>
          </div>
          <!--  Line 40  -->
          <!--  Line 41 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">41</div>
            <div class="styIRS8873ShortestLNDesc">Multiply line 38 by 2.0
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">41</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignTradeIncomeBy2Pct"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="background-color: lightgrey; border-bottom-width:1px"/>
            <div class="styLNAmountBox" style="border-bottom-width: 0px"/>
          </div>
          <!--  Line 41  -->
          <!--  Line 42  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">42</div>
            <div class="styIRS8873MedLNDesc">
      Enter the <span class="styBoldText">smaller </span>of line 40 or line 41
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">42</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SmallerOfFrgnTrdGroReceipts"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 42  -->
          <!--  Line 43  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">43</div>
            <div class="styIRS8873MedLNDesc">
      Enter your foreign sale and leasing income from line 21
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">43</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignSaleAndLeasingIncome2"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 43  -->
          <!--  Line 44  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">44</div>
            <div class="styIRS8873MedLNDesc">
      Multiply line 43 by 30% (.30)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">44</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnSaleAndLeasingBy30Percent"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 44  -->
          <!--  Line 45  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">45</div>
            <div class="styIRS8873MedLNDesc">
      Enter the <span class="styBoldText">greatest</span> of lines 33, 36, 38, 42, or 44. If you are using the alternative computation,<br/>
      see instructions for the amount to enter
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm">45</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/GreatestOfQlfyFrgnTradeIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 45  -->
          <!--  Note  -->
          <div style="width: 187mm">
            <div class="styIRS8873MedLNDesc" style="width: 146.75mm; padding-left: 8mm">
              <span class="styBoldText">Note: </span>
              <span class="styItalicText">If you do not have a reduction for international boycott operations, illegal bribes, kickbacks,<br/>
      etc. (see the instructions for line 50), skip lines 46 through 51 and enter on line 52 the amount<br/>
      from line 45.</span>
            </div>
            <div class="styLNRightNumBox" style="height: 12mm; padding-top: 7mm; background-color: lightgrey; border-bottom-width: 0px"/>
            <div class="styLNAmountBox" style="height: 12mm; padding-top: 4mm; border-bottom-width: 0px"/>
          </div>
          <!--  Note  -->
          <!--  Line 46 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">46</div>
            <div class="styIRS8873ShortestLNDesc">
      If line 44 equals line 45, divide the amount on line 45 by the amount<br/>
      on line 43. Otherwise, divide the amount on line 45 by the amount on<br/>
      line 37. Carry the result to at least three decimal places.
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 12mm; padding-top: 7mm">46</div>
            <div class="styLNAmountBox" style="height: 12mm; padding-top: 7mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/QlfyTrdMethodsDivByFrgnTrdIncm"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 12mm; border-bottom-width: 0px; background-color: lightgrey"/>
            <div class="styLNAmountBox" style="height: 12mm; border-bottom-width: 0px"/>
          </div>
          <!--  Line 46  -->
          <!--  Line 47 -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">47</div>
            <div class="styIRS8873ShortestLNDesc">
      If line 44 equals line 45, enter the amount from line 19, column (b).<br/>
      Otherwise, enter the amount from line 19, column (a)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm">47</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/OtherExpensesAndDeductions"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; border-bottom-width:1px; background-color: lightgrey"/>
            <div class="styLNAmountBox" style="height: 8mm; border-bottom-width: 0px"/>
          </div>
          <!--  Line 47  -->
          <!--  Line 48  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">48</div>
            <div class="styIRS8873MedLNDesc">
      Multiply line 46 by line 47
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">48</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/MultiplyExpnssDedByRatio"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 48  -->
          <!--  Line 49  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">49</div>
            <div class="styIRS8873MedLNDesc">
      Add lines 45 and 48
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">49</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/SumOfQlfyForeignTradeIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 49  -->
          <!--  Line 50  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">50</div>
            <div class="styIRS8873MedLNDesc">
      Reduction for international boycott operations, illegal bribes, kickbacks, etc. (see instructions)
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">50</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/ReductionForInternationalByct"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 50  -->
          <!--  Line 51  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox">51</div>
            <div class="styIRS8873MedLNDesc">
              <span class="styBoldText">Qualifying foreign trade income. </span>Subtract line 50 from line 49. If -0- or less, stop here. You do<br/>
      not qualify for the exclusion
      <span class="styBoldText">
                <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
        <span class="styNBSP"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm">51</div>
            <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/QualifyingForeignTradeIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 51  -->
          <!--  Line 52  -->
          <div style="width: 187mm; border-style: solid; border-color: black; border-left-width: 0px;
   border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px;height:8mm;">
            <div class="styLNLeftNumBox" style="height:8mm;">52</div>
            <div class="styIRS8873MedLNDesc">
              <b>Extraterritorial income exclusion (net of disallowed deductions)</b> Subtract line 48 from line 51.  Enter the result here and include it on the “other deductions” line of your tax return or schedule (see instructions).
    
    </div>
            <div class="styLNRightNumBox" style="padding-top:4mm;border-bottom-
    width:0px;height:8mm;">52</div>
            <!--The xsl: choose code block below enables this stylesheet to display data from more then one schema version -->
            <xsl:choose>
              <xsl:when test="$Version='2004v2.0' or $Version='2004v3.0'">
                <div class="styLNAmountBox">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NOT_AVALIABLE"/>
                  </xsl:call-template>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;
            padding-top:4mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/DiffBtwnExpnsDedAndFrgnTrdIncm"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!--   End Line 52  -->
          <!--  Line 53a 
      
  <div style="width: 187mm">
    <div class="styLNLeftNumBox">53a</div>
    <div class="styIRS8873MedLNDesc">
      Enter the amount from line 52 that is attributable to 100% transactions (see instructions).
      <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
         <span class="styNBSP"></span>.
        </span>
    </div>
    <div class="styLNRightNumBox">53a</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AttrblTo100PctTrans"/>
      </xsl:call-template>
    </div>
  </div>
 End Line 53a  -->
          <!-- Start Line 53b 
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:4.5mm;">b</div>
    <div class="styIRS8873MedLNDesc">
     Multiply the amount from line 52 that is attributable to 80% transactions (see instructions) by
     80% (0.80) and enter the result 
      <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm">53b</div>
    <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AttrblTo80PctTrans"/>
      </xsl:call-template>
    </div>
  </div>
   End Line 53b  -->
          <!--  Line 53c 
  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
    <div class="styIRS8873MedLNDesc">
     Multiply the amount from line 52 that is attributable to 60% transactions (see instructions) by
     60% (0.60) and enter the result here
      <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
      </span>
    </div>
    <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm">53c</div>
    <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/AttrblTo60PctTrans"/>
      </xsl:call-template>
    </div>
  </div>

 End Line 53c  -->
          <!--  Line 54 
  <div style="width: 187mm">
    <div class="styLNLeftNumBox">54</div>
    <div class="styIRS8873MedLNDesc"><span class="styBoldText">
     Extraterritorial income exclusion (net of disallowed deductions).</span> Add lines 53a through 53c. Enter the result
     here and include it on the “other deductions” line of your tax return or schedule (see instructions)
    
    </div>
    <div class="styLNRightNumBox" style="height: 8mm; padding-top: 4mm;border-bottom-width: 0px;">54</div>
    <div class="styLNAmountBox" style="height: 8mm; padding-top: 4mm;border-bottom-width: 0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/ExtraterritorialIncmExclusion"/>
      </xsl:call-template>
    </div>
  </div>
  End Line 54  -->
          <div class="styBB" style="width: 187mm;border-top-width: 1px; border-bottom-width: 0px;"/>
          <div style="width:187mm;">
            <div style="float:right">
      Form <b style="font-size:8pt;">8873</b> (2009)
    </div>
          </div>
          <br class="pageEnd"/>
          <!-- BEGIN Left Over Table -->
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
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
