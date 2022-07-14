<?xml version="1.0" ?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<!-- Last modified on8/11/2010 by Robert Jones Updates made per BSP-101319OTH Tax Year to 2010 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleMStyle.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*" />
<xsl:param name="Form990ScheduleMData" select="$RtnDoc/IRS990ScheduleM" />

<xsl:template match="/">

<html>
  <head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form990ScheduleMData)"></xsl:with-param></xsl:call-template></title>

   <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 990 Schedule M" />
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">
    
    <xsl:if test="not($Print) or $Print=''">
      
        <xsl:call-template name="IRS990ScheduleMStyle"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
   </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
  <form name="Form990ScheduleM">
    
      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      <div class="styTBB" style="width:187mm;height:20mm;">
        <div class="styFNBox" style="width:28mm;"> 
          <div style="height:9.5mm;">
            <span class="styFormNumber" style="font-size:9pt;" >SCHEDULE M<br/>(Form 990)
            </span>
          <br/>
       <!--    <span style="width:2px;"></span>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleMData"/>
            </xsl:call-template>  -->          
          </div>
          <div style="padding-top:1mm;"><br/>
            <div class="styAgency" style="padding-top:1.5mm;">Department of the Treasury</div>
            <div class="styAgency">Internal Revenue Service</div>
          </div>
        </div>
        
        <div class="styFTBox" style="width:128mm;">
          <div class="styMainTitle" style="padding-top:1mm;font-size:14pt;">NonCash Contributions</div>
          <div class="styFBT" style="padding-top:2mm;margin-top:.5mm;font-weight:bold;">
          <span style="font-size:7.5pt;font-weight:bold;width:85mm;padding-bottom:0mm;padding-top:1mm;">
            <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>Complete if the organization answered "Yes" on Form 990, Part IV, lines 29 or 30. 
             <br/> <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> Attach to Form 990.</span>
         </div>
          <div>
         </div>
        </div>
        <div class="styTYBox" style="width:30mm;">
          <div class="styOMB" >OMB No. 1545-0047</div>
          <div class="styTY" >20<span class="styTYColor">10</span></div>
          <div class="styPartName" style=" width:30.5mm;">Open to Public Inspection</div>
        </div>
      </div>

   
         <!-- Begin Name and Identifying Number Section-->      
<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
  <div class="styFNBox" style="width:135mm;height:8mm;">
     Name of the organization<br/>
    <div style="font-family:verdana;font-size:6pt;height:6.25mm">
     <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
    </xsl:call-template>
    <br />
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
    </xsl:call-template>
   </div> 
  </div>
  
  <div class="styGenericDiv" style="width:50mm;height:4mm;padding-left:1mm;">
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
      
<div class="styTable" style="border-top-width: 1px; width:187mm;border-bottom-width:1px;height:100%; ">
<table class="styTable" style="font-size: 7pt;border-color:black;" cellspacing="0">
<thead >
    <tr scope="col">

       <th class="styTableCellHeader" scope="col" colspan="2"  style="border-top-width:0px;border-bottom-width:0px;width:57mm;border-left-width:0px; "><span class="styTableCellPad" ></span></th>

      <th class="styTableCellHeader" style="width:10mm;vertical-align:top;padding-top:1mm;" scope="col">
        (a)<br/><span class="styNormalText">Check if applicable</span>
      </th>
      <th class="styTableCellHeader" style=" width:35mm;vertical-align:top;padding-top:1mm;" scope="col">
        (b)<br/><span class="styNormalText">Number of Contributions or items contributed</span>
      </th>
      <th class="styTableCellHeader" style="width:35mm;vertical-align:top;padding-top:1mm;" scope="col">
        (c)<br/><span class="styNormalText">Contribution amounts reported on<br/>Form 990, Part VIII, line 1g</span>
      </th>
      <th class="styTableCellHeader" style="width:50mm; border-right-width: 0px;vertical-align:top;padding-top:1mm;" scope="col">
        (d)<br/><span class="styNormalText">Method of determining<br />contribution amounts</span>
      </th>
    </tr>
  </thead>
  <tfoot></tfoot>
  
  <!-- Line 1  -->
   <tbody valign="top">
      <tr>
           <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">1</span><span style="width:2mm"></span>
         Art—Works of art
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;margin-left:2mm;">....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode"
               select="$Form990ScheduleMData/WorksOfArt/NonCashCheckbox" />
              </xsl:call-template>
              </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
      <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/WorksOfArt/NumberOfContributions" /></xsl:call-template></td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
      <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/WorksOfArt/NoncashContribsRptdF990" /></xsl:call-template></td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/WorksOfArt/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 

<!-- Line 2 -->  
   <tr>
     <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">2</span><span style="width:2mm"></span>
         Art—Historical treasures
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3.5mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
       <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode"
               select="$Form990ScheduleMData//ArtHistoricalTreasures/NonCashCheckbox" />
              </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
      <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtHistoricalTreasures/NumberOfContributions" />
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
      <xsl:call-template name="PopulateAmount">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtHistoricalTreasures/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;">
      <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtHistoricalTreasures/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 

<!-- Line 3 -->

   <tr>
    <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">3</span><span style="width:2mm"></span>
         Art—Fractional interests
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;  margin-left:3.5mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
          <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterest/NonCashCheckbox" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
       <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterest/NumberOfContributions" />
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
       <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterest/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:bottom;text-align:left;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArtFractionalInterest/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 

      
<!--  Line 4  -->
          
   <tr>
     <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">4</span><span style="width:2mm"></span>
         Books and publications
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4.5mm;">..</span>
</td>

      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
            <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BooksAndPublications/NonCashCheckbox" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;background-color:gray;" > <span class ="styTableCellPad"></span>
      </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BooksAndPublications/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:bottom;text-align:left;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BooksAndPublications/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 

<!--  Line 5 -->
<tr>
  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">5</span><span style="width:2mm"></span>
         Clothing and household<br/>
          <span class="styNormalText" ></span><span style="width: 7.5mm"></span>
 goods
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">.......</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;padding-top:2mm;" > <span class ="styTableCellPad"></span>
            <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ClothingAndHouseholdGoods/NonCashCheckbox" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;background-color:gray;" > <span class ="styTableCellPad"></span></td>
      <td class="styTableCell" style="width:35mm;padding-top:2.5mm" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ClothingAndHouseholdGoods/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left;vertical-align:bottom;">
        <xsl:call-template name="PopulateText">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ClothingAndHouseholdGoods/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 
    
    
      <!--  Line 6 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">6</span><span style="width:2mm"></span>
         Cars and other vehicles
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3.5mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
                   <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehicles/NonCashCheckbox" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehicles/NumberOfContributions" />
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehicles/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left;vertical-align:bottom;">
               <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/CarsAndOtherVehicles/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 
    
   <!--  Line 7 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">7</span><span style="width:2mm"></span>
         Boats and planes
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;margin-left:1mm;">....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanes/NonCashCheckbox" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanes/NumberOfContributions" />
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanes/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/BoatsAndPlanes/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 
    
    
    
    <!--  Line 8 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">8</span><span style="width:2mm"></span>
         Intellectual property
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;margin-left:3mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualProperty/NonCashCheckbox" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualProperty/NumberOfContributions" />
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualProperty/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:bottom;text-align:left;">
             <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/IntellectualProperty/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 
    
    
    
  <!--  Line 9 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:2mm">9</span><span style="width:2mm"></span>
         Securities—Publicly traded
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:1mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTraded/NonCashCheckbox" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
             <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTraded/NumberOfContributions" />
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
                 <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTraded/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPubliclyTraded/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 

    
    
    <!--  Line 10 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">10</span><span style="width:2mm"></span>
          Securities—Closely held stock
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:1mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/SecuritiesCloselyHeldStock/NonCashCheckbox" />
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
                   <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesCloselyHeldStock/NumberOfContributions" />
        </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesCloselyHeldStock/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/SecuritiesCloselyHeldStock/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 
    
    
  <!--  Line 11 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">11</span><span style="width:2mm"></span>
          Securities—Partnership, LLC,<br/>
          <span class="styNormalText" ></span><span style="width: 7.5mm"></span>
    or trust interests
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">....</span>
     </td>
      <td class="styTableCell" style="width:10mm;text-align:center;padding-top:2mm;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/SecuritiesPrtnrshpTrustIntrsts/NonCashCheckbox" />
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;padding-top:2.5mm;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPrtnrshpTrustIntrsts/NumberOfContributions" />
     </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;padding-top:2.5mm;" > <span class ="styTableCellPad"></span>
             <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesPrtnrshpTrustIntrsts/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; padding-top:2.5mm;text-align:left;">
       <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/SecuritiesPrtnrshpTrustIntrsts/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 

    
    
  <!--  Line 12 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">12</span><span style="width:2mm"></span>
          Securities—Miscellaneous
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;  margin-left:1mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/SecuritiesMiscellaneous/NonCashCheckbox" />
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesMiscellaneous/NumberOfContributions" />
     </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
                   <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/SecuritiesMiscellaneous/NoncashContribsRptdF990" />
        </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;vertical-align:bottom;text-align:left;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/SecuritiesMiscellaneous/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 
    
    
 <!--  Line 13 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm;" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">13</span><span style="width:2mm"></span>
         Qualified conservation <br /><span style="width: 7.5mm;"></span>
         contribution—Historic <br/><span style="width: 7.5mm;"></span>structures
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2.5mm;">.....</span>
  </td>
      <td class="styTableCell" style="width:10mm;text-align:center;padding-top:4mm;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/QualifiedContribHistStruct/NonCashCheckbox" />
        </xsl:call-template>
       </td>      
      <td class="styTableCell" style="width:35mm;padding-top:5mm;" > <span class ="styTableCellPad"></span>
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribHistStruct/NumberOfContributions" />
     </xsl:call-template>
  </td>
      <td class="styTableCell" style="width:35mm;padding-top:5mm;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribHistStruct/NoncashContribsRptdF990" />
        </xsl:call-template>
  </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;padding-top:5mm;">
       <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData//QualifiedContribHistStruct/MethodOfDeterminingRevenues" />
        </xsl:call-template>      </td>     
    </tr> 

    
    
 <!--  Line 14 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width:57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">14</span><span style="width:2mm"></span>
          Qualified conservation<br /><span style="width: 7.5mm"></span>
          contribution—Other
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;padding-top:2mm;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/QualifiedContribOther/NonCashCheckbox" />
      </xsl:call-template>
    </td>      
      <td class="styTableCell" style="width:35mm;padding-top:3mm;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribOther/NumberOfContributions" />
     </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;padding-top:3mm;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/QualifiedContribOther/NoncashContribsRptdF990" />
      </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;padding-top:.5mm;">
       <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/QualifiedContribOther/MethodOfDeterminingRevenues" />
      </xsl:call-template>      </td>     
    </tr> 
    
    
    
 <!--  Line 15 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">15</span><span style="width:2mm"></span>
          Real estate—Residential
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/RealEstateResidential/NonCashCheckbox" />
      </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateResidential/NumberOfContributions" />
     </xsl:call-template>
   </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateResidential/NoncashContribsRptdF990" />
      </xsl:call-template>
    </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left; vertical-align:bottom;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/RealEstateResidential/MethodOfDeterminingRevenues" />
      </xsl:call-template>      </td>     
    </tr> 
    
    
  <!--  Line 16 -->
          <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">16</span><span style="width:2mm"></span>
          Real estate—Commercial

                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;font-family:verdana;font-size:7pt;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/RealEstateCommercial/NonCashCheckbox" />
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateCommercial/NumberOfContributions" />
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateCommercial/NoncashContribsRptdF990" />
       </xsl:call-template>
    </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/RealEstateCommercial/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 


     <!--  Line 17 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">17</span><span style="width:2mm"></span>
          Real estate—Other
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/RealEstateOther/NonCashCheckbox" />
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateOther/NumberOfContributions" />
      </xsl:call-template>
</td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/RealEstateOther/NoncashContribsRptdF990" />
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/RealEstateOther/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr> 

    
      <!--  Line 18 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">18</span><span style="width:2mm"></span>
          Collectibles
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">.....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/Collectibles/NonCashCheckbox" />
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/Collectibles/NumberOfContributions" />
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/Collectibles/NoncashContribsRptdF990" />
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left; vertical-align:bottom;">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/Collectibles/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr>

    
    <!--  Line 19 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">19</span><span style="width:2mm"></span>
           Food inventory              
              <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
     </td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/FoodInventory/NonCashCheckbox" />
        </xsl:call-template>
      </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/FoodInventory/NumberOfContributions" />
      </xsl:call-template>
     </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/FoodInventory/NoncashContribsRptdF990" />
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/FoodInventory/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr>
    
 <!--  Line 20 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">20</span><span style="width:2mm"></span>
          Drugs and medical supplies
                           <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">.</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/DrugsAndMedicalSupplies/NonCashCheckbox" />
     </xsl:call-template>
   </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/DrugsAndMedicalSupplies/NumberOfContributions" />
      </xsl:call-template></td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/DrugsAndMedicalSupplies/NoncashContribsRptdF990" />
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
           <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/DrugsAndMedicalSupplies/MethodOfDeterminingRevenues" />
   </xsl:call-template>
</td>     
    </tr>
    
  
<!--  Line 21 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">21</span><span style="width:2mm"></span>
          Taxidermy
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">......</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/Taxidermy/NonCashCheckbox" />
        </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/Taxidermy/NumberOfContributions" />
      </xsl:call-template>
     </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/Taxidermy/NoncashContribsRptdF990" />
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/Taxidermy/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr>
    
     <!--  Line 22 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">22</span><span style="width:2mm"></span>
          Historical artifacts
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">....</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/HistoricalArtifacts/NonCashCheckbox" />
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/HistoricalArtifacts/NumberOfContributions" />
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/HistoricalArtifacts/NoncashContribsRptdF990" />
       </xsl:call-template>
</td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
         <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/HistoricalArtifacts/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr>
    
    
        <!--  Line 23 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">23</span><span style="width:2mm"></span>
          Scientific specimens
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold;  margin-left:2mm;">..</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/ScientificSpecimens/NonCashCheckbox" />
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ScientificSpecimens/NumberOfContributions" />
      </xsl:call-template>
     </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ScientificSpecimens/NoncashContribsRptdF990" />
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px;text-align:left;vertical-align:bottom;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/ScientificSpecimens/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr>
    
      <!--  Line 24 -->
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
         <span class="styBoldText" style="padding-left:.5mm">24</span><span style="width:2mm"></span>
          Archeological artifacts
                 <!--Dotted Line-->
      <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:2mm;">...</span>
</td>
      <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/ArchaeologicalArtifacts/NonCashCheckbox" />
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
         <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArchaeologicalArtifacts/NumberOfContributions" />
      </xsl:call-template>
    </td>
      <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ArchaeologicalArtifacts/NoncashContribsRptdF990" />
       </xsl:call-template>
     </td>      
      <td class="styTableCell" style="width:50mm; border-right-width:0px; text-align:left;vertical-align:bottom;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"  select="$Form990ScheduleMData/ArchaeologicalArtifacts/MethodOfDeterminingRevenues" />
        </xsl:call-template>
      </td>     
    </tr>


    <!-- Line 25 Through 28 -->
    <!-- 
          The OtherNonCashContributionsTable data element repeats and is unbounded, 
          so there may be more rows displayed then line 25 through 28. Each line in 
          excess of line 28 will not be given a line number 
    -->

    <xsl:for-each select="$Form990ScheduleMData/OtherNonCashContributionsTable">


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
                  <span style="width:4mm"></span>
                </xsl:otherwise>
              </xsl:choose>
            </span>
            
            <span style="width:2mm"></span>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> (
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Description" />
                </xsl:call-template>
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode"  select="NonCashCheckbox" />
            </xsl:call-template>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="NumberOfContributions" />
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > <span class ="styTableCellPad"></span>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="NoncashContribsRptdF990" />
            </xsl:call-template>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="MethodOfDeterminingRevenues" />
            </xsl:call-template>
          </td>     
       </tr>       
       
    </xsl:for-each>

    <!-- The following lines will display blank lines 25 through 28 if not enough data exists -->

    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContributionsTable) &lt; 1">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  25
            </span>
            <span style="width:2mm"></span>
            Other <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> (
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
            <span class ="styTableCellPad"></span>
          </td>     
       </tr>
    </xsl:if>
    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContributionsTable) &lt; 2">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  26
            </span>
            <span style="width:2mm"></span>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>(
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
            <span class ="styTableCellPad"></span>
          </td>     
       </tr>
    </xsl:if>
    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContributionsTable) &lt; 3">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  27
            </span>
            <span style="width:2mm"></span>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>( 
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
            <span class ="styTableCellPad"></span>
          </td>     
       </tr>
    </xsl:if>
    <xsl:if test="count($Form990ScheduleMData/OtherNonCashContributionsTable) &lt; 4">
       <tr>
          <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px; width: 57mm" colspan="2">
            <span class="styBoldText" style="padding-left:.5mm">
                  28
            </span>
            <span style="width:2mm"></span>
            Other  <img src="{$ImagePath}/990SchM_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> ( 
            <span style="width:18mm;border-style:solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            </span>
            )
          </td>
          <td class="styTableCell" style="width:10mm;text-align:center;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>
          <td class="styTableCell" style="width:35mm;vertical-align:bottom;" > 
            <span class ="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:50mm; border-right-width:0px; vertical-align:bottom;text-align:left;">
            <span class ="styTableCellPad"></span>
          </td>     
       </tr>
    </xsl:if>

     
   </tbody> 
 </table>
 
 <!--  Line 29 -->
 <!--<div class="styGenericDiv" style="width:187mm;height:1mm;padding-left:1mm;" />-->
 
    <div class="styLNLeftNumBox" style="height:7mm;width:8mm;font-size:7pt;">29</div>
      <div class="styLNDesc" style="width:128.25mm;height:7mm;font-size:7pt;">
        <span class="styNormalText">
           Number of Forms 8283 received by the organization during the tax year for contributions <br/>for 
           which the organization completed Form 8283, Part IV, Donee Acknowledgement
</span>
 <!--Dotted Line -->
<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt;padding-top:3mm; margin-left:2mm;">...</span>
          </div>

            <div class="styLNRightNumBox" style="height:7mm;width:7mm;font-size:7pt;padding-top:3mm;">29</div>
      <div class="styLNAmountBox" style="height:7mm;font-size:7pt;width:43mm;padding-top:3mm;"> 
         <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="MaxSize" select="6" />
          <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/NumberOf8283Received" />
        </xsl:call-template>
  
</div>
 

  <!-- line 30a  Yes - No boxes  -->
  
  <div class="IRS990ScheduleM_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
  <div class="IRS990ScheduleM_LineIndex" style="border-top-width:0px;height:4mm;"></div>
  <div class="IRS990ScheduleM_LineDesc" style="width:155.25mm;height:4mm;border-right-width:0px;border-top-width:0px;">
    </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="border-top-width:0px;width:8mm;padding-top:.25mm;border-bottom-width:0px;height:4mm;"></div>
  <div class="IRS990ScheduleM_LineIndexMid" style="border-top-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;">Yes</div>
  <div class="IRS990ScheduleM_LineIndexMid" style="border-right-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;border-top-width:0px;">No</div>
</div>

  <!-- line 30a -->

 <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-top:0;font-size:7pt;">30a</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
          During the year, did the organization receive by contribution any property reported in Part I, lines 1-28 that it 
        </span>
      </div>
      <div class="styShadingCell" style="width:8mm;height:3mm;padding-bottom:1mm;border-top-width:1px;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:3mm;padding-bottom:1mm;border-top-width:1px;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:3mm;padding-bottom:1mm;border-top-width:1px;padding-top:0mm;"></div>
    </div>
    <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:3mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
          must hold for at least three years from the date of the initial contribution, and which is not required to be used
        </span></div>
         <div class="styShadingCell" style="width:8mm;height:3mm;padding-bottom:0mm;border-left-width:1px;padding-top:1mm;border-top-width:0px;"></div>
      <div class="styShadingCell" style="width:8mm;height:3mm;padding-bottom:0mm;padding-top:1mm;border-top-width:0px;"></div>
      <div class="styShadingCell" style="width:8mm;height:3mm;padding-bottom:0mm;padding-top:1mm;border-top-width:0px;"></div>
    </div>

   <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:3mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
            for exempt purposes for the entire holding period?
        </span>
        <!--Dotted Line-->
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................</span>
      </div>
      
       <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;"><b>30a</b></div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;padding-top:1mm;font-size:7pt;">
    <span style="font-weight: normal;">
         <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/AnyPropertyThatMustBeHeld"/>
      </xsl:call-template>
      </span>
     </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;fong-size:7pt;">
     <span style="font-weight: normal;">
         <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/AnyPropertyThatMustBeHeld"/>
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
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;"></div>
    </div>
      
  <!-- Line 31 -->    
  
   <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;font-size:7pt;">31</div>
      <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:1.25mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
        Does the organization have a gift acceptance policy that requires the review of any non-standard contributions?
        </span>
     </div>
      
       <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;width:8.25mm;border-left-width:1px;font-size:7pt;padding-top:1mm;">31</div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4.5mm;padding-top:1mm;width:8mm;font-size:7pt;">
    <span style="font-weight: normal;">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ReviewProcessUnusualNCGifts"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="padding-top:1mm;font-size:7pt;border-right-width:0px;border-bottom-width:1px;width:7.75mm;height:4.5mm;">
   <span style="font-weight: normal;">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ReviewProcessUnusualNCGifts"/>
      </xsl:call-template>
      </span>
  </div>
</div>

<!-- Line 32a -->

  <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1.5mm;font-size:7pt;">32a</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1.5mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
        Does the organization hire or use third parties or related organizations to solicit, process, or sell non-cash
        </span>
      </div>
      <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1.5mm;padding-top:1mm;"></div>
      <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1.5mm;padding-top:1mm;"></div>
      <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1.5mm;padding-top:1mm;"></div>
    </div>
   
   <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
           contributions?
        </span>
        <!--Dotted Line-->
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............................</span>
      </div>
      
       <div class="IRS990ScheduleM_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;font-size:7pt;padding-top:1mm;">32a</div>
  <div class="IRS990ScheduleM_LineIndexMid" style="height:4mm;padding-top:1mm;font-size:7pt;">
   <span style="font-weight: normal;">
       <xsl:call-template name="PopulateYesBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ThirdPartiesUsed"/>
      </xsl:call-template>
      </span>
  </div>
  <div class="IRS990ScheduleM_LineIndexMid" style="padding-top:1mm;border-right-width:0px;font-size:7pt;border-bottom-width:1px;width:7.5mm;height:4mm;">
    <span style="font-weight: normal;">
       <xsl:call-template name="PopulateNoBoxText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/ThirdPartiesUsed"/>
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
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;padding-top:0mm;"></div>
    </div>
  
  <!-- Line 33 -->

  <div style="width:187mm;" class="styBB">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:0;font-size:7pt;">33</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
       If the organization did not report revenues in column (c) for a type of property for which column (a) is checked,
        </span>
      </div>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"></div>
       
   <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
            describe in Part II.
        </span> </div>

        <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"></div>
      <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;padding-top:0mm;"></div>
</div>
</div>
 </div>
  
 
   <!-- Page Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
      <div class="styGenericDiv" style="width:112mm;font-size:6pt;font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
      <div class="styGenericDiv" style="padding-left:6mm;width:35mm;font-size:6pt;"><span class="styNormalText">Cat. No. 51227J</span></div>
      <div class="styGenericDiv" style="float:right;font-size:6pt;"><span class="styBoldText">Schedule M (Form 990) 2010</span> 
    </div> </div>
<!--END Page Footer-->

  <!-- Page 2 header -->
    <div style="width:187mm;clear:both;padding-bottom:0mm;float:none;clear:both;" class="styBB">
      <div style="width:90mm;font-size:6.25pt;font-weight:bold;padding-top:1mm;" class="styGenericDiv">Schedule M (Form 990) 2010</div>
      <div style="width:55mm;text-align:center;" class="styGenericDiv"></div>
      <div style = "float:right;font-size:6.25pt;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:7pt;">2</span></div>
    </div>
<!-- END Page2 Header -->   


<!-- PART  II SUPPLEMENAL  INFORMATION    -->

 <div class="styGenericDiv" style="width: 187mm;">
  <div class="styPartName" style="width:18mm;">Part II</div>
    <div class="styPartDesc" style="width:170mm;border-bottom-width:1px;border-color: black;"><b>Supplemental Information. </b> <span class="styNormalText">Complete this part to provide the information required by Part I, lines 30b, <br/>32b, and 33. Also complete this part for any additional information. </span></div>
   <div class="styIRS990ScheduleMLNDescBB" style="width:187mm;height:4mm;"> 
        <span style="float:right">  
          <xsl:call-template name="SetDynamicTableToggleButton" >
              <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/Form990ScheduleMPartII" />              
              <xsl:with-param name="containerHeight" select="5" />
              <xsl:with-param name="containerID" select="'SUPctn'" />
          </xsl:call-template>    
        </span>
     </div></div> 

<div class="styTableContainer" style="width: 187mm; border-bottom-width: 2px" id="SUPctn">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
  <thead class="styTableThead">
    
    <tr class="styDepTblHdr">
          
          <th class="styDepTblCell" scope="col">Identifier </th>
          <th class="styDepTblCell" scope="col">Return Reference</th>  
          <th class="styDepTblCell" scope="col">Explanation</th>                
             

    </tr>
  </thead>
  <tfoot></tfoot>
  <tbody valign="top">
   <xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($Form990ScheduleMData/Form990ScheduleMPartII) &lt;20))">
      <xsl:for-each select="$Form990ScheduleMData/Form990ScheduleMPartII">
          <tr>
      <td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Identifier" />
            </xsl:call-template>
      </td>
      <td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 50mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ReturnReference" />
              </xsl:call-template>
           </td>      
      <td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 86mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Explanation" />
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
            <xsl:with-param name="TargetNode" select="$Form990ScheduleMData/Form990ScheduleMPartII"/>
            <xsl:with-param name="containerHeight" select="5"/>
            <xsl:with-param name="containerID" select=" 'SUPctn' "/>
 </xsl:call-template>

 
   <!-- Footer -->
    <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
   
      <div class="styGenericDiv" style="float:right;"> <span class="styBoldText">Schedule M (Form 990) 2010</span></div>
    </div>






<!-- Recycle Image -->

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
          <xsl:with-param name="TargetNode" select="$Form990ScheduleMData" />
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
