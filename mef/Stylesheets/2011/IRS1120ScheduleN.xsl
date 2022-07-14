<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120ScheduleNStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1120ScheduleN" select="$RtnDoc/IRS1120ScheduleN"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120ScheduleN)"/>
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
        <meta name="Description" content="IRS Form 1120 Schedule N"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120ScheduleNStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120ScheduleN">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:15.5mm;">
              <span class="styFormNumber" style="font-size:9pt;font-family:arial;">SCHEDULE N<br/>
                <span style="font-size:9pt;">(Form 1120)</span>
                <!--General Dependency Push Pin
				<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleN"/>
				</xsl:call-template> -->
                <br/>
              </span>
              <div style="line-height:120%;padding-top:1.5mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:15.5mm;">
              <div class="styMainTitle" style="height:9mm;">Foreign Operations of U.S. Corporations</div>
              <div class="styFST" style="height:5mm;">
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" alt="Bullet"/> Attach to Form 1120, 1120-C, 1120-IC-DISC, 1120-L,<br/>
              1120-PC, 1120-REIT, 1120-RIC, or 1120S.
          </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:15.5mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0123</div>
              <div class="styTY" style="height:11mm;">20<span class="styTYColor">11</span>
              </div>
            </div>
          </div>
          <!--Name Line -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:120mm;height:8mm;font-size:7pt;font-weight:normal;">
			  Name<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- EIN Line -->
            <div class="styEINBox" style="width:65mm;height:8mm;text-align:left;padding-left:2mm;font-size:7pt;font-weight:bold;">
			  Employer identification number (EIN)<br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Foreign Operations Information Line -->
          <div class="styBB" style="width:187mm;height:8mm;">
            <div class="styIRS1120ScheduleNInfoTitle">Foreign Operations Information</div>
          </div>
          <!-- Yes and No Line -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;">Yes</div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;">No</div>
          </div>
          <!-- Line 1a Row 1-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">1a</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">During the tax year, did the corporation own (directly or indirectly) any foreign entity that was disregarded as</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- Line 1a Row 2-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  an entity separate from its owner under Regulations sections 301.7701-2 and 301.7701-3 (see instructions)?
			  <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/OwnedFrgnEntitiesDisregarded"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/OwnedFrgnEntitiesDisregarded"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/OwnedFrgnEntitiesDisregarded"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 1a Row 3-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  If “Yes,” you are generally required to attach <b>Form 8858</b>, Information Return of U.S. Persons With Respect to Foreign 
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- Line 1a Row 4-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">Disregarded Entities, for each foreign disregarded entity (see instructions).</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--Line 1b -->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:115mm;height:4.5mm;">
			  Enter the number of Forms 8858 attached to the tax return          
			  <!--Dotted Line-->
			  <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">........</span>
              <span style="width:10px;"/>
              <img src="{$ImagePath}/1120SchN_Bullet_Line.gif" alt="Bullet"/>
            </div>
            <!--UnderLine-->
            <div class="styIRS1120ScheduleNUnderlineAmount" style="width:42.95mm;padding-left:2mm;padding-right:3.75mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="3"/>
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/NumberOfForms8858Attached"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:4.5mm;width:10.1mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- Space row -->
          <div style="height:4.5mm;width:187mm;">
            <div class="styLNDesc" style="width:166mm;height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 2 row 1-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  Enter the number of <span class="styBoldText">Forms 8865</span>,
			  Return of U.S. Persons With Respect to Certain Foreign Partnerships, attached to the 
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 2 row 2-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:115mm;height:4.5mm;">
              corporation's income tax return
			  <!--Dotted Line-->
              <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.................</span>
              <span style="width:10px;"/>
              <img src="{$ImagePath}/1120SchN_Bullet_Line.gif" alt="Bullet"/>
            </div>
            <!--UnderLine-->
            <div class="styIRS1120ScheduleNUnderlineAmount" style="width:42.95mm;padding-left:2mm;padding-right:3.75mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="3"/>
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/NumberOfForms8865Attached"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:4.5mm;width:10.1mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <div style="height:4.5mm;width:187mm;">
            <div class="styLNDesc" style="width:166mm;height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 3 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
            Excluding any partnership for which a Form 8865 is attached to
            the tax return, did the corporation own at least a 10%
          </div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 3 row 2-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  interest, directly or indirectly, in any other foreign partnership (including an entity
			  treated as a foreign partnership
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 3 row 3-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
            <span style="float:left">under Regulations section 301.7701-2 or 301.7701-3)?
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/Owned10PercentIntForeignPrtshp"/>
              </xsl:call-template>
            </span>
              <!--Dotted Line-->
              <div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/Owned10PercentIntForeignPrtshp"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/Owned10PercentIntForeignPrtshp"/>
              </xsl:call-template>
            </div>
          </div>
          <!--line 3 row 4-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">If "Yes," see instructions for required attachment.</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <div style="height:4.5mm;width:187mm;">
            <div class="styLNDesc" style="width:166mm;height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 4a-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">4a</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  Was the corporation a U.S. shareholder of any controlled foreign
			  corporation (CFC)? (See sections 951 and 957.)
			  <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ShareholderOfAnyCFC951And957"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ShareholderOfAnyCFC951And957"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ShareholderOfAnyCFC951And957"/>
              </xsl:call-template>
            </div>
          </div>
          <!--line 4a row 2-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  If "Yes," attach <span class="styBoldText">Form 5471</span>, Information Return of
			  U.S. Persons With Respect to Certain Foreign Corporations, for
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 4a row 3-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">each CFC.</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--line 4b-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:115mm;height:4.5mm;">
			  Enter the number of Forms 5471 attached to the tax return
			  <!--Dotted Line-->
              <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">........</span>
              <span style="width:10px;"/>
              <img src="{$ImagePath}/1120SchN_Bullet_Line.gif" alt="Bullet"/>
            </div>
            <div class="styIRS1120ScheduleNUnderlineAmount" style="width:42.95mm;padding-right:3.75mm;padding-left:2mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="3"/>
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/NumberOfForms5471Attached"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:4.5mm;width:10.1mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <div style="height:4.5mm;width:187mm;">
            <div class="styLNDesc" style="width:166mm;height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- line 5 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
              During the tax year, did the corporation receive a distribution from, or was it the grantor of, or transferor to, a foreign
            </div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- line 5 row 2-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
              <span style="float:left;">trust?</span>
              <!--Dotted Line-->
              <div class="styDotLn" style="float:right;padding-right:1mm;">...................................</div>
              <!--<span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">...................................</span>-->
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/RcvdDistributionFromFrgnTrust"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/RcvdDistributionFromFrgnTrust"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 5 row 3-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  If "Yes," the corporation may have to file <span class="styBoldText">Form 3520</span>,
			  Annual Return To Report Transactions With Foreign Trusts and
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- line 5 row 4-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  Receipt of Certain Foreign Gifts.
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <div style="height:4.5mm;width:187mm;">
            <div class="styLNDesc" style="width:166mm;height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- line 6a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">6a</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  At any time during the 2011 calendar year, did the corporation have an interest in or a signature or other authority
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- line 6a row 2-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  over a financial account (such as a bank account, securities account, or other financial account) in a foreign country?
			</div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ForeignFinancialAccount"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ForeignFinancialAccount"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 6a row 3-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  See the instructions for exceptions and filing requirements for
			  <span class="styBoldText">Form TD F 90-22.1</span>, Report of Foreign Bank and
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  Financial Accounts.
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- Line 6b -->
          <div style="width:187mm;height:4.5mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
            <table class="styTable" style="float:left;font-size:7pt;width:178mm;" cellspacing="0">
              <tr>
                <td scope="col" style="width: 157.5mm;">
                  <div class="styLNDesc" style="width:157.5mm;">
                If "Yes," enter the name of the foreign country                    
                <span style="font-weight:bold;letter-spacing:3.3mm;">.........</span>
                    <span style="width:5px;"/>
                    <img src="{$ImagePath}/1120SchN_Bullet_Line.gif" style="float:none;clear:none;" alt="Bullet"/>
                    <span style="width:6px;"/>
                    <span style="width:58mm;border-bottom: 1 black solid;padding-left:4mm;">
                      <xsl:for-each select="$Form1120ScheduleN/ForeignCountryCode">
                        <xsl:if test="($Print != $Separated) or count($Form1120ScheduleN/ForeignCountryCode) &lt;=10">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="."/>
                          </xsl:call-template>
                          <xsl:if test="position() != last()">,<span style="width:4px;"/>
                          </xsl:if>
                        </xsl:if>
                      </xsl:for-each>
                      <xsl:if test="($Print = $Separated) and count($Form1120ScheduleN/ForeignCountryCode) &gt; 10">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ForeignCountryCode"/>
                        </xsl:call-template>
                      </xsl:if>
                    </span>
                  </div>
                </td>
                <td class="styShadingCell" scope="col" style="width:10mm;">
                  <span style="width:0.5px"/>
                </td>
                <td class="styShadingCell" scope="col" style="width:10mm;">
                  <span style="width:1px"/>
                </td>
              </tr>
            </table>
          </div>
          <div style="height:4.5mm;width:187mm;">
            <div class="styLNDesc" style="width:166mm;height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--7a-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">7a</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
              <span style="float:left;">Is the corporation claiming the extraterritorial income exclusion?
                <span style="width:2px;"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ExtraterritorialIncmExclusion"/>
                </xsl:call-template>
              </span>
              <!--Dotted Line-->
              <div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ExtraterritorialIncmExclusion"/>
              </xsl:call-template>
            </div>
            <div class="styIRS1120ScheduleNLNYesNoBox" style="height:4.5mm">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/ExtraterritorialIncmExclusion"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 7a Row 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  If "Yes," attach a separate <span class="styBoldText">Form 8873</span>, Extraterritorial
			  Income Exclusion, for <span class="styBoldText">each</span> transaction or group of
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!-- Line 7a Row 3 -->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  transactions.
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--7b-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:115mm;height:4.5mm;">
               Enter the number of Forms 8873 attached to the tax return
			  <!--Dotted Line-->
              <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">........</span>
              <span style="width:10px;"/>
              <img src="{$ImagePath}/1120SchN_Bullet_Line.gif" alt="Bullet"/>
            </div>
            <div class="styIRS1120ScheduleNUnderlineAmount" style="width:42.95mm;padding-right:3.75mm;padding-left:2mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="MaxSize" select="3"/>
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/NumberOfForms8873Attached"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:4.5mm;width:10.1mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--Line 7c-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
			  Enter the total of the amounts from line 52 (extraterritorial income exclusion (net of disallowed deductions)) of <span class="styBoldText">all</span> 
			</div>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--Line 7c row 2-->
          <div class="styTBB" style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:115mm;height:4.5mm;">
              Forms 8873 attached to the tax return
              <!--Dotted Line-->
			  <span style="padding-left:1mm;font-weight:bold;letter-spacing:3.3mm;">...............</span>
              <span style="width:10px;"/>
              <img src="{$ImagePath}/1120SchN_Bullet_Line.gif" alt="Bullet"/>
            </div>
            <div class="styGenericDiv" style="width:42.95mm;padding-right:3.75mm;padding-left:2mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleN/TotalOfAmounts"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:4.5mm;width:10.1mm;"/>
            <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
          </div>
          <!--Page footer -->
           <div style="width:187mm;">
            <div class="stySmallText" style="width:120mm;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1120.</span>
            </div>
            <div class="stySmallText" style="width:25mm;">Cat. No. 26294K</div>
            <div class="stySmallText" style="width:41mm;text-align:right;">
              <span class="styBoldText">Schedule N (Form 1120) (2011)</span>
            </div>
          </div>
          <br/>
          <br/>
          <br/>
          <br class="pageEnd"/>
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
            Additional Data        
          </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form1120ScheduleN"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          <!-- JMI: Additional Data Table-->
          <!-- Separated Data for 6b -->
          <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleN/ForeignCountryCode) &gt; 10)">
            <br/>
            <br/>
            <span class="styTopSectionLine" style="font-size:7pt;">
              <b>Form 1120 Schedule N, Line 6b:</b>
            </span>
            <br/>
            <div class="styTopSectionLine" style="font-size:7pt;">
              <div class="styTopSectionLineLbl" style="float:left">
                <b>If "Yes," enter the name of the foreign country:</b>
              </div>
              <div class="styExplanationLine" style="float:left">
                <br/>
                <xsl:for-each select="$Form1120ScheduleN/ForeignCountryCode">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                  <xsl:if test="position() != last()">,<span style="width:4px;"/>
                  </xsl:if>
                </xsl:for-each>
              </div>
            </div>
          </xsl:if>
          <br/>
          <br/>
          <!-- /Separated Data for 6b -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
