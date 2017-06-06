<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8911Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8911" select="$RtnDoc/IRS8911"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8911)"/>
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
        <meta name="Description" content="IRS Form 8911"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <style type="text/css">
          <!-- EXCEPTION: per Tamaira Green's response e-mail dated 8/4/09, column a and b heading for Part III, line 12 can be omitted from PDF dated 1/9/09.-->
          <!--PRINT STATEMENT-->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8911Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8911">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:20mm;border-right:none;">
              <span style="height:7mm;">
                Form <span class="styFormNumber">8911</span>
                <!--General Dependency Push Pin -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8911"/>
                </xsl:call-template>
              </span>
              <span class="styAgency" style="line-height:110%;">
                <br/>
                <br/>
                <br/>
                  Department of the Treasury
                <br/>
                  Internal Revenue Service
              </span>
            </div>
            <div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:20mm;">
              <div style="height:12.5mm;" class="styMainTitle">
                Alternative Fuel Vehicle Refueling Property Credit
              </div>
              <br/>
              <div class="styFST" style="height:5mm;font-size:7pt;">
                <img src="{$ImagePath}/8911_Bullet.gif" alt="Bullet Image"/>
                  Attach to your tax return.
              </div>
            </div>
            <div class="styTYBox" style="width:32mm;border-left:none;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1981</div>
              <div class="styTaxYear">
                20<span class="styTYColor">10</span>
              </div>
              <div style="margin-left:3mm; text-align:left;">
                Attachment<br/>Sequence No. <span class="styBoldText">151</span>
              </div>
            </div>
            <!-- Close right tax return header box -->
          </div>
          <!-- Close left tax return header box -->
          <!-- End Form Number and Name section -->
          <!-- Begin Name and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
              Name(s) shown on return
              <br/>
              <div style="font-family:verdana;font-size:7pt;height:6.25mm;">
                <xsl:choose>
					<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
						</xsl:call-template>
						<br/> 
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">Name</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
              </div>
            </div>
            <div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">
              Identifying number
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:choose>
					<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">
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
          <!-- End Names and Identifying number section -->
          <div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1px;padding-top:1.5mm;padding-bottom:1.5mm">
            <div class="styPartName" style="height:3.75mm">Part I</div>
            <div class="styPartDesc" style="float:left;width:167mm;">
		    Total Cost of Refueling Property
	       </div>
          </div>
          <!-- L1-->
          <div style="width:187mm;">
            <div style="float:left;clea:none;">
              <div class="styLNLeftNumBoxSD" />
              <div class="styLNDesc" style="width:97mm;"/>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNRightNumBox" style="height:6.5mm;border-left-width:0px;"/>
              <div class="styLNAmountBox" style="height:6.5mm;text-align:center;padding-left:0px;font-size:6pt;valign:center;">
                <b>(a)</b> Hydrogen refueling property  
              </div>
              <div class="styLNAmountBox" style="height:6.5mm;text-align:center;padding-left:0px;font-size:6pt;">
                <b>(b)</b> Other refueling <br/>property 
              </div>
            </div>
          </div>
          <!-- L1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:8mm;">1</div>
              <div class="styLNDesc" style="width:107mm;height:8mm;">
                 Total cost of qualified alternative fuel vehicle refueling property placed in <span style="float:left;">service during the tax year </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0">1</div>
              <div class="styLNAmountBox" style="height:8mm;border-bottom-width:0;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/TotalQualifiedPropertyCost"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="height:8mm;border-bottom-width:0;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/TotalQualifiedPropertyCost"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;height:3.75mm;border-top-width:2px;padding-top:1.5mm;padding-bottom:1.5mm;">
            <div class="styPartName" style="height:3.75mm">Part II</div>
            <div class="styPartDesc" style="float:left;width:167mm;">
		    Credit for Business/Investment Use Part of Refueling Property
		  </div>
          </div>
          <!-- L2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >2</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Business/investment use part (see instructions)</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >2</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/BusInvstUsePart"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/BusInvstUsePart"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--L3 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >3</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Section 179 expense deduction (see instructions)</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >3</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/Section179ExpenseDeduction"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/Section179ExpenseDeduction"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L4 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >4</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Subtract line 3 from line 2 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >4</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/NetBusUsePart"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/NetBusUsePart"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L5-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >5</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Applicable credit rate decimal amount </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">5</div>
              <!-- Choice of enter blank, zero or minus amount for line 5 even thought the ratio amount allow is .30 for a adn .50 for b minimum  -->
              <xsl:choose>
                <xsl:when test="$Form8911/HydrogenRefuelingProperty/RefuelingPropBusUseApplcblCrRt!=' '">
                  <div class="styLNAmountBox" style="text-align: center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/RefuelingPropBusUseApplcblCrRt"/>
                    </xsl:call-template>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="styLNAmountBox" style=" text-align: center;"> .30</div>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="$Form8911/OtherRefuelingProperty/RefuelingPropBusUseApplcblCrRt!=' '">
                  <div class="styLNAmountBox" style="text-align: center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/RefuelingPropBusUseApplcblCrRt"/>
                    </xsl:call-template>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="styLNAmountBox" style=" text-align: center;"> .50</div>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- L6-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >6</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Multiply line 4 by the applicable decimal amount on line 5 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >6</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/AdjBusUsePrt"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/AdjBusUsePrt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L7-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >7</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Maximum business/investment use part of credit (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >7</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/MxBusUsePrt"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/MxBusUsePrt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L8-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >8</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 6 or line 7 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >8</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/AdjBusUsePrtOrMxBusUsePrt"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/AdjBusUsePrtOrMxBusUsePrt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L9 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" >9</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Add columns (a) and (b) on line 8</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >9</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/RefuelingPropBusUsePrtTotCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L10 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >10</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Alternative fuel vehicle refueling property credit from partnerships and S corporations </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >10</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/FinalGulfBondCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L11 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" >11</div>
              <div class="styLNDesc" style="width:139mm;">
                <span class="styBoldText">Business/investment use part of credit. </span>
		        Add lines 9 and 10. Partnerships and S corporations, report this
		      <span style="float:left;">amount on Schedule K; all others, report this amount on Form 3800, line 1s </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
              <div class="styLNRightNumBox" style="border-bottom-width:0">11</div>
              <div class="styLNAmountBox" style="border-bottom-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/BusInvstUsePartOfCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part III header -->
          <div class="styBB" style="width:187mm;height:3.75mm;padding-top:1.5mm;padding-bottom:1.5mm;border-top-width:2px;">
            <div class="styPartName" style="height:3.75mm">Part III</div>
            <div class="styPartDesc" style="float:left;width:167mm;">
		        Credit for Personal Use Part of Refueling Property
		    </div>
          </div>
          <!-- L12-->
          <!-- EXCEPTION: per Tamaira Green's response e-mail dated 8/4/09, column a and b heading for Part III, line 12 can be omitted from PDF dated 1/9/09.-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >12</div>
              <div class="styLNDesc" style="width:107mm;">
                Subtract line 2 from line 1. If zero, stop here; <span class="styBoldText">do not</span> file this form unless you 
                  <span style="float:left;">are claiming a credit on line 11 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">12</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/PersnlUsePartOfCredit"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/PersnlUsePartOfCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L13-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >13</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Applicable credit rate decimal amount </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >13</div>
              <!-- Choice of enter blank, zero or minus amount for line 5 even thought the ratio amount allow is .30 for a adn .50 for b minimum  -->
              <xsl:choose>
                <xsl:when test="$Form8911/HydrogenRefuelingProperty/RefuelPropPersnlUseApplcblCrRt!=' '">
                  <div class="styLNAmountBox" style="text-align: center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/RefuelPropPersnlUseApplcblCrRt"/>
                    </xsl:call-template>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="styLNAmountBox" style=" text-align: center;"> .30</div>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="$Form8911/OtherRefuelingProperty/RefuelPropPersnlUseApplcblCrRt!=' '">
                  <div class="styLNAmountBox" style="text-align: center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/RefuelPropPersnlUseApplcblCrRt"/>
                    </xsl:call-template>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="styLNAmountBox" style=" text-align: center;"> .50</div>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- L14-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >14</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Multiply line 12 by the applicable decimal amount on line 13 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >14</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/AdjPersnlUsePrt"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/AdjPersnlUsePrt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L15-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >15</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Maximum personal use part of credit (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >15</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/MxPersnlUsePrt"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/MxPersnlUsePrt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L16-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >16</div>
              <div class="styLNDesc" style="width:107mm;">
                <span style="float:left;">Enter the <span class="styBoldText">smaller</span> of line 14 or line 15
                 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >16</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/HydrogenRefuelingProperty/AdjPersnlUsePrt-MxPersnlUsePrt"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherRefuelingProperty/AdjPersnlUsePrt-MxPersnlUsePrt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L17 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >17</div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Add columns (a) and (b) on line 16</span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >17</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/PersonalUsePartTotalPropCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L18 R1 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >18</div>
              <div class="styLNDesc" style="width:139mm;">
		      Regular tax before credits:
		    </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
          <!-- L18 R2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left: 2mm;"/>
              <div class="styLNDesc" style="width:139mm; ">
                <table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
                  <tr>
                    <td style=" width:111mm;font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none;">
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
		              Individuals. Enter the amount from Form 1040, line 44 (or Form 1040NR, line 42)
                      <br/>
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
                        Other filers. Enter the regular tax before credits from your return
                        <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.....</span>
                    </td>
                    <td style="width:27mm">
                      <div class="styLNDesc" style="width:2mm;">
                        <img src="{$ImagePath}/8826_Bracket_Tiny.gif" alt="Curly Bracket Image"/>
                      </div>
                      <div class="styLNDesc" style="width:25mm;padding-top:1.5mm;">
                        <span class="styBoldText" style="font-size: 7pt;float:right;padding-right:1mm;letter-spacing:3.3mm;">......</span>
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="">18</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/RegularTaxBeforeCredits"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;background-color:gray;border-right-width:1px;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- L19-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >19</div>
              <div class="styLNDesc" style="width:139mm;">
		      Credits that reduce regular tax before the alternative fuel vehicle refueling property credit:
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="TargetNode" select="$Form8911/OtherSpecifiedCredits"/>
                </xsl:call-template>
                <span style="width:2px;"/>
                <!--Dotted Line-->
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
            </div>
          </div>
          <!-- L19a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >
                <span style="width:6px;padding-left:3mm"/>
		        a
		    </div>
              <div class="styLNDesc" style="width:99mm;">
                <span style="float:left;">Foreign tax credit </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">19a</div>
              <div class="styLNAmountBox" style="height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/ForeignTaxCredit"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
          <!-- L19b -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:99mm;">
                <span style="float:left;">Personal credits from Form 1040 or 1040NR (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">19b</div>
              <div class="styLNAmountBox" style="height:4.5mm;">
                <!--<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911"/>
                </xsl:call-template>-->
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
          <!-- L19c -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >
                <span style="width:6px;padding-left:3mm">c</span>
              </div>
              <div class="styLNDesc" style="width:99mm;">
		      Non-business qualified electric vehicle credit from Form 8834, Line 29
		      </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >19c</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/ElectricVehicleTaxCredit"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0"/>
            </div>
          </div>
          <!-- L19d -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >
                <span style="width:6px;padding-left:3mm">d</span>
              </div>
              <div class="styLNDesc" style="width:139mm;">
                <span style="float:left;">Add lines 19a through 19c </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" >19d</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/TotalTaxCredits"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L20 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height:4.5mm;">20</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;">
		      Net regular tax. Subtract line 19d from line 18. If zero or less, stop here; 
			 <span class="styBoldText">do not</span> file this form unless 
			 <span style="float:left;">you are claiming a credit on line 11 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">20</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/NetRegularTax"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L21 R1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="">21</div>
              <div class="styLNDesc" style="width:139mm;">
		      Tentative minimum tax (see instructions):	
		    </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
            </div>
          </div>
          <!-- L21R2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left: 2mm; "/>
              <div class="styLNDesc" style="width:139mm; ">
                <table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
                  <tr>
                    <td style="font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none; width: 111mm;">
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
						Individuals. Enter the amount from Form 6251, line 33
			         <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">.........</span>
                      <br/>
                      <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
			           Other filers. Enter the tentative minimum tax from your alternative minimum tax
			         <br/>
                      <span>form or schedule</span>
                      <span style="padding-left:2mm;font-weight:bold;letter-spacing:3.3mm;">......................</span>
                    </td>
                    <td style="width:27mm">
                      <div class="styLNDesc" style="width:2mm;">
                        <img src="{$ImagePath}/8911_Bracket_Sm.gif" alt="Curly Bracket Image"/>
                      </div>
                      <div class="styLNDesc" style="width:25mm;padding-top:4mm;;">
						<span class="styBoldText" style="font-size: 7pt;float:right;letter-spacing:3.3mm;">......
                          <!--<span style="width:3.3mm;"/>.
                          <span style="width:3.3mm;"/>. 
                          <span style="width:3.3mm;"/>.
                          <span style="width:3.3mm;"/>.-->
                        </span>
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:1mm;background-color:gray;"/>
              <div class="styLNAmountBoxNBB" style="height:1mm;"/>
              <div class="styLNRightNumBox" style="">21</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/TentativeMinimumTax"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.3mm;height:6mm;background-color:gray;border-right-width:1px;padding-top:0;padding-bottom:0;"/>
            </div>
          </div>
          <!-- L22-->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >22</div>
              <div class="styLNDesc" style="width:139mm;">
		      Subtract line 21 from line 20. If zero or less, stop here; <span class="styBoldText">do not</span> 
			 file this form unless you are claiming a 
			 <span style="float:left;">credit on line 11 </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="border-bottom-width:0"/>
              <div class="styLNRightNumBox" >22</div>
              <div class="styLNAmountBox" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/AdjustedRegularTax"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- L23-->
          <div class="styTBB" style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" >23</div>
              <div class="styLNDesc" style="width:139mm;">
                <span class="styBoldText">Personal use part of credit. </span>
			   Enter the <span class="styBoldText">smaller</span>
			   of line 17 or line 22 here and on Form 1040, line 53; Form 1040NR, line 50; or the appropriate line of your return. If line 22 is smaller than line 17, see 
			 <span style="float:left;">instructions </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...............................</div>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:6mm;background:gray;border-bottom-width:0"/>
              <div class="styLNAmountBox" style="height:6mm;border-bottom-width:0"/>
              <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0">23</div>
              <div class="styLNAmountBox" style="height:4;border-bottom-width:0">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8911/TotalPersnlUsePartOfCredit"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End of Page -->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <span class="styBoldText" style="width:76mm;">For Paperwork Reduction Act Notice, see instructions. </span>
              <span style="width:83mm; text-align:center;">Cat. No. 37721Q </span>
            </div>
            <div style="float:right;clear:none;">
              <span style="width:27mm;text-align:right;">Form <span class="styBoldText">8911 </span>(2010)</span>
            </div>
          </div>
          <br class="pageend"/>
          <!-- BEGIN Left Over Table -->
          <!-- ADDITIONAL DATA TITLE BAR AND BUTTON-->
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
              <xsl:with-param name="TargetNode" select="$Form8911"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          <!-- Optional Print Solution for repeating data table  -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
