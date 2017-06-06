<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]><!-- Last modified on8/11/2010 by Robert Jones Updates made per BSP-101319OTH Tax Year to 2010 -->
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->
<!-- Updated 6/29/2012 per UWR 58215 by Robert L Jones -->
<!-- Last modified on 09/19/2012 by Robert Jones for UWR 58215 after getting the 2012 PDF's-->
<!-- Last modified on 12/20/2012 by Robert Jones IBM Defect 34230-->
<!-- Last modified on 10/24/2013 by Robert Jones IBM Defect 38593 comma needed on line 30a-->
<!-- Last modified on 10/29/2013 by Robert Jones IBM Defect 38584 made 1-29 vertical-align-top, other nit picking stuff rejected-->
<!-- Last modified on 12/03/2013 by Robert Jones Kisams 1382939 made 25 - 28 larger for other -->
<!-- Last modified on 1/07/2014 by Robert Jones IBM Defect 38584 NO data diff font -->
<!-- Updated 5/29/2014 per UWR 107551 and pdf dated 3/27/14 by Robert L Jones -->
<!-- Last modified on 7/31/2014 by Robert Jones IBM Defect 41083 HEADER ALIGNMENT -->
<!-- Updated 4/23/2015 per UWR 123023 IE11 changes by Robert L Jones -->
<!-- Last modified on 6/3/2015 by Robert Jones IBM Defect 43119 IE11 Fixes -->
<!-- Updated 8/05/2015 per UWR 161465 Tax Year by Robert L Jones -->
<!-- Updated 10/22/2015 per PDF REVIEW by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleMStyle.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form990ScheduleMData" select="$RtnDoc/IRS990ScheduleM"/>

<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form990ScheduleMData)"/></xsl:call-template></title>

   <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Desc" content="IRS Form 990 Schedule M"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>
    <style type="text/css">
    
    <xsl:if test="not($Print) or $Print=''">
      
        <xsl:call-template name="IRS990ScheduleMStyle"/>
        <xsl:call-template name="AddOnStyle"/>
   </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
  <form name="Form990ScheduleM">
    
      <xsl:call-template name="DocumentHeader"/>
      <div class="styTBB" style="width:187mm;height:auto;">
        <div class="styFNBox" style="width:28mm;height:auto;"> 
          <div style="height:auto;">
            <span class="styFormNumber" style="font-size:9pt;">SCHEDULE M<br/>(Form 990)
            </span>
          <br/>
       <!--    <span style="width:2px;"></span>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleMData"/>
            </xsl:call-template>  -->          
          </div>
          <div style="padding-top:7mm;"><br/>
            <div class="styAgency" style="padding-top:1.5mm;height:auto;">Department of the Treasury</div>
            <div class="styAgency">Internal Revenue Service</div>
          </div>
        </div>
        
        <div class="styFTBox" style="width:128mm;height:auto;">
          <div class="styMainTitle" style="padding-top:1mm;font-size:14pt;">Noncash Contributions</div>
          <div class="styFBT" style="padding-top:1mm;margin-top:.5mm;font-weight:bold;text-align:left;height:auto;">
          <span style="font-size:7pt;font-weight:bold;width:128mm;padding-left:1mm;padding-top:1mm;text-align:left;">
         <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>Complete if the organizations answered "Yes" on Form 990, Part IV, lines 29 or 30. </span>
             <br/>
         <span style="padding-left:1mm;padding-top:1mm;text-align:left;"><img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> Attach to Form 990.</span>
                         <br/>
            <span style="padding-left:1mm;padding-top:1mm;text-align:left;"> <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>Information about Schedule M (Form 990) and its instructions is at <!--www.irs.gov/form990.-->
          <a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/form990</i>
            </a></span>
         </div>
          <div>
         </div>
        </div>
        <div class="styTYBox" style="width:30mm;height:auto;">
          <div class="styOMB" style="height:auto;">OMB No. 1545-0047</div>
          <div class="styTY">20<span class="styTYColor">16</span></div>
          <div class="styPartName" style="padding-top:3mm; width:30.5mm;height:auto;">Open to Public Inspection</div>
        </div>
      </div>

   
         <!-- Begin Name and Identifying Number Section-->      
<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;height:auto;">
  <div class="styFNBox" style="width:135mm;height:auto;">
     Name of the organization<br/>
    <div style="font-family:verdana;font-size:6pt;height:6.25mm">
     <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
    </xsl:call-template>
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
    </xsl:call-template>
   </div> 
  </div>
  
  <div class="styGenericDiv" style="width:50mm;height:auto;padding-left:1mm;">
    <span class="styBoldText">Employer identification number</span>
    <br/><br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
    </xsl:call-template>
  </div>
</div>
<!-- End Name and Identifying Number Section-->      




    <!-- Begin Part I-->
    <!-- BEGIN Part I Title -->
    <div class="styBB" style="width:187mm;float:none;height:4mm;">
      <div class="styPartName" style="float:left;width:14mm;">Part I</div>
      <div class="styPartDesc" style="width:43mm;">Types of Property</div>
      <div class="styGenericDiv" style="width:129mm;">
     </div>
    </div>
    <!-- END Part I Title -->
    <!-- Begin Part I Table-->
      
<div class="styTable" style="border-top-width: 1px; width:187mm;border-bottom-width:1px;height:100%;display:table; ">
<table class="styTable" style="font-size: 7pt;border-color:black;" cellspacing="0">
<thead>
    <tr scope="col">

       <th class="styTableCellHeader" scope="col" colspan="2" style="border-top-width:0px;border-bottom-width:0px;width:57mm;border-left-width:0px; "><span class="styTableCellPad"/></th>

      <th class="styTableCellHeader" style="width:10mm;vertical-align:top;padding-top:1mm;" scope="col">
        (a)<br/><span class="styNormalText">Check if applicable</span>
      </th>
      <th class="styTableCellHeader" style=" width:35mm;vertical-align:top;padding-top:1mm;" scope="col">
        (b)<br/><span class="styNormalText">Number of contributions or items contributed</span>
      </th>
      <th class="styTableCellHeader" style="width:35mm;vertical-align:top;padding-top:1mm;" scope="col">
        (c)<br/><span class="styNormalText">Noncash contribution amounts reported on<br/>Form 990, Part VIII, line 1g</span>
      </th>
      <th class="styTableCellHeader" style="width:50mm; border-right-width: 0px;vertical-align:top;padding-top:1mm;" scope="col">
        (d)<br/><span class="styNormalText">Method of determining<br/>noncash contribution amounts</span>
      </th>
    </tr>
  </thead>
  <tfoot/>
  
  <!-- Line 1  -->
   <tbody valign="top">
      <tr>
           <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">1</span><span style="width:2mm"/>
         Art—Works of art
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;margin-left:2mm;">....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/WorksOfArtGrp/NonCashCheckboxInd"/>
              </xsl:call-template>
              </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
      <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/WorksOfArtGrp/ContributionCnt"/></xsl:call-template></td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
      <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/WorksOfArtGrp/NoncashContributionsRptF990Amt"/></xsl:call-template></td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/WorksOfArtGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 

<!-- Line 2 -->  
   <tr>
     <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">2</span><span style="width:2mm"/>
         Art—Historical treasures
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3.5mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
       <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleMData//ArtHistoricalTreasuresGrp/NonCashCheckboxInd"/>
              </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
      <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtHistoricalTreasuresGrp/ContributionCnt"/>
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
      <xsl:call-template name="PopulateAmount">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtHistoricalTreasuresGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;">
      <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtHistoricalTreasuresGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 

<!-- Line 3 -->

   <tr>
    <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">3</span><span style="width:2mm"/>
         Art—Fractional interests
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;  margin-left:3.5mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterestGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
       <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterestGrp/ContributionCnt"/>
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
       <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterestGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:top;text-align:left;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterestGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 

      
<!--  Line 4  -->
          
   <tr>
     <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">4</span><span style="width:2mm"/>
         Books and publications
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4.5mm;">..</span>
</td>

      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BooksAndPublicationsGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;background-color:gray;"> <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BooksAndPublicationsGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:top;text-align:left;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BooksAndPublicationsGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 

<!--  Line 5 -->
<tr>
  <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">5</span>
         <span style="width:2mm"/>
         Clothing and household<br/>
          <span style="width:7mm"/>goods
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">.......</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;padding-top:2mm;vertical-align:top;"> <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ClothingAndHouseholdGoodsGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;background-color:gray;"> <span class="styTableCellPad"/></td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ClothingAndHouseholdGoodsGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ClothingAndHouseholdGoodsGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 
    
    
      <!--  Line 6 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">6</span><span style="width:2mm"/>
         Cars and other vehicles
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3.5mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
                   <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehiclesGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehiclesGrp/ContributionCnt"/>
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehiclesGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left;vertical-align:top;">
               <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehiclesGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 
    
   <!--  Line 7 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">7</span><span style="width:2mm"/>
         Boats and planes
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;margin-left:1mm;">....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanesGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanesGrp/ContributionCnt"/>
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanesGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:top;text-align:left;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanesGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 
    
    
    
    <!--  Line 8 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">8</span><span style="width:2mm"/>
         Intellectual property
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;margin-left:3mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualPropertyGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualPropertyGrp/ContributionCnt"/>
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualPropertyGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:top;text-align:left;">
             <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualPropertyGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 
    
    
    
  <!--  Line 9 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">9</span><span style="width:2mm"/>
         Securities—Publicly traded
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:1mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTradedGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
             <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTradedGrp/ContributionCnt"/>
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
                 <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTradedGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTradedGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 

    
    
    <!--  Line 10 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">10</span><span style="width:2mm"/>
          Securities—Closely held stock
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:1mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesCloselyHeldStockGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
                   <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesCloselyHeldStockGrp/ContributionCnt"/>
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesCloselyHeldStockGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:top;text-align:left;">
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesCloselyHeldStockGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 
    
    
  <!--  Line 11 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">11</span>
         <span style="width:2mm"/>
          Securities—Partnership, LLC,<br/>
          <span style="width:7mm"/>
    or trust interests
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">....</span>
     </td>
      <td class="styTableCell" style="width:10mm;text-align:center;padding-top:2mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecurPrtnrshpTrustIntrstsGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;padding-top:2.5mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecurPrtnrshpTrustIntrstsGrp/ContributionCnt"/>
     </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;padding-top:2.5mm;vertical-align:top;"> <span class="styTableCellPad"/>
             <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecurPrtnrshpTrustIntrstsGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; padding-top:2.5mm;text-align:left;vertical-align:top;">
       <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecurPrtnrshpTrustIntrstsGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 

    
    
  <!--  Line 12 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">12</span><span style="width:2mm"/>
          Securities—Miscellaneous
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;  margin-left:1mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesMiscellaneousGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesMiscellaneousGrp/ContributionCnt"/>
     </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
                   <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesMiscellaneousGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:top;text-align:left;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesMiscellaneousGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 
    
    
 <!--  Line 13 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm;" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">13</span>
         <span style="width:2mm"/>
         Qualified conservation <br/><span style="width: 7mm;"/>
         contribution—Historic <br/>
         <span style="width: 7mm;"/>structures
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2.5mm;">.....</span>
  </td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribHistStructGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
       </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribHistStructGrp/ContributionCnt"/>
     </xsl:call-template>
  </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribHistStructGrp/NoncashContributionsRptF990Amt"/>
        </xsl:call-template>
  </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
       <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData//QualifiedContribHistStructGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>      </td>     
    </tr> 

    
    
 <!--  Line 14 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width:57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">14</span><span style="width:2mm"/>
          Qualified conservation<br/>
          <span style="width: 7mm"/>
          contribution—Other
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribOtherGrp/NonCashCheckboxInd"/>
      </xsl:call-template>
    </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribOtherGrp/ContributionCnt"/>
     </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribOtherGrp/NoncashContributionsRptF990Amt"/>
      </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
       <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribOtherGrp/MethodOfDeterminingRevenuesTxt"/>
      </xsl:call-template>      </td>     
    </tr> 
    
    
    
 <!--  Line 15 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">15</span><span style="width:2mm"/>
          Real estate—Residential
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateResidentialGrp/NonCashCheckboxInd"/>
      </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateResidentialGrp/ContributionCnt"/>
     </xsl:call-template>
   </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateResidentialGrp/NoncashContributionsRptF990Amt"/>
      </xsl:call-template>
    </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left; vertical-align:top;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateResidentialGrp/MethodOfDeterminingRevenuesTxt"/>
      </xsl:call-template>      </td>     
    </tr> 
    
    
  <!--  Line 16 -->
          <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">16</span><span style="width:2mm"/>
          Real estate—Commercial

                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;font-family:verdana;font-size:7pt;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateCommercialGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateCommercialGrp/ContributionCnt"/>
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateCommercialGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
    </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateCommercialGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 


     <!--  Line 17 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">17</span><span style="width:2mm"/>
          Real estate—Other
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateOtherGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateOtherGrp/ContributionCnt"/>
      </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateOtherGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateOtherGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr> 

    
      <!--  Line 18 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">18</span><span style="width:2mm"/>
          Collectibles
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">.....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CollectiblesGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CollectiblesGrp/ContributionCnt"/>
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CollectiblesGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left; vertical-align:top;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CollectiblesGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr>

    
    <!--  Line 19 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">19</span><span style="width:2mm"/>
           Food inventory              
              <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
     </td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/FoodInventoryGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/FoodInventoryGrp/ContributionCnt"/>
      </xsl:call-template>
     </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/FoodInventoryGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/FoodInventoryGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr>
    
 <!--  Line 20 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">20</span><span style="width:2mm"/>
          Drugs and medical supplies
                           <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/DrugsAndMedicalSuppliesGrp/NonCashCheckboxInd"/>
     </xsl:call-template>
   </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/DrugsAndMedicalSuppliesGrp/ContributionCnt"/>
      </xsl:call-template></td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/DrugsAndMedicalSuppliesGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
           <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/DrugsAndMedicalSuppliesGrp/MethodOfDeterminingRevenuesTxt"/>
   </xsl:call-template>
</td>     
    </tr>
    
  
<!--  Line 21 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">21</span><span style="width:2mm"/>
          Taxidermy
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">......</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/TaxidermyGrp/NonCashCheckboxInd"/>
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/TaxidermyGrp/ContributionCnt"/>
      </xsl:call-template>
     </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/TaxidermyGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/TaxidermyGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr>
    
     <!--  Line 22 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">22</span><span style="width:2mm"/>
          Historical artifacts
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/HistoricalArtifactsGrp/NonCashCheckboxInd"/>
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/HistoricalArtifactsGrp/ContributionCnt"/>
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/HistoricalArtifactsGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/HistoricalArtifactsGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr>
    
    
        <!--  Line 23 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">23</span><span style="width:2mm"/>
          Scientific specimens
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;  margin-left:2mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ScientificSpecimensGrp/NonCashCheckboxInd"/>
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ScientificSpecimensGrp/ContributionCnt"/>
      </xsl:call-template>
     </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ScientificSpecimensGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ScientificSpecimensGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr>
    
      <!--  Line 24 -->
       <tr>
          <td class="styTableCell" style="text-align:left; vertical-align:top;border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">24</span><span style="width:2mm"/>
          Archeological artifacts
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArchaeologicalArtifactsGrp/NonCashCheckboxInd"/>
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArchaeologicalArtifactsGrp/ContributionCnt"/>
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad "/>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArchaeologicalArtifactsGrp/NoncashContributionsRptF990Amt"/>
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArchaeologicalArtifactsGrp/MethodOfDeterminingRevenuesTxt"/>
        </xsl:call-template>
      </td>     
    </tr>


    <!-- Line 25 Through 28 -->
    <!-- 
          The OtherNonCashContributionsTable data element repeats and is unbounded, 
          so there may be more rows displayed then line 25 through 28. Each line in 
          excess of line 28 will not be given a line number 
    -->

    <xsl:for-each select="$Form990ScheduleMData/OtherNonCashContriTableGrp">


       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
              <xsl:choose>
                <xsl:when test="position() = 1">
                  25
                </xsl:when>
                <xsl:when test="position() = 2">
                  26
                </xsl:when>
                <xsl:when test="position() = 3">
                  27
                </xsl:when>
                <xsl:when test="position() = 4">
                  28
                </xsl:when>
                <xsl:otherwise>
                  <span style="width:4mm"/>
                </xsl:otherwise>
              </xsl:choose>
            </span>
            
            <span style="width:2mm"/>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> (
            <span style="width:35mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Desc"/>
                </xsl:call-template> )
            </span>
           
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="NonCashCheckboxInd"/>
            </xsl:call-template>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="ContributionCnt"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> <span class="styTableCellPad"/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="NoncashContributionsRptF990Amt"/>
            </xsl:call-template>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:top;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="MethodOfDeterminingRevenuesTxt"/>
            </xsl:call-template>
          </td>     
       </tr>       
       
    </xsl:for-each>

    <!-- The following lines will display blank lines 25 through 28 if not enough data exists -->

    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContriTableGrp) &lt; 1">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  25
            </span>
            <span style="width:2mm"/>
            Other <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> (
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:top;text-align:left;">
            <span class="styTableCellPad"/>
          </td>     
       </tr>
    </xsl:if>
    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContriTableGrp) &lt; 2">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  26
            </span>
            <span style="width:2mm"/>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> (
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:top;text-align:left;">
            <span class="styTableCellPad"/>
          </td>     
       </tr>
    </xsl:if>
    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContriTableGrp) &lt; 3">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  27
            </span>
            <span style="width:2mm"/>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> ( 
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:top;text-align:left;">
            <span class="styTableCellPad"/>
          </td>     
       </tr>
    </xsl:if>
    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContriTableGrp) &lt; 4">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  28
            </span>
            <span style="width:2mm"/>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> ( 
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:top;"> 
            <span class="styTableCellPad"/>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:top;text-align:left;">
            <span class="styTableCellPad"/>
          </td>     
       </tr>
    </xsl:if>

     
   </tbody> 
 </table>
 
 <!--  Line 29 -->
 <!--<div class="styGenericDiv" style="width:187mm;height:1mm;padding-left:1mm;" />-->
  <div style="width:187mm;" class="styBB"/>
    <div class="styLNLeftNumBox" style="height:7.5mm;width:7mm;font-size:7pt;padding-left:.7mm;">29</div>
      <div class="styLNDesc" style="width:129.8mm;height:7.5mm;font-size:7pt;">
        <span class="styNormalText">
           Number of Forms 8283 received by the organization during the tax year for contributions <br/>for 
           which the organization completed Form 8283, Part IV, Donee Acknowledgement
</span>
 <!--Dotted Line -->
<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt;padding-top:3mm; margin-left:2mm;"></span>
          </div>

            <div class="styLNRightNumBox" style="height:7.5mm;width:7.5mm;font-size:7pt;padding-top:3mm;">29</div>
      <div class="styLNAmountBox" style="height:7.5mm;font-size:7pt;width:42mm;padding-top:3mm;"> 
         <xsl:call-template name="PopulateAmount">
          <!--<xsl:with-param name="MaxSize" select="6" />-->
          <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/Form8283ReceivedCnt"/>
        </xsl:call-template>
  
</div>
 

  <!-- line 30a  Yes - No boxes  -->
  
  <div class="IRS990ScheduleM_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
  <div class="IRS990ScheduleM_LineIndex" style="border-top-width:0px;height:4mm;"/>
  <div class="IRS990ScheduleM_LineDesc" style="width:155.25mm;height:4mm;border-right-width:0px;border-top-width:0px;">
    </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="border-top-width:0px;width:7.90mm;padding-top:.25mm;border-bottom-width:0px;height:4mm;"/>
  <div class="IRS990ScheduleM_LineIndexMid" style="border-top-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;">Yes</div>
  <div class="IRS990ScheduleM_LineIndexMid" style="border-right-width:0px;width:7.75mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;border-top-width:0px;">No</div>
</div>

  <!-- line 30a -->

 <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0;font-size:7pt;">30a</div>
      <div class="styLNDesc" style="width:155mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
      During the year, did the organization receive by contribution any property reported in Part I, lines 1 through 28, that 
       it must hold for at least three years from the date of the initial contribution, and which is not required to be used 
       for exempt purposes for the entire holding period?
       <!--Dotted Line-->
         <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...................</span>
      </div>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:1px;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:1px;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:1px;padding-top:0mm;"/>
    </div>
    <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:auto;"/>
      <div class="styLNDesc" style="width:155mm;height:auto;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
        
         
        </div>
         <div class="styShadingCell" style="width:8mm;height:2.5mm;padding-bottom:0mm;border-left-width:1px;padding-top:1mm;border-top-width:0px;"/>
      <div class="styShadingCell" style="width:8mm;height:2.5mm;padding-bottom:0mm;padding-top:1mm;border-top-width:0px;"/>
      <div class="styShadingCell" style="width:8mm;height:2.5mm;padding-bottom:0mm;padding-top:1mm;border-top-width:0px;"/>
    </div>

   <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4.5mm;"/>
      <div class="styLNDesc" style="width:155mm;height:4.5mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
      
        
      </div>
      
    <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;width:8.25mm;border-left-width:1px;border-right-width:1px;padding-top:1mm;font-size:7pt;"><b>30a</b></div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;padding-top:1mm;font-size:7pt;width:8.25mm;">
    <span style="font-weight: normal;">
         <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/AnyPropertyThatMustBeHeldInd"/>
      </xsl:call-template>
      </span>
     </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;font-size:7pt;">
     <span style="font-weight: normal;">
         <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/AnyPropertyThatMustBeHeldInd"/>
      </xsl:call-template>
       </span>
    </div>
</div>

<!-- line 30b -->
 <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.25mm;font-size:7pt;">b</div>
      <div class="styLNDesc" style="width:155mm;height:4.5mm;font-size:7pt;">
        <span class="styNormalText">
          If "Yes," describe the arrangement in Part II.
        </span>
      </div>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;"/>
    </div>
      
  <!-- Line 31 -->    
  
   <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm;font-size:7pt;">31</div>
      <div class="styLNDesc" style="width:155mm;height:4.5mm;padding-top:1.25mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
        Does the organization have a gift acceptance policy that requires the review of any nonstandard contributions?
        </span>
     </div>
      
       <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;width:8.25mm;border-left-width:1px;font-size:7pt;padding-top:1mm;border-right-width:1px;">31</div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;padding-top:1mm;font-size:7pt;width:8.25mm;border-right-width:1px;">
    <span style="font-weight: normal;">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ReviewProcessUnusualNCGiftsInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="padding-top:1mm;font-size:7pt;border-right-width:0px;border-bottom-width:1px;width:7.5mm;height:4.5mm;">
   <span style="font-weight: normal;">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ReviewProcessUnusualNCGiftsInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- Line 32a -->

  <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1.5mm;font-size:7pt;">32a</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1.5mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
        Does the organization hire or use third parties or related organizations to solicit, process, or sell noncash
        </span>
      </div>
      <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1.5mm;padding-top:1mm;"/>
      <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1.5mm;padding-top:1mm;"/>
      <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1.5mm;padding-top:1mm;"/>
    </div>
   
   <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4mm;"/>
      <div class="styLNDesc" style="width:155mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
           contributions?
        </span>
        <!--Dotted Line-->
       <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........................</span>
      </div>
      
       <div class="IRS990ScheduleM_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;font-size:7pt;padding-top:0mm;border-right-width:1px;">32a</div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4mm;padding-top:0mm;font-size:7pt;width:8.25mm;border-right-width:1px;">
   <span style="font-weight: normal;">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ThirdPartiesUsedInd"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="padding-top:1mm;border-right-width:0px;font-size:7pt;border-bottom-width:1px;width:7.5mm;height:4mm;">
    <span style="font-weight: normal;">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ThirdPartiesUsedInd"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- line 32b -->
 <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.25mm;font-size:7pt;">b</div>
      <div class="styLNDesc" style="width:155mm;height:4.5mm;font-size:7pt;">
        <span class="styNormalText">
          If "Yes," describe in Part II.
        </span>
      </div>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;padding-top:0mm;"/>
    </div>
  
  <!-- Line 33 -->

  <div style="width:187mm;" class="styBB">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0;font-size:7pt;">33</div>
      <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
       If the organization did not report an amount in column (c) for a type of property for which column (a) is checked,
        </span>
      </div>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"/>
       
   <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;"/>
      <div class="styLNDesc" style="width:155mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
            describe in Part II.
        </span> </div>

        <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"/>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"/>
</div>
</div>
 </div>
  
 
   <!-- Page Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageEnd">
      <div class="styGenericDiv" style="width:112mm;font-size:6pt;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
      <div class="styGenericDiv" style="padding-left:6mm;width:35mm;font-size:6pt;"><span class="styNormalText">Cat. No. 51227J</span></div>
      <div class="styGenericDiv" style="float:right;font-size:6pt;"><span class="styBoldText">Schedule M (Form 990) (2016)</span> 
    </div> </div>
<!--END Page Footer-->

  <!-- Page 2 header -->
    <div style="width:187mm;clear:both;padding-bottom:0mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;font-size:6.25pt;font-weight:bold;padding-top:1mm;" class="styGenericDiv">Schedule M (Form 990) (2016)</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
      <div style="float:right;font-size:6.25pt;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:7pt;">2</span></div>
    </div>
<!-- END Page2 Header -->   


<!-- PART  II SUPPLEMENAL  INFORMATION    -->

 <div class="styGenericDiv" style="width: 187mm;">
  <div class="styPartName" style="width:18mm;">Part II</div>
    <div class="styPartDesc" style="width:169mm;border-bottom-width:1px;border-color: black;height:auto;"><b>Supplemental Information. </b> <span class="styNormalText">Provide the information required by Part I, lines 30b, 32b, and 33, and whether the organization is reporting in Part I, column (b), the number of contributions, the number of items received, or a combination of both. Also complete this part for any additional information. </span></div>
    
        <span style="float:right">  
          <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SupplementalInformationDetail"/>              
              <xsl:with-param name="containerHeight" select="5"/>
              <xsl:with-param name="containerID" select="'SUPctn'"/>
          </xsl:call-template>    
        </span>
     </div> 

<div class="styTableContainer" style="width: 187mm; border-bottom-width: 2px;display:table;" id="SUPctn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
  <thead class="styTableThead">
    
    <tr class="styDepTblHdr">
          
          <!--<th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Identifier </th>-->
          <th class="styDepTblCell" scope="col" style="height:auto;width:50mm;text-align:center;font-size:7pt;font-weight:normal;border-right-width:0px;">Return Reference</th>  
          <th class="styDepTblCell" scope="col" style="height:auto;width:137mm;text-align:center;font-size:7pt;font-weight:normal;">Explanation</th>                
          

    </tr>
  </thead>
  <tfoot/>
  <tbody valign="top">
   <xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($Form990ScheduleMData/SupplementalInformationDetail) &lt;20))">
      <xsl:for-each select="$Form990ScheduleMData/SupplementalInformationDetail">
          <tr>
     <!-- <td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="IdentifierTxt"/>
            </xsl:call-template>
      </td>-->
      <td class="styTableCell" style="text-align:left; border-right-width: 1px; width:50mm;height:auto;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
              </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align:left; border-right-width: 0px; width:137mm;height:auto;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
              </xsl:call-template>
           </td>      

    </tr>     
     </xsl:for-each>
<!--     <xsl:call-template name="PopulateAdditionalRows">
      <xsl:with-param name="RowCounter" select="count($Form990ScheduleMData/Form990ScheduleMPartII) + 1" ></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
    <xsl:if test="($Print=$Separated) and (count($Form990ScheduleMData/Form990ScheduleMPartII) &gt;5)">
    <xsl:call-template name="PopulateAdditionalRows">
      <xsl:with-param name="RowCounter" select="1" ></xsl:with-param>
    </xsl:call-template> -->
    </xsl:if>
  </tbody>
</table>
</div>

<xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SupplementalInformationDetail"/>
            <xsl:with-param name="containerHeight" select="5"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>

 
   <!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageEnd">
   
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule M (Form 990) (2016)</span></div>
    </div>






<!-- Recycle Image -->
 <p style="page-break-before: always"/> 
     <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
      </div>
      
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleMData"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
        
    </table>



<!--  Part II  Supplemental Information - Additional data -->
<!--<xsl:if test="($Print = $Separated) and (count($Form990ScheduleMData/Form990ScheduleMPartII) &gt;27)">
<br/>
<span class="styRepeatingDataTitle">Form 990 Schedule M Part II - Supplemental Information</span>
<table class="styDepTbl" style="font-size: 7pt" cellspacing="0">
  <thead class="styTableThead">
    <tr class="styDepTblHdr"> 
      <th class="styDepTblCell" style="text-align: left; border-right-width:0px; width: 187mm; padding-left: 3mm" scope="col">
        <span class="styNormalText" style="border-bottom-width:1px;">
          Complete this part to provide the information required by Part I, lines 30b, 32b, and 33. <br />Also complete this part for any additional information.
        </span>
      </th>
    </tr>
    </thead>
   <tbody>
      <xsl:for-each select="$Form990ScheduleMData/Form990ScheduleMPartII">
          <tr>
            <xsl:attribute name="class">
       <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
      <td class="styDepTblCell" style="background-color:yellow;text-align:left; width:50mm;border-right-width: 0px;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Identifier" />
            </xsl:call-template>
      </td>
      <td class="styDepTblCell" style="text-align:left; border-right-width: 0px; width: 50mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ReturnReference" />
              </xsl:call-template>
           </td>  
      <td class="styDepTblCell" style="text-align:left; border-right-width: 0px; width: 87mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Explanation" />
              </xsl:call-template>
           </td>        
         </tr>     
      </xsl:for-each>
    </tbody>
  </table>
</xsl:if> -->
    
</form>
 </body>
 </html>
 
</xsl:template>
</xsl:stylesheet>