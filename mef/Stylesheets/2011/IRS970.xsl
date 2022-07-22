<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS970Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form970" select="$RtnDoc/IRS970"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form970)"/>
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
        <meta name="Description" content="IRS Form 970"/>
        <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS970Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form970">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:19mm;">
          Form <span class="styFormNumber">970</span>
              <br/>
              <span class="styAgency">(Rev. December 2005)</span>
              <span style="width:1mm;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:19mm;">
              <br/>
              <div class="styMainTitle">Application To Use LIFO Inventory Method</div>
              <br/>
              <br/>
              <div class="styFST" style="padding-top:1mm;">
                <img src="{$ImagePath}/970_Bullet.gif" width="4" height="7" alt="Bullet"/> Attach to your tax return.
          </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:19mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0042</div>
              <br/>
              <div>
                <span style="padding-right:30px;">Attachment </span>
                <br/>Sequence No.<span class="styBoldText">
                  <span style="width:4px;"/>122</span>
              </div>
            </div>
          </div>
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;">
            <div class="styFNBox" style="width:117mm;height:8mm;">
          Name of filer (name of parent corporation if a consolidated group) (see instructions)<br/>
         
<!--<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">-->
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
</xsl:call-template>
<!--</xsl:when>-->
<!--<xsl:otherwise>-->
<br/>
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">Name</xsl:with-param>
</xsl:call-template>
<!--</xsl:otherwise>-->
<!--</xsl:choose>  -->
            </div>
             <!-- Begin Identifying Number Section-->
          
            <div class="styGenericDiv" style="width:69mm;height:4mm;padding-left:1mm;">
              <span class="styBoldText">Filer's identification number</span> (see instructions)
          <br/>
              <br/>
      
          <!--   ****************************************************************************** -->     
   <!--       <xsl:choose>-->
<!--<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">-->
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">EIN</xsl:with-param>
</xsl:call-template>
<!--</xsl:when>
-->
<!--<xsl:otherwise>-->
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
</xsl:call-template>
<!--</xsl:otherwise>
</xsl:choose>    -->
	<!--   ****************************************************************************** --> 

            </div>
          </div>
          <!-- Begin Other Name and Identifying Number Section -->
         <div class="styBB" style="width:187mm;height:8mm;clear:both;">
          Name of applicant(s) (if different from filer) and identification number(s)<br/>
          
            <xsl:for-each select="$Form970/ApplicantInformation">
                   <xsl:choose>
                        <xsl:when test="ApplicantBusinessName !=''">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ApplicantBusinessName/BusinessNameLine1"/>
                            </xsl:call-template>
                        <xsl:if test="ApplicantBusinessName/BusinessNameLine2 !=''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ApplicantBusinessName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>,
              
                   </xsl:when>
              	</xsl:choose>
              	 <xsl:choose>
                        <xsl:when test="ApplicantPersonName !=''">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ApplicantPersonName"/>
                            </xsl:call-template>,
                            <span style="width:3mm:"/>
                   </xsl:when>
              	</xsl:choose>
             <xsl:if test="SSN !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateSSN">
                       <xsl:with-param name="TargetNode" select="SSN"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
 
              
              
             <xsl:if test="EIN !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateEIN">
                       <xsl:with-param name="TargetNode" select="EIN"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
              <xsl:if test="MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>

      
              <br/>
            </xsl:for-each>
          </div>
          <!-- End Name and Identifying Number Section-->
          <!-- BEGIN Part I Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:3.5mm;">Part I </div>
            <div class="styPartDesc" style="width:152mm;height:3.5mm;">Statement of Election under Section 472</div>
            <div class="styIRS970LNYesNoBox" style="width:10mm;height:3.5mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;">Yes</div>
            <div class="styIRS970LNYesNoBox" style="width:10mm;height:3.5mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;">No</div>
          </div>
          <!-- END Part I  Title -->
          <!--Begin Part I -->
          <div style="width:187mm;height:4.5mm;">
            <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:1.8mm;">1</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
          The applicant elects to use the LIFO inventory method for the tax year ending 
          (enter month, day, year)
          <span style="width:2px"/>
              <img src="{$ImagePath}/970_Bullet.gif" alt="Bullet"/>
              <span style="width:4px;"/>
              <span class="styUnderlineAmount" style="width:18mm; float:none;text-align:left;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form970/ElectsLIFOMthdForFirstTYEnding"/>
                </xsl:call-template>
              </span>
              <br/>
              <span style="vertical-align:top;">
            for the following goods (enter here):
          </span>
              <span style="width:2px;"/>
              <span class="styUnderlineAmount" style="width:108mm;float:none;text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form970/LIFOMthdGoodsForFirstTY"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;height:6mm;">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:158mm;">
          See instructions and attach a statement if necessary.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOMthdGoodsForFirstTY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;height:8mm;">
            <div class="styLNLeftNumBoxSD">2</div>
            <div class="styLNDesc" style="width:158mm;">
          In an attached statement, identify and describe the inventory method(s) used by 
          the applicant in the prior tax year for the goods covered by this election.
        </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:.7mm;">3a</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
          Is the applicant already using the LIFO inventory method for any other goods?
          <span style="width:2px;"/>
              <!--Dotted Line-->
           <span style="letter-spacing:4mm;font-weight:bold">...........</span>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOMthdCurrUsedForOthGoods"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOMthdCurrUsedForOthGoods"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:158mm;">
          If "Yes" to line 3a, attach a statement identifying and describing the goods and the LIFO methods used.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOMthdCurrUsedForOthGoods"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2.2mm;">4a</div>
            <div class="styLNDesc" style="width:158mm;height:6mm;padding-top:2mm;">
          Has the applicant ever used the LIFO inventory method for the goods covered by this election?
          <!--Dotted Line-->
           <span style="letter-spacing:4mm;font-weight:bold;">.......</span>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:6mm;padding-top:2mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOInventoryMethodUsedBefore"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:6mm;padding-top:2mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOInventoryMethodUsedBefore"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:8mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:158mm;">
          If "Yes" to line 4a, attach a statement listing the tax years for which the LIFO inventory 
          method was used and explaining why the LIFO inventory method was discontinued.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOInventoryMethodUsedBefore"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          
<!--  Line 5  -->          
          
          <div class="styBB" style="width:187mm;height:4.5mm;">
            <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:1.8mm;">5</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
          The applicant will not use the LIFO inventory method to account for the following goods 
          (enter here):
          <span style="width:2px"/>
           <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOInventoryMethodUsedBefore"/>
              </xsl:call-template>
               <span style="width:4px;"/>
              <img src="{$ImagePath}/970_Bullet.gif" alt="Bullet"/>
              <span style="width:4px;"/>
              <span class="styUnderlineAmount" style="width:14mm; float:none;text-align:left;"/>
              <br/>
            
                <xsl:for-each select="$Form970/LIFOMethodGoods">
                <span class="styUnderlineAmount" style="width:156mm;float:none;text-align:left;">
                <span style="width:2px"/>
                <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOInventoryMethodUsedBefore"/>
              </xsl:call-template>
              <span style="width:4px"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template></span>
                  <br/>
                </xsl:for-each>
              
              <br/>
          Attach a statement if necessary.
        </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <!--End Part I -->
          <!-- BEGIN Part II Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:3.5mm;">Part II</div>
            <div class="styPartDesc" style="width:152mm;height:3.5mm;">LIFO Inventory Requirements</div>
            <div class="styIRS970LNYesNoBox" style="width:10mm;height:3.5mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;">Yes</div>
            <div class="styIRS970LNYesNoBox" style="width:10mm;height:3.5mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width:0px;padding-top:0mm;padding-bottom:0mm;">No</div>
          </div>
          <!-- END Part II  Title -->
          <!--Begin Part II -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-top:.7mm;">6a</div>
            <div class="styLNDesc" style="width:158mm;height:7.5mm;">
          Did the applicant value the closing inventories of goods covered by this election at 
          cost for the tax year immediately preceding the tax year specified on line 1?
          <!--Dotted Line-->
              <span style="letter-spacing:4mm;font-weight:bold;">.....................</span>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/ClsInventoriesValuedForPriorTY"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/ClsInventoriesValuedForPriorTY"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;height:7.5mm;">b</div>
            <div class="styLNDesc" style="width:158mm;height:7.5mm;">
          If "No" to line 6a, did the applicant value the beginning inventories of goods covered 
          by this election at cost for the tax year specified on line 1 as required by section 472(d)?
          <!--Dotted Line-->
            <span style="letter-spacing:4mm;font-weight:bold;">..................</span> 
            </div>
            <div class="styShadingCell" style="height:3.3mm;width:10mm;"/>
            <div class="styShadingCell" style="height:3.3mm;width:10mm;"/>
            <div class="styIRS970LNYesNoBox" style="height:3.2mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/BegngInventoryValuedForFirstTY"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:3.2mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/BegngInventoryValuedForFirstTY"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;padding-left:4mm;"/>
            <div class="styLNDesc" style="width:158mm;padding-top:0mm;">
          If "No" to line 6b, attach an explanation.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/BegngInventoryValuedForFirstTY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;height:4.5mm;">c</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
          If "Yes" to line 6b, will the applicant account for the adjustment required by 
          section 472(d) over a 3-year period?
        </div>
            <div class="styIRS970LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/AdjIncludedInIncomeOver3Years"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/AdjIncludedInIncomeOver3Years"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;padding-left:4mm;"/>
            <div class="styLNDesc" style="width:158mm;padding-top:0mm;">
          If "No" to line 6c, attach an explanation.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/AdjIncludedInIncomeOver3Years"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;height:3mm;">
            <div class="styGenericDiv" style="width:166mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:7.5mm;padding-top:.7mm;">7a</div>
            <div class="styLNDesc" style="width:158mm;height:7.5mm;">
          When determining the beginning inventories of goods covered by this election, did the 
          applicant treat those goods as being acquired for a unit cost that is equal to the 
          total cost of those goods divided by the total number of units on hand?
        </div>
            <div class="styShadingCell" style="height:3.3mm;width:10mm;"/>
            <div class="styShadingCell" style="height:3.3mm;width:10mm;"/>
            <div class="styIRS970LNYesNoBox" style="height:3.2mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/ItemAGoodsTreatedAsAcquired"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:3.2mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/ItemAGoodsTreatedAsAcquired"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:158mm;padding-top:0mm;">
          If "No" to line 7a, attach an explanation.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/ItemAGoodsTreatedAsAcquired"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;height:3mm;">
            <div class="styGenericDiv" style="width:166mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:10.5mm;padding-top:.7mm;">8a</div>
            <div class="styLNDesc" style="width:158mm;height:10.5mm;">
          Did the applicant (or any member of the same group of financially related corporations 
          as defined in section 472(g)) issue credit statements or reports to shareholders, 
          partners, other proprietors, or beneficiaries covering the tax year specified on line 1?
          <!--Dotted Line-->
             <span style="letter-spacing:4mm;font-weight:bold;">............................</span> 
            </div>
            <div class="styShadingCell" style="height:6mm;width:10mm;"/>
            <div class="styShadingCell" style="height:6mm;width:10mm;"/>
            <div class="styIRS970LNYesNoBox" style="height:3.2mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/CrStatementsOrReportsIssued"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:3.2mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/CrStatementsOrReportsIssued"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:158mm;padding-top:0mm;">
          If "Yes" to line 8a, attach a statement describing the recipient(s), the date(s) of 
          issuance, and the inventory method(s) used to determine income, profit, or loss in 
          those statements.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/CrStatementsOrReportsIssued"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;height:3mm;">
            <div class="styGenericDiv" style="width:166mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4.5mm;">9a</div>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
          Will the applicant determine beginning and ending inventories at cost regardless of market value?
          <!--Dotted Line-->
             <span style="letter-spacing:4mm;font-weight:bold;">......</span> 
            </div>
            <div class="styIRS970LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/InventoryNotTakenAtActualCost"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/InventoryNotTakenAtActualCost"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:158mm;padding-top:0mm;">
          If "No" to line 9a, attach an explanation.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/InventoryNotTakenAtActualCost"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;height:3mm;">
            <div class="styGenericDiv" style="width:166mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:13.5mm;padding-top:.7mm;">10a</div>
            <div class="styLNDesc" style="width:158mm;height:13.5mm;">
          As a condition of adopting the LIFO inventory method, Regulations section 1.472-4 requires a taxpayer to agree
          to make any adjustments incident to the change to, the change from, or the use of, the LIFO inventory method
          that, upon the examination of the taxpayer's income tax return, the IRS determines are necessary to clearly reflect
          income. Does the applicant agree to this condition?
          <!--Dotted Line-->
              <span style="letter-spacing:4mm;font-weight:bold;">.......................</span> 
            </div>
            <div class="styShadingCell" style="height:9.5mm;width:10mm;"/>
            <div class="styShadingCell" style="height:9.5mm;width:10mm;"/>
            <div class="styIRS970LNYesNoBox" style="height:4mm;border-bottom-width:0px;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/Sect14724AdjustmentAgreement"/>
              </xsl:call-template>
            </div>
            <div class="styIRS970LNYesNoBox" style="height:4mm;border-bottom-width:0px;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form970/Sect14724AdjustmentAgreement"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styBB" style="width:187mm;height:4mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:158mm;padding-top:0mm;">
          If “No” to line 10a, the applicant is not eligible to use the LIFO inventory method and does not need to file Form 970.
        </div>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
            <div class="styShadingCell" style="height:100%;width:10mm;"/>
          </div>
          <!--End Part II -->
          <!-- BEGIN Part III Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:3.5mm;">Part III</div>
            <div class="styPartDesc" style="height:3.5mm;">Specific Goods (Unit) Method</div>
          </div>
          <!-- END Part III  Title -->
          <!-- Begin Part III -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-top:0mm;">11</div>
            <div class="styGenericDiv" style="width:179mm;">
          Under Regulations section 1.472-1, the types of goods in the opening inventory must be 
          compared with similar types of goods in the closing inventories. Attach a list of the 
          types or categories of goods that will be compared, describe the goods that will be 
          included in each type or category, and identify the unit of measure (pounds, barrels, 
          feet, etc.) used for each type or category.
        </div>
          </div>
          <!-- Begin Footer -->
          <div style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see the instructions.</span>
              <span style="width:90px;"/>
              Cat. No. 17057T
            </div>
            <div style="float:right;">
              <span style="width:1px;"/>
              Form<span class="styBoldText"> 970 </span>(Rev. 12-2005)
        </div>
          </div>
          <!-- End Footer -->
          <br class="pageEnd"/>
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 970 (Rev. 12-2005)<span style="width:100mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- BEGIN Part III Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:3.5mm;">Part III</div>
            <div class="styPartDesc" style="height:3.5mm;">
          Specific Goods (Unit) Method
          <span style="font-weight:normal;">(Continued)</span>
            </div>
          </div>
          <!-- END Part III  Title -->
          <div style="width:187mm;height:8mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:.7mm;">12</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:.7mm;">
          Check the box corresponding to the method that the applicant will use to determine the cost of the goods in the closing
          inventories in excess of the cost of the goods in the opening inventories (see instructions):
        </div>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/ActCostGdsMostRctPrchsOrPrdcd"/>
                <xsl:with-param name="BackupName">IRS970ActCostGdsMostRctPrchsOrPrdcd</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/ActCostGdsMostRctPrchsOrPrdcd"/>
                <xsl:with-param name="BackupName">IRS970ActCostGdsMostRctPrchsOrPrdcd</xsl:with-param>
              </xsl:call-template>
            Actual cost of goods most recently purchased or produced
          </label>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/AvgCostOfGdsPrchsOrPrdcdDurYr"/>
                <xsl:with-param name="BackupName">IRS970AvgCostOfGdsPrchsOrPrdcdDurYr</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/AvgCostOfGdsPrchsOrPrdcdDurYr"/>
                <xsl:with-param name="BackupName">IRS970AvgCostOfGdsPrchsOrPrdcdDurYr</xsl:with-param>
              </xsl:call-template>
            Average cost of goods purchased or produced during the tax year
          </label>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/ActlCostGdsPrchsOrPrdcdAcqOrd"/>
                <xsl:with-param name="BackupName">IRS970ActlCostGdsPrchsOrPrdcdAcqOrd</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/ActlCostGdsPrchsOrPrdcdAcqOrd"/>
                <xsl:with-param name="BackupName">IRS970ActlCostGdsPrchsOrPrdcdAcqOrd</xsl:with-param>
              </xsl:call-template>
            Actual cost of goods purchased or produced in the order of acquisition
          </label>
          </div>
          <div class="styBB" style="width:187mm;height:7mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/OtherMethodUsed"/>
                <xsl:with-param name="BackupName">IRS970OtherMethodUsed</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/OtherMethodUsed"/>
                <xsl:with-param name="BackupName">IRS970OtherMethodUsed</xsl:with-param>
              </xsl:call-template>
            Other (attach explanation)
          </label>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form970/OtherMethodUsed"/>
            </xsl:call-template>
          </div>
          <!--End Part III -->
          <!-- BEGIN Part IV Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:3.5mm;">Part IV</div>
            <div class="styPartDesc" style="height:3.5mm;">
          Dollar-Value Method
        </div>
          </div>
          <!-- END Part IV  Title -->
          <!--Begin Part IV -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:.7mm;">13</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:.7mm;">
          Attach a statement describing the applicant's method of defining "items."
        </div>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;">14a</div>
            <div class="styGenericDiv" style="width:157mm;">
          Did the applicant acquire any of the goods covered by this election at below-market prices?
          <!--Dotted Line-->
               <span style="letter-spacing:4mm;font-weight:bold;">........</span> 
            </div>
            <div class="styGenericDiv" style="font-weight:bold;width:14mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form970/GoodsAcquiredAtBelowMrktPrices"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form970/GoodsAcquiredAtBelowMrktPrices"/>
                    <xsl:with-param name="BackupName" select="IRS970GoodsAcquiredAtBelowMrktPrices"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form970/GoodsAcquiredAtBelowMrktPrices"/>
                  <xsl:with-param name="BackupName" select="IRS970GoodsAcquiredAtBelowMrktPrices"/>
                </xsl:call-template>
            Yes
          </label>
            </div>
            <div class="styGenericDiv" style="font-weight:bold;width:8mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form970/GoodsAcquiredAtBelowMrktPrices"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form970/GoodsAcquiredAtBelowMrktPrices"/>
                    <xsl:with-param name="BackupName" select="IRS970GoodsAcquiredAtBelowMrktPrices"/>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form970/GoodsAcquiredAtBelowMrktPrices"/>
                </xsl:call-template>
            No
          </label>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:5.7mm;padding-top:0mm;">b</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:0mm;">
          If "Yes" to line 14a, attach a statement explaining whether the applicant did, or will, 
          account for the goods purchased at below-market prices and similar goods produced or 
          acquired at market prices as separate items. If the applicant did, or will, account 
          for both types of goods as the same item, explain and justify.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/GoodsAcquiredAtBelowMrktPrices"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:.7mm;">15</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:.7mm;">
          Attach a statement describing the method of pooling the applicant will use for the goods 
          covered by this election. If the applicant will use more than one dollar-value pool, list 
          and describe the contents of each dollar-value pool (see instructions).
        </div>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:.7mm;">16</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:.7mm;">
          Identify or describe the method the applicant will use to compute the LIFO value of each 
          dollar-value pool containing goods covered by 
        </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;"/>
            <div class="styGenericDiv" style="width:121mm;padding-top:0mm;">
          this election (for example, double-extension method, link-chain method, or index method).
        </div>
        
            <div class="styUnderlineAmount" style="width:45mm;text-align:left;">
            <span style="width:5mm;">
           <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/LIFOCmptMthdForDolValuePooling"/>
              </xsl:call-template>
              </span>
              <xsl:for-each select="$Form970/LIFOCmptMthdForDolValuePooling">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="."/>
                </xsl:call-template>
                <br/>
              </xsl:for-each>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;"/>
            <div class="styGenericDiv" style="width:179mm;padding-top:0mm;">
          If the applicant's method is neither the double-extension method nor the Inventory Price 
          Index Computation method, attach a statement describing the method in detail and justifying 
          the applicant's use of the selected method (see instructions).
        </div>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:.7mm;">17</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:.7mm;">
          Check the box corresponding to the method the applicant will use to determine the 
          current-year cost of goods in the closing inventories and to value the LIFO 
          increments of the dollar-value pool(s) (see instructions).
        </div>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/DollarValueMthdCostOfGdsPrchs"/>
                <xsl:with-param name="BackupName">Form970DollarValueMthdCostOfGdsPrchs</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/DollarValueMthdCostOfGdsPrchs"/>
                <xsl:with-param name="BackupName">Form970DollarValueMthdCostOfGdsPrchs</xsl:with-param>
              </xsl:call-template>
            Actual cost of goods most recently purchased or produced
          </label>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/DolValueMthdAvgCostOfGdsPrch"/>
                <xsl:with-param name="BackupName">Form970DolValueMthdAvgCostOfGdsPrch</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/DolValueMthdAvgCostOfGdsPrch"/>
                <xsl:with-param name="BackupName">Form970DolValueMthdAvgCostOfGdsPrch</xsl:with-param>
              </xsl:call-template>
            Average cost of goods purchased or produced during the tax year
          </label>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/DolVlMthdCostOfGdsPrchsInOrd"/>
                <xsl:with-param name="BackupName">Form970DolVlMthdCostOfGdsPrchsInOrd</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/DolVlMthdCostOfGdsPrchsInOrd"/>
                <xsl:with-param name="BackupName">Form970DolVlMthdCostOfGdsPrchsInOrd</xsl:with-param>
              </xsl:call-template>
            Actual cost of goods purchased or produced in the order of acquisition
          </label>
          </div>
          <div class="styBB" style="width:187mm;height:7mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/DollarValueOtherMethodUsed"/>
                <xsl:with-param name="BackupName">Form970DollarValueOtherMethodUsed</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/DollarValueOtherMethodUsed"/>
                <xsl:with-param name="BackupName">Form970DollarValueOtherMethodUsed</xsl:with-param>
              </xsl:call-template>
            Other (attach explanation)
            <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/DollarValueOtherMethodUsed"/>
                <xsl:with-param name="BackupName">Form970DollarValueOtherMethodUsed</xsl:with-param>
              </xsl:call-template>
            </label>
          </div>
          <!--End Part IV -->
          <!-- BEGIN Part V Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:3.5mm;">Part V</div>
            <div class="styPartDesc" style="height:3.5mm;">
          Inventory Price Index Computation (IPIC) Method
        </div>
          </div>
          <!-- END Part V  Title -->
          <!--Begin Part V -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:.7mm;">18</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:.7mm;">
          Check the box corresponding to the method the applicant will use to compute the LIFO value 
          of each dollar-value pool containing goods covered by this election (see instructions).
        </div>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/DoubleExtensionIPICMethod"/>
                <xsl:with-param name="BackupName">Form970DoubleExtensionIPICMethod</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/DoubleExtensionIPICMethod"/>
                <xsl:with-param name="BackupName">Form970DoubleExtensionIPICMethod</xsl:with-param>
              </xsl:call-template>
            Double-extension IPIC method
          </label>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/LinkChainIPICMethod"/>
                <xsl:with-param name="BackupName">Form970LinkChainIPICMethod</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/LinkChainIPICMethod"/>
                <xsl:with-param name="BackupName">Form970LinkChainIPICMethod</xsl:with-param>
              </xsl:call-template>
            Link-chain IPIC method
          </label>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:.7mm;">19</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:.7mm;">
          Check the box corresponding to the table from which the applicant will select Bureau of Labor 
          Statistics (BLS) price indexes (see instructions).          
        </div>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/Table3CPIDetailedReport"/>
                <xsl:with-param name="BackupName">Form970Table3CPIDetailedReport</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/Table3CPIDetailedReport"/>
                <xsl:with-param name="BackupName">Form970Table3CPIDetailedReport</xsl:with-param>
              </xsl:call-template>
            Table 3 of the Consumer Price Index (CPI) Detailed Report
          </label>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/Table6PPIDetailedReport"/>
                <xsl:with-param name="BackupName">Form970Table6PPIDetailedReport</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/Table6PPIDetailedReport"/>
                <xsl:with-param name="BackupName">Form970Table6PPIDetailedReport</xsl:with-param>
              </xsl:call-template>
            Table 6 of the Producer Price Index (PPI) Detailed Report
          </label>
          </div>
          <div style="width:187mm;height:4mm;padding-left:8mm;">
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form970/OtherTablePPIDetailedReport"/>
                <xsl:with-param name="BackupName">Form970OtherTablePPIDetailedReport</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;"/>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form970/OtherTablePPIDetailedReport"/>
                <xsl:with-param name="BackupName">Form970OtherTablePPIDetailedReport</xsl:with-param>
              </xsl:call-template>
            Other table of the PPI Detailed Report
          </label>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;"/>
            <div class="styGenericDiv" style="width:179mm;padding-top:0mm;">
          If the applicant will use "Other table of the PPI Detailed Report," attach a statement 
          explaining why the other table is more appropriate than Table 6.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/OtherTablePPIDetailedReport"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;">20</div>
            <div class="styGenericDiv" style="width:157mm;">
          Will the applicant use the 10 percent method (see instructions)?
          <!--Dotted Line-->
             <span style="letter-spacing:4mm;font-weight:bold;">...............</span> 
            </div>
            <div class="styGenericDiv" style="font-weight:bold;width:14mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form970/TenPercentMethod"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form970/TenPercentMethod"/>
                     <xsl:with-param name="BackupName">IRS970TenPercentMethod</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form970/TenPercentMethod"/>
                  <xsl:with-param name="BackupName">IRS970TenPercentMethod</xsl:with-param>
                </xsl:call-template>
            Yes
          </label>
            </div>
            <div class="styGenericDiv" style="font-weight:bold;width:8mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form970/TenPercentMethod"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form970/TenPercentMethod"/>
                    <xsl:with-param name="BackupName">IRS970TenPercentMethod</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form970/TenPercentMethod"/>
                  <xsl:with-param name="BackupName">IRS970TenPercentMethod</xsl:with-param>
                </xsl:call-template>
            No
          </label>
            </div>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;">21</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:0mm;">
          If the applicant elects to use a representative month for selecting BLS price indexes 
          from the applicable Detailed Report, enter the representative month elected for each 
          dollar-value pool.
          <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Form 970, Line 21 - BLS price index representative month</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form970/BLSPriceIndexRepMonth"/>
              </xsl:call-template>
              <br/>
          See instructions and attach a statement if necessary.
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form970/BLSPriceIndexRepMonth"/>
              </xsl:call-template>
            </div>
          </div>
          <!--End Part V -->
          <!-- BEGIN Part VI Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:3.5mm;">Part VI</div>
            <div class="styPartDesc" style="height:3.5mm;">
          Other Information
        </div>
          </div>
          <!-- END Part VI  Title -->
          <!--Begin Part VI -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;">22</div>
            <div class="styGenericDiv" style="width:179mm;padding-top:0mm;">
          Attach a statement describing the applicant's method of determining the cost of 
          inventory items (for example, standard cost method, actual invoice cost, joint 
          product cost method, or retail inventory method).
        </div>
          </div>
          <div style="width:187mm;height:3mm;"/>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-top:0mm;">23</div>
            <div class="styGenericDiv" style="width:157mm;">
          Did the applicant receive IRS consent to change the method of valuing inventories for 
          the tax year specified on line 1 (see instructions)?
          <!--Dotted Line-->
              <span style="letter-spacing:4mm;font-weight:bold;">............................</span> 
            </div>
            <div class="styGenericDiv" style="font-weight:bold;width:14mm;padding-top:3mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form970/CnsntChgValuingInventoriesMthd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form970/CnsntChgValuingInventoriesMthd"/>
                    <xsl:with-param name="BackupName">IRS970CnsntChgValuingInventoriesMthd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form970/CnsntChgValuingInventoriesMthd"/>
                  <xsl:with-param name="BackupName">IRS970CnsntChgValuingInventoriesMthd</xsl:with-param>
                </xsl:call-template>
            Yes
          </label>
            </div>
            <div class="styGenericDiv" style="font-weight:bold;width:8mm;padding-top:3mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form970/CnsntChgValuingInventoriesMthd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form970/CnsntChgValuingInventoriesMthd"/>
                    <xsl:with-param name="BackupName">IRS970CnsntChgValuingInventoriesMthd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form970/CnsntChgValuingInventoriesMthd"/>
                  <xsl:with-param name="BackupName">IRS970CnsntChgValuingInventoriesMthd</xsl:with-param>
                </xsl:call-template>
            No
          </label>
            </div>
          </div>
          <!--End Part VI -->
          <!-- Begin Footer -->
          <div style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:1px;"/>
              Form<span class="styBoldText"> 970 </span>(Rev. 12-2005)
        </div>
          </div>
          <!-- End Footer -->
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
              <xsl:with-param name="TargetNode" select="$Form970"/>
              <xsl:with-param name="DescWidth" select="110"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 970, Line 21 - BLS price index representative month</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form970/BLSPriceIndexRepMonth"/>
              <xsl:with-param name="DescWidth" select="110"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
