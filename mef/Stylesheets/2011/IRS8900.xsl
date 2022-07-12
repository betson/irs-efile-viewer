<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8900Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8900"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Schedule P (Form 5735)"/>
        <meta name="Generator" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!-- PRINT STATEMENT -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8900Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form id="Form8900" style="font-family:verdana; font-size:7pt">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form title and Form number section -->
          <div class="styBB" style="width:187mm;clear:both;float:none;">
            <div class="styFNBox" style="width:31mm;height:11mm;">
            Form <span class="styFormNumber">8900</span>
              <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
                <xsl:with-param name="TabOrder" select="2"/>
              </xsl:call-template>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
              </xsl:call-template>
              <br/>
              <div style="padding-top:3.5mm;">
                <!--<div class="styAgency">(Rev. December 2006) </div>-->
                <div class="styAgency"> Department of the Treasury</div>
                <div class="styAgency">Internal Revenue Service</div>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:11mm;">
              <div class="styMainTitle" style="padding-top:2mm;">
              Qualified Railroad Track Maintenance Credit</div>
              <div class="styFST" style="padding-top:9mm;font-weight:bold;">
                <img src="{$ImagePath}/8900_Bullet.gif" alt="bullet image"/>
              Attach to your tax return.
            </div>
            </div>
            <div class="styTYBox" style="width:31mm;height:11mm;">
              <div class="styOMB" style="height:5.5mm;padding-top;1mm;">OMB No. 1545-1983</div>
              <div class="styTY" style="font-size:21.5pt;">
                20<span class="styTYcolor">11</span>
              </div>
              <div class="styOMB" style="border-bottom-width:0px;text-align:left;padding-left:5mm;">
                  Attachment Sequence No. <span class="styBoldText" style="font-size:8pt;">144</span>
              </div>
            </div>
          </div>
          <!-- End form title and Form number Section -->
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;">
            <div class="styFNBox" style="width:144mm;height:8mm;">
			  Name(s) shown on return<br/>
			  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
			  <xsl:choose>
			    <xsl:when test="$RtnHdrData/ReturnType='1040'">								  
				  <br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
				    <xsl:with-param name="TargetNode">Name</xsl:with-param>
				  </xsl:call-template>
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
            <div class="styGenericDiv" style="width:42mm;height:4mm;padding-left:1mm;">
              <span class="styBoldText">Identifying number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
			  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
			    <xsl:choose>
				  <xsl:when test="$RtnHdrData/ReturnType='1040'">
				    <xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
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
          <!-- End Name and Identifying Number Section-->
          <!-- BEGIN Line Items -->
          <!-- Start line 1 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">1</div>
              <div class="styLNDesc" style="width:99mm;">
                  Qualified railroad track maintenance expenditures paid or incurred (see 
                <span style="float:left;">instructions)</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QualifiedRlrdTrackMaintExpend"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:10mm;padding-top:6mm;"/>
              <div class="styLNAmountBoxNBB" style="height:10mm;padding-top:6mm;"/>
            </div>
          </div>
          <!--end line 1-->
          <!-- Start line 2 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">2</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Enter 50% (.50) of line 1</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox">2</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/FiftyPctRlrdTrackMaintExpend"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--end line 2-->
          <!-- Start line 3a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">3a</div>
              <div class="styLNDesc" style="width:99mm;">
                  Number of miles of railroad track owned or leased by you (see 
                <span style="float:left;">instructions)</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3a</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;font-size:6pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/MilesOfRlrdTrackOwnedorLeased"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;padding-top:4mm;"/>
              <div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;"/>
            </div>
          </div>
          <!--end line 3a-->
          <!-- Start line 3b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;padding-bottom:0mm;">b</div>
              <div class="styLNDesc" style="width:99mm;padding-bottom:0mm;">
                  Less: number of miles of railroad track owned or leased by you and
                  assigned to other eligible taxpayers for purposes of this credit. See
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;"/>
              <div class="styLNAmountBoxNBB" style="height:7mm;padding-bottom:0mm;"/>
              <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;"/>
              <div class="styLNAmountBoxNBB" style="height:7mm;padding-bottom:0mm;"/>
            </div>
          </div>
          <!--end line 3b-->
          <!-- Start line 3b extension -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;padding-top: 0mm;padding-bottom:0mm;"/>
              <div class="styLNDesc" style="width:99mm;padding-top: 0mm;padding-bottom:0mm;">
                <span style="float:left;">instructions for more information, including required statement 
                  <!--Push Pin image -Form to Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/LessNumMileRlrdTrackOwnLsdAsgn"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="padding-top: 0mm;padding-bottom:0mm;">3b</div>
              <div class="styLNAmountBox" style="padding-top: 0mm;padding-bottom:0mm;font-size:6pt;">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$FormData/LessNumMileRlrdTrackOwnLsdAsgn"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top: 0mm;padding-bottom:0mm;"/>
              <div class="styLNAmountBoxNBB" style="padding-top: 0mm;padding-bottom:0mm;"/>
            </div>
          </div>
          <!--end line 3b extension-->
          <!-- Start line 3c -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;padding-bottom:0mm;">c</div>
              <div class="styLNDesc" style="width:99mm;padding-bottom:0mm;">
                  Number of miles of railroad track assigned to you by the owner or
                  lessee for purposes of this credit. See instructions for more information, including 
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;"/>
              <div class="styLNAmountBoxNBB" style="height:7mm;padding-bottom:0mm;"/>
              <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;"/>
              <div class="styLNAmountBoxNBB" style="height:7mm;padding-bottom:0mm;"/>
            </div>
          </div>
          <!--end line 3c-->
          <!-- Start line 3c extension -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;padding-top: 0mm;padding-bottom:0mm;"/>
              <div class="styLNDesc" style="width:99mm;padding-top: 0mm;padding-bottom:0mm;">
                <span style="float:left;">required statement
                  <!--Push Pin image -Form to Form Link -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/MileRlrdTrackAsgnByOwnrLessee"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="padding-top: 0mm;padding-bottom:0mm;">3c</div>
              <div class="styLNAmountBox" style="padding-top: 0mm;padding-bottom:0mm;font-size:6pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/MileRlrdTrackAsgnByOwnrLessee"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;padding-top: 0mm;padding-bottom:0mm;"/>
              <div class="styLNAmountBoxNBB" style="height:6mm;padding-top: 0mm;padding-bottom:0mm;"/>
            </div>
          </div>
          <!--end line 3c extension-->
          <!-- Start line 3d -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">d</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">
                  <b>Total.</b> Combine lines 3a through 3c</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox">3d</div>
              <div class="styLNAmountBox" style="padding-top: 0mm;padding-bottom:1.5mm;font-size:6pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalRailroadTrack"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--end line 3d-->
          <!-- Start line 4 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">4</div>
              <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
                <span style="float:left;">Multiply line 3d by $3,500</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">4</div>
              <div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AdjustedTotalRlrdTrack"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--end line 4-->
          <!-- Start line 5 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">5</div>
              <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
                <span style="float:left;">Enter the <span style="font-weight:bold;">smaller</span> of line 2 or line 4</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">5</div>
              <div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyPercentageOfRlrdTrack"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--end line 5-->
          <!-- Start line 6 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">6</div>
              <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm;">
                <span style="float:left;">Qualified railroad track maintenance credit from partnerships and S corporations</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">6</div>
              <div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QualifiedRlrdTrackMaintCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--end line 6-->
          <!-- Start line 7 -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">7</div>
              <div class="styLNDesc" style="width:139mm;">
                  Add lines 5 and 6. Partnerships and S corporations, report this amount on Schedule K.  All others, report 
                  <span style="float:left;">this amount on Form 3800, line 4g </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
              </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBoxNBB" style="height:3.5mm;background-color:lightgrey;padding-top: 0mm;padding-bottom:0mm;"/>
              <div class="styLNAmountBoxNBB" style="height:3.5mm;padding-top: 0mm;padding-bottom:0mm;"/>
              <div class="styLNRightNumBoxNBB" style="height:3mm;padding-top: 0mm;padding-bottom:.5mm;">7</div>
              <div class="styLNAmountBoxNBB" style="height:3mm;padding-top: 0mm;padding-bottom:.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--end line 7-->
          <!-- Start Page footer   -->
          <div style="width:187mm; border-top:1 solid Black; font-size:8pt">
            <div style="font-weight:bold; float:left; padding-top:0.5mm">
              For Paperwork Reduction Act Notice, see instructions.  
            </div>
            <div style="float:right">
              <span style="margin-right:20mm; font-size:7pt">Cat. No. 37708X</span>          
                Form <b>8900</b> (2011)    
            </div>
          </div>
          <p style="page-break-before:always"/>
          <!-- end Page footer-->
          <!-- Start Additional Data Page -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
            <div class="styLeftOverTitle">
          Additional Data        
        </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
            <!-- <xsl:choose>
              <xsl:when test="$Version='2005v2.0' ">
                <xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Schema 2005v2.0 -  Former line 3d - Number Of Miles Of Railroad Track Assigned By Owner</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/MilesOfRlrdTrackAsgnByOwner"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise/>
            </xsl:choose>-->
          </table>
          <!-- end Additional Data Page -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
