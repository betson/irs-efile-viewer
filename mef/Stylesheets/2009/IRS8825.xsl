<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8825Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8825Data" select="$RtnDoc/IRS8825"/>
  
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8825Data)"></xsl:with-param></xsl:call-template></title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 8825"/>
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css"> 

          <xsl:if test="not($Print) or $Print=''">

            <!-- Form 8825 CSS Styles are located in the template called below -->
            <xsl:call-template name="IRS8825Style"></xsl:call-template>  
            <xsl:call-template name="AddOnStyle"></xsl:call-template>
      
          </xsl:if>

        </style>  
      <xsl:call-template name="GlobalStylesForm"/>
</head>
    
    
    
      <body class="styBodyClass">
        <form name="Form8825">
          <xsl:call-template name="DocumentHeader"></xsl:call-template>

          <!-- BEGIN WARNING LINE -->
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
       <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:21mm;">
                    Form <span class="styFormNumber" >8825</span>
            <div style="height:4mm;"/>
                  <span class="styAgency">(Rev. December 2006)</span><br/>
                  <span class="styAgency">Department of the Treasury</span>
                     <br/>
                   <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:13mm;">
              <div class="styMainTitle" style="height:8mm;font-size:13pt;">
                  Rental Real Estate Income and Expenses of a<br/>
                  Partnership or an S Corporation
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;vertical-align:bottom;padding-top:2mm;">
                <img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
                     See instructions on back.
               </div>
        
         <div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm">
                <img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
            Attach to Form 1065, Form 1065-B, or Form 1120S.
          </div>
          
        </div>
            <div class="styTYBox" style="width:30mm;height:23mm;">
      
              <div class="styOMB" style="border-bottom-width:0px;padding-top:8mm;">
            OMB No. 1545-1186
          </div>
      
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styGenericDiv" style="width:187mm;float:none;clear:none;">
            <div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
              Name<br/>
              <span>                
                <xsl:call-template name="PopulateReturnHeaderFiler">
                	<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                	<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            
            <!--
            <xsl:call-template name="PopulateReturnHeaderFiler">
    				<xsl:with-param name="EINChanged">true</xsl:with-param>
    				<xsl:with-param name="TargetNode">EIN</xsl:with-param>
    			</xsl:call-template></span></div>

            -->
            <div class="styEINBox" style="width:55mm;height:4mm;font-size:7pt;padding-left:2mm;">
              Employer identification number<br/><br />              
              <span class="styEINFld" style="width:30mm; text-align:left;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                		<xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>      
              </span>  
            </div>
          </div>
          
          
          <!-- End Names and Identifying number section -->
          <!-- Start Properties table -->
          <div class="styForm8825TableCellNoBorder" style="height:4mm;width:187mm;float:none;clear:none;">
            <div class="styBoldText" style="width:5mm;float:left; font-size: 7pt;">1</div>
            <div style="float:left;font-weight:normal;font-size:7pt;"><span style="width:4mm"></span>
                      Show the kind and location of each property. See page 2 to list additional properties. 
            </div>
            <div style="float:right">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses/PropertyTypeAndLocation"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" 'PTPctn' "/>                
              </xsl:call-template>
            </div>
          </div>
          
          <div style="clear:both;float;none;width:187mm;">
            <div class="styTableContainer" id="PTPctn">
              <xsl:call-template name="SetInitialState"/>
                <table class="styTable"  cellspacing="0" cellname="TYTable" id="TYTable" summary="Table for displaying the kind and location of each property">
                  <thead>
                  </thead> 
                    <tfoot></tfoot>
                   <tbody>
                <!-- Line 1 -->
                <!-- If the Print parameter is not set to be Separated, or there are fewer elements than the container height -->
                <xsl:if test="($Print != $Separated) or (count($Form8825Data/RentalIncomeExpenses) &lt;= 4) ">
                  <xsl:for-each select="$Form8825Data/RentalIncomeExpenses">
                    <tr style="height:8mm;font-size:7pt;">
                      <td class="styForm8825TableCellNoBorder " scope="row" style="width:5mm;text-align:left;padding-left:3.5mm;">
                        <xsl:if test="position() = count($Form8825Data/RentalIncomeExpenses)">
                          <xsl:attribute name="style">border-bottom-width:0px;width:5mm;text-align:left;padding-left:3.5mm;</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="AddPositionNumber"/>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styForm8825TableCellNoBorder" style="width:178mm; text-align:left;" valign="bottom">
                        <xsl:if test="position() = count($Form8825Data/RentalIncomeExpenses)">
                          <xsl:attribute name="style">border-bottom-width:0px;width:178mm;text-align:left;</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyTypeAndLocation"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                
                  <!-- If no element in table is populated with data, setting width to 182mm in the first blank row will force the table lines to extend to the right side of the page.-->
                  <!-- If the Print parameter is Separated and the number of rows is more than 4, display a message in the -->
                  <!-- first blank row directing the user to the additional data table -->
                  <xsl:if test="count($Form8825Data/RentalIncomeExpenses) &lt; 1 or 
                     (($Print = $Separated) and (count($Form8825Data/RentalIncomeExpenses) &gt; 4)) ">
                    <tr style="height:8mm;font-size:7pt">
                      <td  class="styForm8825TableCellNoBorder " style="width:5mm;text-align:left;padding-left:3.5mm;">
                      	<span class="styBoldText"> A </span><span class="styTableCellPad"></span>
                      </td>
                      <td  class="styForm8825TableCellNoBorder " style="width:182mm;text-align:left">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses" />
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($Form8825Data/RentalIncomeExpenses) &lt; 2 or 
                     (($Print = $Separated) and (count($Form8825Data/RentalIncomeExpenses) &gt; 4)) ">
                    <tr style="height:6mm;font-size:7pt;">
                      <td  class="styForm8825TableCellNoBorder " style="width:5mm;text-align:left;padding-left:3.5mm;">
                      		<span class="styBoldText"> B </span>
                      		<span class="styTableCellPad"></span>
                      </td>
                      <td  class="styForm8825TableCellNoBorder "><span class="styTableCellPad"></span></td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($Form8825Data/RentalIncomeExpenses) &lt; 3 or 
                     (($Print = $Separated) and (count($Form8825Data/RentalIncomeExpenses) &gt; 4)) ">
                    <tr style="height:6mm;font-size:7pt;">
                      <td  class="styForm8825TableCellNoBorder " style="width:5mm;text-align:left;padding-left:3.5mm;"><span class="styBoldText"> C </span>
                      	<span class="styTableCellPad"></span>
                      </td>
                      <td  class="styForm8825TableCellNoBorder ">
                      		<span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </xsl:if>
                            
                  <xsl:if test="count($Form8825Data/RentalIncomeExpenses) &lt; 4 or 
                     (($Print = $Separated) and (count($Form8825Data/RentalIncomeExpenses) &gt; 4)) ">
                    <tr style="height:6mm;font-size:7pt;">
                      <td  class="styForm8825TableCellNoBorder " style="width:5mm;text-align:left;padding-left:3.5mm;">
                      	<span class="styBoldText"> D </span>
                      	<span class="styTableCellPad"></span>
                      </td>
                      <td  class="styForm8825TableCellNoBorder ">
                      	<span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </xsl:if>  
                
                </tbody>
              </table>
            </div>
            <!--Set initial height of the Kind and Location of each property table-->
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses/PropertyTypeAndLocation"/>
              <xsl:with-param name="containerHeight" select="3"/>
              <xsl:with-param name="containerID" select=" 'PTPctn' "/>                
            </xsl:call-template>
          </div>
          
      <!-- Lines 2 - 16 -->
      
      <xsl:if test="$Form8825Data/RentalIncomeExpenses">
        <!-- If the Print parameter is not Separated, or there are fewer elements than the container height -->
        <xsl:if test="($Print != $Separated) or (count($Form8825Data/RentalIncomeExpenses) &lt;= 4) ">
        <div style="clear:both;float;none;width:187mm;"> 
          <xsl:for-each select="$Form8825Data/RentalIncomeExpenses">
            <xsl:variable name="pos" select="position()"/>
            <xsl:if test="position() mod 4 = 1">
              <xsl:variable name="conID" select="concat('RentTableID', $pos)"/>              
              <xsl:variable name="imgID" select="concat('RentImgID', $pos)"/>
              <xsl:variable name="btnID" select="concat('RentBtnID', $pos)"/>
              <xsl:variable name="OtherRowCount" select="(count($Form8825Data/RentalIncomeExpenses[$pos]/Other)
              	+ count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other)
              	+ count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) 
             	 	+count($Form8825Data/RentalIncomeExpenses[$pos+3]/Other))"/>
                                   
                <table cellspacing="0" class="styTable" style="border-color:black;" summary="Table for displaying the rental real estate properties there income and expenses">
                  <thead class="styTableThead">
                  <tr>
                    <th class="styTableCellHeader" style="width:65mm;border:none;border-right-width: 1px;">  </th>
                    <th style="width:7mm;height:5mm;border: black solid 1px; border-left-width:0px; border-top-width:0px;border-bottom-width:0px;">
                      <span class="styTableCellPad"></span>
                    </th>
                    <th class="styTableCellHeader" style="width:100mm;font-size:8pt;border-left-width: 0px;" colspan="4" scope="col">
                      Properties
                    </th>
                  </tr>
                  </thead>
                    <tfoot></tfoot>
                    <tbody>
                  <tr>
                    <th style="width:70mm;border:none;font-size:7pt;text-align:left;padding-left:8.25mm;font-weight:medium;" scope="col">
                      <span class="styBoldText">Rental Real Estate Income</span>
                    </th>
                    <th class="styForm8825TableCellSmallRB " style="width:5mm;border-left-width: 0px;">
                      <span class="styTableCellPad"></span>
                    </th>
                    
                    <xsl:for-each select="$Form8825Data/RentalIncomeExpenses">
                      <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
                        <td class="styTableCellSmall" style="text-align: center;">
                          <xsl:call-template name="AddPositionNumber"/>
                          <span class="styTableCellPad"></span>
                        </td>
                      </xsl:if>
                    </xsl:for-each>
    
                    <xsl:if test="count($Form8825Data/RentalIncomeExpenses[position() &gt;= $pos  and position() &lt; $pos+4]) = 1">
                    
                      <xsl:choose>
                        <xsl:when test="count($Form8825Data/RentalIncomeExpenses) &lt; 2">
                          <td  class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> B </span><span class="styTableCellPad"></span></td>
                          <td  class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> C </span><span class="styTableCellPad"></span></td>
                          <td  class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> D </span><span class="styTableCellPad"></span></td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                          <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                          <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                        </xsl:otherwise>
                      </xsl:choose>                    
                    </xsl:if>
                    <xsl:if test="count($Form8825Data/RentalIncomeExpenses[position() &gt;= $pos  and position() &lt; $pos+4]) = 2">
                      <xsl:choose>
                        <xsl:when test="count($Form8825Data/RentalIncomeExpenses) &lt; 3">
                          <td  class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> C </span><span class="styTableCellPad"></span></td>
                          <td  class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> D </span><span class="styTableCellPad"></span></td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                          <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:if>
                    <xsl:if test="count($Form8825Data/RentalIncomeExpenses[position() &gt;= $pos  and position() &lt; $pos+4]) = 3">
                      <xsl:choose>
                        <xsl:when test="count($Form8825Data/RentalIncomeExpenses) &lt; 4">
                          <td  class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> D </span><span class="styTableCellPad"></span></td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:if>                    
          
                  </tr>
                  <!-- line 2 -->
                  <tr>
                    <td style="border:none;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">2</div>
                        <div class="styGenericDiv" style="width:65mm;font-size:7pt;">
                           <span style="float:left">Gross rents</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
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
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">2<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GrossRents"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/GrossRents"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/GrossRents"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/GrossRents"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  
                  <!-- line 3 -->
                  <tr>
                    <td style="border:none;" scope="row">
                      <div>
                        <br/>
                        <span class="styBoldText;" style="font-size:7pt;text-align:left;padding-left:8mm;font-weight:bold;">Rental Real Estate Expenses</span>
                        <br/>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">3</div>
                        <div class="styGenericDiv" style="width:65mm;font-size:7pt;"> 
                          <span style="float:left">Advertising</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
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
                        <!--<span class="styTableCellPad"></span>-->
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">
                      <br/>3<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Advertising"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Advertising"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Advertising"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Advertising"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  
                  <!-- line 4 -->
                  <tr>
                    <td style="border:none;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">4</div>
                        <div class="styGenericDiv" style="width:65mm;font-size:7pt;">  
                          <span style="float:left">Auto and travel</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.                                                                                                
                          </span>
                        </div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">4<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="AutoAndTravel"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/AutoAndTravel"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/AutoAndTravel"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/AutoAndTravel"/>
                      </xsl:call-template>
                    </td>                 
                  </tr>
                  
                  <!--line 5 -->
                  <tr>
                    <td style="border:none;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">5</div>
                        <div class="styGenericDiv" style="width:65mm;font-size:7pt;">
                           <span style="float:left">Cleaning and maintenance</span>
                           <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.                                                                                                                          
                          </span>
                        </div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">5<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CleaningAndMaintenance"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/CleaningAndMaintenance"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/CleaningAndMaintenance"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/CleaningAndMaintenance"/>
                      </xsl:call-template>
                    </td>                  
                 </tr>
                 
                 <!-- line 6 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">6</div>
                        <div class="styGenericDiv" style="width:65mm;"> 
                          <span style="float:left">Commissions</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.                                                                                                                          
                          </span>
                        </div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">6<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Commissions"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Commissions"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Commissions"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Commissions"/>
                      </xsl:call-template>
                    </td>                 
                   </tr>
                   
                   <!-- line 7 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">7</div>
                        <div class="styGenericDiv" style="width:65mm;">
                           <span style="float:left">Insurance</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
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
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">7<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Insurance"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Insurance"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Insurance"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Insurance"/>
                      </xsl:call-template>
                    </td>                  
                  </tr>
                  
                  <!-- line 8 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">8</div>
                        <div class="styGenericDiv" style="width:65mm;font-size:7pt;"> 
                          <span style="float:left">Legal and other professional fees</span> 
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.                                                                                                                            
                          </span>                        
                        </div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">8<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="LegalAndOtherProfessionalFees"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/LegalAndOtherProfessionalFees"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/LegalAndOtherProfessionalFees"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/LegalAndOtherProfessionalFees"/>
                      </xsl:call-template>
                    </td>                  
                 </tr>
                 
                 <!-- line 9 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; font-size: 7pt; width:7.75mm; text-align:left; padding-left:2mm;">9</div>
                        <div class="styGenericDiv" style="width:65mm;">
                          <span style="float:left">Interest</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:2px;"></span>.
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
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">9<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Interest"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Interest"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Interest"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Interest"/>
                      </xsl:call-template>
                    </td>                  
                  </tr>
                  
                  <!-- line 10 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">10</div>
                        <div class="styGenericDiv" style="width:65mm;">
                          <span style="float:left">Repairs</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:2px;"></span>.
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
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">10<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Repairs"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Repairs"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Repairs"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Repairs"/>
                      </xsl:call-template>
                    </td>                  
                  </tr>
                  
                  <!-- line 11 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">11</div>
                        <div class="styGenericDiv" style="width:65mm;">
                          <span style="float:left">Taxes</span>  
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
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
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">11<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Taxes"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Taxes"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Taxes"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Taxes"/>
                      </xsl:call-template>
                    </td>                  
                  </tr>
                  
                  <!-- line 12 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">12</div>
                        <div class="styGenericDiv" style="width:65mm;">
                          <span style="float:left">Utilities</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:4px;"></span>.
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
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">12<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Utilities"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Utilities"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Utilities"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Utilities"/>
                      </xsl:call-template>
                    </td>                  
                 </tr>
                 
                 <!-- line 13 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">13</div>
                        <div class="styGenericDiv" style="width:65mm;">
                          <span style="float:left">Wages and salaries</span>  
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:6px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.                                                                                                                                                                                    
                          </span>
                        </div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">13<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="WagesAndSalaries"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/WagesAndSalaries"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/WagesAndSalaries"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/WagesAndSalaries"/>
                      </xsl:call-template>
                    </td>                  
                  </tr>
                  
                  <!-- line 14 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">14</div>
                        <div class="styGenericDiv" style="width:65mm;">
                          <span style="float:left">Depreciation (see instructions)</span>
                    
                          <!--Dotted Line -->
                          <span class="styBoldText" style="float:right">
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.
                            <span style="width:16px;"></span>.                                                                                                                                                                                    
                          </span> 
                       
                        </div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                  14<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses/Depreciation"/>
                        </xsl:call-template>
                      </span>                    
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses/Depreciation"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Depreciation"/>
                        </xsl:call-template>
                      </span>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Depreciation"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Depreciation"/>
                        </xsl:call-template>
                      </span>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Depreciation"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Depreciation"/>
                        </xsl:call-template>
                      </span>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Depreciation"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  
                  <!--Row 15 Begins-->
                  <!--  RowCount gives the total count of all the 'Other' s-->
                  <!--  Removed sum -->

                  <xsl:variable name="RowCount" select="(count($Form8825Data/RentalIncomeExpenses[$pos]/Other)
                  + count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other)
                  + count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) 
                  +count($Form8825Data/RentalIncomeExpenses[$pos+3]/Other))"/>
                  
                  <!-- EMPTY rows -->
                  <!-- This "if loop" puts empty rows when there are no 'Other' elements-->
                  <xsl:if test="$RowCount=0">
                    <xsl:choose>
                      <xsl:when test="position() mod 4=1">
                        <td style="border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px" scope="row">
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>                                   
                            <div class="styGenericDiv">
                               Other (list)
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                              <span class="" style="width:45mm;border-bottom:1 solid black;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                </xsl:call-template>
                              </span>
                            </div>    
                        </td>
                        <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                          <xsl:attribute name="rowspan">
                          			<xsl:value-of select="$RowCount"></xsl:value-of>
                          </xsl:attribute>
                          <span style="text:align:right;">15</span>
                          <span class="styTableCellPad"></span>
                        </td>
                        <!-- Empty columns-->                        
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td style="border:none;font-size:7pt;" scope="row">
                          <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                            <span class="styBB" style="width:29mm;">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                            </xsl:call-template>
                            </span>
                          <span class="styTableCellPad"></span>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                  <xsl:variable name="FirstCol">
                      <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos]/Other) " />
                    </xsl:variable>
                    <xsl:variable name="SecondCol">
                      <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other) " />
                  </xsl:variable>
                  <xsl:variable name="ThirdCol">
                      <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) " />
                </xsl:variable>
                  <xsl:variable name="FourthCol">
                      <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos+3]/Other) " />
                  </xsl:variable>

                  <!-- For column A-->
                  <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos]/Other">
                    <tr>
                      <xsl:choose>
                        <xsl:when test="position()=1">
                          <td style="border:none;font-size:7pt;" scope="row">
                            <xsl:if  test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
                              <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px					    </xsl:attribute>
                            </xsl:if>
                            <div class="styGenericDiv" style="width:4mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>    
                            <div class="styGenericDiv">
                               Other (list) 
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                              <span style="width:4px;"></span>
                              <xsl:choose>
                                <xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
                                    <span style="width:45mm;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                    </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <span style="width:45mm;border-bottom:1 solid black;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                  </span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </div>    
                          </td>
                          <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                         
                            <xsl:attribute name="rowspan">
                            	<xsl:value-of select="$RowCount">
                            	</xsl:value-of>
                            </xsl:attribute>
                         
                            <span style="text:align:right;vertical-align:top" valign="top">15</span>
                            <span class="styTableCellPad"></span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td style="border:none;font-size:7pt;" scope="row">                            
                            <xsl:choose>
                              <xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
                                  <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px					</xsl:attribute>
                                  <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template></span>
                              </xsl:when>
                              <xsl:otherwise>
                                <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                <span class="styFixedUnderline" style="width:62mm;float:left;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                </xsl:call-template>
                                </span>
                                <span class="styTableCellPad"></span>
                              </xsl:otherwise>
                            </xsl:choose>                           
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                      </xsl:call-template>
                      </td>
                      <td class="styTableCellSmall">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall">
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <!-- For Column B-->
                  <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos+1]/Other">
                    <tr>
                      <xsl:choose>
                        <xsl:when test="(position()=1) and (count($Form8825Data/RentalIncomeExpenses[$pos]/Other)=0)">
                          <td style="border:none;font-size:7pt;" scope="row">
                            <xsl:if  test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
                              <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
                            </xsl:if>
                            <div class="styGenericDiv" style="width:5mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>                                          
                            <div class="styGenericDiv">
                               Other (list) 
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                              <span style="width:4px;"></span>
                              <xsl:choose>
                                <xsl:when test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
                                    <span style="width:45mm;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                    </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <span style="width:45mm;border-bottom:1 solid black;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                  </span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </div>    
                          </td>
                          <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                            <xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"> </xsl:value-of></xsl:attribute>
                            <span style="text:align:right;">15</span><span class="styTableCellPad"></span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td style="border:none;font-size:7pt;" scope="row">
                            <xsl:choose>
                              <xsl:when test="position()=last() and ($ThirdCol+$FourthCol) = 0">
                                  <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
                                <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                </xsl:call-template>
                                </span>
                              </xsl:when>
                              <xsl:otherwise>
                                <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                <span class="styFixedUnderline" style="width:62mm;float:left;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                </xsl:call-template>
                                </span>
                                <span class="styTableCellPad"></span>
                              </xsl:otherwise>
                            </xsl:choose>                           
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td class="styTableCellSmall" scope="row">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                      </xsl:call-template>
                      </td>
                      <td class="styTableCellSmall">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall">
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <!--For Column C -->
                  <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos+2]/Other">
                    <tr>
                      <xsl:choose>
                        <xsl:when test="(position()=1) and ( (count($Form8825Data/RentalIncomeExpenses[$pos]/Other) + count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other) )=0)">
                          <td style="border:none;font-size:7pt;" scope="row">
                            <xsl:if  test="position()=last() and (($FourthCol) = 0)">
                              <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
                            </xsl:if>
                            <div class="styGenericDiv" style="width:5mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>                                          
                            <div class="styGenericDiv">
                               Other (list) 
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                              <span style="width:4px;"></span>
                              <xsl:choose>
                                <xsl:when test="position()=last() and (($FourthCol) = 0)">
                                    <span style="width:45mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                </xsl:call-template>
                                </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <span style="width:45mm;border-bottom:1 solid black;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                  </span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </div>    
                          </td>
                          <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                            <xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"> </xsl:value-of></xsl:attribute>
                            <span style="text:align:right;">15</span>
                            <span class="styTableCellPad"></span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td style="border:none;font-size:7pt;" scope="row">
                            <xsl:choose>
                              <xsl:when test="position()=last() and (($FourthCol) = 0)">
                                  <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
                                <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                  </span>
                              </xsl:when>
                              <xsl:otherwise>
                                <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                <span class="styFixedUnderline" style="width:62mm;float:left;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                </span>
                                <span class="styTableCellPad"></span>
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td class="styTableCellSmall" scope="row">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" scope="row">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                      </xsl:call-template>
                      </td>
                      <td class="styTableCellSmall">
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <!-- For Column D-->
                  <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos+3]/Other">
                    <tr>
                      <xsl:choose>
                        <xsl:when test="(position()=1) and ( (count($Form8825Data/RentalIncomeExpenses[$pos]/Other) + count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other) + count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) )=0)">
                          <td style="border:none;font-size:7pt;" scope="row">
                            <xsl:if  test="position()=last()">
                              <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
                            </xsl:if>
                            <div class="styGenericDiv" style="width:5mm;font-weight:bold; width:7.75mm; text-align:left; padding-left:.5mm;">15</div>
                            <div class="styGenericDiv">
                               Other (list) 
                              <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                              <span style="width:4px;"></span>
                              <xsl:choose>
                                <xsl:when test="position()=last()">
                                  <span style="width:45mm;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <span style="width:45mm;border-bottom:1 solid black;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </div>    
                          </td>
                          <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                            <xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"></xsl:value-of></xsl:attribute>
                            <span style="text:align:right;">15</span>
                            <span class="styTableCellPad"></span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td style="border:none;font-size:7pt;" scope="row">
                            <xsl:choose>
                              <xsl:when test="position()=last()">
                                <xsl:attribute name="style">border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px</xsl:attribute>
                                <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                </span>
                              </xsl:when>
                              <xsl:otherwise>
                                <div class="styGenericDiv" style="width:8mm;font-weight:bold;"/>
                                <span class="styFixedUnderline" style="width:62mm;float:left;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                </span>
                                <span class="styTableCellPad"></span>
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td class="styTableCellSmall" scope="row">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" scope="row">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" scope="row">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                      </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <!-- End of row 15-->
                  
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:7.75mm;font-weight:bold;padding-left:.75mm">16</div>
                        <div class="styGenericDiv" style="width:65mm;">
                          Total expenses for each property. <br/>
                          <span style="float:left">Add lines 3 through 15</span>
                          <!--Dotted Line-->
                          <span class="styBoldText" style="float:right">
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.                                                    
                          </span>
                        </div>
                      </div>
                    </td>
                    
                    <!-- line 16 -->
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">16<span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <br/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalExpensesForProperty"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <br/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/TotalExpensesForProperty"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <br/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/TotalExpensesForProperty"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <br/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/TotalExpensesForProperty"/>
                      </xsl:call-template>
                    </td>                  </tr>
                </tbody>  
                </table>
              <!--/div-->
            </xsl:if>
          </xsl:for-each>
          </div>
          </xsl:if>
        </xsl:if>
        
        <!-- SEPARATED DATA -->
        <!--When there is no data -->
        <!-- Begin empty rows -->
        <!-- If the Print parameter is Separated and the number of elements is greater than the container size, then -->
        <!-- display a message in the first row directing the user to the additional data table -->
        <xsl:if test="not($Form8825Data/RentalIncomeExpenses) or 
           (($Print = $Separated) and (count($Form8825Data/RentalIncomeExpenses) &gt; 4)) ">    
          <div  style="clear:both;float;none;width:187mm;">
            <div class="styBB" style="width:187mm;">
            </div>
            <div class="styTableContainerNBB" style="height:100mm;" id="RentTableID1">
              <table class="styTable" summary="Table for displaying the rental real estate properties there income and expenses" cellspacing="0" style="border-color:black;">
                <thead class="styTableThead">
                  <tr>
                    <th class="styTableCellHeader" style="width:65mm;border:none;" />
                    <th style="width:7mm;height:5mm;border-color:black; border-style:solid; border-left-width:0px; border-top-width:0px; border-bottom-width:0px; border-right-width:1px;"><span class="styTableCellPad"></span></th>
                    <th class="styTableCellHeader" style="width:100mm;font-size:8pt;border-left-width: 0px;" colspan="4" scope="col">
                          Properties
                        </th></tr>
                </thead><tfoot /><tbody>
                
                <tr>
                  <th style="width:70mm;border:none;font-size:7pt;text-align:left;padding-left:6mm;font-weight:medium;" scope="col">
                	<span class="styBoldText">Rental Real Estate Income</span>
                  </th>
                  <th class="styForm8825TableCellSmallRB " style="width:5mm;border-left-width: 0px;">
                  		<span class="styTableCellPad"></span>
                  </th><td class="styTableCellSmall" style="text-align:center;"><span class="styBoldText">  A </span><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="text-align:center;"><span class="styBoldText" >B </span><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> C </span><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="text-align:center;"><span class="styBoldText"> D </span><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 2 -->
                  <tr>
                    <td style="border:none;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">2</div><div class="styGenericDiv" style="width:67mm;font-size:7pt;">
                               Gross rents
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                    
                              </span></div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">2<span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:7pt;text-align:left">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses" />
                        <xsl:with-param name="ShortMessage" select="'true'" />
                      </xsl:call-template>
                      <span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                    		<span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                    		<span class="styTableCellPad"></span>
                    </td>
			<td class="styTableCellSmall" style="font-size:6pt;">
				<span class="styTableCellPad"></span></td>
                  </tr>
                  <tr>
                    <td style="border:none;" scope="row">
                      <div><br/>
                      <span class="styBoldText;" style="font-size:7pt;text-align:left;padding-left:6mm;font-weight:bold;">Rental Real Estate Expenses</span>
                      <br/>
                      
                      <!-- SEPARATED DATA line 3 -->
                      <div class="styGenericDiv" style="width:5mm;font-weight:bold;">3</div>
                      <div class="styGenericDiv" style="width:67mm;font-size:7pt;"> 
                              Advertising
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                    
                              </span></div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;"><br/>3<span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><br/><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><br/><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><br/><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><br/><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 4 -->
                  <tr>
                    <td style="border:none;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:5mm;font-weight:bold;">4</div><div class="styGenericDiv" style="width:67mm;font-size:7pt;">  
                              Auto and travel
                            <span class="styBoldText">
                              <span style="width:16px;"></span>.
                              <span style="width:16px;"></span>.
                              <span style="width:16px;"></span>.
                              <span style="width:16px;"></span>.
                              <span style="width:16px;"></span>.
                              <span style="width:16px;"></span>.
                              <span style="width:16px;"></span>.                                                                    
                            </span>
                        </div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">4<span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  <tr>
                    <td style="border:none;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">5</div><div class="styGenericDiv" style="width:67mm;font-size:7pt;">
                               Cleaning and maintenance
                               <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                                              
                              </span></div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">5<span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!--SEPARATED DATA  line 6 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">6</div><div class="styGenericDiv" style="width:67mm;"> 
                              Commissions
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                                                
                              </span></div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">6<span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">7</div><div class="styGenericDiv" style="width:67mm;">
                               Insurance
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                    
                              </span></div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">7<span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">8</div><div class="styGenericDiv" style="width:67mm;font-size:7pt;"> 
                              Legal and other professional fees 
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                                                
                              </span></div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">8<span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 9 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">9</div><div class="styGenericDiv" style="width:67mm;">
                              Interest
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
                              </span></div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">9
                   		 <span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 10 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">10</div><div class="styGenericDiv" style="width:67mm;">
                              Repairs
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                                                                            
                              </span></div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">10<span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 11 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div>
                        <div class="styGenericDiv" style="width:5mm;font-weight:bold;">11</div><div class="styGenericDiv" style="width:67mm;">
                              Taxes  
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
                          </span>
                        </div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">11<span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 12 --> 
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">12</div><div class="styGenericDiv" style="width:67mm;">
                              Utilities
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                                                                            
                              </span></div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">12<span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">13</div><div class="styGenericDiv" style="width:67mm;">
                              Wages and salaries  
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                                                                                                        
                              </span></div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">13<span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 14 -->
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">14</div><div class="styGenericDiv" style="width:67mm;">
                              Depreciation (see instructions)
                        
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.                                                                                                                                                        
                              </span></div>
                      </div>
                    </td>
                    <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                      14<span class="styTableCellPad"></span></td><td class="styTableCellSmall" style="font-size:6pt;">                
                      <span class="styTableCellPad"></span></td><td class="styTableCellSmall" style="font-size:6pt;">                
                      <span class="styTableCellPad"></span></td><td class="styTableCellSmall" style="font-size:6pt;">                
                      <span class="styTableCellPad"></span></td><td class="styTableCellSmall" style="font-size:6pt;">                
                      <span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!--SEPARATED DATA  line 15 -->
                  <tr>
                  <td style="border:none;font-size:7pt;" scope="row">
                  <div class="styGenericDiv" style="width:5mm;font-weight:bold;" valign="top">15</div>                                                
                   <div class="styGenericDiv">Other (list)
                        <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                                           <span style="width:4px;"></span>
                   </div>
                   <div style="width:49.5mm;border-bottom:1 solid black;"><span style="width:1px;"></span></div>
                    </td>
                        <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;" rowspan="4">
                        <span style="text:align:right;">15</span>
                        <span class="styTableCellPad"></span></td><td class="styTableCellSmall" style="font-size:6pt;" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  
                  <tr>
                  <td style="border:none;font-size:7pt;" scope="row">
                      <div class="styGenericDiv" style="width:5mm;font-weight:bold;">
                      </div>
                      <div class="styGenericDiv" style="width:68mm;font-weight:bold;border-bottom:1 solid black;"></div>
                      <span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                  </tr>
                  <tr><td style="border:none;font-size:7pt;" scope="row">
                      <div class="styGenericDiv" style="width:5mm;font-weight:bold;">
                      </div>
                      <div class="styGenericDiv" style="width:68mm;font-weight:bold;border-bottom:1 solid black;"></div>
                      <span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                  </tr>
                  
                  <!-- SEPARATED DATA line 16 -->
                  <tr>
                  <td style="border:1 solid black;font-size:7pt;border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px;" scope="row">
                      <div class="styGenericDiv" style="width:5mm;font-weight:bold;">
                      </div><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" scope="row"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;" scope="row"><span class="styTableCellPad"></span></td>
                  </tr>
                  <tr>
                    <td style="border:none;font-size:7pt;" scope="row">
                      <div><div class="styGenericDiv" style="width:5mm;font-weight:bold;">16</div><div class="styGenericDiv" style="width:67mm;">
                              Total expenses for each property. <br/>
                              Add lines 3 through 15
                              <span class="styBoldText"><span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.
                                <span style="width:16px;"></span>.  
                                <span style="width:16px;"></span>.                      
                              </span></div>
                      </div>
                    </td><td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">16<span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                    <td class="styTableCellSmall" style="font-size:6pt;"><span class="styTableCellPad"></span></td>
                  </tr>
                </tbody></table>
            </div>
          </div>
        </xsl:if>
     <!-- End empty rows-->      
          
          <!-- Begin the right amount boxes outside of table above -->
          <!-- line 17 -->
      <!--    <div class="stybb" style="clear:both;float:none;width:187mm;">    -->
            <div style="clear:both;float:none;width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">
                17
              </div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
              <span style="float:left">Total gross rents.  Add gross rents from line 2, columns A through H</span>
              <!--Dotted Line-->
              <span class="styBoldText" style="float:right;padding-right:1mm">
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
                17
              </div>
              <div class="styLNAmountBox" style="height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8825Data/TotalGrossRents"/>
                </xsl:call-template>
              </div>
            </div>
            
            <!-- line 18 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">
                18
              </div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
              <span style="float:left">Total expenses.  Add total expenses from line 16, columns A through H</span>
              <!--Dotted Line-->
              <span class="styBoldText" style="float:right;padding-right:1mm">
                <span style="width:3px;"/>
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:15px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
              </div>
              <div class="styLNRightNumBox">
            18
          </div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form8825Data/TotalExpenses"/>
              </xsl:call-template>
            </div>
          </div>
          
          <!-- line 19 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">
              19
            </div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
            Net gain (loss) from Form 4797, Part II, line 17, from the disposition of property from rental real<br/>
            <span style="float:left">estate activities</span>        
            <!--Dotted Line-->
              <span class="styBoldText" style="float:right;padding-right:1mm">
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
                        <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">19</div>
              <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8825Data/NetGainLossFrom4797"/>
                </xsl:call-template>
              </div>
            </div>
            
            <!-- line 20 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">20a</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Net income (loss) from rental real estate activities from partnerships, estates, and trusts in which this<br/>
            <span style="float:left">partnership or S corporation is a partner or beneficiary (from Schedule K-1)</span>
            <span class="styBoldText" style="float:right;padding-right:1mm">
                  <span style="width:6px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.

          </span>
              </div>
              <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">
            20a
          </div>
              <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8825Data/NetIncomeLossRentalRealEstate"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4mm; text-align: right; padding-right: 2mm;">b</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
                Identify below the partnerships, estates, or trusts from which net income (loss) is shown on line 20a.<br/>
                Attach a schedule if more space is needed:  
                <span style="width:290px;"/>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:8mm;
              border-color:black;border-right-width:1px;"/>
            </div>
          
            <div class="styForm8825TableContainer" style="padding-left:9mm;" id="PSTPctn">  
                                      
                <xsl:call-template name="SetInitialState"/>
                <table class="styTable" style="float:none; font-size: 7pt;" cellspacing="0" summary="Table for partnerships, 
                estates or trusts from which net income or loss is shown on line 20a">
                  <thead class="styTableThead" >  
                  <tr>
                    <th class="styTablesCells" scope="col" style="width: 69mm;">
                      <span class="styBoldText">(1)</span><span style="font-weight:normal;"> Name </span>
                    </th>
                    <th class="styTablesCells" scope="col" style="width: 6mm;">
                      <span style="width:4px;">  </span>
                    </th>

                    <th class="styTablesCells" scope="col" style="width: 43.75mm;">
                      <span class="styBoldText">(2)</span> <span style="font-weight:normal; font-size: 6pt;"> Employer
                       identification number</span>
                    </th>
                    <th class="styTablesCells" scope="col" style="width: 35mm;padding-left:17.5mm;padding-top:0px;padding-
                    bottom:0px;">                      
                      <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:7mm;
                       border-color:black;border-right-width:1px;height:100%;"/>
                    </th>
                  
                  </tr>
                  </thead>
                    <tfoot></tfoot>
                    <tbody>
                    
                    
                  <!-- If the Print parameter is not set to be Separated, or there are fewer elements than the container height -->
                  <xsl:if test="($Print != $Separated) or (count($Form8825Data/IdentifyPartnershipEstateTrust) &lt;= 3) ">
                    <xsl:for-each select="$Form8825Data/IdentifyPartnershipEstateTrust">
                      <tr>
                        <td class="styTablesCells" scope="row" style="font-size:6pt;width: 69mm;border-style:solid;border-
                        color:black;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;
                         font-size: 7pt;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                          </xsl:call-template>
                          
                          <xsl:if test=" Name/BusinessNameLine2 !='' ">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                            </xsl:call-template>
                          </xsl:if>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTablesCells" scope="row" style="width: 6mm;">
                          <span style="width:4px;">  </span>
                        </td>

                        <td class="styTablesCells" style="font-size:6pt;width:42mm; border-style:solid;border-
                        color:black;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-
                        width:0px;font-size: 7pt;text-align:center;">
                       
                       <xsl:choose>
                            <xsl:when test="normalize-space(EIN)" >                    
                                   <xsl:call-template name="PopulateEIN">
                                   <xsl:with-param name="TargetNode" select="EIN"/>
                                   </xsl:call-template>  
                             
                           </xsl:when>  
                     <xsl:otherwise> 
	                    	<xsl:call-template name="PopulateText">
		                     	<xsl:with-param name="TargetNode" select="MissingEINReason"/>
		                   </xsl:call-template>    
		           <span style="width: 2px"></span>
	               </xsl:otherwise>   
                   </xsl:choose>
                       
                       
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTablesCells" style="width: 35mm;padding-left:17.5mm;padding-top:0px;padding-
                        bottom:0px;height:100%;">
                          <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-
                          color:lightgrey;height:7mm;border-right-width:1px;height:100%;"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
        <!--empty rows for separated data -->            
                    <!--Filler rows when elements does not exist-->
                    <!-- If the Print parameter is Separated and the number of elements is greater than the container -->
                    <!-- height, then display a message in the first row directing the user to the additional data table -->
                    <xsl:if test="count($Form8825Data/IdentifyPartnershipEstateTrust) &lt; 1 or
                       (($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrust) &gt; 3)) ">
                      <tr>
                        <td class="styTablesCells" scope="row" style="font-size:7pt;width: 69mm;border-style:solid;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$Form8825Data/IdentifyPartnershipEstateTrust" />
                          </xsl:call-template>
                          <span style="width:4px;"></span>                      
                        </td>
                        <td class="styTablesCells" scope="row" style="width: 6mm;">
                          <span style="width:4px;">  </span>
                        </td>

                        <td class="styTablesCells" style="font-size:6pt;width: 43.75mm; border-style:solid;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;">
                          <span style="width:4px;"></span>                           
                           <span class="styTableCellPad"></span>
                        </td>                        
                        
                        <td class="styTablesCells" style="width: 35mm;padding-left:17.5mm;padding-top:0px;padding-bottom:0px;height:100%;">
                          <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:7mm;border-right-width:1px;height:100%;"/>
                        </td>
                      </tr>
                    </xsl:if>  
                    
                    <xsl:if test="count($Form8825Data/IdentifyPartnershipEstateTrust) &lt; 2 or
                       (($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrust) &gt; 3)) ">
                    
                      <tr>
                        <td class="styTablesCells" scope="row" style="font-size:6pt;width: 69mm;border-style:solid;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;">
                          <span style="width:4px;"></span>                      
                        </td>
                        <td class="styTablesCells" scope="row" style="width: 6mm;">
                          <span style="width:4px;">  </span>
                        </td>

                        <td class="styTablesCells" style="font-size:6pt;width: 43.75mm; border-style:solid;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;">
                          <span style="width:4px;"></span>                            
                          <span class="styTableCellPad"></span>
                        </td>                        
                        
                        <td class="styTablesCells" style="width: 35mm;padding-left:17.5mm;padding-top:0px;padding-bottom:0px;height:100%;">
                          <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:7mm;border-right-width:1px;height:100%;"/>
                        </td>
                      </tr>
                    </xsl:if>  
                    
                    <xsl:if test="count($Form8825Data/IdentifyPartnershipEstateTrust) &lt; 3 or
                       (($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrust) &gt; 3)) ">

                      <tr>
                        <td class="styTablesCells" scope="row" style="font-size:6pt;width: 69mm;border-style:solid;border-
                        bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;">
                          <span style="width:4px;"></span>                      
                        </td>
                        <td class="styTablesCells" scope="row" style="width: 6mm;">
                          <span style="width:4px;">  </span>
                        </td>

                        <td class="styTablesCells" style="font-size:6pt;width: 43.75mm; border-style:solid;border-bottom-
                        width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;">
                          <span style="width:4px;"></span>                            <span class="styTableCellPad"></span>
                        </td>                        
                        
                        <td class="styTablesCells" style="width: 35mm;padding-left:17.5mm;padding-top:0px;padding-
                        bottom:0px;height:100%;">
                          <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-
                          color:lightgrey;height:7mm;border-right-width:1px;height:100%;"/>
                        </td>
                      </tr>                           
                   </xsl:if>          
                 </tbody>
                </table>
              </div>              
        <!--    </div>   -->
        
        <!-- line 21 -->
           <div class="styBB" style="clear:both;float:none;width:187mm;"> 
            <div style="width:187mm;clear:both;">
              <div class="styLNLeftNumBox" style="height:4mm;">21</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
              Net rental real estate income (loss). Combine lines 17 through 20a.  Enter the result here and on:
          
              <li>
                <span class="styBoldText"> Form 1065 or 1120S:</span> Schedule K, line 2, or </li>
              <li>
              <span class="styBoldText"> Form 1065-B:</span> Part I, line 4 </li>
              </div>
              <div class="styLNRightNumBox" style="width:8mm;height:4.75mm;">
                                 21
                </div>
              <div class="styLNAmountBox" style="height:4.75mm;">
                     <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8825Data/NetIncomeLoss"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;border-right-width:0px;height:5.75mm;"/>
              <div class="styLNAmountBoxNBB" style="width:31.5mm; background-color:lightgrey;border-left-width:0px;height:5.75mm; "/> 
            </div>
          </div>               
         <!-- End the amount boxes -->
         
          <!-- capturing the page bottom info -->
          <div style="width:187mm;">
            <div style="width:105mm;float:left;clear:none;">
              <span class="styBoldText"> For Paperwork Reduction Act Notice, see back of form. </span>
            </div>
            <div style="width:40mm;float:left;clear:none;">Cat. No. 10136Z</div>
            <div style="width:40mm;float:left;clear:none;">
              <span style="width:40px;"/>
              Form <span class="styBoldText">8825</span> (12-2006)
            </div>
          </div>          
          <br/>
          <br class="pageEnd"/>
          
          <!-- BEGIN Left Over Table -->  
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>      
          </div>
          
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8825Data" />
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>          
          </table>
          <!-- END Left Over Table -->
          
          <!--SEPARATED DATA -->
          <!-- Additional Data Table for separated data from Line 1 -->
          <xsl:if test="($Print = $Separated) and (count($Form8825Data/RentalIncomeExpenses) &gt;4) ">
            <span class="styRepeatingDataTitle">
              <br/>Form 8825, Line 1 - Show the kind and location of each property:
            </span>
            <table class="styDepTbl" style="font-size:7pt">
              <thead class="styTableHead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:5mm;border-right:0px">1</th>
                  <th class="styDepTblCell" style="text-align:left;border-left:0px">Show the kind and location of each property</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form8825Data/RentalIncomeExpenses">
                  <tr>
                    <!--Define background colors to the rows -->
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td class="styDepTblCell" style="text-align:center;width:5mm">
                      <span style="font-weight:bold;">
                        <xsl:number value="position()" format="A" />
                      </span>
                    </td>
                    <td class="styDepTblCell" style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="PropertyTypeAndLocation"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- End Line 1 separated data -->
          
          <!-- Additional Data Table for separated data from Lines 2-16 -->
          <xsl:if test="($Print = $Separated) and (count($Form8825Data/RentalIncomeExpenses) &gt; 4) ">
            <span class="styRepeatingDataTitle">
              <br/>Form 8825, Lines 2 through 16:
            </span>
            <xsl:for-each select="$Form8825Data/RentalIncomeExpenses">
              <xsl:variable name="pos" select="position()"/>
              <xsl:if test="position() mod 4 = 1">
                <xsl:variable name="conID" select="concat('RentTableID', $pos)"/>              
                <xsl:variable name="imgID" select="concat('RentImgID', $pos)"/>
                <xsl:variable name="btnID" select="concat('RentBtnID', $pos)"/>
                <xsl:variable name="OtherRowCount" 
                  select="(count($Form8825Data/RentalIncomeExpenses[$pos]/Other)+ 
                                count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other)+ 
                                count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) +
                                count($Form8825Data/RentalIncomeExpenses[$pos+3]/Other))"/>
                <table class="styDepTbl" style="font-size:7pt">
                  <thead class="styTableThead">
                  <!-- Header row -->
                  <tr class="styDepTblHdr">
                    <th class="styTableCellHeader" style="width:65mm;"></th>
                    <th class="styTableCellHeader" style="width:7mm;height:5mm;"><span class="styTableCellPad"></span></th>
                    <th class="styTableCellHeader" style="width:100mm;font-size:8pt;" colspan="4" scope="col">
                      Properties
                    </th>
                  </tr>
                  </thead>
                  <tfoot></tfoot>
                  <tbody>
                    <!-- Line 2 header -->
                    <tr class="styDepTblRow1">
                      <td style="width:70mm;border:none;text-align:left;padding-left:6mm;font-weight:medium;" scope="col">
                        <span class="styBoldText">Rental Real Estate Income</span>
                      </td>
                      <td class="styForm8825TableCellSmallRB " style="width:5mm;border-left-width: 0px;">
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="text-align:center;width:auto;font-weight:bold">
                        <xsl:number value="$pos" format="A"/>
                      </td>
                      <td class="styTableCellSmall" style="text-align:center;width:auto;font-weight:bold">
                        <xsl:if test="($pos + 1) &lt;= count($Form8825Data/RentalIncomeExpenses)">
                          <xsl:number value="$pos + 1" format="A"/>
                        </xsl:if>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="text-align:center;width:auto;font-weight:bold">
                        <xsl:if test="($pos + 2) &lt;= count($Form8825Data/RentalIncomeExpenses)">
                          <xsl:number value="$pos + 2" format="A"/>
                        </xsl:if>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="text-align:center;width:auto;font-weight:bold">
                        <xsl:if test="($pos + 3) &lt;= count($Form8825Data/RentalIncomeExpenses)">
                          <xsl:number value="$pos + 3" format="A"/>
                        </xsl:if>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 2 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            2
                          </div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;font-size:7pt;">
                            Gross rents
                            <span style="letter-spacing:5.5mm;font-weight:bold">........</span>  
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">
                        2<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GrossRents"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/GrossRents"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/GrossRents"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/GrossRents"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 3 -->
                    <tr class="styDepTblRow2">
                      <td style="border:none;" scope="row">
                        <div>
                          <br/>
                          <div class="styGenericDiv" style="font-size:7pt;text-align:left;font-weight:bold;padding-left:6mm">
                            Rental Real Estate Expenses
                          </div>
                          <br/>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            3
                          </div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;font-size:7pt;"> 
                            Advertising
                            <span style="letter-spacing:5mm;font-weight:bold">.........</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">
                        <br/>3<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Advertising"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Advertising"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Advertising"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt; vertical-align: bottom;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Advertising"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 4 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            4
                          </div>
                          <div class="styGenericDiv" style="width:65mm;font-size:7pt;">  
                            Auto and travel
                            <span style="letter-spacing:5.5mm;font-weight:bold">.......</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">
                        4<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AutoAndTravel"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/AutoAndTravel"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/AutoAndTravel"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" 
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/AutoAndTravel"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 5 -->
                    <tr class="styDepTblRow2">
                      <td style="border:none;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            5
                          </div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;font-size:7pt;">
                             Cleaning and maintenance
                             <span style="letter-spacing:5.5mm;font-weight:bold">.....</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">
                        5<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CleaningAndMaintenance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/CleaningAndMaintenance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/CleaningAndMaintenance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/CleaningAndMaintenance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 6 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            6
                          </div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;"> 
                            Commissions
                            <span style="letter-spacing:5.5mm;font-weight:bold">........</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        6<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Commissions"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Commissions"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Commissions"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Commissions"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 7 -->
                    <tr class="styDepTblRow2">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            7
                          </div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Insurance
                            <span style="letter-spacing:5.5mm;font-weight:bold">........</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        7<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Insurance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Insurance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Insurance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Insurance"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 8 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            8
                          </div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;font-size:7pt;"> 
                            Legal and other professional fees 
                            <span style="letter-spacing:5.5mm;font-weight:bold">...</span>                        
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-weight:bold;">
                        8<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="LegalAndOtherProfessionalFees"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/LegalAndOtherProfessionalFees"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/LegalAndOtherProfessionalFees"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/LegalAndOtherProfessionalFees"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 9 -->
                    <tr class="styDepTblRow2">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-right: 0.5mm; text-align: right;">
                            9
                          </div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Interest
                            <span style="letter-spacing:5.5mm;font-weight:bold">.........</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        9<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Interest"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Interest"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Interest"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Interest"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 10 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;">10</div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Repairs
                            <span style="letter-spacing:5.5mm;font-weight:bold">.........</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        10<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Repairs"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Repairs"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Repairs"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Repairs"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 11 -->
                    <tr class="styDepTblRow2">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;">11</div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Taxes
                            <span style="letter-spacing:5.5mm;font-weight:bold">.........</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        11<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Taxes"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Taxes"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Taxes"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Taxes"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 12 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;">12</div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Utilities
                            <span style="letter-spacing:5.5mm;font-weight:bold">.........</span>  
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        12<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Utilities"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Utilities"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Utilities"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Utilities"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 13 -->
                    <tr class="styDepTblRow2">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;">13</div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Wages and salaries
                            <span style="letter-spacing:5.5mm;font-weight:bold">......</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        13<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="WagesAndSalaries"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/WagesAndSalaries"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/WagesAndSalaries"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/WagesAndSalaries"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                    <!-- Line 14 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;">14</div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Depreciation (see instructions)
                            <span style="letter-spacing:5.5mm;font-weight:bold">...</span>  
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        14<span class="styTableCellPad"/>
                      </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="width:25mm; text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="Depreciation"/>
                        </xsl:call-template>
                      </span>                    
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Depreciation"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="width:25mm; text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Depreciation"/>
                        </xsl:call-template>
                      </span>
                      
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/Depreciation"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="width:25mm; text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Depreciation"/>
                        </xsl:call-template>
                      </span>

                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/Depreciation"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"></span>
                    </td>
                    <td class="styTableCellSmall" style="font-size:6pt;">
                      <!-- Form to Form Link -->

                      <span style="width:25mm; text-align:left;padding-bottom:0mm;">
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Depreciation"/>
                        </xsl:call-template>
                      </span>
                    
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/Depreciation"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"></span>
                    </td>                    </tr>
                    <!-- Line 15 -->
                    <xsl:variable name="RowCount" select="(
                      count($Form8825Data/RentalIncomeExpenses[$pos]/Other)+ 
                      count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other)+ 
                      count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) +
                      count($Form8825Data/RentalIncomeExpenses[$pos+3]/Other))"/>
                      <!-- This "if loop" puts empty rows when there are no 'Other' elements-->
                      <xsl:if test="$RowCount=0">
                        <xsl:choose>
                          <xsl:when test="position() mod 4=1">
                            <td style="font-size:7pt" scope="row">
                              <div class="styGenericDiv" style="width:4mm;font-weight:bold;">15</div>                                   
                              <div class="styGenericDiv" style="text-align:left;padding-left:2mm;">
                                Other (list)
                                <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                                <span class="" style="width:45mm;border-bottom:1 solid black;"></span>
                              </div>    
                            </td>
                            <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                              <span style="text:align:right;">15</span>
                              <span class="styTableCellPad"></span>
                            </td>
                            <!-- Empty columns-->                        
                            <td class="styTableCellSmall">
                              <span class="styTableCellPad"></span>
                            </td>
                            <td class="styTableCellSmall">
                              <span class="styTableCellPad"></span>
                            </td>
                            <td class="styTableCellSmall">
                              <span class="styTableCellPad"></span>
                            </td>
                            <td class="styTableCellSmall">
                              <span class="styTableCellPad"></span>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="border:none;font-size:7pt;" scope="row">
                              <div class="styGenericDiv" style="width:5mm;font-weight:bold;"/>
                              <span class="styTableCellPad"></span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                      <!-- When there are "Other" elements -->
                      <xsl:variable name="FirstCol">
                        <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos]/Other) " />
                      </xsl:variable>
                      <xsl:variable name="SecondCol">
                        <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other) " />
                      </xsl:variable>
                      <xsl:variable name="ThirdCol">
                        <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) " />
                      </xsl:variable>
                      <xsl:variable name="FourthCol">
                        <xsl:value-of select="count($Form8825Data/RentalIncomeExpenses[$pos+3]/Other) " />
                      </xsl:variable>
                      <!-- For column A-->
                      <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos]/Other">
                        <tr class="styDepTblRow2">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <td style="border:none;font-size:7pt;" scope="row">
                              <xsl:if  test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
                                <xsl:attribute name="style">
                                  border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                </xsl:attribute>
                              </xsl:if>
                              <div class="styGenericDiv" style="width:4mm;font-weight:bold;" valign="top">15</div>    
                              <div class="styGenericDiv" style="text-align:left;padding-left:2mm;">
                                Other (list) 
                                <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                                <span style="width:4px;"></span>
                                <xsl:choose>
                                  <xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
                                    <span style="width:45mm;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                      </xsl:call-template>
                                    </span>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <span style="width:45mm;border-bottom:1 solid black;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                      </xsl:call-template>
                                    </span>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </div>    
                            </td>
                            <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                              <xsl:attribute name="rowspan">
                                <xsl:value-of select="$RowCount"></xsl:value-of>
                              </xsl:attribute>
                              <span style="text:align:right;" valign="top">15</span><span class="styTableCellPad"></span>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="border:none;font-size:7pt;" scope="row">                            
                              <xsl:choose>
                                <xsl:when test="position()=last() and (($SecondCol+$ThirdCol+$FourthCol) = 0)">
                                  <xsl:attribute name="style">
                                    border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                  </xsl:attribute>
                                  <div class="styGenericDiv" style="width:4mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <div class="styGenericDiv" style="width:4mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                  <span class="styTableCellPad"></span>
                                </xsl:otherwise>
                              </xsl:choose>                           
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- For Column B-->
                    <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos+1]/Other">
                      <tr class="styDepTblRow2">
                        <xsl:choose>
                          <xsl:when test="(position()=1) and (count($Form8825Data/RentalIncomeExpenses[$pos]/Other)=0)">
                            <td style="border:none;font-size:7pt;" scope="row">
                              <xsl:if  test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
                                <xsl:attribute name="style">
                                  border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                </xsl:attribute>
                              </xsl:if>
                              <div class="styGenericDiv" style="width:5mm;font-weight:bold;" valign="top">15</div>                                          
                              <div class="styGenericDiv" style="text-align:left;padding-left:2mm;">
                                Other (list) 
                                <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                                <span style="width:4px;"></span>
                                <xsl:choose>
                                  <xsl:when test="position()=last() and (($ThirdCol+$FourthCol) = 0)">
                                    <span style="width:45mm;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                      </xsl:call-template>
                                    </span>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <span style="width:45mm;border-bottom:1 solid black;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                      </xsl:call-template>
                                    </span>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </div>    
                            </td>
                            <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                              <xsl:attribute name="rowspan">
                                <xsl:value-of select="$RowCount"> </xsl:value-of>
                              </xsl:attribute>
                              <span style="text:align:right;" valign="top">15</span><span class="styTableCellPad"></span>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="border:none;font-size:7pt;" scope="row">
                              <xsl:choose>
                                <xsl:when test="position()=last() and ($ThirdCol+$FourthCol) = 0">
                                  <xsl:attribute name="style">
                                    border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                  </xsl:attribute>
                                  <div class="styGenericDiv" style="width:5mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <div class="styGenericDiv" style="width:5mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                  <span class="styTableCellPad"></span>
                                </xsl:otherwise>
                              </xsl:choose>                           
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td class="styTableCellSmall" scope="row">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!--For Column C -->
                    <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos+2]/Other">
                      <tr class="styDepTblRow2">
                        <xsl:choose>
                          <xsl:when test="(position()=1) and 
                             ( (count($Form8825Data/RentalIncomeExpenses[$pos]/Other) + 
                                count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other) )=0)">
                            <td style="border:none;font-size:7pt;" scope="row">
                              <xsl:if  test="position()=last() and (($FourthCol) = 0)">
                                <xsl:attribute name="style">
                                  border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                </xsl:attribute>
                              </xsl:if>
                              <div class="styGenericDiv" style="width:5mm;font-weight:bold;" valign="top">15</div>                                          
                              <div class="styGenericDiv" style="text-align:left;padding-left:2mm;">
                                Other (list) 
                                <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                                <span style="width:4px;"></span>
                                <xsl:choose>
                                  <xsl:when test="position()=last() and (($FourthCol) = 0)">
                                    <span style="width:45mm;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                      </xsl:call-template>
                                    </span>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <span style="width:45mm;border-bottom:1 solid black;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                      </xsl:call-template>
                                    </span>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </div>    
                            </td>
                            <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                              <xsl:attribute name="rowspan">
                                <xsl:value-of select="$RowCount"> </xsl:value-of>
                              </xsl:attribute>
                              <span style="text:align:right;" valign="top">15</span>
                              <span class="styTableCellPad"></span>
                          </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="border:none;font-size:7pt;" scope="row">
                              <xsl:choose>
                                <xsl:when test="position()=last() and (($FourthCol) = 0)">
                                  <xsl:attribute name="style">
                                    border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                  </xsl:attribute>
                                  <div class="styGenericDiv" style="width:5mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                  </xsl:call-template>
                                  </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <div class="styGenericDiv" style="width:5mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                  <span class="styTableCellPad"></span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td class="styTableCellSmall" scope="row">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" scope="row">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall">
                          <span class="styTableCellPad"></span>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- For Column D-->
                    <xsl:for-each select="$Form8825Data/RentalIncomeExpenses[$pos+3]/Other">
                      <tr class="styDepTblRow2">
                        <xsl:choose>
                          <xsl:when test="(position()=1) and ( (
                             count($Form8825Data/RentalIncomeExpenses[$pos]/Other) + 
                             count($Form8825Data/RentalIncomeExpenses[$pos+1]/Other) + 
                             count($Form8825Data/RentalIncomeExpenses[$pos+2]/Other) )=0)">
                            <td style="border:none;font-size:7pt;" scope="row">
                              <xsl:if  test="position()=last()">
                                <xsl:attribute name="style">
                                  border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                </xsl:attribute>
                              </xsl:if>
                              <div class="styGenericDiv" style="width:5mm;font-weight:bold;" valign="top">15</div>
                              <div class="styGenericDiv" style="text-align:left;padding-left:2mm;">
                                Other (list) 
                                <img src="{$ImagePath}/8825_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
                                <span style="width:4px;"></span>
                                <xsl:choose>
                                  <xsl:when test="position()=last()">
                                    <span style="width:45mm;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                      </xsl:call-template>
                                    </span>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <span style="width:45mm;border-bottom:1 solid black;">
                                      <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </div>    
                          </td>
                          <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                            <xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"></xsl:value-of></xsl:attribute>
                            <span style="text:align:right;">15</span>
                            <span class="styTableCellPad"></span>
                          </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="border:none;font-size:7pt;" scope="row">
                              <xsl:choose>
                                <xsl:when test="position()=last()">
                                  <xsl:attribute name="style">
                                    border-right-width:0px;border-top-width:0px;border-left-width:0px;border-bottom-width:1px
                                  </xsl:attribute>
                                  <div class="styGenericDiv" style="width:5mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;border-bottom:0 solid black;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                </xsl:when>
                                <xsl:otherwise>
                                  <div class="styGenericDiv" style="width:5mm;font-weight:bold;"/>
                                  <span class="styFixedUnderline" style="width:62mm;float:left;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="OtherExpenseType"/>
                                    </xsl:call-template>
                                  </span>
                                  <span class="styTableCellPad"></span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td class="styTableCellSmall" scope="row">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" scope="row">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" scope="row">
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="font-size:6pt;" scope="row">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="OtherExpenseAmount"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <!-- Line 16 -->
                    <tr class="styDepTblRow1">
                      <td style="border:none;font-size:7pt;" scope="row">
                        <div>
                          <div class="styGenericDiv" style="width:4mm;font-weight:bold;">16</div>
                          <div class="styGenericDiv" style="text-align:left;padding-left:2mm;width:65mm;">
                            Total expenses for each property. <br/>Add lines 3 through 15
                            <span style="letter-spacing:5.5mm;font-weight:bold">.....</span>
                          </div>
                        </div>
                      </td>
                      <td class="styForm8825TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">
                        16<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TotalExpensesForProperty"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 1]/TotalExpensesForProperty"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 2]/TotalExpensesForProperty"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCellSmall" style="font-size:6pt;">
                        <br/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode"
                            select="$Form8825Data/RentalIncomeExpenses[$pos + 3]/TotalExpensesForProperty"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                  </tbody>  
                </table><br />
              </xsl:if>
            </xsl:for-each>
          </xsl:if>
          <!-- End Lines 2-16 separated data -->
          
          <!-- Additional Data Table for separated data from Line 20b -->
          <xsl:if test="($Print = $Separated) and (count($Form8825Data/IdentifyPartnershipEstateTrust) &gt;3) ">
            <span class="styRepeatingDataTitle">
              <br/>Form 8825, Line 20b - Identify below the partnerships, estates, or trusts from which net income (loss) is shown on line 20a:
            </span>
            <table class="styDepTbl" style="font-size:7pt">
              <thead class="styTableHead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell">(1) Name</th>
                  <th class="styDepTblCell">(2) Employer identification number</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form8825Data/IdentifyPartnershipEstateTrust">
                  <tr>
                    <!--Define background colors to the rows -->
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td class="styDepTblCell" style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                      </xsl:call-template>
                      <xsl:if test=" Name/BusinessNameLine2 !='' ">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styDepTblCell" style="text-align:center;padding-left:5mm;" >
                      <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- End Line 20b separated data -->
          
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="AddPositionNumber">
	<span class="styBoldText">
		<xsl:number value="position()" format="A"/>
	</span>
    </xsl:template>
</xsl:stylesheet>