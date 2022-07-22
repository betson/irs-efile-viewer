<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
   <xsl:include href="AddOnTable.xsl"/>
   <xsl:include href="IRS1040ScheduleEStyle.xsl"/>
   <xsl:output method="html" indent="yes" />
   <xsl:strip-space elements="*" />  
   <xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleE" />  
   <xsl:template match="/">
      <html lang="EN-US">
         <head>
            <title>
               <xsl:call-template name="FormTitle">
                  <xsl:with-param name="RootElement" select="local-name($FormData)">
                  </xsl:with-param>
               </xsl:call-template>
            </title>
            <!-- No Browser Caching -->
            <meta http-equiv="Pragma" content="no-cache" />
            <meta http-equiv="Cache-Control" content="no-cache" />
            <meta http-equiv="Expires" content="0" />
            <!-- No Proxy Caching -->
            <meta http-equiv="Cache-Control" content="private" />
            <!-- Define Character Set -->
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
            <meta name="Description" content="IRS Form Schedule E" />
            <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript">
            </script>
            <xsl:call-template name="InitJS">
            </xsl:call-template>
            <style type="text/css">
     <xsl:if test="not($Print) or $Print=''">
                  <xsl:call-template name="IRS1040ScheduleEStyle"/>
                  <xsl:call-template name="AddOnStyle"/>
           </xsl:if>
            </style>
            <xsl:call-template name="GlobalStylesForm"/>
         </head>
         <body class="styBodyClass">
            <form id="IRS1040ScheduleE">
               <xsl:call-template name="DocumentHeader">
               </xsl:call-template>
 <div class="styTBB" style="width:187mm;">
                  <div class="styFNBox" style="width:28mm;height:20mm;">
                  <div style="padding-top:1mm;line-height:180%;">        
                        <span class="styFormNumber" style="font-size:9pt;">SCHEDULE E</span>
                        <br/>
                        <span class="styFormNumber" style="font-size:9pt;padding-top:2mm;">(Form 1040)</span>
				   <xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>  </div>
                     <div style="padding-top:3.0mm;">
                        <span class="styAgency">Department of the Treasury</span>
                        <br />
                        <span class="styAgency">Internal Revenue Service (99)</span>
                     </div>
                  </div>
                  <div class="styFTBox" style="width:127mm;height:20mm;">
                     <div class="styMainTitle" style="height:12mm;font-size:14pt;padding-top:0mm;">
                     Supplemental Income and Loss<br />
                        <span class="styTitleDesc" style="width:127mm;font-size:10pt;">
                        (From rental real estate, royalties, partnerships,<br />
                           S corporations, estates, trusts, REMICs, etc.)
                        </span>
                     </div>
                     <div style="padding-top:2mm;">
                        <img src="{$ImagePath}/1040SchE_Bullet.gif" alt="Bullet Image" />
                        <span class="styBoldText" style="font-size:6pt;">Attach to Form 1040, 1040NR, or Form 1041. </span>
                        <img src="{$ImagePath}/1040SchE_Bullet.gif" alt="Bullet Image" />
                        <span class="styBoldText" style="font-size:6pt;"> See Instructions for Schedule E (Form 1040).</span>
                     </div>
                  </div>
                  <div class="styTYBox" style="width:30mm;height:20mm;">
                     <div class="styOMB" style="height:2mm;">
                     OMB No. 1545-0074
                     </div>
                     <div class="styTaxYear">
          20<span class="styTYColor">10</span>
        </div>
              <div  style="margin-left:2mm; text-align:left;">
                     Attachment <br />Sequence No. <span class="styBoldText">13</span>
                     </div>
                  </div>
               </div>
  <div  class="styBB" style="width:187mm;border-bottom-width:1px;">
               <!-- Begin Names and Identifying number section -->
        <div  class="styBB" style="width:187mm;">
                  <div class="styNameBox" style="width:138mm;height:8mm;font-weight:normal;font-size:7pt;" >
                  Name(s) shown on return<br />
                     <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">Name</xsl:with-param>
                     </xsl:call-template>            
                  </div>
                  <div style="width:49mm;height:4mm;padding-left:2mm;font-size:7pt;" class="styEINBox">
                  Your social security number<br />
                     <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateSSN">
                           <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN" />
                           <xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
                        </xsl:call-template>  
                     </span>   
                  </div>
               </div>    
               <!-- End Names and Identifying number section -->
               <!-- Start Part I Title -->
                <div class="styBB" style="width:187mm;" >
                  <div class="styPartName" style="width:12mm;">Part l</div>
                  <div class="styLNDesc" style="width:171mm;padding-left:2mm;height:5mm;padding-top:0mm;">
                    <span style="font-size:8pt;"><b>lncome or Loss From Rental Real Estate and Royalties</b></span>
                     <span style="padding-left:1.5mm;"><b>Note.</b></span>
                    <span style=" font-family:Arial;color:black;"> If you are in the business of renting personal property, use <b>Schedule C or C-EZ</b>
                     (see page E-3). If you are an individual, report farm rental income or loss from
                    <b> Form 4835</b> on page 2, line 40.</span>
                         </div>
                   <div class="styLNDesc" style="width:3mm;float:right;padding-top:4mm;">
                     <!-- button display logic -->
                     <xsl:call-template name="SetDynamicTableToggleButton">
                        <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/PropertyType"/>
                        <xsl:with-param name="containerHeight" select="3"/>
                          <xsl:with-param name="headerHeight" select="1"/>
                        <xsl:with-param name="containerID" select=" 'PICctn' "/>
                     </xsl:call-template>
                     <!-- end button display logic -->
                      </div>
           </div>
               <!-- END PART  I Title -->
               <!-- Part 1, Lines 1 & 2 Table (Start) -->
           <div class="styTableContainer" style="width:187mm;border-bottom-width:1px;" id="PICctn" >
                     <xsl:call-template name="SetInitialState"/>
        <table class="styTable" style="border-bottom-width:1px;" cellspacing="0"  id="PICTable">
                           <tr>
          <td class="styTableCell" scope="col" style="width:5.9mm;border-right-width:1px;border-color:black;text-align:center;font-weight:bold;font-size:8pt;">
                                1
                              </td>
              <td class="styTableCell" scope="col" style="width:99mm;border-right-width:1px; border-color:black;text-align:left;padding-left:2mm;">
                                    <span class="styNormalText" style="font-size:7.5pt;">
                                    List the type and address of each <b>rental real estate property:</b>
                                    </span>
                              </td>
               <td class="styTableCell" scope="col" style="width:5mm;border-bottom-width:0px;border-right-width:0px; font-weight:bold;font-size:8pt;border-color:black;text-align:center;vertical-align:top;padding-top:1mm;">
                              2
                              </td>
   <td class="styTableCell" scope="col" rowspan="4"  colspan="1" style="vertical-align:top;padding-top:1mm;font-size:8pt;width:51.9mm;border-bottom-width:0px;text-align:left;border-color:black;border-right-width:0px;">
                                 <span class="styNormalText" >
                                 For each rental real estate property
                                    listed on line 1, did you or your family
                                    use it during the tax year for personal
                                    purposes for more than the greater of:   </span>
                                      <div style="padding-top:1mm;font-size:8pt;">
                                    <img src="{$ImagePath}/1040SchE_Bullet_Round.gif" alt="Bullet Image" /> 14 days <span class="styBoldText">or</span>
                                      </div>
                                    <div style="padding-top:2mm;font-size:8pt;">
                                    <img src="{$ImagePath}/1040SchE_Bullet_Round.gif" alt="Bullet Image" /> 10% of the total days rented at<br />
                                    <span style="width:11px;"></span>fair rental value?<br />
                                    </div>
                                      <div style="padding-top:2mm;font-size:8pt;">
                                    (See page E-3)<br />             
                                  </div>
                              </td>
                              <td class="styTableCell" scope="col" style="width:5.9mm;border-right-width:1px; border-color:black;height:7mm;">
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" scope="col" style="width:7mm;border-right-width:1px; border-color:black;height:2mm;">
                                 <span style="font-weight:bold;font-size:7pt;">Yes</span>
                              </td>
                              <td class="styTableCell" scope="col" style="width:7mm;border-right-width:0px; border-color:black;height:2mm;">
                                 <span style="font-weight:bold;font-size:7pt;">No</span>
                              </td>
                           </tr>
 <xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt;= 3) "> 
                              <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
                                 <tr>
                                    <!-- Column A -->
     <td class="styTableCell" style="width:5.9mm;border-right-width:1px;text-align:center; border-color:black;border-left-width:0px;height:2mm;">
                                       <span class="styBoldText" style="font-size:8pt;">
                                          <xsl:call-template name="AddPositionNumber" />
                                       </span>
                                    </td>
                                    <!-- Column B -->
                          <td class="styTableCell" style="width:99mm;border-right-width:1px;border-color:black;text-align:left;font-size:7pt;height:3mm;">
                               <xsl:if test="PropertyUSAddress != ''">
                                       <xsl:call-template name="PopulateText">
                                          <xsl:with-param name="TargetNode" select="PropertyType" />
                             <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyType</xsl:with-param>
                                       </xsl:call-template>
                                    <br/>
                                       <xsl:call-template name="PopulateUSAddressTemplate">
                                          <xsl:with-param name="TargetNode" select="PropertyUSAddress" />
                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyUSAddress</xsl:with-param>
                                       </xsl:call-template>  
                                            </xsl:if>
                                        <xsl:if test="PropertyForeignAddress != ''">
                                     <xsl:call-template name="PopulateText">
                                          <xsl:with-param name="TargetNode" select="PropertyType" />
                             <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyType</xsl:with-param>
                                       </xsl:call-template>
                                    <br/>
                                       <xsl:call-template name="PopulateForeignAddressTemplate">
                                          <xsl:with-param name="TargetNode" select="PropertyForeignAddress" />
             <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyForeignAddress</xsl:with-param>
                                       </xsl:call-template> 
                                       </xsl:if>                           
                                    </td>
                                    <!-- Column C -->
                               <td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px; border-color:black;height:3mm;">
                                       <span class="styTableCellPad" />
                                    </td>
                                    <!-- Column D -->
                                    <xsl:if test="(position() &gt; 3) ">
                                        <td class="styTableCell" style="width:51.9mm;border-right-width:1px;border-bottom-width:0px; " > 
                         <span class="styTableCellPad" />
                                 </td>
                                    </xsl:if>
                                    <!-- Column E -->
                               <td class="styTableCell" style="width:5.9mm;border-right-width:1px;vertical-align:bottom;text-align:center;font-size:8pt; border-color:black;border-left-width:1px;height:5mm; ">
                                       <xsl:call-template name="AddPositionNumber" />
                                    </td>
                                    <!-- Column F -->
                           <td class="styTableCell" style="width:7mm;border-right-width:1px;text-align:center; border-color:black;vertical-align:bottom;">
                                       <xsl:call-template name="PopulateYesBoxText">
                                          <xsl:with-param name="TargetNode" select="PersonalUseInd" />
                                     <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPersonalUseInd</xsl:with-param>
                                       </xsl:call-template>
                                    </td>
                                    <!-- Column G -->
     <td class="styTableCell" style="width:7mm;border-right-width:0px;text-align:center; border-color:black;vertical-align:bottom;">
                              <xsl:call-template name="PopulateNoBoxText">
                                   <xsl:with-param name="TargetNode" select="PersonalUseInd" />
                          <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPersonalUseInd</xsl:with-param>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </xsl:if>         
                           <!-- Table Filler Rows -->
<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
                              <tr>
                                 <td class="styTableCell" style="width:5.9mm;border-right-width:1px;text-align:center;vertical-align:bottom;border-bottom-width:1px;border-style: solid; border-color: black;" > 
                                    <span class="styBoldText" style="font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="1" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
<td class="styTableCell" style="width:99mm;border-right-width:1px;border-bottom-width:1px;border-style: solid; border-color: black;text-align:left" > 
                                   <span class="styTableCellPad"></span>
                                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                       <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup"/>                      
                                    </xsl:call-template>
                                 </td>
                                 <td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px;border-bottom-width:0px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                <td class="styTableCell" style="width:5.9mm;border-right-width:1px;text-align:center;vertical-align:bottom;border-left-width:1px;border-bottom-width:1px;height:2mm;border-style: solid; border-color: black;" > 
                                    <span class="styBoldText" style="font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="1" />
                                       </xsl:call-template>
                                        <span class="styTableCellPad"></span>
                                    </span>
                                 </td>
                                 <td class="styTableCell" style="width:7mm;border-right-width:1px;border-bottom-width:1px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                <td class="styTableCell" style="width:7mm;border-right-width:0px;border-bottom-width:1px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                              </tr>
                           </xsl:if>
 <xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 2 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
                              <tr>
                                 <td class="styTableCell" style="width:5.9mm;border-right-width:1px;text-align:center;border-style: solid; border-color: black;" > 
                                    <span class="styBoldText" style="font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="2" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                   <td class="styTableCell" style="width:99mm;border-right-width:1px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                <td class="styTableCell" style="width:5.9mm;border-right-width:1px;text-align:center;vertical-align:bottom;border-left-width:1px;height:2mm;border-style: solid; border-color: black;" > 
                                    <span class="styBoldText" style="font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="2" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                                 <td class="styTableCell" style="width:7mm;border-right-width:1px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                    <td class="styTableCell" style="width:7mm;border-right-width:0px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                              </tr>
                           </xsl:if>
<xsl:if test="count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 3 or ((count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3) and ($Print = $Separated))">
                              <tr>
                                 <td class="styTableCell" style="width:5.9mm;border-right-width:1px;text-align:center;border-style: solid; border-color: black;" > 
                                    <span class="styBoldText" style="font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="3" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                                 <td class="styTableCell" style="width:99mm;border-right-width:1px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:5mm;border-right-width:0px;border-bottom-width:0px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                <td class="styTableCell" style="width:5.9mm;border-right-width:1px;text-align:center;vertical-align:bottom;border-left-width:1px;height:2mm;border-style: solid; border-color: black;" > 
                                     <span class="styBoldText" style="font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="3" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                  <td class="styTableCell" style="width:7mm;border-right-width:1px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                  <td class="styTableCell" style="width:7mm;border-right-width:0px;border-style: solid; border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <!-- End of filler rows -->
                     </table>
                  </div>
                  <!-- Set Initial Height of Above Table -->
                  <xsl:call-template name="SetInitialDynamicTableHeight">
                     <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup"/>
                     <xsl:with-param name="containerHeight" select="3"/>
                        <xsl:with-param name="headerHeight" select="1"/>
                     <xsl:with-param name="containerID" select=" 'PICctn' "/>
                  </xsl:call-template>  
 <!-- Generated Table (End) --> 
       <table class="styTable"  style="width:187mm;" cellspacing="0">  
        <thead class="styTableThead">
		<tr>
	</tr>
	</thead>
	<tfoot/>
  <tbody>
    <xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt;=3) ">
                              <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
                                 <xsl:variable name="pos" select="position()"/>
                                 <xsl:if test="position() mod 3 = 1">
                                    <xsl:variable name="conID" select="concat('PropTableID', $pos)"/>             
                                    <xsl:variable name="imgID" select="concat('PropImgID', $pos)"/>
                                    <xsl:variable name="btnID" select="concat('PropBtnID', $pos)"/>
                                    <xsl:variable name="OtherRowCount" select="(count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other)
                                    + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/Other)
                                    + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/Other))"/>
                            <tr >
   <td  class="styTableCell" rowspan="2" colspan="2" style="text-align:left;width:53mm;border-right-width:0px;border-bottom-width:0px;border-color: black;padding-top:0mm;">
                                   <span class="styBoldText">
         <span style="font-size:8pt;">lncome:</span>
                                              </span>
                                            <span class="styTableCellPad"></span>
      </td>
                  <td class="styTableCell" colspan="1" rowspan="2" style="width:8mm;border-color: black;" >
                                             <span class="styTableCellPad"></span>
                                          </td>
                                           <xsl:if test="$pos &lt;= 3">
              <td class="styTableCell" colspan="3" rowspan="1" style="width:80mm;border-right-width:1px;text-align:center;border-color: black;">
                                               <span class="styBoldText" style="font-size:8pt;text-align:center;">
                                             Properties
                                             </span>
                                          </td>
                                           </xsl:if>
                                           <xsl:if test="$pos &gt;= 4">
   <td class="styTableCell" colspan="3" rowspan="1" style="width:80mm;border-right-width:1px;border-left-width:0px;text-align:center;border-color: black;">
                                             (Continued)
                                          </td>
                                             </xsl:if>
   <xsl:if test="$pos &lt;= 3">
   <td class="styTableCell"  rowspan="2" colspan="2" style="width:36mm;text-align:center;border-right-width:0px;border-left-width:0px;">
                                                     <span class="styBoldText" style="font-size:8pt;">Totals</span>
                                                     <br/>
                                    <span style="font-family:Arial;">(Add columns A, B,and C.)</span>
                               </td>
           </xsl:if>
    <xsl:if test="$pos &gt;= 4">
      <td class="styShadingCell" colspan="1" rowspan="2"  style="width:6mm;border-right-width:1px;border-left-width:0px;">
                                              <span class="styTableCellPad" style=""></span>    
       </td>
      <td class="styTableCell" colspan="1" rowspan="2" style="width:42mm;border-bottom-width:0px;border-right-width:0px;border-color: black;">
                                                  <span class="styTableCellPad" style=""></span>     
       </td>
      </xsl:if>
       </tr>
              <tr>            
     <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+3)">
     <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:1px;">
                                                   <xsl:call-template name="AddPositionNumber"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
    <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:1px;">
                                                   <xsl:call-template name="AddPositionNumber1"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
       <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:1px;">
                                                   <xsl:call-template name="AddPositionNumber2"/>
                                                    <span class="styTableCellPad" style="border-right-width:0px;"></span>
                                                </td>
                                                   </xsl:if>
                                       </tr>
                                       <!-- Line 3 -->
                                          <tr>
                                             <!-- Column 1 -->
               <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;border-top-width:0px;">
                       <span class="styBoldText" style="text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                3
                                                </span>
                               </td>
                                             <!-- Column 2 -->
                                             <td class="styTableCell" style="width:53mm;text-align:left;border-right-width:1px;border-bottom-width:0px;border-color: black;">
                                                <span style="font-size:7pt;">Rents received</span>
                                               <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.....</span>
                                             </td>
                                             <!-- Column 3 -->
                                             <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">3</span>
                                             </td>
                                             <!-- Column 4 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RentsReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 5 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RentsReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 6 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RentsReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <xsl:if test="$pos &lt;= 3">
                                                <!-- Column 7 -->
                                                <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-top-width:1px;">
                                                   <span class="styBoldText" style="font-size:7pt;">3</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;border-top-width:1px;">
                                                   <xsl:call-template name="PopulateAmount">
                                                      <xsl:with-param name="TargetNode" select="$FormData/TotalRentsReceivedAmt" />
                                                      <xsl:with-param name="BackupName">IRS1040ScheduleETotalRentsReceivedAmt</xsl:with-param>
                                                   </xsl:call-template>
                                                </td>
                                             </xsl:if>
                                             <xsl:if test="$pos &gt;= 4">
                                                <!-- Column 7 -->
                                                <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                   <span class="styBoldText" style="font-size:7pt;">3</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                   <xsl:call-template name="PopulateAmount">
                                                      <xsl:with-param name="TargetNode" select="$FormData/TotalRentsReceivedAmt" />
                                                      <xsl:with-param name="BackupName">IRS1040ScheduleETotalRentsReceivedAmt</xsl:with-param>
                                                   </xsl:call-template>
                                                </td>
                                             </xsl:if>
                                          </tr>
                                          <!-- Line 4 -->
                                          <tr>
                                             <!-- Column 1 -->
                                             <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-color: black;">
                                                <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;">
                                                4
                                                </span>
                                             </td>
                                             <!-- Column 2 -->
                                             <td class="styTableCell" style="width:53mm;text-align:left;border-right-width:1px;border-color: black;">
                                                <span style="font-size:7pt;">Royalties received</span>
                                                <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.....</span>
                                             </td>
                                             <!-- Column 3 -->
                                             <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">4</span>
                                             </td>
                                             <!-- Column 4 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RoyaltiesReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 5 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RoyaltiesReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 6 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                       <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RoyaltiesReceivedAmt" />
                                  <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <xsl:if test="$pos &lt;= 3">
                                                <!-- Column 7 -->
                                                <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                   <span class="styBoldText" style="font-size:7pt;">4</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                   <xsl:call-template name="PopulateAmount">
                                                      <xsl:with-param name="TargetNode" select="$FormData/TotalRoyaltiesReceivedAmt" />
                                                      <xsl:with-param name="BackupName">IRS1040ScheduleETotalRoyaltiesReceivedAmt</xsl:with-param>
                                                   </xsl:call-template>
                                                </td>
                                             </xsl:if>
                                             <xsl:if test="$pos &gt;= 4">
                                                <!-- Column 7 -->
                                                <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                   <span class="styBoldText" style="font-size:7pt;">4</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                   <xsl:call-template name="PopulateAmount">
                                                      <xsl:with-param name="TargetNode" select="$FormData/TotalRoyaltiesReceivedAmt" />
                                                      <xsl:with-param name="BackupName">IRS1040ScheduleETotalRoyaltiesReceivedAmt</xsl:with-param>
                                                   </xsl:call-template>
                                                </td>
                                             </xsl:if>
                                          </tr>
                                       <!-- Expenses -->
                                       <tr>
                                          <!-- Column 1 -->
                                 <td  class="styTableCell" colspan="2" style="width:6.9mm;border-right-width:1px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             Expenses:
                                             </span>
                                          </td>
                                            <!-- Column 2 -->
                         
                            <!-- Column 3 -->
                                  <td class="styTableCell" style="text-align:center;width:8.5mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 7 -->
                     <td class="styShadingCell" style="text-align:center;width:7mm;border-bottom-width:0px;border-right-width:1px;border-color: black;border-left-width:0px;">
 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-bottom-width:0px;border-right-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- Line 5 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             5
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                           <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Advertising</span>
                                             <span class="styDotLn" style="padding-left:3mm;float:none;clear:none;">........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">5</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AdvertisingAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AdvertisingAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AdvertisingAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                           <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 5 -->
                                       <!-- Line 6 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             6
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Auto and travel (see page E-4)</span>

                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">6</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AutoAndTravelAmt" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AutoAndTravelAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AutoAndTravelAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- Line 7 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             7
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Cleaning and maintenance</span>
                                             <span class="styDotLn" style="padding-left:3mm;float:none;clear:none;">..</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">7</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CleaningAndMaintenanceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CleaningAndMaintenanceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CleaningAndMaintenanceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 7 -->
                                       <!-- Line 8 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             8
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Commissions</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">8</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CommissionsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CommissionsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CommissionsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 8 -->
                                       <!-- Line 9 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             9
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Insurance</span>
                                             <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">9</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/InsuranceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/InsuranceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/InsuranceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 9 -->
                                       <!-- Line 10 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             10
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Legal and other professional fees</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">10</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/LegalAndOtherProfFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/LegalAndOtherProfFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/LegalAndOtherProfFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 10 -->
                                       <!-- Line 11 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             11
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Management fees</span>
                                             <span class="styDotLn" style="padding-left:4.5mm;float:none;clear:none;">.....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">11</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/ManagementFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/ManagementFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/ManagementFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 11 -->
                                       <!-- Line 12 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             12
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Mortgage interest paid to banks,
                                             etc. (see page E-5)</span>
                                             <span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">.....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="padding-top:2mm;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">12</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/MortgageInterestPaidAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/MortgageInterestPaidAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/MortgageInterestPaidAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <xsl:if test="$pos &lt; 4">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="padding-top:2mm;text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">12</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="padding-top:2mm;width:26mm;border-right-width:0px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/TotalMortgageInterestPaidAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleETotalMortgageInterestPaidAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 12 -->
                                       <!-- Line 13 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             13
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Other interest</span>
                                             <span class="styDotLn" style="padding-left:2.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">13</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherInterestAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/OtherInterestAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/OtherInterestAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 13 -->
                                       <!-- Line 14 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             14
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Repairs</span>
                                             <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">14</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RepairsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RepairsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RepairsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 14 -->
                                       <!-- Line 15 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             15
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Supplies</span>
                                             <span class="styDotLn" style="padding-left:2.5mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">15</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/SuppliesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/SuppliesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/SuppliesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 15 -->
                                       <!-- Line 16 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             16
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Taxes</span>
                                             <span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">..........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">16</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TaxesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TaxesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TaxesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 16 -->
                                       <!-- Line 17 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             17
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                  <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Utilities</span>
                                             <span class="styDotLn" style="padding-left:4.25mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">17</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/UtilitiesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/UtilitiesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/UtilitiesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 17 -->
                                       <!-- Line 18 -->
                                       <!-- If there are no entries for OtherExpenseAmt, then build empty rows -->
                        <xsl:if test="$OtherRowCount=0">
                                <tr class="styFixedUnderline">
                                             <xsl:choose>
                                                <xsl:when test="position() mod 3=1">
      <td class="styTableCell" style="width:6.9mm;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px" >
                                                      <span class="styBoldText" style="font-size:7pt;">18</span>
                                                      </td>
      <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                                      Other (list)<span style="width:1mm;"></span>
                                                         <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
                                                         <span style="width:25mm;border-bottom-width:1px">
                                                            <xsl:call-template name="PopulateText">
                                                               <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                            </xsl:call-template>
                                                         </span>
                                                           </td>
      <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">18</span>
                                          </td>
                                                   <!-- Empty columns--> 
                                                   <td class="styTableCell" style="width:26.9mm;">                                             
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell" style="width:26.9mm;" >
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell" style="width:26.9mm;" >
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styShadingCell" style="border-left-width:0px;width:7mm;">
                                                     <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                   </td>
                                                   <td class="styTableCell" style="width:26mm;clear:none;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td style="border:none;font-size:7pt;" scope="row">
                                                      <div class="styGenericDiv" style="width:7mm;font-weight:bold;"/>
                                                      <span class="styBB" style="width:29mm;">
                                                         <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                         </xsl:call-template>
                                                      </span>
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tr>
                                       </xsl:if>
                                       <xsl:variable name="FirstCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other) " />
                                       </xsl:variable>
                                       <xsl:variable name="SecondCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/Other) " />
                                       </xsl:variable>

                                       <xsl:variable name="ThirdCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/Other) " />
                                       </xsl:variable>
                                       <xsl:variable name="Line18Rows">
                                          <xsl:value-of select="$FirstCol + $SecondCol + $ThirdCol" />
                                       </xsl:variable>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other">
                                          <tr class="styFixedUnderline">
                                             <xsl:choose>
                                                <xsl:when test="position() = 1">
                                                   <!-- Col 1 -->
                                                   <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                      <div class="styGenericDiv" style="width:8mm;font-weight:bold;text-align:left;padding-left:0mm;">18</div>
                                                   </td>
                                                   <!-- Col 2 -->
                                                   <td>                                   
                                                      <div class="styGenericDiv" style="width:53mm;font-size:7pt;">
                                                         <span style="">
                                                         Other (list)
                                                           <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
                                                            <span style="width:1mm;"> </span>
                                                         </span>
                                                             <div class="styBB" style="width:50mm;border-style:dotted;">
                                                               <xsl:call-template name="PopulateText">
                                                                  <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                               </xsl:call-template>
                                                            </div>
                                                 
                                                      </div>    
                                                   </td>
                                                   <!-- Col 3 -->
                             <td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:right;border-left-width:1px;">
                                                      <xsl:attribute name="rowspan">
                                                         <xsl:value-of select="$Line18Rows"></xsl:value-of>
                                                      </xsl:attribute>
                                                      <span style="font-size:7pt;">18</span>
                                                   </td>
                                                   <!-- Col A -->
                                                  
                                       <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">   
                                                      <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/Other/OtherExpenseAmt" />
                                             </xsl:call-template>                            
                                                      <xsl:call-template name="PopulateAmount">
                                                         <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                      </xsl:call-template>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                  <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td style="border:none;font-size:7pt;" scope="row">
                                                      <span class="styBB" style="border-style:dotted;width:50mm;">
                                                         <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                         </xsl:call-template>
                                                      </span>
                                                   </td>
                                                   <td class="styTableCell">
                                                    <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/Other" />
                                             </xsl:call-template>
                                                      <xsl:call-template name="PopulateAmount">
                                                         <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
             <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                      </xsl:call-template>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                               <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tr>
                                       </xsl:for-each>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/Other">
                                          <tr class="styFixedUnderline">
                                             <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td style="border:none;font-size:7pt;" scope="row">
                                                <span class="styBB" style="border-style:dotted;width:50mm;">
                                                   <xsl:call-template name="PopulateText">
                                                      <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                   </xsl:call-template>
                                                </span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td class="styTableCell">
                                              <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/Other" />
                                             </xsl:call-template>
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
                                  <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                           <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/Other">
                                          <tr class="styFixedUnderline">
                                             <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td style="border:none;font-size:7pt;" scope="row">
                                                <span class="styBB" style="border-style:dotted;width:50mm;">
                                                   <xsl:call-template name="PopulateText">
                                                      <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                   </xsl:call-template>
                                                </span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td class="styTableCell">
                                              <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/Other" />
                                             </xsl:call-template>
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                       <!-- End of Line 18 -->
                                       
                                       <!-- Line 19 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             19
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Add lines 5 through 18</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">...</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">19</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RentAndRyltyExpnssPerPropAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RentAndRyltyExpnssPerPropAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RentAndRyltyExpnssPerPropAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <xsl:if test="$pos &lt;= 3">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">19</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/TotalRentalAndRoyaltyDedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleETotalRentalAndRoyaltyDedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:25mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 19 -->
                                       <!-- Line 20 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             20
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Depreciation expense or depletion<br />
                                             (see page E-5)</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">20</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <!-- Form to Form Link -->
                                             <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/DeprecExpenseOrDepletionAmt" />
                                             </xsl:call-template>
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DeprecExpenseOrDepletionAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/DeprecExpenseOrDepletionAmt" />
                                             </xsl:call-template>
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DeprecExpenseOrDepletionAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/DeprecExpenseOrDepletionAmt" />
                                             </xsl:call-template>
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DeprecExpenseOrDepletionAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <xsl:if test="$pos &lt;= 3">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">20</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/TotalDepreciationAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleETotalDepreciationAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:28mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 20 -->
                                       <!-- Line 21 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             21
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Total expenses. Add lines 19 and 20</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">21</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TotalExpensesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TotalExpensesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TotalExpensesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 21 -->
                                       <!-- Line 22 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="vertical-align:text-top;width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             22
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">
                                             Income or (loss) from rental real<br />
                                                estate or royalty properties.<br />
                                                Subtract line 21 from line 3 (rents)<br />
                                                or line 4 (royalties). If the result is a<br />
                                                (loss), see page E-5 to find out if<br />
                                                you must file <span class="styBoldText">Form 6198</span>
                                             </span>                              
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">22</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/NetRentalIncomeOrLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupNetRentalIncomeOrLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/NetRentalIncomeOrLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupNetRentalIncomeOrLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/NetRentalIncomeOrLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupNetRentalIncomeOrLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 22 -->
                                       <!-- Line 23 -->
                                       <tr style="">
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="vertical-align:text-top;width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             23
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">
                                             Deductible rental real estate loss.
                                                <span class="styBoldText">Caution</span>. Your rental real estate<br />
                                                loss on line 22 may be limited. See<br />
                                                page E-5 to find out if you must<br />
                                                file <span class="styBoldText">Form 8582</span>. Real estate<br />
                                                professionals <span class="styBoldText">must</span> complete line<br />
                                                43 on page 2
                                             </span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">23</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateNegativeNumber">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DedRentalRealEstateLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDedRentalRealEstateLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateNegativeNumber">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DedRentalRealEstateLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDedRentalRealEstateLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateNegativeNumber">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DedRentalRealEstateLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDedRentalRealEstateLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad" style=":border-right-width:0px;"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 23 -->
                                    </xsl:if>
                                 </xsl:for-each>
                              </xsl:if>
                                 <!-- Blank Filler rows if no data is entered -->
                    <xsl:if test="(count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1) ">
					<xsl:if test="($Print != $Separated) or (count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1) ">
                                 <xsl:variable name="pos" select="position()"/>
                                 <xsl:if test="position() mod 3 = 1">
                                    <xsl:variable name="conID" select="concat('PropTableID', $pos)"/>             
                                    <xsl:variable name="imgID" select="concat('PropImgID', $pos)"/>
                                    <xsl:variable name="btnID" select="concat('PropBtnID', $pos)"/>
                                    <xsl:variable name="OtherRowCount" select="(count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other)
                                    + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/Other)
                                    + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/Other))"/>
                            <tr >
   <td  class="styTableCell" rowspan="2" colspan="2" style="text-align:left;width:53mm;border-right-width:0px;border-bottom-width:0px;border-color: black;padding-top:0mm;">
                                   <span class="styBoldText">
         <span style="font-size:8pt;">lncome:</span>
                                              </span>
                                            <span class="styTableCellPad"></span>
      </td>
  <td class="styTableCell" colspan="1" rowspan="2" style="width:8mm;border-color: black;" >
                                             <span class="styTableCellPad"></span>
                                          </td>
                                           <xsl:if test="$pos &lt;= 3">
    <td class="styTableCell" colspan="3" rowspan="1" style="width:80mm;border-right-width:1px;text-align:center;border-color: black;">
                                               <span class="styBoldText" style="font-size:8pt;text-align:center;">
                                             Properties
                                             </span>
                                          </td>
                                           </xsl:if>
                                  <xsl:if test="$pos &gt;= 4">
   <td class="styTableCell" colspan="3" rowspan="1" style="width:80mm;border-right-width:0px;border-left-width:0px;text-align:center;border-color: black;">
                                             (Continued)
                                          </td>
                                             </xsl:if>
   <xsl:if test="$pos &lt;= 3">
   <td class="styTableCell"  rowspan="2" colspan="2" style="width:36mm;text-align:center;border-right-width:0px;border-left-width:0px;border-bottom-width:1px;border-color: black;padding-left:0mm;">
                <span class="styBoldText" style="font-size:8pt;">Totals</span>
                                                     <br/>
                                    <span style="font-family:Arial;">(Add columns A, B,and C.)</span>
                               </td>
                               
           </xsl:if>
    <xsl:if test="$pos &gt;= 4">
      <td class="styShadingCell" colspan="1" rowspan="2"  style="width:6mm;border-right-width:1px;border-bottom-width:1px;">
                                              <span class="styTableCellPad" style=""></span>    
       </td>
      <td class="styTableCell" colspan="1" rowspan="2" style="width:42mm;border-bottom-width:1px;border-right-width:0px;border-color: black;">
                                                  <span class="styTableCellPad" style=""></span>     
       </td>
      </xsl:if>
       </tr>
              <tr>
                        
                         <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+3)">
     <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:0px;">
                                                   <xsl:call-template name="AddPositionNumber"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                  <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:0px;">
                                                   <xsl:call-template name="AddPositionNumber1"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                               <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:1px;">
                                                   <xsl:call-template name="AddPositionNumber2"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                                             </xsl:if>                          
                                       </tr>
   
                                    <!-- Line 3 (2)-->
                                    <tr>																					
                                     <!-- Column 1 -->
               <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                       <span class="styBoldText" style="text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                3
                                                </span>
                               </td>
                                             <!-- Column 2 -->
                                             <td class="styTableCell" style="width:53mm;text-align:left;border-right-width:1px;border-bottom-width:0px;border-color: black;">
                                                <span style="font-size:7pt;">Rents received</span>
                                               <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.....</span>
                                             </td>
                                             <!-- Column 3 -->
                                             <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">3</span>
                                             </td>
                                             <!-- Column 4 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <!-- Column 5 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <!-- Column 6 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <xsl:if test="$pos &lt;= 3">
                                                <!-- Column 7 -->
                 <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                   <span class="styBoldText" style="font-size:7pt;">3</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                     <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                                             </xsl:if>
                                             <xsl:if test="$pos &gt;= 4">
  <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
           <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;">
 <span class="styTableCellPad"></span>
                                                </td>
                                             </xsl:if>
                                          </tr>
                                          <!-- Line 4 -->
                                          <tr>
                                             <!-- Column 1 -->
                                             <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-color: black;">
                                                <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;">
                                                4
                                                </span>
                                             </td>
                                             <!-- Column 2 -->
                                             <td class="styTableCell" style="width:53mm;text-align:left;border-right-width:1px;border-color: black;">
                                                <span style="font-size:7pt;">Royalties received</span>
                                                <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.....</span>
                                             </td>
                                             <!-- Column 3 -->
                                             <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">4</span>
                                             </td>
                                             <!-- Column 4 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <!-- Column 5 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <!-- Column 6 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <xsl:if test="$pos &lt;= 3">
                                                <!-- Column 7 -->
                                                <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                   <span class="styBoldText" style="font-size:7pt;">4</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                     <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                                             </xsl:if>
                                             <xsl:if test="$pos &gt;= 4">
                                                <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                                <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                                </td>
                                             </xsl:if>
                                          </tr>
                                       <!-- Expenses -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td  class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             Expenses:
                                             </span>
                                          </td>
                                            <!-- Column 2 -->
                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                                <span class="styTableCellPad"></span>
                                          </td>
                            <!-- Column 3 -->
                                  <td class="styTableCell" style="text-align:center;width:8.5mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 7 -->
                     <td class="styShadingCell" style="text-align:center;width:7mm;border-bottom-width:0px;border-right-width:1px;border-color: black;border-left-width:0px;">
 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-bottom-width:0px;border-right-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                 <!-- Line 5 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             5
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Advertising</span>
                                             <span class="styDotLn" style="padding-left:3mm;float:none;clear:none;">........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">5</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                           <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 5 -->
                                       <!-- Line 6 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             6
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Auto and travel (see page E-4)</span>

                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">6</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                <!-- Line 7 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             7
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Cleaning and maintenance</span>
                                             <span class="styDotLn" style="padding-left:3mm;float:none;clear:none;">..</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">7</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 7 -->
                                       <!-- Line 8 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             8
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Commissions</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">8</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 8 -->
                                       <!-- Line 9 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             9
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Insurance</span>
                                             <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">9</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 9 -->
                                       <!-- Line 10 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             10
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Legal and other professional fees</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">10</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>         
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                        
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                    
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 10 -->
                                 <!-- Line 11 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             11
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Management fees</span>
                                             <span class="styDotLn" style="padding-left:4.5mm;float:none;clear:none;">.....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">11</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                     
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                          
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                       
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 11 -->
                                       <!-- Line 12 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             12
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Mortgage interest paid to banks,
                                             etc. (see page E-5)</span>
                                             <span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">.....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="padding-top:2mm;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">12</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>            
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                  
                                          </td>
                                          <xsl:if test="$pos &lt; 4">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="padding-top:2mm;text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">12</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="padding-top:2mm;width:26mm;border-right-width:0px;border-color: black;">
                                                 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 12 -->
                                       <!-- Line 13 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             13
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Other interest</span>
                                             <span class="styDotLn" style="padding-left:2.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">13</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 13 -->
                                 <!-- Line 14 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             14
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Repairs</span>
                                             <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">14</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                       
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                       
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                      
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 14 -->
                                       <!-- Line 15 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             15
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Supplies</span>
                                             <span class="styDotLn" style="padding-left:2.5mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">15</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                       
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                        
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 15 -->
                                       <!-- Line 16 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             16
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Taxes</span>
                                             <span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">..........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">16</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                       
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                          
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                          
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 16 -->
                                       <!-- Line 17 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             17
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Utilities</span>
                                             <span class="styDotLn" style="padding-left:4.25mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">17</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 17 -->
                                <!-- Line 18 -->
                                       <!-- If there are no entries for OtherExpenseAmt, then build empty rows -->
                        <xsl:if test="$OtherRowCount=0">
                                <tr class="styFixedUnderline">
                                             <xsl:choose>
                                   <xsl:when test="position() mod 3=1">
  <td class="styTableCell" style="width:6.9mm;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:0px;text-align:left;" >
                                                      <span class="styBoldText" style="font-size:7pt;">18</span>
                                                      </td>
      <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                                      Other (list)<span style="width:1mm;"></span>
                                                         <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
                                                         <span style="width:31mm;border-bottom-width:1px">
                                                            <xsl:call-template name="PopulateText">
                                                               <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                            </xsl:call-template>
                                                         </span>
                                                           </td>
      <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">18</span>
                                          </td>
                                                   <!-- Empty columns--> 
                                                   <td class="styTableCell">                                             
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styShadingCell" style="border-left-width:0px;width:7mm;border-right-width:1px;">
                                                     <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                   </td>
                                                   <td class="styTableCell" style="width:26mm;clear:none;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td style="border:none;font-size:7pt;" scope="row">
                                                      <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                                      <span class="styBB" style="width:29mm;">
                                                         <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                         </xsl:call-template>
                                                      </span>
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tr>
                                       </xsl:if>
                                       <xsl:variable name="FirstCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other) " />
                                       </xsl:variable>
                                       <xsl:variable name="SecondCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/Other) " />
                                       </xsl:variable>

                                       <xsl:variable name="ThirdCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/Other) " />
                                       </xsl:variable>
                                       <xsl:variable name="Line18Rows">
                                          <xsl:value-of select="$FirstCol + $SecondCol + $ThirdCol" />
                                       </xsl:variable>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other">
                                          <tr class="styFixedUnderline">
                                             <xsl:choose>
                                                <xsl:when test="position() = 1">
                                                   <!-- Col 1 -->
                                                   <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                      <div class="styGenericDiv" style="width:6.9mm;font-weight:bold;text-align:left;padding-left:0mm;">18</div>
                                                   </td>
                                                   <!-- Col 2 -->
                                                   <td>                                   
                                                      <div class="styGenericDiv" style="width:53mm;font-size:7pt;">
                                                         <span style="">
                                                         Other (list)
                                                           <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
                                                            <span style="width:1mm;"> </span>
                                                         </span>
                                                             <div class="styBB" style="width:50mm;border-style:dotted;">
                                                               <xsl:call-template name="PopulateText">
                                                                  <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                               </xsl:call-template>
                                                            </div>
                                                 
                                                      </div>    
                                                   </td>
                                                   <!-- Col 3 -->
                                                   <td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:right;border-left-width:1px;">
                                                      <xsl:attribute name="rowspan">
                                                         <xsl:value-of select="$Line18Rows"></xsl:value-of>
                                                      </xsl:attribute>
                                                      <span style="font-size:7pt;">18</span>
                                                   </td>
                                                   <!-- Col A -->
                                       <td class="styTableCell">                                             
                                                       <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                  <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td style="border:none;font-size:7pt;" scope="row">
                                                      <span class="styBB" style="border-style:dotted;width:50mm;">
                                                         <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                         </xsl:call-template>
                                                      </span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                               <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tr>
                                       </xsl:for-each>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/Other">
                                          <tr class="styFixedUnderline">
                                             <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td style="border:none;font-size:7pt;" scope="row">
                                                <span class="styBB" style="border-style:dotted;width:50mm;">
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                           <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/Other">
                                          <tr class="styFixedUnderline">
                                             <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td style="border:none;font-size:7pt;" scope="row">
                                                <span class="styBB" style="border-style:dotted;width:50mm;">
                                                     <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td class="styTableCell">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                       <!-- End of Line 18 -->
                                       <!-- Line 19 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             19
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Add lines 5 through 18</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">...</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">19</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <xsl:if test="$pos &lt;= 3">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">19</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:25mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 19 -->
                                       <!-- Line 20 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             20
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Depreciation expense or depletion<br />
                                             (see page E-5)</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">20</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <!-- Form to Form Link -->
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <xsl:if test="$pos &lt;= 3">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">20</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:28mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 20 -->
                                       <!-- Line 21 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             21
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Total expenses. Add lines 19 and 20</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">21</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>       
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                         
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>              
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 21 -->
                                       <!-- Line 22 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="vertical-align:text-top;width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;font-size:7pt;">
                                             22
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                 <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">
                                             Income or (loss) from rental real<br />
                                                estate or royalty properties.<br />
                                                Subtract line 21 from line 3 (rents)<br />
                                                or line 4 (royalties). If the result is a<br />
                                                (loss), see page E-5 to find out if<br />
                                                you must file <span class="styBoldText">Form 6198</span>
                                             </span>                              
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">22</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                               <span class="styTableCellPad" style="border-left-width:0px;"></span>                
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>                  
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 22 -->
                                       <!-- Line 23 -->
                                       <tr style="">
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="vertical-align:text-top;width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;font-size:7pt;">
                                             23
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                 <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">
                                             Deductible rental real estate loss.
                                                <span class="styBoldText">Caution</span>. Your rental real estate<br />
                                                loss on line 22 may be limited. See<br />
                                                page E-5 to find out if you must<br />
                                                file <span class="styBoldText">Form 8582</span>. Real estate<br />
                                                professionals <span class="styBoldText">must</span> complete line<br />
                                                43 on page 2
                                             </span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">23</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;color:darkblue;font-size:7pt;text-align:right">
                                               (<span class="styTableCellPad" style="border-left-width:0px;width:2mm;"></span>)    
                                          </td>
                                          <!-- Column 5 -->
                                         <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;color:darkblue;font-size:7pt;text-align:right">
                                               (<span class="styTableCellPad" style="border-left-width:0px;width:2mm;"></span>)    
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;color:darkblue;font-size:7pt;text-align:right">
                                               (<span class="styTableCellPad" style="border-left-width:0px;width:2mm;"></span>)    
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad" style=":border-right-width:0px;"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 23 -->
                                 </xsl:if>
                       </xsl:if>
                              </xsl:if>
                              <!-- SEPARATED DATA -->
  <xsl:if test="(count($FormData/PropertyRealEstAndRoyaltyGroup) &lt; 1 ) or (($Print = $Separated) and (count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 4)) ">
                              <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
                                 <xsl:variable name="pos" select="position()"/>
                                 <xsl:if test="position() mod 3 = 1">
                                    <xsl:variable name="conID" select="concat('PropTableID', $pos)"/>             
                                    <xsl:variable name="imgID" select="concat('PropImgID', $pos)"/>
                                    <xsl:variable name="btnID" select="concat('PropBtnID', $pos)"/>
                                    <xsl:variable name="OtherRowCount" select="(count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other)
                                    + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/Other)
                                    + count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/Other))"/>
                            <tr >
   <td  class="styTableCell" rowspan="2" colspan="2" style="text-align:left;width:53mm;border-right-width:0px;border-bottom-width:0px;border-color: black;padding-top:0mm;">
                                   <span class="styBoldText">
         <span style="font-size:8pt;">lncome:</span>
                                              </span>
                                            <span class="styTableCellPad"></span>
      </td>
                  <td class="styTableCell" colspan="1" rowspan="2" style="width:8mm;border-color: black;" >
                                             <span class="styTableCellPad"></span>
                                          </td>
                                           <xsl:if test="$pos &lt;= 3">
              <td class="styTableCell" colspan="3" rowspan="1" style="width:80mm;border-right-width:0px;text-align:center;border-color: black;">
                                               <span class="styBoldText" style="font-size:8pt;text-align:center;">
                                             Properties
                                             </span>
                                          </td>
                                           </xsl:if>
                                           <xsl:if test="$pos &gt;= 4">
   <td class="styTableCell" colspan="3" rowspan="1" style="width:80mm;border-right-width:0px;border-left-width:0px;text-align:center;border-color: black;">
                                             (Continued)
                                          </td>
                                             </xsl:if>
   <xsl:if test="$pos &lt;= 3">
   <td class="styShadingCell" colspan="1" rowspan="2"  style="width:6mm;border-right-width:1px;">
                                              <span class="styTableCellPad" style=""></span>    
       </td>
   <td class="styTableCell"  rowspan="2" colspan="1" style="width:32mm;text-align:center;border-right-width:0px;border-left-width:1px;">
                                                     <span class="styBoldText" style="font-size:8pt;">Totals</span>
                                                     <br/>
                                    <span style="font-family:Arial;">(Add columns A, B,and C.)</span>
                               </td>
                               
           </xsl:if>
    <xsl:if test="$pos &gt;= 4">
      <td class="styShadingCell" colspan="1" rowspan="2"  style="width:6mm;border-right-width:1px;">
                                              <span class="styTableCellPad" style="border-left-width:0px;"></span>    
       </td>
      <td class="styTableCell" colspan="1" rowspan="2" style="width:42mm;border-bottom-width:0px;border-right-width:0px;border-color: black;">
                                                  <span class="styTableCellPad" style=""></span>     
       </td>
      </xsl:if>
       </tr>
              <tr> 
                        <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+3)">
     <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:1px;">
                                                   <xsl:call-template name="AddPositionNumber"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
    <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:1px;">
                                                   <xsl:call-template name="AddPositionNumber1"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
       <td class="styTableCell" style="width:80mm;text-align:center;font-size:8pt;border-color: black;border-left-width:0px;border-right-width:0px;">
                                                   <xsl:call-template name="AddPositionNumber2"/>
                                                    <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                                                   </xsl:if>
                               
                                       </tr>
                                    <!-- Line 3 (2)-->
                                    <tr>																					
                                     <!-- Column 1 -->
 <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                       <span class="styBoldText" style="text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                3
                                                </span>
                               </td>
                                             <!-- Column 2 -->
                                             <td class="styTableCell" style="width:53mm;text-align:left;border-right-width:1px;border-bottom-width:0px;border-color: black;">
                                                <span style="font-size:7pt;">Rents received</span>
                                               <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.....</span>
                                             </td>
                                             <!-- Column 3 -->
                                             <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">3</span>
                                             </td>
                                             <!-- Column 4 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                               <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RentsReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 5 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RentsReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 6 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RentsReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentsReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <xsl:if test="$pos &lt;= 3">
                                                <!-- Column 7 -->
                                                <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                   <span class="styBoldText" style="font-size:7pt;">3</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                   <xsl:call-template name="PopulateAmount">
                                                      <xsl:with-param name="TargetNode" select="$FormData/TotalRentsReceivedAmt" />
                                                      <xsl:with-param name="BackupName">IRS1040ScheduleETotalRentsReceivedAmt</xsl:with-param>
                                                   </xsl:call-template>
                                                </td>
                                             </xsl:if>
                                             <xsl:if test="$pos &gt;= 4">
                                                <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                                  <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;">
 <span class="styTableCellPad"></span>
                                                </td>
                                             </xsl:if>
                                          </tr>
                                          <!-- Line 4 -->
                                          <tr>
                                             <!-- Column 1 -->
                                             <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-color: black;">
                                                <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;">
                                                4
                                                </span>
                                             </td>
                                             <!-- Column 2 -->
                                             <td class="styTableCell" style="width:53mm;text-align:left;border-right-width:1px;border-color: black;">
                                                <span style="font-size:7pt;">Royalties received</span>
                                                <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.....</span>
                                             </td>
                                             <!-- Column 3 -->
                                             <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">4</span>
                                             </td>
                                             <!-- Column 4 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RoyaltiesReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 5 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RoyaltiesReceivedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <!-- Column 6 -->
                                             <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                       <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RoyaltiesReceivedAmt" />
                                  <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRoyaltiesReceivedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <xsl:if test="$pos &lt;= 3">
                                                <!-- Column 7 -->
                                                <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                   <span class="styBoldText" style="font-size:7pt;">4</span>
                                                </td>
                                                <!-- Column 8 -->
                                                <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                   <xsl:call-template name="PopulateAmount">
                                                      <xsl:with-param name="TargetNode" select="$FormData/TotalRoyaltiesReceivedAmt" />
                                                      <xsl:with-param name="BackupName">IRS1040ScheduleETotalRoyaltiesReceivedAmt</xsl:with-param>
                                                   </xsl:call-template>
                                                </td>
                                             </xsl:if>
                                             <xsl:if test="$pos &gt;= 4">
                                                <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                                <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                </td>
                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                                </td>
                                             </xsl:if>
                                          </tr>
                                       <!-- Expenses -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td  class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             Expenses:
                                             </span>
                                          </td>
                                            <!-- Column 2 -->
                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                                <span class="styTableCellPad"></span>
                                          </td>
                            <!-- Column 3 -->
                                  <td class="styTableCell" style="text-align:center;width:8.5mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                          <!-- Column 7 -->
                     <td class="styShadingCell" style="text-align:center;width:7mm;border-bottom-width:0px;border-right-width:1px;border-color: black;border-left-width:0px;">
 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-bottom-width:0px;border-right-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                 <!-- Line 5 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             5
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Advertising</span>
                                             <span class="styDotLn" style="padding-left:3mm;float:none;clear:none;">........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">5</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AdvertisingAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AdvertisingAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AdvertisingAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAdvertisingAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                           <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 5 -->
                                       <!-- Line 6 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             6
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Auto and travel (see page E-4)</span>

                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">6</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/AutoAndTravelAmt" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/AutoAndTravelAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/AutoAndTravelAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupAutoAndTravelAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
 <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                <!-- Line 7 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             7
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Cleaning and maintenance</span>
                                             <span class="styDotLn" style="padding-left:3mm;float:none;clear:none;">..</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">7</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CleaningAndMaintenanceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CleaningAndMaintenanceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CleaningAndMaintenanceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCleaningAndMaintenanceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 7 -->
                                       <!-- Line 8 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             8
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Commissions</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">8</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/CommissionsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/CommissionsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/CommissionsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupCommissionsAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 8 -->
                                       <!-- Line 9 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                             9
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Insurance</span>
                                             <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">9</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/InsuranceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/InsuranceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/InsuranceAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupInsuranceAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 9 -->
                                       <!-- Line 10 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             10
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Legal and other professional fees</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">10</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/LegalAndOtherProfFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/LegalAndOtherProfFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/LegalAndOtherProfFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupLegalAndOtherProfFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 10 -->
                                 <!-- Line 11 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             11
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Management fees</span>
                                             <span class="styDotLn" style="padding-left:4.5mm;float:none;clear:none;">.....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">11</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/ManagementFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/ManagementFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/ManagementFeesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupManagementFeesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 11 -->
                                       <!-- Line 12 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             12
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Mortgage interest paid to banks,
                                             etc. (see page E-5)</span>
                                             <span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">.....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="padding-top:2mm;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">12</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/MortgageInterestPaidAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/MortgageInterestPaidAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="padding-top:2mm;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/MortgageInterestPaidAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupMortgageInterestPaidAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <xsl:if test="$pos &lt; 4">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="padding-top:2mm;text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">12</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="padding-top:2mm;width:26mm;border-right-width:0px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/TotalMortgageInterestPaidAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleETotalMortgageInterestPaidAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 12 -->
                                       <!-- Line 13 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             13
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Other interest</span>
                                             <span class="styDotLn" style="padding-left:2.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">13</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/OtherInterestAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/OtherInterestAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/OtherInterestAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherInterestAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 13 -->
                                 <!-- Line 14 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             14
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Repairs</span>
                                             <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">14</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RepairsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RepairsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RepairsAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRepairsAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 14 -->
                                       <!-- Line 15 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             15
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Supplies</span>
                                             <span class="styDotLn" style="padding-left:2.5mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">15</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/SuppliesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/SuppliesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/SuppliesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupSuppliesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 15 -->
                                       <!-- Line 16 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             16
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Taxes</span>
                                             <span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">..........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">16</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TaxesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TaxesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TaxesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTaxesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 16 -->
                                       <!-- Line 17 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             17
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Utilities</span>
                                             <span class="styDotLn" style="padding-left:4.25mm;float:none;clear:none;">.........</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">17</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/UtilitiesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/UtilitiesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/UtilitiesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupUtilitiesAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 17 -->
                                <!-- Line 18 -->
                                       <!-- If there are no entries for OtherExpenseAmt, then build empty rows -->
                        <xsl:if test="$OtherRowCount=0">
                                <tr class="styFixedUnderline">
                                             <xsl:choose>
                                                <xsl:when test="position() mod 3=1">
      <td class="styTableCell" style="width:6.9mm;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px" >
                                                      <span class="styBoldText" style="font-size:7pt;">18</span>
                                                      </td>
      <td class="styTableCell" style="width:53mm;text-align:right;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                                      Other (list)<span style="width:1mm;"></span>
                                                         <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
                                                         <span style="width:31mm;border-bottom-width:1px">
                                                            <xsl:call-template name="PopulateText">
                                                               <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                            </xsl:call-template>
                                                         </span>
                                                           </td>
      <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">18</span>
                                          </td>
                                                   <!-- Empty columns--> 
                                                   <td class="styTableCell">                                             
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styShadingCell" style="border-left-width:0px;width:7mm;">
                                                     <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                                   </td>
                                                   <td class="styTableCell" style="width:26mm;clear:none;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td style="border:none;font-size:7pt;" scope="row">
                                                      <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                                      <span class="styBB" style="width:29mm;">
                                                         <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                         </xsl:call-template>
                                                      </span>
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tr>
                                       </xsl:if>
                                       <xsl:variable name="FirstCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other) " />
                                       </xsl:variable>
                                       <xsl:variable name="SecondCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+1]/Other) " />
                                       </xsl:variable>

                                       <xsl:variable name="ThirdCol">
                                          <xsl:value-of select="count($FormData/PropertyRealEstAndRoyaltyGroup[$pos+2]/Other) " />
                                       </xsl:variable>
                                       <xsl:variable name="Line18Rows">
                                          <xsl:value-of select="$FirstCol + $SecondCol + $ThirdCol" />
                                       </xsl:variable>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/Other">
                                          <tr class="styFixedUnderline">
                                             <xsl:choose>
                                                <xsl:when test="position() = 1">
                                                   <!-- Col 1 -->
                                                   <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                      <div class="styGenericDiv" style="width:6.9mm;font-weight:bold;text-align:left;padding-left:0mm;">18</div>
                                                   </td>
                                                   <!-- Col 2 -->
                                                   <td>                                   
                                                      <div class="styGenericDiv" style="width:53mm;font-size:7pt;">
                                                         <span style="">
                                                         Other (list)
                                                           <img src="{$ImagePath}/1040_Bullet.gif" align="bottom" alt="Bullet Image"/>
                                                            <span style="width:1mm;"> </span>
                                                         </span>
                                                             <div class="styBB" style="width:50mm;border-style:dotted;">
                                                               <xsl:call-template name="PopulateText">
                                                                  <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                               </xsl:call-template>
                                                            </div>
                                                      </div>    
                                                   </td>
                                                   <!-- Col 3 -->
                                                   <td rowspan="1" class="styTableCell" style="width:8mm;font-size:7pt;font-weight:bold;text-align:right;border-left-width:1px;">
                                                      <xsl:attribute name="rowspan">
                                                         <xsl:value-of select="$Line18Rows"></xsl:value-of>
                                                      </xsl:attribute>
                                                      <span style="font-size:7pt;">18</span>
                                                   </td>
                                                   <!-- Col A -->
                                      <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">    
                                                    <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/OtherExpenseAmt" />
                                             </xsl:call-template>              
                                                      <xsl:call-template name="PopulateAmount">
                                                         <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                      </xsl:call-template>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                  <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td style="border:none;font-size:7pt;" scope="row">
                                                      <span class="styBB" style="border-style:dotted;width:50mm;">
                                                         <xsl:call-template name="PopulateText">
                                                            <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                         </xsl:call-template>
                                                      </span>
                                                   </td>
                                                     <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                           <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/OtherExpenseAmt" />
                                             </xsl:call-template>              
                                                      <xsl:call-template name="PopulateAmount">
                                                         <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
                                  <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                      </xsl:call-template>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                   <td class="styTableCell">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                               <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                      <span class="styTableCellPad"></span>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tr>
                                       </xsl:for-each>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/Other">
                                          <tr class="styFixedUnderline">
                                             <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td style="border:none;font-size:7pt;" scope="row">
                                                <span class="styBB" style="border-style:dotted;width:50mm;">
                                                   <xsl:call-template name="PopulateText">
                                                      <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                   </xsl:call-template>
                                                </span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                              <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                                    <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/OtherExpenseAmt" />
                                             </xsl:call-template>              
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
                                  <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                           <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                       <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/Other">
                                          <tr class="styFixedUnderline">
                                             <td style="font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td style="border:none;font-size:7pt;" scope="row">
                                                <span class="styBB" style="border-style:dotted;width:50mm;">
                                                   <xsl:call-template name="PopulateText">
                                                      <xsl:with-param name="TargetNode" select="OtherExpenseDescription"/>
                                                   </xsl:call-template>
                                                </span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                             <td class="styTableCell">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                                <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;"> 
                                                     <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/OtherExpenseAmt" />
                                             </xsl:call-template>              
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="OtherExpenseAmt" />
                                   <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                             <td class="styShadingCell" style="border-right-width:1px;width:7mm;border-left-width:0px;">
                                                <span class="styTableCellPad"></span>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                       <!-- End of Line 18 -->
                                       <!-- Line 19 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             19
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Add lines 5 through 18</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">...</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">19</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/RentAndRyltyExpnssPerPropAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/RentAndRyltyExpnssPerPropAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/RentAndRyltyExpnssPerPropAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupRentAndRyltyExpnssPerPropAmt</xsl:with-param>
                                             </xsl:call-template>
                                          </td>
                                          <xsl:if test="$pos &lt;= 3">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">19</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/TotalRentalAndRoyaltyDedAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleETotalRentalAndRoyaltyDedAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:25mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 19 -->
                                       <!-- Line 20 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             20
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Depreciation expense or depletion<br />
                                             (see page E-5)</span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">20</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <!-- Form to Form Link -->
                                             <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/DeprecExpenseOrDepletionAmt" />
                                             </xsl:call-template>
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DeprecExpenseOrDepletionAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/DeprecExpenseOrDepletionAmt" />
                                             </xsl:call-template>
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DeprecExpenseOrDepletionAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="SetFormLinkInline">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup/DeprecExpenseOrDepletionAmt" />
                                             </xsl:call-template>
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DeprecExpenseOrDepletionAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDeprecExpenseOrDepletionAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <xsl:if test="$pos &lt;= 3">
                                             <!-- Column 7 -->
                                             <td class="styTableCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;">
                                                <span class="styBoldText" style="font-size:7pt;">20</span>
                                             </td>
                                             <!-- Column 8 -->
                                             <td class="styTableCell" style="width:26mm;border-right-width:0px;border-color: black;">
                                                <xsl:call-template name="PopulateAmount">
                                                   <xsl:with-param name="TargetNode" select="$FormData/TotalDepreciationAmt" />
                                                   <xsl:with-param name="BackupName">IRS1040ScheduleETotalDepreciationAmt</xsl:with-param>
                                                </xsl:call-template>
                                             </td>
                                          </xsl:if>
                                          <xsl:if test="$pos &gt;= 4">
                                             <td class="styShadingCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;border-left-width:0px;">
                                             <span class="styTableCellPad" style="border-left-width:0px;"></span>
                                             </td>
                                             <td class="styTableCell" style="width:28mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
 <span class="styTableCellPad"></span>
                                             </td>
                                          </xsl:if>
                                       </tr>
                                       <!-- End of Line 20 -->
                                       <!-- Line 21 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;padding-right:2mm;font-size:7pt;">
                                             21
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                                          <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">Total expenses. Add lines 19 and 20</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">21</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/TotalExpensesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/TotalExpensesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/TotalExpensesAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupTotalExpensesAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 21 -->
                                       <!-- Line 22 -->
                                       <tr>
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="vertical-align:text-top;width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;font-size:7pt;">
                                             22
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                 <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">
                                             Income or (loss) from rental real<br />
                                                estate or royalty properties.<br />
                                                Subtract line 21 from line 3 (rents)<br />
                                                or line 4 (royalties). If the result is a<br />
                                                (loss), see page E-5 to find out if<br />
                                                you must file <span class="styBoldText">Form 6198</span>
                                             </span>                              
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">....</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">22</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/NetRentalIncomeOrLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupNetRentalIncomeOrLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/NetRentalIncomeOrLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupNetRentalIncomeOrLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/NetRentalIncomeOrLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupNetRentalIncomeOrLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 22 -->
                                       <!-- Line 23 -->
                                       <tr style="">
                                          <!-- Column 1 -->
                                          <td class="styTableCell" style="vertical-align:text-top;width:6.9mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styBoldText" style="float:left;text-align:left;padding-left:0mm;font-size:7pt;">
                                             23
                                             </span>
                                          </td>
                                          <!-- Column 2 -->
                 <td class="styTableCell" style="width:53mm;text-align:left;border-bottom-width:0px;border-right-width:1px;border-color: black;">
                                             <span style="font-size:7pt;">
                                             Deductible rental real estate loss.
                                                <span class="styBoldText">Caution</span>. Your rental real estate<br />
                                                loss on line 22 may be limited. See<br />
                                                page E-5 to find out if you must<br />
                                                file <span class="styBoldText">Form 8582</span>. Real estate<br />
                                                professionals <span class="styBoldText">must</span> complete line<br />
                                                43 on page 2
                                             </span>
                                             <span class="styDotLn" style="padding-left:3.25mm;float:none;clear:none;">.......</span>
                                          </td>
                                          <!-- Column 3 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;text-align:center;width:8mm;border-right-width:1px;border-color: black;">
                                             <span class="styBoldText" style="font-size:7pt;">23</span>
                                          </td>
                                          <!-- Column 4 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateNegativeNumber">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos]/DedRentalRealEstateLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDedRentalRealEstateLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 5 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateNegativeNumber">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 1]/DedRentalRealEstateLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDedRentalRealEstateLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 6 -->
                                          <td class="styTableCell" style="vertical-align:text-bottom;width:26.9mm;border-right-width:1px;border-color: black;">
                                             <xsl:call-template name="PopulateNegativeNumber">
                                                <xsl:with-param name="TargetNode" select="$FormData/PropertyRealEstAndRoyaltyGroup[$pos + 2]/DedRentalRealEstateLossAmt" />
                                                <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupDedRentalRealEstateLossAmt</xsl:with-param>
                                             </xsl:call-template>                           
                                          </td>
                                          <!-- Column 7 -->
                                          <td class="styShadingCell" style="text-align:center;width:7mm;border-right-width:1px;border-color: black;border-left-width:0px;">
<span class="styTableCellPad" style="border-left-width:0px;"></span>
                                          </td>
                                          <!-- Column 8 -->
                                          <td class="styTableCell" style="width:26mm;border-right-width:0px;border-bottom-width:0px;border-color: black;">
                                             <span class="styTableCellPad" style=":border-right-width:0px;"></span>
                                          </td>
                                       </tr>
                                       <!-- End of Line 23 -->
                                 </xsl:if>
                         </xsl:for-each>
                              </xsl:if>
                             
                           </tbody>
                        </table>
                  
             
                
                  <!-- Generated Table (End) -->
                 <!--scroll here 23-->
               <!-- Line 24  -->
               <div class="styBB" style="width:187mm;height:5mm;border-bottom-width: 0px;">
                  <div class="styLNLeftNumBox" style="padding-left:0mm;width:5mm;padding-top:.5mm;padding-left:1mm;height:5mm;">
                  24
                  </div>
                  <div class="styLnDesc" style="padding-top:.5mm;width:145mm;padding-left:2mm;height:5mm;">
                 <span class="styBoldText">lncome.</span> Add positive amounts shown on line 22. <span class="styBoldText">Do not</span> include any losses
                        <span class="styDotLn" style="padding-left:3.5mm;float:none;clear:none;">.........</span>
                  </div>
                     <div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
                     24
                     </div>
                     <div class="styLNAmountBox" style="padding-right:.5mm;width:31mm;font-size:6.5pt;height:5mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/IncomeAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleEIncomeAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
            
               </div>
               <!-- End Line 24  -->
               <!-- Line 25  -->
               <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
                  <div class="styLNLeftNumBox" style="float:left;clear:none;padding-left:0mm;width:5mm;padding-top:.5mm;padding-left:1mm;height:5mm;">25</div>
                  <div class="styLnDesc" style="padding-top:.5mm;width:145mm;padding-left:2mm;height:5mm;">
                   <span class="styBoldText">Losses.</span> Add royalty losses from line 22 and rental real estate losses from line 23. Enter total losses here.
                  </div>
                 
                     <div class="styLNRightNumBox" style="width:5.5mm;height:5mm;">
                     25
                     </div>
                     <div class="styLNAmountBox" style="font-size:6.5pt;width:31mm;height:5mm;">
                        <xsl:call-template name="PopulateNegativeNumber">
                           <xsl:with-param name="TargetNode" select="$FormData/LossesAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleELossesAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  
               </div>
               <!-- End Line 25  -->
               <!-- Line 26  -->
               <div class="styBB" style="width:187mm;height:11mm;float:left;clear:none;">
                  <div class="styLNLeftNumBox" style="float:left;clear:none;padding-left:0mm;width:5mm;padding-top:.5mm;padding-left:1mm;height:11mm;">26</div>
                  <div class="styLnDesc" style="padding-top:.5mm;width:145mm;padding-left:2mm;height:11mm;">
                   <b> Total rental real estate and royalty income or (loss).</b> Combine lines 24 and 25. Enter the result here.
                     If Parts II, III, IV, and line 40 on page 2 do not apply to you, also enter this amount on Form 1040,
                     line 17, or Form 1040NR, line 18. Otherwise, include this amount in the total on line 41 on page 2
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                               <xsl:with-param name="Desc">Part I, Line 26 NonPassive Activity Literal </xsl:with-param>
                                <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityLiteralCd"/>
                                 </xsl:call-template> 
                                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                               <xsl:with-param name="Desc">Part I, Line 26 NonPassive Activity Amount</xsl:with-param>
                                <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityAmt"/>
                                 </xsl:call-template> 
                                  <span class="styDotLn" style="float:none;clear:none;padding-left:4.75mm;">..</span>
                  </div>
                     <div class="styLNRightNumBox" style="width:5.5mm;height:11mm;border-bottom-width:0px;padding-top:7mm;">
                     26
                     </div>
                     <div class="styLNAmountBox" style="font-size:6.5pt;padding-right:.5mm;width:31mm;height:11mm;border-bottom-width:0px;padding-top:6mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalIncomeOrLossAmt</xsl:with-param>
                        </xsl:call-template>                          
                  </div>
               </div>
               <!-- End Line 26  -->
                  </div>
               <!-- End Expenses -->
               <div style="height:6mm;width:187mm;">
                  <span class="styBoldText" style="float:left;padding-top:0mm;">
                  For Paperwork Reduction Act Notice, see your tax return instructions.
                  </span>
                  <span style="padding-left:10mm;padding-top:0mm;">Cat. No. 11344L</span> 
      <span class="styBoldText" style="font-size:8pt;padding-left:10mm;">Schedule E (Form 1040) 2010</span>
               </div>  
                <br /><br class="pageEnd"/>
               <!-- Page 2 -->
               <div class="styTBB" style="height:5.5mm;width:187mm;">
                  <span style="float:left;clear:none;padding-top:1mm;">Schedule E (Form 1040) 2010</span>
                  <span style="float:left;clear:none;padding-left:45mm;padding-top:1mm;">Attachment Sequence No. <span class="styBoldText" style="font-size:10pt;">13</span></span>
                  <span style="float:right;clear:none;padding-top:1mm;">Page <span class="styBoldText" style="font-size:10pt;">2</span></span>
               </div>
               <div style="width:187mm;" class="styBB">
                  <div style="width:138mm;height:8mm;font-weight:normal;font-size:7pt;" class="styNameBox">
                  Name(s) shown on return. Do not enter name and social security number if shown on other side.<br />
                     <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Name</xsl:with-param></xsl:call-template><br/>  
                  </div>
                  <div style="width:49mm;height:4mm;padding-left:2mm;font-size:7pt;" class="styEINBox">
                  Your social security number<br />
                     <span style="font-weight:normal;">  
                     <xsl:call-template name="PopulateSSN">
                           <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN" />
                           <xsl:with-param name="BackupName">$RtnHdrDataFilerPrimarySSN</xsl:with-param>
                        </xsl:call-template>  
                        <!--<xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template><br />-->
                        <!--<xsl:call-template name="PopulateReturnHeaderFiler">
                              <xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>-->
                     </span>      
                  </div>
               </div>    
               <div style="width:187mm;" class="styBB">
                  <span class="styBoldText">Caution.</span> The IRS compares amounts reported on your tax return with amounts shown on Schedule(s) K-1.
               </div>
               <!-- Part II --> 
               <!-- Part II Title --> 
               <div style="width:187mm;" class="styBB">
                  <div class="styPartName" style="width:15mm;">Part ll</div>
                  <div class="styPartDesc" style="padding-left:3mm;font-weight:normal;">
                     <span class="styBoldText">lncome or Loss From Partnerships and S Corporations <span style="padding-left:3mm;padding-right:1mm;">Note.</span> </span>If you report a loss from an at-risk activity for
                     which <span class="styBoldText">any</span> amount is <span class="styBoldText">not</span> at risk, you <span class="styBoldText">must</span> check the box in column <b>(e)</b> on line 28 and attach <span class="styBoldText">Form 6198.</span> See page E-1. 
                  </div>
               </div>
               <!-- End Part II Title --> 
               <!-- Line 27--> 
               <div style="width:187mm;" class="styBB">
                  <div class="styLNLeftNumBox" style="float:left;clear:none;padding-left:0mm;width:5mm;padding-top:.5mm;padding-left:1mm;">27</div>
                  <div style="width:153mm;float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
                  Are you reporting any loss not allowed in a prior year due to the at-risk or basis limitations, a prior year unallowed
                  loss from a passive activity (if that loss was not reported on Form 8582), or unreimbursed partnership expenses?
                  If you answered "Yes," see page E-7 before completing this section.                      
                  </div>   
                  <div style="width:13mm;float:left;clear:none;padding-left:2mm;padding-top:3mm;">               
                        <!-- Yes Checkbox -->
                        <input type="Checkbox" class="styCkbox">
                           <xsl:call-template name="PopulateYesCheckbox">
                              <xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd" />
                              <xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
                           </xsl:call-template>
                        </input>
                         <label>
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">Yes</span>
      </label>
                        
                 </div>     
                     <div style="width:13mm;float:left;clear:none;padding-left:2mm;padding-top:3mm;">    
                     <!-- No Checkbox -->
                     <input type="Checkbox" class="styCkbox">
                        <xsl:call-template name="PopulateNoCheckbox">
                           <xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
                        </xsl:call-template>                            
                     </input>
                     <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/PriorYearsLossesInd" />
          <xsl:with-param name="BackupName">IRS1040ScheduleEPriorYearsLossesInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">No</span>
    
      </label>
                      </div>
                 <div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;">
                                 <!-- button display logic -->
                                 <xsl:call-template name="SetDynamicTableToggleButton">
                                    <xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
                                    <xsl:with-param name="containerHeight" select="4"/>
                                    <xsl:with-param name="headerHeight" select="1"/>
                                    <xsl:with-param name="containerID" select=" 'sCorpContainerId'  "/>
                                 </xsl:call-template>
                                 <!-- end button display logic -->
                              </div>
               </div>
               <!-- line 28 -->
               <div class="styTableContainer" style="width:187mm;height:0mm;"  id="sCorpContainerId">
                  <!-- print logic -->
                  <xsl:call-template name="SetInitialState"/>
                  <!-- end -->
                  <table class="styTable" style="" cellspacing="0">
                     <thead class="styTableThead">
                        <tr>
                           <th class="styTableCellHeader" scope="col" style="width:5mm;border-right-width:0px;border-color: black;">
                              <!-- uncomment and change table header literals here or use 'cellpad' -->
                              <span class="styNormalText">
                                 <span class="styBoldText" style="font-size:7pt;">28</span>
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                           <th class="styTableCellHeader" scope="col" style="width:86.2mm;border-right-width:1px;border-color: black;">
                              <!-- uncomment and change table header literals here or use 'cellpad' -->
                              <span style="font-weight:bold;">(a)</span>
                              <span class="styNormalText">
                              Name
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                           <th class="styTableCellHeader" scope="col" style="width:19.7mm;border-right-width:1px;border-color: black;">
                              <!-- uncomment and change table header literals here or use 'cellpad' -->
                              <span style="font-weight:bold;">(b)</span>
                              <span class="styNormalText">
                              Enter <b>P</b> for
                              partnership; <b>S</b><br />
                                 for S corporation
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                           <th class="styTableCellHeader" scope="col" style="width:17.5mm;border-right-width:1px;border-color: black;">
                              <!-- uncomment and change table header literals here or use 'cellpad' -->
                              <span style="font-weight:bold;">(c)</span>
                              <span class="styNormalText">
                              Check if<br />
                                 foreign<br />
                                 partnership
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                           <th class="styTableCellHeader" scope="col" style="width:32.5mm;border-right-width:1px;border-color: black;">
                              <!-- uncomment and change table header literals here or use 'cellpad' -->
                              <span style="font-weight:bold;">(d)</span>
                              <span class="styNormalText">
                              Employer<br />
                                 identification<br />
                                 number
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                           <th class="styTableCellHeader" scope="col" style="width:23.2mm;border-right-width:0px;border-color: black;">
                              <div class="styGenericDiv">
                                 <span style="font-weight:bold;">(e)</span>
                                 <span class="styNormalText">
                                 Check if<br />
                                    any amount is<br />
                                    not at risk
                                 </span>
                              </div>
                             
                           </th>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:if test="($Print != $Separated) or (count($FormData/PartnershipOrSCorpGroup) &lt;= 4) "> 
                           <xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
                              <tr>
                                 <!-- Column 0 -->
                                 <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;">
                                    <span class="styBoldText" style="padding-right:2mm;font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <xsl:with-param name="Position" select="position()" />
                                       </xsl:call-template>
                                    </span>
                                     <span class="styTableCellPad"></span>
                                 </td>
                                 <!-- Column a -->
                      <td class="styTableCell" style="text-align:left;width:86.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                       <xsl:if test="PartnershipOrSCorpName != ''">
                                    <xsl:call-template name="PopulateText">
                                       <xsl:with-param name="TargetNode" select="PartnershipOrSCorpName" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpName</xsl:with-param>
                                    </xsl:call-template>
                                        </xsl:if>     
                                          <xsl:if test="count($FormData/PartnershipOrSCorpGroup/PartnershipOrSCorpName) &lt; 1" >
                                           <span class="styTableCellPad"></span>
                                           </xsl:if>  
                                        <xsl:if test="PartnershipOrSCorpNameCd != ''">  
                                    <xsl:call-template name="PopulateText">
                                       <xsl:with-param name="TargetNode" select="PartnershipOrSCorpNameCd" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpNameCd</xsl:with-param>
                                    </xsl:call-template>  
                                           </xsl:if>   
                                            <xsl:if test="count($FormData/PartnershipOrSCorpGroup/PartnershipOrSCorpNameCd) &lt; 1" >
                                           <span class="styTableCellPad"></span>
                                           </xsl:if>  
                                 </td>
                                 <!-- Column b -->
                                 <td class="styTableCell" style="width:19.7mm;height:4mm;text-align:center;float:center;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                    <xsl:call-template name="PopulateText">
                                       <xsl:with-param name="TargetNode" select="PartnershipSCorpCd" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipSCorpCd</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                                 <!-- Column c -->
                  <td class="styTableCell" style="width:17.5mm;height:4mm;text-align:center;float:center;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                    <!-- Checkbox -->
                                    <input type="Checkbox" class="styCkbox">
                                       <xsl:call-template name="PopulateCheckbox">
                                          <xsl:with-param name="TargetNode" select="ForeignPartnershipInd" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupForeignPartnershipInd</xsl:with-param>
                                       </xsl:call-template>
                                    </input>
                                    	<label>
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="ForeignPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupForeignPartnershipInd</xsl:with-param>
								</xsl:call-template>
                            </label>
                                 </td>
                                 <!-- Column d -->
                  <td class="styTableCell" style="width:32.5mm;height:4mm;text-align:center;float:center;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                    <xsl:call-template name="PopulateEIN">
                                       <xsl:with-param name="TargetNode" select="PartnershipOrSCorpEIN" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpEIN</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                                 <!-- Column e -->
                <td class="styTableCell" style="width:23.2mm;height:4mm;text-align:center;float:center;clear:none;border-right-width:0px;border-color: black;font-size:7pt;">
                                    <!-- Checkbox -->
                                    <input type="Checkbox" class="styCkbox">
                                       <xsl:call-template name="PopulateCheckbox">
                                          <xsl:with-param name="TargetNode" select="AnyAmountIsNotAtRiskInd" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd</xsl:with-param>
                                       </xsl:call-template>
                                    </input>
                                      <label>
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="AnyAmountIsNotAtRiskInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd</xsl:with-param>
								</xsl:call-template>
                            </label>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </xsl:if>
                        <!-- Table Filler Rows -->
                        <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 1 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:3.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="1" />
                                    </xsl:call-template>
                                 </span>
                                  <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:86.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:left" > 
                                 <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                    <xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>                      
                                 </xsl:call-template>
                                  <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:19.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:17.5mm;height:4mm;border-right-width:1px;border-color: black;text-align:center" > 
                                   <input type="Checkbox" class="styCkbox">
                                     
                                    </input>
                              </td>
                              <td class="styTableCell" style="width:32.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:23.2mm;height:4mm;border-right-width:0px;border-color: black;text-align:center" > 
                                    <input type="Checkbox" class="styCkbox">
                                       
                                    </input>
                              </td>
                           </tr>
                        </xsl:if>
                        <!-- row B -->
                        <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 2 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:3.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="2" />
                                    </xsl:call-template>
                                 </span>
                                  <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:86.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:19.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                     <td class="styTableCell" style="width:17.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:center" > 
                                 <input type="Checkbox" class="styCkbox">
                                     
                                    </input>
                              </td>
                              <td class="styTableCell" style="width:32.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                      <td class="styTableCell" style="width:23.2mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;text-align:center" > 
                                <input type="Checkbox" class="styCkbox">
                                     
                                    </input>
                              </td>
                           </tr>
                        </xsl:if>
                        <!-- row C -->
                        <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 3 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:3.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="3" />
                                    </xsl:call-template>
                                 </span>
                                  <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:86.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:19.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                      <td class="styTableCell" style="width:17.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:center" > 
                                <input type="Checkbox" class="styCkbox">
                                     
                                    </input>
                              </td>
                              <td class="styTableCell" style="width:32.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                      <td class="styTableCell" style="width:23.2mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;text-align:center" > 
                                <input type="Checkbox" class="styCkbox">
                                     
                                    </input>
                              </td>
                           </tr>
                        </xsl:if>
                        <!-- row D -->
                        <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 4 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:3.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="4" />
                                    </xsl:call-template>
                                     <span class="styTableCellPad"></span>
                                 </span>
                              </td>
                              <td class="styTableCell" style="width:86.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:19.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:17.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:center" > 
                                <input type="Checkbox" class="styCkbox">
                                     
                                    </input>
                              </td>
                                <td class="styTableCell" style="width:32.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:23.2mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;text-align:center" > 
                                 <input type="Checkbox" class="styCkbox">
                                     
                                    </input>
                              </td>
                           </tr>
                        </xsl:if>
                        <!-- End of filler rows -->
                     </tbody>
                  </table>
               </div>
               <!-- Set Initial Height of Above Table -->
               <xsl:call-template name="SetInitialDynamicTableHeight">
                  <xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
                  <xsl:with-param name="containerHeight" select="4"/>
                   <xsl:with-param name="headerHeight" select="1"/>
                  <xsl:with-param name="containerID" select=" 'sCorpContainerId' "/>
               </xsl:call-template >
               <!-- Generated Table (End) -->
<!--Line 28 Passive Income-->
  <div   class="styBB" style="width:187mm;border-bottom-width:0px;">
                <div class="styFNBox" style="width:5mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
                     <span class="styBoldText" style="font-size:8pt;"></span>
                  </div>
                  <div class="styFNBox" style="width:76mm;text-align:center;border-right-width:2px;height:4mm;border-bottom-width:1px;">
                     <span class="styBoldText" style="font-size:8pt;">Passive lncome and Loss</span>
                  </div>
                  <div class="styFNBox" style="width:102mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
                     <span class="styBoldText" style="font-size:8pt;">Nonpassive lncome and Loss</span>
                         </div>
                      <div class="styGenericDiv" style="height:0mm;width:3.2mm;float:right;">
                     <!-- button display logic -->
                                    <xsl:call-template name="SetDynamicTableToggleButton">
                                       <xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
                                       <xsl:with-param name="containerHeight" select="5"/>
                                       <xsl:with-param name="headerHeight" select="1"/>
                                       <xsl:with-param name="containerID" select=" 'partnerSorpTbl2Id'  "/>
                                    </xsl:call-template>
                      <!-- end button display logic -->
                      </div>
                  <!-- passive income and loss -->
                  <!-- double table start --> 
                  <!-- Generated Table (Start) -->
                  <div class="styTableContainer" style="width:187mm;height:0mm;"  id="partnerSorpTbl2Id">
                     <!-- print logic -->
                     <xsl:call-template name="SetInitialState"/>
                     <!-- end -->
                     <table class="styTable" style="float:none;clear:both;" cellspacing="0">
                        <thead class="styTableThead">
                           <tr>
                              <th class="styTableCellHeader" scope="col" style="width:5mm;border-right-width:1px;border-color: black;float:left;clear:none;">
                                  <span class="styTableCellPad"></span>
                              </th>
                              <th class="styTableCellHeader" scope="col" style="width:41.7mm;border-right-width:1px;border-color: black;float:left;clear:none;">
                                 <!-- uncomment and change table header literals here or use 'cellpad' -->
                                 <span style="font-weight:bold;">(f)</span>
                                 <span class="styNormalText">
                                 Passive loss allowed<br />
                                    (attach <b>Form 8582</b> if required)
                                 </span>
                              </th>
                              <th class="styTableCellHeader" scope="col" style="width:31.5mm;border-right-width:2px;border-color: black;float:left;clear:none;">
                                 <span style="font-weight:bold;">(g)</span>
                                 <span class="styNormalText">
                                 Passive income<br />
                                    from <b>Schedule K-1 </b>               
                                 </span>
                              </th>
                              <th class="styTableCellHeader" scope="col" style="width:31.9mm;border-right-width:1px;border-color: black;float:left;clear:none;">
                                 <span style="font-weight:bold;">(h)</span>
                                 <span class="styNormalText">
                                 Nonpassive loss<br />
                                    from <b>Schedule K-1</b>
                                 </span>
                              </th>
                              <th class="styTableCellHeader" scope="col" style="width:33.9mm;border-right-width:1px;border-color: black;float:left;clear:none;">
                                 <span style="font-weight:bold;">(i)</span>
                                 <span class="styNormalText">
                                 Section 179 expense
                                 deduction from <b>Form 4562</b>
                                 </span>
                              </th>
                              <th class="styTableCellHeader" scope="col" style="width:32mm;border-right-width:0px;border-color: black;float:left;clear:none;">
                                 <span style="font-weight:bold;">(j)</span>
                                 <span class="styNormalText">
                                 Nonpassive income
                                 from <b>Schedule K-1</b>
                                 </span>
                              </th>
                           </tr>
                        </thead>
                        <tbody>
                           <xsl:if test="($Print != $Separated) or (count($FormData/PartnershipOrSCorpGroup) &lt;= 4) "> 
                              <xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
                                 <tr>
                                    <!-- Column 1 -->
                                    <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;">
                                       <span class="styBoldText" style="padding-right:2mm;font-size:8pt;">
                                          <xsl:call-template name="AlphaPosition">
                                             <xsl:with-param name="Position" select="position()" />
                                          </xsl:call-template>
                                       </span>
                                       
                                    </td>
                                    <!-- Column 2 -->
                                    <td class="styTableCell" style="width:41.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                       <!-- Form to Form Link -->
                                       <xsl:call-template name="SetFormLinkInline">
                                          <xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt" />
                                       </xsl:call-template>
                                       <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPassiveLossAllowedAmt</xsl:with-param>
                                       </xsl:call-template>
                                    </td>
                                    <!-- Column 3 -->
                                    <td class="styTableCell" style="width:31.5mm;height:4mm;float:left;clear:none;border-right-width:2px;border-color: black;font-size:7pt;">
                                       <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="BusinessPassiveIncomeAmt" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupBusinessPassiveIncomeAmt</xsl:with-param>
                                       </xsl:call-template>
                                    </td>
                                    <!-- Column 4 -->
                                    <td class="styTableCell" style="width:31.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                       <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="NonpassiveLossAmt" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveLossAmt</xsl:with-param>
                                       </xsl:call-template>
                                    </td>
                                    <!-- Column 5 -->
                                    <td class="styTableCell" style="width:33.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                       <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="Sect179ExpenseDeductionAmt" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupSect179ExpenseDeductionAmt</xsl:with-param>
                                       </xsl:call-template>
                                    </td>
                                    <!-- Column 6 -->
                                    <td class="styTableCell" style="width:32mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;font-size:7pt;">
                                       <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="NonpassiveIncomeAmt" />
                                          <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveIncomeAmt</xsl:with-param>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </xsl:if>
                           <!-- Table Filler Rows -->
                           <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 1 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                              <tr>
                                 <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styBoldText" style="font-size:8pt;padding-right:2mm;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="1" />
                                       </xsl:call-template>
                                    </span>
                                     
                                 </td>
                                 <td class="styTableCell" style="width:41.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:left;" > 
                                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                       <xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>                      
                                    </xsl:call-template>
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:33.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:32mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 2 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                              <tr>
                                 <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styBoldText" style="padding-right:2mm;font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="2" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                                 <td class="styTableCell" style="width:41.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:33.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:32mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 3 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                              <tr>
                                 <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styBoldText" style="padding-right:2mm;font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="3" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                                 <td class="styTableCell" style="width:41.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:33.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:32mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="count($FormData/PartnershipOrSCorpGroup) &lt; 4 or ((count($FormData/PartnershipOrSCorpGroup) &gt; 4) and ($Print = $Separated))">
                              <tr>
                                 <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styBoldText" style="padding-right:2mm;font-size:8pt;padding-right:2mm;">
                                       <xsl:call-template name="AlphaPosition">
                                          <!-- row A -->
                                          <xsl:with-param name="Position" select="4" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                                 <td class="styTableCell" style="width:41.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:31.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:33.9mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                                 <td class="styTableCell" style="width:32mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                    <span class="styTableCellPad"></span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <!-- End of filler rows -->
                        </tbody>
                     </table>
                  </div>
                   
                  <!-- Set Initial Height of Above Table -->
                  <xsl:call-template name="SetInitialDynamicTableHeight">
                     <xsl:with-param name="TargetNode" select="$FormData/PartnershipOrSCorpGroup"/>
                     <xsl:with-param name="containerHeight" select="5"/>
                       <xsl:with-param name="headerHeight" select="1"/>
                     <xsl:with-param name="containerID" select=" 'partnerSorpTbl2Id' "/>
                  </xsl:call-template>
                  <!-- double table end --> 
               <!-- end line 28 -->
               <!-- line 29 -->
                  <div style="width:187mm;border-right-width:0px;">
                  <div style="float:left;clear:none;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">29a</div>
                     <div style="width:11mm;padding-top:.5mm;float:left;clear:none;">Totals</div>
                     <div class="styShadingCell" style="width:29mm;border-bottom-width:1px;height:5mm;"></div>
                     <!-- Column 29a (g) total -->
                     <div class="styLNAmountBox" style="width:32.6mm;height:5mm;font-size:7pt;border-right-width:1px;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalPassiveIncomeAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalPassiveIncomeAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                         <div style="float:left;clear:none;">
                          <div class="styShadingCell" style="width:30mm;border-bottom-width:1px;height:5mm;font-size:7pt;border-right-width:0px;"></div>       
                     <div class="styShadingCell" style="width:37.6mm;border-bottom-width:1px;height:5mm;font-size:7pt;border-left-width:0px;"></div>                     
                     <div class="styLNAmountBox" style="width:37.4mm;height:5mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/BusTotalNonpassiveIncomeAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleEBusTotalNonpassiveIncomeAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                 </div>
             
                 
                     <div class="styLNLeftNumBox" style="padding-left:4.25mm;">b</div>
                     <div style="width:11mm;padding-top:.5mm;float:left;clear:none;">Totals</div>
                     <!-- Column 29b (f) total -->
                     <div class="styLNAmountBox" style="font-size:7pt;width:29mm;height:4.5mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalPassiveLossAllowedAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalPassiveLossAllowedAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                     <div class="styShadingCell" style="height:4.5mm;width:32.6mm;border-bottom-width:1px;"></div>
                     <div class="styLNAmountBox" style="width:33.1mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalNonpassiveLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalNonpassiveLossAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                     <div class="styLNAmountBox" style="width:34.5mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotSect179ExpenseDeductionAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotSect179ExpenseDeductionAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                     <div class="styShadingCell" style="height:4.5mm;width:37.4mm;border-bottom-width:1px;"></div>
                  </div>
           </div>
            
            
                 </div>
               <!-- End line 29 -->
               <!-- line 30 -->
               <div style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">30</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                        Add columns (g) and (j) of line 29a
                        </span>
                        <span class="styDotLn" style="clear:none;padding-left:4mm;">.......................</span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="width:6mm;">
                     30
                     </div>
                     <div class="styLNAmountBox" style="padding-right:1mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalPrtshpSCorpIncomeAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalPrtshpSCorpIncomeAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  </div>
               </div>  
               <!-- line 31 -->
               <div style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">31</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                        Add columns (f), (h), and (i) of line 29b
                        </span>
                        <span class="styDotLn" style="clear:none;padding-left:2.75mm;">......................</span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="width:6mm;">
                     31
                     </div>
                     <div class="styLNAmountBox" style="text-align:right;font-size:6.5pt;">
                        <xsl:call-template name="PopulateNegativeNumber">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalPrtshpSCorpLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalPrtshpSCorpLossAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  </div>
               </div>  
               <!-- end line 31 -->
               <!-- line 32 -->
               <div class="styBB" style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">32</div>
                     <div class="styLnDesc" style="width:141mm;" >
                        <span style="float:left;clear:none;">
                           <span class="styBoldText" style="float:none;clear:none;">Total partnership and S corporation income or (loss).</span> Combine lines 30 and 31. Enter the
                           result here and include in the total on line 41 below
                           <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......................</span>
                        </span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="border-bottom-width:0px;width:6mm;height:8mm;padding-top:4mm;">
                     32
                     </div>
                     <div class="styLNAmountBox" style="border-bottom-width:0px;padding-right:1mm;height:8mm;padding-top:4mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/NetPrtshpSCorpIncomeOrLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleENetPrtshpSCorpIncomeOrLossAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  </div>
               </div>  
               <!-- end line 32 -->
               <!-- Start Part III -->
               <!-- line 33 -->
               <div class="styBB" style="width:187mm;float:left:clear:none;" >
                  <div class="styPartName" style="width:15mm;">Part lll</div>
                  <div class="styPartDesc" style="padding-left:3mm;width:86mm;">
                  lncome or Loss From Estates and Trusts 
                  </div>
                  <div class="styGenericDiv" style="width:3.2mm;float:right;border-color: black;">
                                 <!-- button display logic -->
                                 <xsl:call-template name="SetDynamicTableToggleButton">
                                    <xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
                                    <xsl:with-param name="containerHeight" select="2"/>
                                    <xsl:with-param name="headerHeight" select="1"/>
                                    <xsl:with-param name="containerID" select=" 'EAndTIncomeId'  "/>
                                 </xsl:call-template>
                                 <!-- end button display logic -->
                              </div>             
               </div>
               <!-- End Part III (title line) --> 
    <div class="styLine33TableContainer" style="width:187mm;height:0mm;" id="EAndTIncomeId">
                  <!-- print logic -->
                  <xsl:call-template name="SetInitialState"/>
                  <!-- end -->
                  <table class="styTable" style="float:none;clear:both;" cellspacing="0">
                     <thead class="styTableThead">
                        <tr>
              <th class="styTableCellHeader" scope="col" style="width:5mm;float:left;clear:none;border-right-width:0px;border-color: black;">
                              <span class="styBoldText" style="font-size:7pt;">33</span>
                           </th>
                <th class="styTableCellHeader" scope="col" style="width:139.7mm;float:left;clear:none;border-right-width:1px;border-color: black;">
                              <!-- uncomment and change table header literals here or use 'cellpad' -->
                              <span style="font-weight:bold;">(a)</span>
                              <span class="styNormalText">
                              Name
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                  <th class="styTableCellHeader" scope="col" style="width:39.4mm;border-right-width:0px;border-color: black;float:left;clear:none;">
                              <div class="styGenericDiv" style="width:35.5mm;">
                                 <span style="font-weight:bold;">(b)</span>
                                 <span class="styNormalText">
                                 Employer<br />
                                    identification number
                                 </span>
                              </div>
                              
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:if test="($Print != $Separated) or (count($FormData/EstateAndTrustGroup) &lt;= 3) "> 
                           <xsl:for-each select="$FormData/EstateAndTrustGroup">
                              <tr>
                                 <!-- Column 1 -->
                                 <td class="styTableCell" style="width:3.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;">
                                    <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <xsl:with-param name="Position" select="position()" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                                 <!-- Column 2 -->
  <td class="styTableCell" style="width:139.7mm;height:4mm;text-align:left;border-right-width:1px;border-color: black;float:left;clear:none;font-size:7pt;">
                                    <xsl:call-template name="PopulateText">
                                       <xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine1" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustNameBusinessNameLine1</xsl:with-param>
                                    </xsl:call-template>
                                    <br/>
                                     <xsl:call-template name="PopulateText">
                                       <xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine2" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustNameBusinessNameLine2</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                                 <!-- Column 3 -->
<td class="styTableCell" style="width:39.4mm;height:4mm;text-align:center;border-right-width:0px;border-color: black;float:left;clear:none;font-size:7pt;">
                                    <xsl:call-template name="PopulateText">
                                       <xsl:with-param name="TargetNode" select="EstateOrTrustEIN" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustEIN</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </xsl:if>
                        <!-- Table Filler Rows -->
                        <xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 1 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:3.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="1" />
                                    </xsl:call-template>
                                 </span>
                              </td>
                              <td class="styTableCell" style="width:139.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:left;" > 
                                 <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                    <xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>                      
                                 </xsl:call-template>
                                   <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:39.4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 2 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:3.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="2" />
                                    </xsl:call-template>
                                 </span>
                              </td>
                              <td class="styTableCell" style="width:139.7mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:39.4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                           </tr>
                        </xsl:if>
                        <!-- End of filler rows -->
                     </tbody>
                  </table>
               </div>
               <!-- Set Initial Height of Above Table -->
               <xsl:call-template name="SetInitialDynamicTableHeight">
                            <xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
                            <xsl:with-param name="containerHeight" select="2"/>
                             <xsl:with-param name="headerHeight" select="1"/>
                            <xsl:with-param name="containerID" select=" 'EAndTIncomeId' "/>
                          </xsl:call-template>
               <!-- Generated Table (End) -->
               <!-- end line33 -->
               <!-- d33tbl --> 
               <!-- Generated Table (Start) -->
               <!--Line 33 passive-->
               <div class="styBB" style="width:187mm;border-bottom-width: 1px;">
               <div class="styFNBox" style="width:4.5mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
                     <span class="styBoldText" style="font-size:8pt;"></span>
                  </div>
                  <div class="styFNBox" style="width:98.1mm;text-align:center;border-right-width:2px;height:4mm;border-bottom-width:1px;">
                     <span class="styBoldText" style="font-size:8pt;">Passive lncome and Loss</span>
                  </div>
                  <div class="styFNBox" style="width:80mm;text-align:center;border-right-width:0px;height:4mm;border-bottom-width:1px;">
                     <span class="styBoldText" style="font-size:8pt;">Nonpassive lncome and Loss</span>
                   
                         </div>
                   <div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;border-color: black;border-bottom-width: 1px;">
                                 <!-- button display logic -->
                                 <xsl:call-template name="SetDynamicTableToggleButton">
                                    <xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
                                    <xsl:with-param name="containerHeight" select="3"/>
                                    <xsl:with-param name="headerHeight" select="1"/>
                                    <xsl:with-param name="containerID" select=" 'estateTrustId'  "/>
                                 </xsl:call-template>
                                 <!-- end button display logic -->
                              </div>                              
 <div class="styTableContainer" style="width:187mm;"  id="estateTrustId">
                  <!-- print logic -->
                  <xsl:call-template name="SetInitialState"/>
                  <!-- end -->
      <table class="styTable" style="" cellspacing="0">
                     <thead class="styTableThead">
                        <tr>
  <th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:5mm;border-right-width:1px;border-color: black;">
              <span class="styTableCellPad"></span>
       </th>
<th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:50.6mm;border-right-width:1px;border-color: black;">
                              <span style="font-weight:bold;">(c)</span>
                              <span class="styNormalText">
                              Passive deduction or loss allowed<br />
                                 (attach <b>Form 8582</b> if required)
                              </span>
                           </th>
     <th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:44.5mm;border-right-width:2px;border-color: black;">
                              <span style="font-weight:bold;">(d)</span>
                              <span class="styNormalText">
                              Passive income<br />
                                 from <b>Schedule K-1</b>
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                      <th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:37.2mm;border-right-width:1px;border-color: black;">
                              <span style="font-weight:bold;">(e)</span>
                              <span class="styNormalText">
                              Deduction or loss<br />
                                 from <b>Schedule K-1</b>
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                   <th class="styTableCellHeader" scope="col" style="float:left;clear:none;width:40.6mm;border-right-width:0px;border-color: black;">
                                 <span style="font-weight:bold;">(f)</span>
                                 <span class="styNormalText">
                                 Other income from<br />
                                    <b>Schedule K-1</b>
                                 </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                        </tr>         
                     </thead>
                     <tbody>
                        <xsl:if test="($Print != $Separated) or (count($FormData/EstateAndTrustGroup) &lt;= 3) "> 
                           <xsl:for-each select="$FormData/EstateAndTrustGroup">
                              <tr>
                                 <!-- Column 1 -->
         <td class="styTableCell" style="width:5mm;height:4mm;border-right-width:1px;border-color: black;float:left;clear:none;">
                                    <span class="styBoldText" style="font-size:8pt;padding-right:2mm;">
                                       <xsl:call-template name="AlphaPosition">
                                          <xsl:with-param name="Position" select="position()" />
                                       </xsl:call-template>
                                    </span>
                                 </td>
                                 <!-- Column 2 -->
                        <td class="styTableCell" style="width:50.6mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                    <!-- Form to Form Link -->
                                    <xsl:call-template name="SetFormLinkInline">
                                       <xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt" />
                                    </xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                       <xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupPassiveDedOrLossAllowedAmt</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                                 <!-- Column 3 -->
                         <td class="styTableCell" style="width:44.5mm;height:4mm;float:left;clear:none;border-right-width:2px;border-color: black;font-size:7pt;">
                                    <xsl:call-template name="PopulateAmount">
                                       <xsl:with-param name="TargetNode" select="EstateAndTrustPassiveIncomeAmt" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateAndTrustPassiveIncomeAmt</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                                 <!-- Column 4 -->
                        <td class="styTableCell" style="width:37.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;font-size:7pt;">
                                    <xsl:call-template name="PopulateAmount">
                                       <xsl:with-param name="TargetNode" select="DeductionOrLossAmt" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupDeductionOrLossAmt</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                                 <!-- Column 5 -->
                                 <td class="styTableCell" style="width:40.6mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;font-size:7pt;">
                                    <xsl:call-template name="PopulateAmount">
                                       <xsl:with-param name="TargetNode" select="OtherIncomeAmt" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupOtherIncomeAmt</xsl:with-param>
                                    </xsl:call-template>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </xsl:if>
                        <!-- Table Filler Rows -->
                        <xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 1 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;padding-right:2mm;">
                                    <xsl:call-template name="AlphaPosition">
                                       <!-- row A -->
                                       <xsl:with-param name="Position" select="1" />
                                    </xsl:call-template>
                                 </span>
                              </td>
                              <td class="styTableCell" style="width:50.6mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:left" > 
                                 <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                    <xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>                      
                                 </xsl:call-template>
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:44.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:37.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:44mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="count($FormData/EstateAndTrustGroup) &lt; 2 or ((count($FormData/EstateAndTrustGroup) &gt; 3) and ($Print = $Separated))">
                           <tr>
                              <td class="styTableCell" style="width:5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;padding-right:2mm;">
                                    <xsl:call-template name="AlphaPosition">
                                       <!-- row A -->
                                       <xsl:with-param name="Position" select="2" />
                                    </xsl:call-template>
                                 </span>
                              </td>
                              <td class="styTableCell" style="width:50.6mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:44.5mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:37.2mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:40.6mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                           </tr>
                        </xsl:if>
                        <!-- End of filler rows -->
                     </tbody>
                  </table>
               </div>
               <!-- Set Initial Height of Above Table -->
               <xsl:call-template name="SetInitialDynamicTableHeight">
     <xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustGroup"/>
     <xsl:with-param name="containerHeight" select="3"/>
      <xsl:with-param name="headerHeight" select="1"/>
     <xsl:with-param name="containerID" select=" 'estateTrustId' "/>
   </xsl:call-template>
               <!-- Generated Table (End) -->
               <!-- end d33tbl --> 
               <!--Line 34a-->
             
                  <!-- part iii table (left) -->
                    <!-- Totals (left) -->
                  <div class="styFNBox" style="width:187mm;border-right-width:0px;">
                     <div style="float:left;clear:none;">
                        <div class="styLNLeftNumBox" style="padding-left:0mm;width:5mm;padding-top:.5mm;padding-left:1mm;">34a</div>
                        <div style="width:13mm;float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
                        Totals
                        </div>
                        <!-- greyed box -->
                        <div class="styShadingCell" style="height:4.5mm;width:38mm;border-bottom-width:1px;"></div>
                        <!-- Column 34a (d) total -->
                        <div class="styLNAmountBox" style="width:45.7mm;border-right-width:1px;">
                           <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/EstateAndTrustTotPssvIncmAmt" />
                              <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustTotPssvIncmAmt</xsl:with-param>
                           </xsl:call-template>
                        </div>
                        <div style="float:left;clear:none;">
                           <!-- greyed box -->
                           <div class="styShadingCell" style="height:4.5mm;width:37.9mm;border-bottom-width:1px;border-left-width:0px;"></div>
                           <!-- Column 34a (f) total -->
                           <div class="styLNAmountBox" style="width:46mm;">
                              <xsl:call-template name="PopulateAmount">
                                 <xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt" />
                                 <xsl:with-param name="BackupName">IRS1040ScheduleETotalOtherIncomeAmt</xsl:with-param>
                              </xsl:call-template>
                           </div>
                        </div>
           
                     <div style="width:187mm;float:left;clear:none;">
                        <div class="styLNLeftNumBox" style="padding-left:0mm;width:5mm;padding-top:.5mm;padding-left:4.5mm;">b</div>
                        <div style="width:12.75mm;float:left;clear:none;padding-top:.5mm;padding-left:2mm;">
                        Totals
                        </div>
                        <!-- Column 34b (c) total -->
                        <div class="styLNAmountBox" style="width:38mm;">
                           <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="$FormData/TotPassiveDedOrLossAllowedAmt" />
                              <xsl:with-param name="BackupName">IRS1040ScheduleETotPassiveDedOrLossAllowedAmt</xsl:with-param>
                           </xsl:call-template>
                        </div>
                        <!-- greyed box -->
                           <div style="float:left;clear:none;">
                        <div class="styShadingCell" style="height:4.5mm;width:45.7mm;border-bottom-width:1px;border-right-width:1px;"></div>
                     
                      <!-- Column 34b (e) total -->
                      
                           <div class="styLNAmountBox" style="width:37.9mm;border-left-width:0px;">
                              <xsl:call-template name="PopulateAmount">
                                 <xsl:with-param name="TargetNode" select="$FormData/TotalDeductionOrLossAmt" />
                                 <xsl:with-param name="BackupName">IRS1040ScheduleETotalDeductionOrLossAmt</xsl:with-param>
                              </xsl:call-template>
                          </div>
                           <!-- greyed box -->
                           <div class="styShadingCell" style="height:4.5mm;width:46mm;border-bottom-width:1px;"></div>
                        </div>
                       
                         </div>
                     <!-- end Totals (left) -->
                  </div>
                  
               </div>
               <!-- line 35 -->
               <div style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">35</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                        Add columns (d) and (f) of line 34a
                        </span>
                        <span class="styDotLn" style="clear:none;padding-left:4mm;">.......................</span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="width:6mm;">
                     35
                     </div>
                     <div class="styLNAmountBox" style="padding-right:1mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalEstateOrTrustIncomeAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalEstateOrTrustIncomeAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  </div>
               </div>  
               <!-- end line 35 -->
               <!-- line 36 -->
               <div style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">36</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                        Add columns (c) and (e) of line 34b
                        </span>
                        <span class="styDotLn" style="clear:none;padding-left:3.25mm;">.......................</span>
                     </div>
                  </div>
                     <div class="styLNRightNumBox" style="width:6mm;height:5mm;">
                     36
                     </div>
                     <div class="styLNAmountBox" style="padding-right:1mm;font-size:6.5pt;height:5mm;text-align:right;">
                        <xsl:call-template name="PopulateNegativeNumber">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalEstateOrTrustLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalEstateOrTrustLossAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
               </div>  
               <!-- end line 36 -->
               <!-- line 37 -->
               <div style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">37</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                           <span class="styBoldText">Total estate and trust income or (loss).</span> Combine lines 35 and 36. Enter the result here and
                           include in the total on line 41 below
					    <xsl:call-template name="LinkToLeftoverDataTableInline">
                               <xsl:with-param name="Desc">Part III, Line 37 Schedule K1 ES Payment Literal </xsl:with-param>
                                <xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsLiteralCd"/>
                                 </xsl:call-template> 
                                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                               <xsl:with-param name="Desc">Part III, Line 37 Schedule K1 ES Payment Amount</xsl:with-param>
                                <xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsAmt"/>
                                 </xsl:call-template> 
                           <span class="styDotLn" style="float:none;clear:none;padding-left:4.75mm;">.................</span>
                        </span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="height:8mm;width:6mm;padding-top:4mm;border-bottom-width:0px;">
                     37
                     </div>
                     <div class="styLNAmountBox" style="height:8mm;padding-right:1mm;padding-top:4mm;border-bottom-width:0px;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotEstateAndTrustIncOrLossAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  </div>
               </div>  
               </div>
               <!-- end line 37 -->
               <!-- Start Part IV --> 
               <div class="styBB" style="width:187mm;border-top-width:1px;" >
                  <div class="styPartName" style="width:15mm;font-family:seif;">Part lV</div>
                  <div class="styPartDesc" style="padding-left:3mm;width:160mm;">
                  lncome or Loss From Real Estate Mortgage Investment Conduits (REMICs)&#151;Residual Holder 
                    </div>
              <div class="styGenericDiv" style="width:3.2mm;float:right;border-color: black;">
                                 <!-- button display logic -->
                                 <xsl:call-template name="SetDynamicTableToggleButton">
                                    <xsl:with-param name="TargetNode" select="$FormData/REMICGroup"/>
                                    <xsl:with-param name="containerHeight" select="1"/>
                                    <xsl:with-param name="headerHeight" select="1"/>
                                    <xsl:with-param name="containerID" select=" 'IncomeId'  "/>
                                 </xsl:call-template>
                                 <!-- end button display logic -->
                                  </div>
                              </div>                        
               <!-- Line 38 (all headers) -->
               <div class="styTableContainer " style="width:187mm;" id="IncomeId">
                  <!-- print logic -->
                   <xsl:call-template name="SetInitialState"/>
                  <!-- end -->
                  <table class="styTable" cellspacing="0">
                     <thead class="styTableThead">
                        <tr>
                        <th class="styTableCellHeader"  colspan="1" rowspan="2" style="width:3.4mm;border-right-width:0px;border-color: black;height:4mm;">
                                 <div class="styGenericDiv" style="width:3.2mm;height:4mm;float:right;clear:none;font-size:7pt">38
                                 </div>
                                 </th>
                        <th class="styTableCellHeader" colspan="1" rowspan="2" style="width:64mm;border-right-width:1px;border-color: black;">
                           <b> (a)</b> <span style="font-weight:normal;"> Name</span>
                           </th>
                           <th class="styTableCellHeader" colspan="1" rowspan="2" style="width:23mm;border-right-width:1px;border-color: black;">
                            <b> (b) </b><span style="font-weight:normal;">Employer identification number</span>
                           </th>
                           <th class="styTableCellHeader"  colspan="1" rowspan="2" style="width:30mm;border-right-width:1px;border-color: black;font-weight:normal;">
                              <div style="height:10mm;width:31mm;padding-top:2mm;font-weight:normal;">
                             <b>(c) </b>Excess inclusion from <b>Schedules Q,</b> line 2c <br/> (see page E-8)
                               </div>
                           </th>
                           <th class="styTableCellHeader"  colspan="1" rowspan="2" style="width:37mm;border-right-width:1px;border-color: black;">
                              <span style="font-weight:bold;"><b>(d)</b></span>
                              <span class="styNormalText">
                              Taxable income (net loss) from <b>Schedules Q,</b> line 1b
                              </span>
                              <!-- span class="styTableCellPad"></span -->
                           </th>
                           <th class="styTableCellHeader"  colspan="1" rowspan="2" style="width:6mm;border-right-width:0px;border-color: black;border-bottom-width:1px;">
                              <span class="styTableCellPad"></span>
                           </th>
                           <th class="styTableCellHeader"  colspan="1" rowspan="2" style="width:30mm;border-right-width:0px;border-color: black;">
                              <!-- uncomment and change table header literals here or use 'cellpad' -->
                              <span style="font-weight:bold;"><b>(e)</b></span>
                              <span class="styNormalText"> lncome from <b>Schedules Q,</b> line 3b
                              </span>
                           </th>
                        </tr>         
                        </thead>
                        <tbody>
						<xsl:if test="($Print != $Separated) or (count($FormData/REMICGroup) &lt;3) "> 
                           <xsl:for-each select="$FormData/REMICGroup">
                              <tr>
                         <td class="styTableCell" style="width:3.4mm;height:4mm;border-bottom-width:1px;border-color: black;border-right-width:0px;">
                                       <span class="styTableCellPad"></span>
                                 </td>
                          <td class="styTableCell" style="text-align:left;width:64mm;height:4mm;border-right-width:1px;border-color: black;font-size:7pt;">
                                    <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine1" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
                     </xsl:call-template>
                     <br/>
                     <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine2" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
                     </xsl:call-template>
                                 </td>
                   <td class="styTableCell" style="width:23mm;height:4mm;text-align:center;border-right-width:1px;border-color: black;font-size:7pt;">
                                   <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="REMICEIN" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICEIN</xsl:with-param>
                     </xsl:call-template>
                                 </td>
                     <td class="styTableCell" style="width:30mm;height:4mm;text-align:right;border-right-width:1px;border-color: black;font-size:7pt;">
                                     <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExcessInclusionAmt" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupExcessInclusionAmt</xsl:with-param>
                     </xsl:call-template>
                                 </td>
                     <td class="styTableCell" style="width:37mm;height:4mm;text-align:right;border-right-width:1px;border-color: black;font-size:7pt;">
                                    <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TaxableIncomeOrNetLossAmt" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupTaxableIncomeOrNetLossAmt</xsl:with-param>
                     </xsl:call-template>
                                 </td>
                       <td class="styShadingCellRB " style="width:6mm;height:4.2mm;border-color: black;border-left-width:0px; border-bottom-width: 1px;border-style: solid;">
                             <span class="styTableCellPad"></span>
                                 </td>
                      <td class="styTableCell" style="width:30mm;height:4mm;text-align:right;border-right-width:0px;border-color: black;font-size:7pt;">
                                     <xsl:call-template name="PopulateAmount">
                                   <xsl:with-param name="TargetNode" select="REMICIncomeAmt" />
                                 <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICIncomeAmt</xsl:with-param>
                     </xsl:call-template>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </xsl:if>	
                        <!-- Table Filler Rows -->
                        <xsl:if test="count($FormData/REMICGroup) &lt; 1 or ((count($FormData/REMICGroup) &gt; 4) and ($Print = $Separated))">	
                        <tr>
                              <td class="styTableCell" style="width:3.4mm;height:4mm;float:left;clear:none;border-right-width:0px;border-color: black;" > 
                              <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:64mm;height:4mm;float:left;clear:none;border-right-width:1px;border-color: black;text-align:left;" > 
                                 <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                    <xsl:with-param name="TargetNode" select="$FormData/REMICGroup"/>                      
                                 </xsl:call-template>
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:18mm;height:4mm;text-align:right;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:30mm;height:4mm;text-align:right;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                              <td class="styTableCell" style="width:37mm;height:4mm;text-align:right;border-right-width:1px;border-color: black;" > 
                                 <span class="styTableCellPad"></span>
                              </td>
                           <td class="styShadingCellRB" style="width:6mm;height:4mm;border-color: black;border-left-width:0px;border-bottom-width:1px;border-style: solid;">
                                      <span class="styTableCellPad"></span>
                                 </td>
                              <td class="styTableCell" style="width:30mm;height:4mm;text-align:right;border-right-width:0px;border-color: black;" > 
                                  <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;"> 
                                     <span class="styTableCellPad"></span>
                                 </span>
                              </td>
                           </tr>
                        		  </xsl:if>		
								
                        </tbody>
                  </table>
                       </div>    
               <!-- End Line 38 (data) -->
                <!-- Set Initial Height of Above Table -->
               <xsl:call-template name="SetInitialDynamicTableHeight">
     <xsl:with-param name="TargetNode" select="$FormData/REMICGroup"/>
     <xsl:with-param name="containerHeight" select="1"/>
      <xsl:with-param name="headerHeight" select="1"/>
     <xsl:with-param name="containerID" select=" 'IncomeId' "/>
   </xsl:call-template>
               <!-- Generated Table (End) -->
               <!-- line 39 -->
               <div class="styBB" style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">39</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                        Combine columns (d) and (e) only. Enter the result here and include in the total on line 41 below
                        </span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="width:6mm;border-bottom-width:0px;">
                     39
                     </div>
                     <div class="styLNAmountBox" style="padding-right:1mm;border-bottom-width:0px;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalREMICIncomeAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalREMICIncomeAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  </div>
               </div>  
               <!-- end line 39 -->
               <!-- Start Part V --> 
               <div style="width:187mm;" class="styBB">
                  <div class="styPartName" style="width:15mm;">Part V</div>
                  <div class="styPartDesc" style="padding-left:3mm;">
                  Summary 
                  </div>
               </div>
               <!-- line 40 -->
               <div style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">40</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                        Net farm rental income or (loss) from <span class="styBoldText">Form 4835</span>. Also, complete line 42 below
                        </span>
                        <span class="styDotLn" style="clear:none;padding-left:2mm;">.........</span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="width:6mm;">
                     40
                     </div>
                     <div class="styLNAmountBox" style="padding-right:1mm;">
                        <!--<xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/NetFarmRentalIncomeOrLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleENetFarmRentalIncomeOrLossAmt</xsl:with-param>
                        </xsl:call-template>-->
                     </div>
                  </div>
               </div>  
               <!-- end line 40 -->
               <!-- line 41 -->
               <div style="width:187mm;">
                  <div style="float:left;width:149mm;">
                     <div class="styLNLeftNumBox" style="padding-left:1mm;">41</div>
                     <div style="width:141mm;" class="styLnDesc">
                        <span style="float:left;clear:none;">
                           <span class="styBoldText">Total income or (loss).</span> Combine lines 26, 32, 37, 39, and 40. Enter the result here and on Form 1040,<br />
                           line 17, or Form 1040NR, line 18
                           <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image" />
                           <span class="styDotLn" style="padding-left:2.25mm;float:none;clear:none;">.......................</span>
                        </span>
                     </div>
                  </div>
                  <div style="float:right;">
                     <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;width:6mm;">
                     41
                     </div>
                     <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;padding-right:1mm;">
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$FormData/TotalSuppIncomeOrLossAmt" />
                           <xsl:with-param name="BackupName">IRS1040ScheduleETotalSuppIncomeOrLossAmt</xsl:with-param>
                        </xsl:call-template>
                     </div>
                  </div>
               </div>  
               <!-- end line 41 -->
                  <!-- line 42 -->
               <div style="width:187mm;">
                        <div class="styLNLeftNumBox" style="padding-left:1mm;">42</div>
                     <div style="width:99mm;float:left;clear:none;">
                           <span class="styBoldText">Reconciliation of farming and fishing income.</span> Enter your <span class="styBoldText">gross </span>farming
                           and fishing income reported on Form 4835, line 7; Schedule K-1 (Form
                           1065), box 14, code B; Schedule K-1 (Form 1120S), box 17, code U; and
                           Schedule K-1 (Form 1041), line 14, code F (see page E-8)                        
                           <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">....</span>
                        </div>
                        <div class="styShadingCell" style="height:8mm;width:41.75mm;border-top-width:0px;">
                        </div>
                         <div class="styShadingCell" style="height:8mm;width:38mm;border-top-width:0px;">
                        </div>
                  <div class="styLNRightNumBox" style="width:6mm;height:5mm;">
                           42
                           </div>
                            <div class="styLNAmountBox" style="width:35.75mm;padding-right:0mm;height:5mm;">
                              <xsl:call-template name="PopulateAmount">
                                 <xsl:with-param name="TargetNode" select="$FormData/FarmingAndFishingIncomeAmt" />
                                 <xsl:with-param name="BackupName">IRS1040ScheduleEFarmingAndFishingIncomeAmt</xsl:with-param>
                              </xsl:call-template>
                           </div>
                            <div class="styShadingCell" style="height:5mm;width:38mm;border-top-width:0px;">
                        </div>
                             </div>
                     <!-- end line 42 -->
                     <!-- line 43 -->
                        <div class="styBB" style="width:187mm;">
                        <div class="styLNLeftNumBox" style="padding-left:1mm;">43</div>
                        <div style="width:99mm;" class="styLnDesc">
                           <span class="styBoldText">Reconciliation for real estate professionals. </span>If you were a real estate
                           professional (see page E-2), enter the net income or (loss) you reported
                           anywhere on Form 1040 or Form 1040NR from all rental real estate activities
                           in which you materially participated under the passive activity loss rules
                           <span class="styDotLn" style="padding-left:4mm;float:none;clear:none;">...................</span>
                        </div>
                     <div class="styShadingCell" style="height:12mm;width:41.75mm;border-top-width:0px;">
                        </div>
                         <div class="styShadingCell" style="height:12mm;width:38mm;border-top-width:0px;">
                        </div>
                       <div class="styLNRightNumBox" style="width:6mm;border-bottom-width:0px;height:5mm;">
                           43
                           </div>
                           <div class="styLNAmountBox" style="width:35.75mm;padding-right:0mm;border-bottom-width:0px;">
                              <xsl:call-template name="PopulateAmount">
                                 <xsl:with-param name="TargetNode" select="$FormData/RecnclForREProfessionalsAmt" />
                                 <xsl:with-param name="BackupName">IRS1040ScheduleERecnclForREProfessionalsAmt</xsl:with-param>
                              </xsl:call-template>
                           </div>
                     <div class="styShadingCell" style="height:4.5mm;width:38mm;height:5mm;">
                     </div>
                  </div>
                   <!-- end line 43 -->
               <!-- last footer -->
               <div class="pageEnd" style="height:6mm;width:187mm;">
               <span class="stySmallText" style="width:141mm;text-align:center;padding-top:1mm;">
      <span style="width:156px"></span>
      </span>
      <div class="stySmallText" style="width:46mm;text-align:right;">
      <span class="styBoldText" style="font-weight:bold;font-size:7pt">Schedule E (Form 1040) 2010</span> 
      </div>
              </div>   
               <!-- end page 2 footer -->
      
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
                        <xsl:with-param name="TargetNode" select="$FormData"/>
                        <xsl:with-param name="DescWidth" select="100"/>
                    </xsl:call-template>
                    <xsl:call-template name="PopulateLeftoverRow">
                        <xsl:with-param name="Desc">Return Software ID</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareId"/>
                        <xsl:with-param name="DescWidth" select="100"/>
                    </xsl:call-template>
                    <xsl:call-template name="PopulateLeftoverRow">
                        <xsl:with-param name="Desc">Return Software Version</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareVersion"/>
                        <xsl:with-param name="DescWidth" select="100"/>
                    </xsl:call-template>
               <tr>
                        <td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
                                    <xsl:call-template name="PopulateLeftoverRow">
                                      <xsl:with-param name="Desc">Part I, Line - 26 - Total income or loss Literal</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityLiteralCd"/>
                                        <xsl:with-param name="BackupName">$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityLiteralCd</xsl:with-param>
                                    </xsl:call-template>
                            </td>
                              <td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
                                    <xsl:call-template name="PopulateLeftoverRowAmount">
                                      <xsl:with-param name="Desc">Part I, Line - 26 - Total income or loss amount</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityAmt"/>
                                        <xsl:with-param name="BackupName">$FormData/TotalIncomeOrLossAmt/@nonpassiveActivityAmt</xsl:with-param>
                                    </xsl:call-template>
                            </td> 
                        <td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
                                    <xsl:call-template name="PopulateLeftoverRow">
                                      <xsl:with-param name="Desc">Part III, Line - 37 - Schedule K1 ES Payment Literal</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsLiteralCd"/>
                                        <xsl:with-param name="BackupName">$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsLiteralCd</xsl:with-param>
                                    </xsl:call-template>
                            </td>
                                <td class="styLeftOverTableRowAmount" style="width:100mm;" scope="row">
                                    <xsl:call-template name="PopulateLeftoverRowAmount">
                                      <xsl:with-param name="Desc">Part III, Line - 37 - Schedule K1 ES Payment Amount</xsl:with-param>
                                        <xsl:with-param name="TargetNode" select="$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsAmt"/>
                                        <xsl:with-param name="BackupName">$FormData/TotEstateAndTrustIncOrLossAmt/@schK1ESPaymentsAmt</xsl:with-param>
                                    </xsl:call-template>
                            </td>
                        </tr>
                  
            </table>
        
               <!-- Begin Separated Repeating data table for PropertyRealEstAndRoyaltyGroup -->
               <xsl:if test="($Print = $Separated) and (count($FormData/PropertyRealEstAndRoyaltyGroup) &gt; 3)">
                  <span class="styRepeatingDataTitle">Form 1040 Schedule E, Part l, Line 1 - Income or Loss From Rental Real Estate and Royalities</span>
                  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                     <thead class="styTableThead">
                        <tr class="styDepTblHdr">
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:5.9mm;">
                              <span style="font-weight:bold;">1</span>
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:99mm;">
                           List the type and address of each <span class="styBoldText">rental real estate property</span>:
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:5.9mm;">
                              <span style="font-weight:bold;">2</span>
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:51mm;text-align:left;">
                           For each rental real estate property
                           listed on line 1, did you or your family
                           use it during the tax year for personal
                           purposes for more than the greater of:<br />
                           <img src="{$ImagePath}/1040SchE_Bullet_Round.gif" alt="Bullet Image" /> 14 days or<br />
                           <img src="{$ImagePath}/1040SchE_Bullet_Round.gif" alt="Bullet Image" /> 10% of t he total days rented at<br />
                           fair rental value?<br />
                           (See page E-3)
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:5.9mm;">
                              <span class="styTableCellPad" />
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:7mm;">
                              <span style="font-weight:bold;">Yes</span>
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:7.9mm;">
                              <span style="font-weight:bold;">No</span>
                           </th>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="$FormData/PropertyRealEstAndRoyaltyGroup">
                           <tr style="border-color:black;height:6mm;">
                              <xsl:attribute name="class">
                                 <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                                 </xsl:choose>
                              </xsl:attribute>
                              <td class="styTableCellText" style="width:5.9mm;">
                                 <span style="width:4mm;font-weight:bold;" class="styGenericDiv">
                                    <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                       <xsl:call-template name="AddPositionNumber" />
                                    </span>
                                 </span>
                                 <br/>
                              </td>
                              <td class="styTableCellText" style="width:99mm;">
                                 <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="PropertyType" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyType</xsl:with-param>
                                 </xsl:call-template>
                                 <xsl:call-template name="PopulateUSAddressTemplate">
                                    <xsl:with-param name="TargetNode" select="PropertyUSAddress" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyUSAddress</xsl:with-param>
                                 </xsl:call-template>     
                                 <xsl:call-template name="PopulateForeignAddressTemplate">
                                    <xsl:with-param name="TargetNode" select="PropertyForeignAddress" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPropertyForeignAddress</xsl:with-param>
                                 </xsl:call-template>   
                                                     <br/>               
                              </td>
                              <td class="styTableCellText" style="width:5.9mm;">
                                 <span class="styTableCellPad"></span>
                                     <br/>
                              </td>
                              <td class="styTableCellText" style="width:51mm;">
                                 <span class="styTableCellPad"></span>
                                     <br/>
                              </td>
                              <td class="styTableCellText" style="width:5.9mm;">
                                 <xsl:call-template name="AddPositionNumber" />
                                     <br/>
                              </td>
                              <td class="styTableCellText" style="width:7mm;">
                                <xsl:call-template name="PopulateYesBoxText">
                                    <xsl:with-param name="TargetNode" select="PersonalUseInd" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPersonalUseInd</xsl:with-param>
                                 </xsl:call-template>
                                     <br/>
                              </td>
                              <td class="styTableCellText" style="width:7.9mm;">
                                <xsl:call-template name="PopulateNoBoxText">
                                    <xsl:with-param name="TargetNode" select="PersonalUseInd" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupPersonalUseInd</xsl:with-param>
                                 </xsl:call-template>
                                     <br/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <!-- End Separated Repeating data table -->
               <!-- Begin Separated Repeating data table -->
               <xsl:if test="($Print = $Separated) and (count($FormData/PartnershipOrSCorpGroup) &gt; 4)">
                  <span class="styRepeatingDataTitle">Form 1040 Schedule E, Part II , Line 28 - Income or Loss From Partnership and S Corporations'</span>
                  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                     <thead class="styTableThead">
                        <tr class="styDepTblHdr">
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:3.5mm;">
                              <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                 <xsl:call-template name="AlphaPosition">
                                    <xsl:with-param name="Position" select="position()" />
                                 </xsl:call-template>
                              </span>
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:86.2mm;">
                              <span style="font-weight:bold;">(a)</span>
                              Name
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:19.7mm;">
                              <span style="font-weight:bold;">(b)</span>
                              Enter P for
                              partnership; S
                              for S corporation
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:17.5mm;">
                              <span style="font-weight:bold;">(c)</span>
                              Check if
                              foreign
                              partnership
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:32.5mm;">
                              <span style="font-weight:bold;">(d)</span>
                              Employer
                              identification
                              number
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:23.2mm;">
                              <span style="font-weight:bold;">(e)</span>
                              Check if
                              any amount is
                              not at risk
                           </th>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
                           <tr style="border-color:black;height:6mm;">
                              <xsl:attribute name="class">
                                 <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                                 </xsl:choose>
                              </xsl:attribute>
                              <td class="styDepTblCell" style="width:3.5mm;text-align:left">
                                 <span style="width:4mm;font-weight:bold;" class="styGenericDiv">
                                    <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <xsl:with-param name="Position" select="position()" />
                                       </xsl:call-template>
                                    </span>
                                 </span>
                              </td>
                              <td class="styDepTblCell" style="text-align:left;width:86.2mm;">
                                 <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="PartnershipOrSCorpName" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpName</xsl:with-param>
                                 </xsl:call-template>
                                 <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="PartnershipOrSCorpNameCd" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpNameCd</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:center;width:19.7mm;">
                                 <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="PartnershipSCorpCd" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipSCorpCd</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:center;width:17.5mm;">
                                 <!-- Checkbox -->
                                 <input type="Checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateCheckbox">
                                       <xsl:with-param name="TargetNode" select="ForeignPartnershipInd" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupForeignPartnershipInd</xsl:with-param>
                                    </xsl:call-template>                                  
                                 </input>
                              </td>
                              <td class="styDepTblCell" style="text-align:center;width:32.5mm;">
                                 <xsl:call-template name="PopulateEIN">
                                    <xsl:with-param name="TargetNode" select="PartnershipOrSCorpEIN" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPartnershipOrSCorpEIN</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:center;width:23.2mm;">
                                 <!-- Checkbox -->
                                 <input type="Checkbox" class="styCkbox">
                                    <xsl:call-template name="PopulateCheckbox">
                                       <xsl:with-param name="TargetNode" select="AnyAmountIsNotAtRiskInd" />
                                       <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupAnyAmountIsNotAtRiskInd</xsl:with-param>
                                    </xsl:call-template>
                                 </input>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <!-- End Separated Repeating data table -->
               <!-- Begin Separated Repeating data table -->
               <xsl:if test="($Print = $Separated) and (count($FormData/PartnershipOrSCorpGroup) &gt; 4)">
                  <span class="styRepeatingDataTitle">Form 1040 Schedule E, Part II, Line 28 - Passive Income and Loss</span>
                  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                     <thead class="styTableThead">
                        <tr class="styDepTblHdr">
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:3.4mm;">
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:41.9mm;">
                              <span style="font-weight:bold;">(f)</span>
                              Passive loss allowed<br />
                              (attach Form 8582 if required)
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:29.9mm;">
                              <span style="font-weight:bold;">(g)</span>
                              Passive income
                              from Schedule K-1
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:35.9mm;">
                              <span style="font-weight:bold;">(h)</span>
                              Nonpassive loss
                              from Schedule K-1
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:35.9mm;">
                              <span style="font-weight:bold;">(i)</span>
                              Section 179 expense
                              deduction from Form 4562
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:35.9mm;">
                              <span style="font-weight:bold;">(j)</span>
                              Nonpassive income
                              from Schedule K-1
                           </th>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="$FormData/PartnershipOrSCorpGroup">
                           <tr style="border-color:black;height:6mm;">
                              <xsl:attribute name="class">
                                 <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                                 </xsl:choose>
                              </xsl:attribute>
                              <td class="styDepTblCell" style="width:3.4mm;text-align:left;">
                                 <span style="width:4mm;font-weight:bold;" class="styGenericDiv">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="position()" />
                                    </xsl:call-template>
                                 </span>
                              </td>
                              <td class="styDepTblCell" style="width:41.9mm;text-align:right;">
                                 <!-- Form to Form Link -->
                                 <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt" />
                                 </xsl:call-template>
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="PassiveLossAllowedAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupPassiveLossAllowedAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:29.9mm;text-align:right;">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="BusinessPassiveIncomeAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupBusinessPassiveIncomeAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:35.9mm;text-align:right;">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="NonpassiveLossAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveLossAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:35.9mm;text-align:right;">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="Sect179ExpenseDeductionAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupSect179ExpenseDeductionAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:35.9mm;text-align:right;">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="NonpassiveIncomeAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEPartnershipOrSCorpGroupNonpassiveIncomeAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <!-- End Separated Repeating data table -->

               <!-- Begin Separated Repeating data table -->
               <xsl:if test="($Print = $Separated) and (count($FormData/EstateAndTrustGroup) &gt; 3)">
                  <span class="styRepeatingDataTitle">Form 1040 Schedule E, Part III, Line 33 - Income or Loss From Estates and Trusts</span>
                  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                     <thead class="styTableThead">
                        <tr class="styDepTblHdr">
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:3.5mm;">
                              <span class="styBoldText" style="font-size:7pt;">33</span>
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:139.7mm;">
                              <span style="font-weight:bold;">(a)</span>
                              Name
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:39.4mm;">
                              <span style="font-weight:bold;">(b)</span>
                              Employer<br />
                              identification number                                
                           </th>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="$FormData/EstateAndTrustGroup">
                           <tr style="border-color:black;height:6mm;">
                              <xsl:attribute name="class">
                                 <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                                 </xsl:choose>
                              </xsl:attribute>
                              <td class="styDepTblCell" style="width:3.5mm;">
                                 <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                    <xsl:call-template name="AlphaPosition">
                                       <xsl:with-param name="Position" select="position()" />
                                    </xsl:call-template>
                                 </span>
                              </td>
                              <td class="styDepTblCell" style="width:139.7mm;text-align:left;">
                                 <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine1" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustName</xsl:with-param>
                                 </xsl:call-template>
                                 <br/>
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="EstateOrTrustName/BusinessNameLine2" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustName</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:center;width:39.4mm;">
                                 <xsl:call-template name="PopulateEIN">
                                    <xsl:with-param name="TargetNode" select="EstateOrTrustEIN" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateOrTrustEIN</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <!-- End Separated Repeating data table -->
               <!-- Begin Separated Repeating data table -->
               <xsl:if test="($Print = $Separated) and (count($FormData/EstateAndTrustGroup) &gt; 3)">
         <span class="styRepeatingDataTitle">Form 1040 Schedule E, Part III, Line 33 - Passive Income and Loss/Nonpassive Income and Loss</span>
                 
                  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                     <thead class="styTableThead">
                        <tr class="styDepTblHdr">
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:3.5mm;">
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:52.3mm;">
                              <span style="font-weight:bold;">(c)</span>
                              Passive deduction or loss allowed
                              (attach Form 8582 if required)
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:46.7mm;">
                              <span style="font-weight:bold;">(d)</span>
                              Passive income
                              from Schedule K-1
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:39.1mm;">
                              <span style="font-weight:bold;">(e)</span>
                              Deduction or loss
                              from Schedule K-1
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:42.5mm;">
                              <span style="font-weight:bold;">(f)</span>
                              Other income from
                              Schedule K-1
                           </th>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="$FormData/EstateAndTrustGroup">
                           <tr style="border-color:black;height:6mm;">
                              <xsl:attribute name="class">
                                 <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                                 </xsl:choose>
                              </xsl:attribute>
                              <td class="styDepTblCell" style="width:3.5mm;">
                                 <xsl:call-template name="AlphaPosition">
                                    <xsl:with-param name="Position" select="position()" />
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:52.3mm;text-align:right;">
                                 <!-- Form to Form Link -->
                                 <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt" />
                                 </xsl:call-template>
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="PassiveDedOrLossAllowedAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupPassiveDedOrLossAllowedAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:46.7mm;text-align:right">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="EstateAndTrustPassiveIncomeAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupEstateAndTrustPassiveIncomeAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:39.1mm;text-align:right;">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="DeductionOrLossAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupDeductionOrLossAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="width:42.5mm;text-align:right;">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="OtherIncomeAmt" />
                                    <xsl:with-param name="BackupName">IRS1040ScheduleEEstateAndTrustGroupOtherIncomeAmt</xsl:with-param>
                                 </xsl:call-template>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <!-- End Separated Repeating data table -->
                 <!-- Begin Separated Repeating data table -->
               <xsl:if test="($Print = $Separated) and (count($FormData/REMICGroup) &gt; 4)">
                  <span class="styRepeatingDataTitle">Form 1040 Schedule E, Part IV, Line 38 - Income or Loss From Real Estate Mortgage Investment Conduits (REMICs) - Residual Holder</span>
                  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
                     <thead class="styTableThead">
                        <tr class="styDepTblHdr">
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:3.5mm;">
                              <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                 <xsl:call-template name="AlphaPosition">
                                    <xsl:with-param name="Position" select="position()" />
                                 </xsl:call-template>
                              </span>
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:86.2mm;">
                              <span style="font-weight:bold;">(a)</span>
                               Name
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:19.7mm;">
                              <span style="font-weight:bold;">(b)</span>
                              Employer identification number
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:17.5mm;">
                              <span style="font-weight:bold;">(c)</span>
                                Excess inclusion from <b>Schedules Q,</b> line 2c (see page E-8)
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:32.5mm;">
                              <span style="font-weight:bold;">(d)</span>
                              Taxable income (net loss) from <b>Schedules Q,</b> line 1b
                           </th>
                           <th class="styDepTblCell" scope="col" rowspan="2" style="width:23.2mm;">
                               <span style="font-weight:bold;">(e)</span>
                              <span class="styNormalText"> lncome from <b>Schedules Q,</b> line 3b
                              </span>
                           </th>
                            
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="$FormData/REMICGroup">
                           <tr style="border-color:black;height:6mm;">
                              <xsl:attribute name="class">
                                 <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                                 </xsl:choose>
                              </xsl:attribute>
                              <td class="styDepTblCell" style="width:3.5mm;">
                                 <span style="width:4mm;font-weight:bold;" class="styGenericDiv">
                                    <span class="styBoldText" style="float:center;text-align:center;font-size:8pt;">
                                       <xsl:call-template name="AlphaPosition">
                                          <xsl:with-param name="Position" select="position()" />
                                       </xsl:call-template>
                                    </span>
                                 </span>
                              </td> 
 
                              <td class="styDepTblCell" style="text-align:left;width:65mm;">
                                  <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine1" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
                     </xsl:call-template>
                     <br/>
                     <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="REMICName/BusinessNameLine2" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICName</xsl:with-param>
                     </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:center;width:19.7mm;">
                                 <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="REMICEIN" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICEIN</xsl:with-param>
                     </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:right;width:30mm;">
                              <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExcessInclusionAmt" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupExcessInclusionAmt</xsl:with-param>
                     </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:right;width:32.5mm;">
                                <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TaxableIncomeOrNetLossAmt" />
                        <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupTaxableIncomeOrNetLossAmt</xsl:with-param>
                     </xsl:call-template>
                              </td>
                              <td class="styDepTblCell" style="text-align:right;width:30mm;">
                                  <xsl:call-template name="PopulateAmount">
                                   <xsl:with-param name="TargetNode" select="REMICIncomeAmt" />
                                 <xsl:with-param name="BackupName">IRS1040ScheduleEREMICGroupREMICIncomeAmt</xsl:with-param>
                          
                     </xsl:call-template>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <!-- End Separated Repeating data table -->
            </form>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="AddPositionNumber">
      <span class="styBoldText">
       <xsl:number value="position()" format="A"/>
      </span>
   </xsl:template>
   <xsl:template name="AddPositionNumber1">
      <span class="styBoldText">
           <xsl:number value="position()" format="B"/>
      </span>
   </xsl:template>
   <xsl:template name="AddPositionNumber2">
      <span class="styBoldText">
          <xsl:number value="position()" format="C"/>
      </span>
   </xsl:template>
   <xsl:template name="AlphaPosition">
      <xsl:param name="Position"></xsl:param>
      <xsl:variable name="FirstAlphaPos" select='format-number(($Position div 26), "###.##") ' />
      <xsl:if test="$FirstAlphaPos > 1">
         <xsl:value-of select="substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',$FirstAlphaPos,1)">
         </xsl:value-of>
         <xsl:variable name="SecondAlphaPos" select='format-number(($Position - 26), "###") ' />
         <xsl:value-of select="substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',$SecondAlphaPos,1)"></xsl:value-of>
      </xsl:if>
      <xsl:if test="$FirstAlphaPos &lt; 1.1">
         <xsl:value-of select="substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',$Position,1)"></xsl:value-of>
      </xsl:if>                
   </xsl:template>
   <xsl:template name="Line18Array">
      <xsl:param name="Count"></xsl:param>
      <tr>
         <!-- Column 1 -->
         <td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;border-right-width:1px;">
            <xsl:value-of select="position()" />
            <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode" select="OtherExpenseAmt[$Count]" />
               <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
            </xsl:call-template>
         </td>
         <!-- Column 2 -->
         <td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;border-right-width:1px;">
            <xsl:if test="($Count + 1) &lt; ($FormData/PropertyRealEstAndRoyaltyGroup/Other)">
               <xsl:value-of select="position() + 1" />
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="OtherExpenseAmt[($Count + 1)]" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
               </xsl:call-template>
            </xsl:if>
         </td>
         <!-- Column 3 -->
         <td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;border-right-width:0px;">
            <xsl:if test="($Count + 2) &lt; ($FormData/PropertyRealEstAndRoyaltyGroup/Other)">
               <xsl:value-of select="position() + 2" />
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="OtherExpenseAmt[($Count + 2)]" />
                  <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
               </xsl:call-template>
            </xsl:if>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Line18Col">
      <xsl:param name="TargetNode"/>
      <!-- Column 1, 2, or 3 -->
      <td class="styTableCell" style="width:27.9mm;height:4mm;float:left;clear:none;border-right-width:1px;">
         <xsl:value-of select="position()" />
         <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$TargetNode" />
            <xsl:with-param name="BackupName">IRS1040ScheduleEPropertyRealEstAndRoyaltyGroupOtherOtherExpenseAmt</xsl:with-param>
         </xsl:call-template>
      </td>
   </xsl:template>


</xsl:stylesheet>
