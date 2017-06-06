<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS6765Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form6765Data" select="$RtnDoc/IRS6765"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form6765Data)"/>
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
        <meta name="Description" content="IRS Form 6765"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!-- Form 6765 CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS6765Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form6765">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:25mm;">
        Form <span class="styFormNumber">6765</span>
              <br/>
              <br/>
              <br/>
              <br/>
              <!-- span class="styAgency">Rev. December 2008</span -->
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:123mm;height:13mm;">
              <div class="styMainTitle" style="height:8mm;">
          Credit for Increasing Research Activities
        </div>
              <br/>
              <div class="styFST" style="height:5mm;font-size:7pt;">
                <img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
          Attach to your tax return.
        </div>
            </div>
            <div class="styTYBox" style="width:32mm;height:13.5mm;">
              <div class="styOMB" style="height:2mm;border-bottom-width:1px;padding-top:3mm;">
          OMB No. 1545-0619
        </div>
              <div class="styTY" style="height:11mm;">20<span class="styTYColor">08</span>
              </div>
              <div style="text-align:left;padding-left:6mm;">Attachment<br/> Sequence No.<span class="styBoldText">
                  <span style="width:4px;"/>81</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:147mm;height:8mm;font-weight:normal;font-size:7pt;">
        Name(s) shown on return<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style="width:39mm;height:4mm;padding-left:2mm;font-size:7pt;">
        Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <!--Begin Section A-->
          <div class="styBB" style="width:187mm;font-size:7pt;">
            <div class="styPartDesc" style="width:183mm;font-size:7pt;padding-left:0mm;">Section A—Regular Credit. <span class="styNormalText">Skip this section and go to Section B or C if you are electing or previously elected (and are not revoking)
the alternative incremental credit or the alternative simplified credit, respectively.</span>
            </div>
          </div>
          <!-- line 1 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
     1
        </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
        Certain amounts paid or incurred to energy consortia (see instructions)       
          <span class="styBoldText">
                <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="width:8.25mm;height:4mm;border-right-width:1px;">1</div>
            <div class="styLNAmountBox" style="height:4mm;border-right-width:0px;border-left-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/EnergyConsortiaAmount"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 2 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
         2
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
        Basic research payments to qualified organizations (see instructions)
         
        </div>
            <div class="styLNRightNumBox" style="height:4mm;">
         2          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/BasicResearchPayment"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
            <!--  
         <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;"></div>
         <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"></div>
         -->
          </div>
          <!-- line 3 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
         3
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
         Qualified organization base period amount
          <span class="styBoldText">
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.       
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.               
         </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
         3          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/BasePeriodAmount"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 4 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
        4
        </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
        
    Subtract line 3 from line 2. If zero or less, enter -0-
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
         4          
        </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/ResearchPymtMinusBasePeriodAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 5 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
          5
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
          Wages for qualified services (do not include wages used in figuring the work opportunity credit)
             <span class="styBoldText">
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
       </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
         5          
        </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/WagesForQualifiedServices"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 6 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
         6
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
            Cost of supplies          
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
         </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
       6          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/CostOfSupplies"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 7 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
     7
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
          Rental or lease costs of computers (see instructions)
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
                </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
         7          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/RentalOrLeaseCostsOfComputers"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line8  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
         8
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
         Enter the applicable percentage of contract research expenses (see instructions)
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
               <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
       8          
        </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/PctOfContractResearchExpenses"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
            <!-- line 9 -->
          </div>
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">
          9
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
           Total qualified research expenses. Add lines 5 through 8
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
             </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
          9         
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/TotalQualifedResearchExpenses"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 10 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
       10
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
           Enter fixed-base percentage, but not more than 16% (see instructions)
             <!--
            <span class="styBoldText">
              <span style="width:16px;"></span>.
              </span>
              -->
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
        10          
        </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:choose>
                <xsl:when test="$Form6765Data/FixedBasePercentage=''">
                  <td class="styTableCell" style="width:17mm;height:5mm;text-align:right;font-size:7pt;border-color:black;">
                    <span style="width:2px;">%</span>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td class="styTableCell" style="width:17mm;height:5mm;text-align:right;font-size:7pt;border-color:black;padding-right:1mm;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasePercentage"/>
                    </xsl:call-template>
                  </td>
                </xsl:otherwise>
              </xsl:choose>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 11 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
          11
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
         Enter average annual gross receipts (see instructions)
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
                                     
            </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
          11          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/AverageAnnualGrossReceipts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 12 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
          12
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
          Multiply line 11 by the percentage on line 10
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
                </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
          12          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasePctTimesGrossReceipts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 13 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
          13
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
         Subtract line 12 from line 9. If zero or less, enter -0-
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
          13          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/AdjTotQualifedResearchExpenses"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 14 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
          14
        </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
           Multiply line 9 by 50% (.50)    
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
            </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
          14          
        </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/HalfAdjTotQlfyResearchExpenses"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!--
    <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:4mm;">
          15
        </div>
          <div class="styLNDesc" style="width:98.75mm;height:4mm;">
            Enter the <span class="styBoldText">smaller</span> of line 13 or line 14          
            <span class="styBoldText">
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.  
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
            </span>          
          </div>              
           <div class="styLNRightNumBox" style="height:4mm;">
          15          
        </div>
        <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form6765Data/SmallestQlfyResearchExpenses"/>
          </xsl:call-template>
        </div>
         <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;"></div>
         <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"></div>
     </div>
     -->
          <!-- line 15-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
          15
        </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
             Enter the <span class="styBoldText">smaller</span> of line 13 or line 14         
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
            </span>
            </div>
            <div class="styLNRightNumBox">
          15          
        </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/SmallestQlfyResearchExpenses"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 16-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
          16
        </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
            Add lines 1, 4,  and 15          
            <span class="styBoldText">
                <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
            </span>
            </div>
            <div class="styLNRightNumBox">
          16          
        </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/RsrchExpensesPlusRsrchPayments"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- 17a -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      17
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
    Are you electing the reduced credit under Section 280C?
        <img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
              <!-- yes checkbox -->
              <span style="width:.5mm;"/>
              <span style="padding-right:1mm;">Yes</span>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
                  <xsl:with-param name="BackupName" select="Form6765Data/CurrentYearCredit"/>
                </xsl:call-template>
              </label>
              <!-- no checkbox -->
              <span style="width:2mm;"/>
              <span style="padding-right:1mm;">No</span>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
                  <xsl:with-param name="BackupName" select="Form6765Data/CurrentYearCredit"/>
                </xsl:call-template>
              </label>
            </div>
            <div class="styLNRightNumBoxNBB"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:10mm;">If “Yes,” multiply line 16 by 13% (.13). If “No,” multiply line 16 by 20% (.20) and see the instructions
for the schedule that must be attached. Members of controlled groups or businesses under
common control: see instructions for the schedule that must be attached 
 
          <!-- Form to Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCredit"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           </span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;border-bottom-width:0px;">17</div>
            <div class="styLNAmountBox" style="height:10.5mm;padding-right:1mm;padding-top:6.5mm;border-bottom-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/ReducedSection280CCrElection"/>
              </xsl:call-template>
            </div>
          </div>
          <!--End of Section A-->
          <!-- Begin Section B-->
          <div class="styBB" style="width:187mm;border-top-width:1px;height:8mm;padding-top:2mm;">
            <div class="styPartDesc" style="font-size:7pt;padding-left:0mm;">Section B&#151;Alternative Incremental Credit. <span class="styNormalText">Skip this section if you are completing Section A or C. </span>
            </div>
          </div>
          <!-- line 18 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">
      18
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">Certain amounts paid or incurred to energy consortia (see the line 1 instructions)
     <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        
             <span style="width:16px;"/>.
 </span>
            </div>
            <div class="styLNRightNumBox" style="width:8.25mm;height:4mm;border-right-width:1px;">18</div>
            <div class="styLNAmountBox" style="height:4mm;border-right-width:0px;border-left-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/EnergyConsortiaAmountSectB"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 19 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      19
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
    Basic research payments to qualified organizations (see the line 2 instructions)
  
       <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>. 
         <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        
     </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
      19          
    </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/BasicResearchPaymentSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 20 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      20
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
    Qualified organization base period amount (see the line 3 instructions)
      </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      20          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/BasePeriodAmountSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 21 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      21
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
    Subtract line 20 from line 19. If zero or less, enter -0-
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox">
      21          
    </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/RsrchPymtMinusBasePrdAmtSectB"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 22 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      22
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
     Add lines 18 and 21
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
          <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
         <span style="width:16px;"/>.
         <span style="width:16px;"/>.
    </span>
            </div>
            <div class="styLNRightNumBox">
      22          
    </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/AddLine18And21"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 23 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      23
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
   Multiply line 22 by 20% (.20)
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.    
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.                                  
      </span>
            </div>
            <div class="styLNRightNumBox">
      23          
    </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/FifthOfRsrchPymtMinusBasePrd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 24  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      24
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
   Wages for qualified services (do not include wages used in figuring the work opportunity credit)
      <span class="styBoldText">
                <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
         <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
     </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
      24         
    </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/WagesForQualifiedServicesSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 25 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      25
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
      Cost of supplies
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      25          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/CostOfSuppliesSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 26 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      26
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
   Rental or lease costs of computers (see the line 7 instructions)
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      26          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/RntlOrLsCostsOfComputersSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 27 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      27
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
      Enter the applicable percentage of contract research expenses (see the line 8 instructions)          
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">
      27          
    </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/PctOfCntrctRsrchExpensesSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 28-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      28
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
       Total qualified research expenses. Add lines 24 through 27
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      28          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/TotQualifedRsrchExpensesSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 29-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      29
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
     Enter average annual gross receipts (see the line 11 instructions)
      <span class="styBoldText">
                <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      29          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/AvgAnnualGrossReceiptsSectB"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 30-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      30
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
      Multiply line 29 by 1% (.01)
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      30          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/OnePctOfAvgAnnualGrossReceipts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 31 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      31
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
     Subtract line 30 from line 28. If zero or less, enter -0-
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      31          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/AdjustedTotalResearchExpenses"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 32-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      32
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
   Multiply line 29 by 1.5% (.015)
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      32          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/PctOfAnnualGrossReceipts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 33-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      33
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
 Subtract line 32 from line 28. If zero or less, enter -0-
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      33          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/RsrchExpnsMinusPctOfGroRcpts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 34-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      34
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
       Subtract line 33 from line 31
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
       </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      34          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/RsrchMinusAdjResearchExpenses"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 35-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      35
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
       Multiply line 29 by 2% (.02)
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      35          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/TwoPctOfAvgAnnualGrossReceipts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 36-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      36
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
    Subtract line 35 from line 28. If zero or less, enter -0-
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
      36          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/ResearchMinus2PctOfReceipts"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey;"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
          </div>
          <!-- line 37-->
          <div class="styBB" style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      37
    </div>
            <div class="styLNDesc" style="width:98.75mm;height:4mm;">
          Subtract line 36 from line 33
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px">
      37          
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;border-bottom-width:0px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/ResearchMinusPctOfReceiptsDiff"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;border-bottom-width:0px"/>
          </div>
          <!--End of Section B-->
          <!-- Page Break-->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
              <span style="width:13mm;"/>                        
      Cat. No. 13700H 
    </div>
            <div style="float:right;">
              <span style="width:40px;"/>  
      Form <span class="styBoldText">6765</span>  (2008)
    </div>
          </div>
          <!-- Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 6765 (2008)<span style="width:140mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!--Begin Page 2 -->
          <!-- Begin Section B-->
          <div class="styBB" style="width:187mm;float:none; clear:none;height:8mm;padding-top:2mm;">
            <div class="styGenericDiv" style="font-size:7pt;font-weight:bold;">Section B—Alternative Incremental Credit<span style="font-weight:normal;font-style:italic;"> (continued)</span>
            </div>
          </div>
          <!-- line 38 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      38
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
 Multiply line 34 by 3% (.03)
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
         <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>. 
        <span style="width:16px;"/>.
                                                 
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">
      38          
    </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:3.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/PctOfResearchMinusAdjResearch"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 39 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      39
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
    Multiply line 37 by 4% (.04)      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
           <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
                                     
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-right:1mm;padding-top:3.5mm">
      39          
    </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:3.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/PctOfResearchMinusReceiptsDiff"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 40-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      40
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
     Multiply line 36 by 5% (.05)      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
                                                  
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-right:1mm;padding-top:3.5mm">
      40          
    </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:3.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/PctOfResearchMinus2PctOfRcpts"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 41-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      41
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
   Add lines 23, 38, 39, and 40
      <span class="styBoldText">
                <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       
      </span>
            </div>
            <div class="styLNRightNumBoxNBB" style="border-bottom-width:1px;padding-right:1mm;">41         
    </div>
            <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/PctOfResearchExpensesTotal"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- line 42a -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">
      42
    </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
    Are you electing the reduced credit under Section 280C?
       <img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
              <!-- yes checkbox -->
              <span style="width:.5mm;"/>
              <span style="padding-right:1mm;">Yes</span>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBCurrentYearCredit"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBCurrentYearCredit"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBCurrentYearCredit"/>
                  <xsl:with-param name="BackupName" select="Form6765Data/SectionBCurrentYearCredit"/>
                </xsl:call-template>
              </label>
              <!-- no checkbox -->
              <span style="width:2mm;"/>
              <span style="padding-right:1mm;">No</span>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBCurrentYearCredit"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBCurrentYearCredit"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBCurrentYearCredit"/>
                  <xsl:with-param name="BackupName" select="Form6765Data/SectionBCurrentYearCredit"/>
                </xsl:call-template>
              </label>
            </div>
            <div class="styLNRightNumBoxNBB"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;"/>
          </div>
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:12mm;">
     If “Yes,” multiply line 41 by 65% (.65). If “No,” enter the amount from lin e 41 and see the line 17
instructions for the schedule that must be attached. Members of controlled groups or businesses
under common control: see instructions for the schedule that must be attached  <span style="width:10px;"/>
              <!-- Form to Form Link -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form6765Data/SectionBCurrentYearCredit"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.

            </span>
            </div>
            <div class="styLNRightNumBox" style="height:12mm;padding-top:8mm;border-bottom-width:0px;">42</div>
            <div class="styLNAmountBox" style="height:12mm;padding-right:1mm;padding-top:8mm;border-bottom-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form6765Data/SectBReducedSect280CCrElection"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Begin Section C-->
          <div class="styBB" style="width:187mm;float:none; clear:none;height:8mm;padding-top:2mm;border-top-width:1px;">
            <div class="styGenericDiv" style="font-size:7pt;font-weight:bold;">Section C—Alternative Simplified Credit. <span class="styNormalText"> Skip this section if you are completing Section A or B.</span>
            </div>
          </div>
          <!-- line 43 -->
          <div class="styBB" style="width:187mm;">
            <div style="width:187mm;">
              <div class="styLNLeftNumBox">43</div>
              <div class="styLNDesc">Certain amounts paid or incurred to energy consortia (see the line 1 instructions)
   <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                             <span style="width:16px;"/>.
             
              </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;">
         43
        </div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/AmtPaidOrIncurredToEnergyCnsrt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 44-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      44
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
Basic research payments to qualified organizations (see the line 2 instructions)
       <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.

         </span>
              </div>
              <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
      44          
    </div>
              <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/BasicResearchPymtToQlfyOrg"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!-- line 45-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      45
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
    Qualified organization base period amount (see the line 3 instructions)
     
    </div>
              <div class="styLNRightNumBox" style="height:4mm;">
      45          
    </div>
              <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/QualifiedOrgBasePeriodAmount"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!--line 46 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">46</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
       Subtract line 45 from line 44. If zero or less, enter -0-
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.

         </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">46</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/AdjBasicResearchPymtToQlfyOrg"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 47 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">47</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
        Add lines 43 and 46
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
 
         </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">47</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SumOfAmtPdAndAdjBscRsrchPymt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 48 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">48</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
       Multiply line 47 by 20% (.20)
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          
         </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">48</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/TwentyPctOfLine47"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 49 -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      49
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
     Wages for qualified services (do not include wages used in figuring the
work opportunity credit)
      <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
       </span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">
      49          
    </div>
              <div class="styLNAmountBox" style="height:8mm;padding-right:1mm;;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/WagesForQualifiedServicesSectC"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:8mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:8mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!-- line 50-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      50
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
       Cost of supplies
      <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.

      </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
      50          
    </div>
              <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CostOfSuppliesSectC"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!-- line 51 -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
     51
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
     Rental or lease costs of computers (see the line 7 instructions)
      <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
       </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
      51          
    </div>
              <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/RntlOrLsCostsOfComputersSectC"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!--
     <div style="width:187mm">
    <div class="styLNLeftNumBox" style="height:4mm;">
      49
    </div>
    <div class="styLNDesc" style="width:98.2mm;height:4mm;">
     Wages for qualified services (do not include wages used in figuring the
work opportunity credit)
      <span class="styBoldText">
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.
        <span style="width:16px;"></span>.  
        <span style="width:16px;"></span>.  
        <span style="width:16px;"></span>.
       </span>
    </div>              
    <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">
      49          
    </div>
    <div class="styLNAmountBox" style="height:8mm;padding-right:1mm;;padding-top:4mm" >
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form6765Data/WagesForQualifiedServicesSectC"/>
      </xsl:call-template>
    </div>
    <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:8mm;border-right-width:1px;background-color:lightgrey"></div>
         <div class="styLNAmountBoxNBB" style="height:8mm;border-right-width:0px;border-left-width:0px;"></div>
    </div>
    -->
            <!-- line 52 -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      52
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
    Enter the applicable percentage of contract research expenses (see the
line 8 instructions)
      <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
          <span style="width:16px;"/>.  
         <span style="width:16px;"/>.
      </span>
              </div>
              <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
      52          
    </div>
              <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:3mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/ApplcblPctOfCntrctRsrchExpnss"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;padding-top:.5mm;"/>
            </div>
            <!-- line 53 -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      53
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;;">
     Total qualified research expenses. Add lines 49 through 52
      <span class="styBoldText">
                  <span style="width:16px;"/>.
   
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
       </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
      53          
    </div>
              <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/TotalQualifiedResearchExpenses"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!-- line 54 -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      54
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
     Enter your total qualified research expenses for the prior 3 tax years. If
you had no qualified research expenses in any one of those years, skip
lines 55 and 56
      <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  

      </span>
              </div>
              <div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">
      54          
    </div>
              <div class="styLNAmountBox" style="height:11mm;padding-right:1mm;padding-top:7mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/TotQlfyRsrchExpnssForPrior3TYs"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:11mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:11mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!-- line 55-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      55
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
    Divide line 54 by 6.0
      <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.  
        <span style="width:16px;"/>.
       </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
      55          
    </div>
              <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/PartialResearchExpenses"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!-- line 56-->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      56
    </div>
              <div class="styLNDesc" style="width:98.2mm;height:4mm;">
     Subtract line 55 from line 53. If zero or less, enter -0-
      <span class="styBoldText">
                  <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
      
      </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
      56          
    </div>
              <div class="styLNAmountBox" style="height:4mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/DiffOfTotalAndPartialRsrchExp"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
            </div>
            <!--line 57 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">57</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
               Multiply<br/>
                <img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
                Line 56 by 12% (.12) for tax years ending before 2009,
        <br/>
                <img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
                Line 56 by 14% (.14) for tax years ending after 2008, or
          <br/>
                <img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
                Line 53 by 6% (.06) if you skipped line 55 and 56.
              </div>
              <div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">57</div>
              <div class="styLNAmountBox" style="height:14mm;padding-right:1mm;padding-top:10mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/MultiplyDiffRsrchExpByPct"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 58 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">58</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
    Add lines 48 and 57
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
 
         </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">58</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SumOfLN48AndLN57"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 59 -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;">
      59
    </div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
    Are you electing the reduced credit under Section 280C?
        <img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
                <!-- yes checkbox -->
                <span style="width:.5mm;"/>
                <span style="padding-right:1mm;">Yes</span>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectionCReducedCr"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/SectionCReducedCr"/>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectionCReducedCr"/>
                    <xsl:with-param name="BackupName" select="Form6765Data/SectionCReducedCr"/>
                  </xsl:call-template>
                </label>
                <!-- no checkbox -->
                <span style="width:2mm;"/>
                <span style="padding-right:1mm;">No</span>
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectionCReducedCr"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/SectionCReducedCr"/>
                    </xsl:call-template>
                  </input>
                </span>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/SectionCReducedCr"/>
                    <xsl:with-param name="BackupName" select="Form6765Data/SectionCReducedCr"/>
                  </xsl:call-template>
                </label>
              </div>
              <div class="styLNRightNumBoxNBB"/>
              <div class="styLNAmountBoxNBB" style="height:4mm;"/>
            </div>
            <div class="styBB" style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
If “Yes,” multiply line 58 by 65% (.65). If “No,” enter the amount from line 58 and see the line 17
instructions for the schedule that must be attached. Members of controlled groups or businesses
under common control: see instructions for the schedule that must be attached
   
          <!-- Form to Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SectionCReducedCr"/>
                </xsl:call-template>
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           </span>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:8mm">59</div>
              <div class="styLNAmountBoxNBB" style="height:8mm;;padding-top:8mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/SectCReducedSect280CCrElection"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Begin Section D-->
            <div class="styBB" style="width:187mm;float:none; clear:none;">
              <div class="styGenericDiv" style="font-size:7pt;font-weight:bold;height:8mm;padding-top:2mm;">Section D &#151; Summary
             </div>
            </div>
            <!--line 60 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">60</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
               Enter the portion of the credit from Form 8932, line 2, that is attributable to wages that were also
               used to figure the credit on line 17, line 42, or line 59 (whichever applies)
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                    <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                 <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
              </span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">60</div>
              <div class="styLNAmountBox" style="height:8mm;padding-right:1mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CrForEmployerDiffWagePmnt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 61 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">61</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
        Subtract line 60 from line 17, line 42, or line 59 (whichever applies). If zero or less, enter -0-
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            
         </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">61</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/AdjCurrentYearCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 62 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">62</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
        Credit for increasing research activities from partnerships, S corporations, estates, and trusts
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            
         </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">62</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/ResearchActivitiesIncreaseCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 63 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">63</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
             Add line 61 and  62. Estates and trusts go to line 64; 
             partnerships and S corporations, report this amount on Schedule K; all others, report this amount
             on line 1c of Form 3800
 <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
              </span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm">63</div>
              <div class="styLNAmountBox" style="height:8mm;padding-right:1mm;;padding-top:5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CurrentYearCreditPlusIncrease"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 64 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">64</div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">
    Amount allocated to beneficiaries of the estate or trust (see instructions)
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">64</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/BeneficiariesAllocation"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- line 65 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">65
              </div>
              <div class="styLNDesc" style="width:138mm;height:4mm;">Estates and trusts:
               subtract line 64 from line 63. Report the credit on line 1c of Form 3800 <span class="styBoldText">
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                 
                </span>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top:.5mm;">
               65
           </div>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/EstatesAndTrustsNetTotal"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- END Part II  -->
          <!--Footer-->
          <div style="width:187mm; text-align:right;padding-top:1mm;">        
        Form <span class="styBoldText">6765</span>    (2008)
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
              <xsl:with-param name="TargetNode" select="$Form6765Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 16 - Reduced Credit Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form6765Data/RegularCredit/@reducedCreditIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 39 - Reduced Credit Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form6765Data/AlternateIncrementalCredit/@reducedCreditIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
