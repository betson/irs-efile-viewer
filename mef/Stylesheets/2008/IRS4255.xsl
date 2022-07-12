<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS4255Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="Form4255Data" select="$RtnDoc/IRS4255" />
<xsl:template match="/">

<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form4255Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 4255" />
    
    
    
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">

      <xsl:if test="not($Print) or $Print=''">

        <xsl:call-template name="IRS4255Style"></xsl:call-template>        
        <xsl:call-template name="AddOnStyle"></xsl:call-template> 

      </xsl:if>

    </style>        
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  <body class="styBodyClass">

    <form name="Form4255">
    <!--xsl:value-of select='$PageWatermark'/-->
      <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"  />  
      <!-- END WARNING LINE -->
      <!-- Begin Form Number and Name -->
      <div class="styBB" style="width:187mm;">
        <div class="styFNBox" style="width:31mm;height:19mm;">
            Form<span class="styFormNumber"> 4255</span>
            (Rev. February 2006)
            <br/>
            <span class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br />Internal Revenue Service</span>
        </div>    
        <div class="styFTBox" style="width:125mm;height:12mm;">
          <div class="styMainTitle" style="height:8mm;padding-top:2mm;">
            Recapture of Investment Credit
          </div>
           <div class="styFST" style="height:5mm;font-size:7pt;padding-top:6mm;">
            <img src="{$ImagePath}/4255_Bullet.gif" width="4" height="7" alt="bullet image"/>
            Attach to your income tax return.
          </div>
        </div>
        <div class="styTYBox" style="width:30mm;height:19mm;">
          <div style="height:2mm;"></div>
          <div class="styOMB" style="height:1mm;">
            OMB No. 1545-0166
          </div>
                  
          <div class="stySequence" style="height:6mm;border-bottom-width:0px;padding-left:4mm;padding-top:3mm;border-left-width:0px">Attachment 			<br/>
            Sequence No. <span class="styBoldText">65</span>
          </div>
        </div>
      </div>
      <!-- End Form Number and Name section -->
      <!-- Begin Names and Identifying number section -->
      <div class="styBB" style="width:187mm;float:none;clear:none;">
        <div class="styNameBox" style="width:156mm;height:8mm;font-size:7pt;">
          Name(s) as shown on return<br/>
          <span>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
          </span>
        </div>
        <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Identifying number<br/><br/>
          <span style="width:27mm;text-align:left;font-weight:normal;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>          
          </span>
        </div>
      </div>
      <!-- End Names and Identifying number section -->      
      <div class="styBB" style="width:187mm;float:none;clear:both;">
        <div class="styTitleDesc" style="width:179mm;text-align:center;">
        </div>
        <div class="styGenericDiv" style="float:none;clear:none;width:7mm;text-align:right;border-color:black;">
           <xsl:call-template name="SetTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form4255Data/Properties/TypeOfProperty"/>
              <xsl:with-param name="containerHeight" select="4"/>
              <xsl:with-param name="containerID" select=" 'TPctn' "/>
              <xsl:with-param name="imageID" select=" 'TPimg' "/>
              <xsl:with-param name="buttonID" select=" 'TPbtn' "/>
           </xsl:call-template>
        </div>      
      </div>  
      <!-- Start Properties table -->      
      <!--<div style="width:187mm;">-->
        <div class="styTableContainer" id="TPctn" style="height:34.9mm;bottom-border:0px;">
          <xsl:call-template name="SetInitialState"/>
          <table class="styTable" cellspacing="0" name="TYTable" id="TYTable" style="border-color:black;" >
            <thead class="styTableThead">
              <tr style="height:6mm;border-color:black;">
                <th class="styTableCellHeader" style="width:25mm;font-size:7pt;"  scope="col"><span class="styBoldText">Properties</span></th>
                <th class="styTableCellHeader" style="width:162mm;font-weight:normal;font-size:7pt;text-align:left;" scope="col">
                  Type of property—State whether rehabilitation, energy, reforestation, qualifying advanced coal project, or qualifying gasification project property. (See the Instructions for Form 3468 for the year the investment
credit property was placed in service for definitions.) If rehabilitation property, also show type of building. If energy property, show type.
                </th>
              </tr>
            </thead>
            <tfoot></tfoot>
            <tbody>
              <xsl:if test="($Print != $Separated) or (count($Form4255Data/Properties) &lt;= 4) "> 
                  <xsl:for-each select="$Form4255Data/Properties">
                    <tr style="height:6mm;font-size:7pt;">
                      <td class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;border-color:black;">
                       <xsl:if test="position() = last() and (count($Form4255Data/Properties) &gt; 3)" >
                            <xsl:attribute name="style">text-align:center;width:25mm;font-weight:bold;border-color:black;border-bottom:0px;</xsl:attribute>
                      </xsl:if>
                      <xsl:number value="position()" format="A" />
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styTableCell" style="text-align:left;width:162mm;border-color:black;">
                      <xsl:if test="position() = last() and (count($Form4255Data/Properties) &gt; 3)"  >
                            <xsl:attribute name="style">text-align:left;width:162mm;border-color:black;border-bottom:0px;</xsl:attribute>
                      </xsl:if>
                        <span class="styTableCellPad"></span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfProperty" />
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                </xsl:for-each>
              </xsl:if>
            <xsl:if test="count($Form4255Data/Properties) &lt; 1 or ((count($Form4255Data/Properties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
                <td  class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;">A<span class="styTableCellPad"></span></td>
                <td  class="styTableCell" style="text-align:left;width:162mm;">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties"/>                      
                  </xsl:call-template>
                <span class="styTableCellPad"></span></td>
              </tr>
            </xsl:if>
            <xsl:if test="count($Form4255Data/Properties) &lt; 2 or ((count($Form4255Data/Properties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
                <td  class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;">B<span class="styTableCellPad"></span></td>
                <td  class="styTableCell" style="text-align:left;width:162mm;"><span class="styTableCellPad"></span></td>
              </tr>
            </xsl:if>
            <xsl:if test="count($Form4255Data/Properties) &lt; 3 or ((count($Form4255Data/Properties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
                <td  class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;">C<span class="styTableCellPad"></span></td>
                <td  class="styTableCell" style="text-align:left;width:162mm;"><span class="styTableCellPad"></span></td>
              </tr>
            </xsl:if>          
            <xsl:if test="count($Form4255Data/Properties) &lt; 4 or ((count($Form4255Data/Properties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
                <td  class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;bottom-border:0px;">
                            D<span class="styTableCellPad"></span></td>
                <td  class="styTableCell" style="text-align:left;width:162mm;"><span class="styTableCellPad"></span></td>
              </tr>
            </xsl:if>          
          </tbody>            
          </table>
        </div>
      <!--</div>-->  
      
      <div class="styBB" style="width:187mm;">
        <div class="styPartDesc" style="text-align:center;width:187mm;">
          Original Investment Credit
        </div>
        <xsl:if test="count($Form4255Data/Properties) &gt; 4">
          <div class="styBoldText" style="text-align:left;font-size:7pt;">
            Note : The following table could repeat if it has more data.
          </div>
        </xsl:if>
      </div>
      <xsl:if test="$Form4255Data/Properties">
      <xsl:if test="$Print != $Separated or count($Form4255Data/Properties) &lt;= 4">
      <xsl:for-each select="$Form4255Data/Properties">
        <xsl:variable name="pos" select="position()"/>
        <xsl:if test="position() mod 4 = 1">
          <div class = "styTableContainerNBB" style="height:58mm;">
            <table class ="styTable" cellspacing="0" style="border-color:black;">
              <tr>
                <th class="styTableCellHeader" style="width:65mm;border:none;font-size:7pt;text-align:left;padding-left:6mm;height:5mm;border-color:black;"                       scope="col">
                  Computation Steps:
                </th>
                <th class="styIRS4255TableCellSmallRB" style="width:8mm;background-color:lightgrey;height:5mm;border-color:black;border-bottom-width:0px;">
                 <xsl:if test="position()  &gt; 4" >
                  <xsl:attribute name="style">border-top-width:1px;width:8mm;color:lightgrey;background-color:lightgrey;height:5mm;border-color:black;border-bottom-width:0px;</xsl:attribute>
                  </xsl:if>
                     <span  class="styTableCellPad"></span>
                </th>
                  
                <th class="styTableCellHeader" style="width:100mm;font-size:8pt;border-top-width: 0px;border-bottom-width: 1px;border-color:black;" colspan="4" scope="col">
                  <xsl:if test="position()  &gt; 4" >
                  <xsl:attribute name="style">border-top-width:1px;width:100mm;font-size:7pt;border-bottom-width: 1px;border-color:black;</xsl:attribute>
                  </xsl:if>
                Properties
                </th>
              </tr>
              <tr>
                <th style="width:70mm;border:none;font-size:7pt;text-align:left;padding-left:6mm;font-weight:normal;height:5mm" >
                  (see Specific Instructions)
                </th>
                <th class="styIRS4255TableCellSmallRB " style="width:5mm;background-color:lightgrey;height:5mm;border-color:black;">
                 <xsl:if test="position()  &gt; 4" >
                  <xsl:attribute name="style">border-top-width:0px;width:5mm;color:lightgrey;background-color:lightgrey;height:5mm;border-color:black;</xsl:attribute>
                  </xsl:if>

                  <span class="styTableCellPad"></span>
                </th>
                <xsl:for-each select="$Form4255Data/Properties">  
                  <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
                    <td class="styTableCellSmall" style="text-align:center;font-weight:bold;border-color:black;">
                   <xsl:number value="position()" format="A" /><span class="styTableCellPad"></span>
                    </td>
                  </xsl:if>
                </xsl:for-each>
                  <xsl:if test="count($Form4255Data/Properties[position() &gt;= $pos  and position() &lt; $pos+4]) = 1">
                    <xsl:choose>
                      <xsl:when test="count($Form4255Data/Properties) &lt; 2">
                        <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">B<span class="styTableCellPad"></span></td>
                        <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"></span></td>
                        <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"></span></td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td  class="styTableCellSmall" style="border-color:black;"><span class="styTableCellPad"></span></td>
                        <td  class="styTableCellSmall" style="border-color:black;"><span class="styTableCellPad"></span></td>
                        <td  class="styTableCellSmall" style="border-color:black;"><span class="styTableCellPad"></span></td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                  <xsl:if test="count($Form4255Data/Properties[position() &gt;= $pos  and position() &lt; $pos+4]) = 2">
                    <xsl:choose>
                      <xsl:when test="count($Form4255Data/Properties) &lt; 3">
                        <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"></span></td>
                        <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"></span></td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                        <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                  <xsl:if test="count($Form4255Data/Properties[position() &gt;= $pos  and position() &lt; $pos+4]) = 3">
                    <xsl:choose>
                      <xsl:when test="count($Form4255Data/Properties) &lt; 4">
                        <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"></span></td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td  class="styTableCellSmall"><span class="styTableCellPad"></span></td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>          
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">1</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">
                       Original rate of credit
                      <span class="styBoldText">
                        <span style="width:12px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;border-color:black;">1<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="OriginalRateOfCredit" />
                  </xsl:call-template>
                  <!--span class="styTableCellPad"></span-->
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                                   1]/OriginalRateOfCredit" />
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/OriginalRateOfCredit" />
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/OriginalRateOfCredit" />
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">2</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">  Cost or other basis
                      <span class="styBoldText">
                        <span style="width:6px;"></span>
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
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;border-style: solid; border-color: black;">2<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>  
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">3</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">
                       Original credit.  Multiply line 2 by the percentage on line 1
                      <span class="styBoldText">
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;border-style: solid; border-color: black;padding-top:3mm;">3<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>  
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>  
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">4</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Date property was placed in service
                      <span class="styBoldText">
                        <span style="width:5px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-style: solid; border-color: black;">4<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">5</div>
                    <div  class ="styGenericDiv" style="width:68mm;">
                       Date property ceased to be qualified investment credit property                                <span class="styBoldText">
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-style: solid; border-color: black;padding-top:3mm;">5<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;text-align:center;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>              
              </tr>              
              <tr>
                <td class ="styIRS4255TableCellSmallBB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">6</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Number of full years between the date on line 4 and the date on line 5                              <span class="styBoldText">
                        <span style="width:10px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-style: solid; border-color: black;padding-top:3mm;">6<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>              
              </tr>
              <tr style="height:2mm;">
                <td style="text-align:center;" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
                    <div style="height:1mm;font-size:8pt;font-weight:bold;">
                      Recapture Tax
                    </div>
                  </div>
                </td>
              </tr>            
              <tr>
                <td class="styIRS4255TableCellSmallTB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">7</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Recapture percentage (see instructions)
                      <span class="styBoldText">
                        <span style="width:10px;"></span>
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;border-top-width: 1px;font-size:7pt;font-weight:bold;border-style: solid; border-color: black;">7<span                     class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:6pt;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="RecapturePercentage" />
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:6pt;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/RecapturePercentage" />
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:6pt;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/RecapturePercentage" />
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:6pt;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/RecapturePercentage" />
                  </xsl:call-template>
                </td>              
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">8</div>
                    <div  class ="styGenericDiv" style="width:68mm;">
                       Tentative recapture tax.  Multiply line 3 by the percentage on line 7                              <span class="styBoldText">
                        <span style="width:15px;"></span>.
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
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;border-style: solid; border-color: black;padding-top:3mm;">8<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
              </tr>
            </table>  
          </div>
          <!--xsl:value-of select="$Form4255Data/Properties[$pos + 4]" /-->
            <xsl:if test="$Form4255Data/Properties[$pos + 4]" >
              <br />
            </xsl:if>
        </xsl:if>
      </xsl:for-each>  
    </xsl:if>
  </xsl:if>
    <xsl:if test="not($Form4255Data/Properties) or ((count($Form4255Data/Properties) &gt; 4) and ($Print = $Separated))">
          <div class = "styIRS4255TableContainerNBB" style="height:57mm;">
            <table class ="styTable" cellspacing="0" >
              <tr>
                <th class="styTableCellHeader" style="width:65mm;border:none;font-size:7pt;text-align:left;padding-left:6mm;"                       scope="col">
                  Computation Steps
                </th>
                <th class="styIRS4255TableCellSmallRB" style="width:8mm;color:lightgrey;background-color:lightgrey;height:5mm;">                      <span class="styTableCellPad"></span>
                </th>
                <th class="styTableCellHeader" style="width:100mm;font-size:7pt;border-top-width: 1px;" colspan="4" scope="col">
                  Properties
                </th>
              </tr>
              <tr>
                <th style="width:70mm;border:none;font-size:7pt;text-align:left;padding-left:6mm;font-weight:medium;" >
                  (See Specific Instructions)
                </th>
                <th class="styIRS4255TableCellSmallRB " style="width:5mm;background-color:lightgrey;height:3mm;">
                  <span class="styTableCellPad"></span>
                </th>
                <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">A<span class="styTableCellPad"></span></td>
                <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">B<span class="styTableCellPad"></span></td>
                <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"></span></td>
                <td  class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"></span></td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">1</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">
                       Original rate of credit
                      <span class="styBoldText">
                        <span style="width:12px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">1<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;text-align:left;">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties"/>    
                    <xsl:with-param name="ShortMessage" select="'true'" />                  
                  </xsl:call-template>
                <span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">2</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">  Cost or other basis
                      <span class="styBoldText">
                        <span style="width:6px;"></span>
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
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">2<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">3</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">
                       Original credit.  Multiply line 2 by the percentage on line 1
                      <span class="styBoldText">
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">3<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">4</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Date property was placed in service
                      <span class="styBoldText">
                        <span style="width:5px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">4<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">5</div>
                    <div  class ="styGenericDiv" style="width:68mm;">
                       Date property ceased to be qualified investment credit property                                          <span class="styBoldText">
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">5<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>              
              </tr>              
              <tr>
                <td class ="styIRS4255TableCellSmallBB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">6</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Number of full years between the date on line 4 and the date on line 5                                        <span class="styBoldText">
                        <span style="width:10px;"></span>.
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
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">6<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>              
              </tr>
              <tr style="height:2mm;">
                <td style="text-align:center;" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
                    <div style="height:1mm;font-size:8pt;font-weight:bold;">
                      Recapture Tax
                    </div>
                  </div>
                </td>
              </tr>            
              <tr>
                <td class="styIRS4255TableCellSmallTB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">7</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Recapture percentage (see instructions)
                      <span class="styBoldText">
                        <span style="width:10px;"></span>
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;border-top-width: 1px;font-size:7pt;font-weight:bold;">7<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style = "border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"></span></td>              
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">8</div>
                    <div  class ="styGenericDiv" style="width:68mm;">
                       Tentative recapture tax.  Multiply line 3 by the percentage on line 7                                        <span class="styBoldText">
                        <span style="width:15px;"></span>.
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
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">8<span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"></span></td>
              </tr>
            </table>        
          </div>  
</xsl:if>    
      <!-- Begin the amount boxes -->    
      <div class="styBB" style="width:187mm;">
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:3.5mm">
            9
          </div>
          <div class="styLNDesc" style="width:141mm;height:3.5mm;">
            Add all the amounts on line 8
            <!-- Adding pen image -->
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Line 9 - Note</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4255Data/TentativeRecaptureTaxTotal/@note"/>
            </xsl:call-template>  
            <!--Dotted Line-->
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
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <!--span style="width:16px;"></span>.-->
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:3.5mm;">
          9
          </div>
          <div class="styLNAmountBox" >        
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/TentativeRecaptureTaxTotal" />                    </xsl:call-template>
          </div>
        </div>
        
        <!-- line 10 -->
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="padding-left:0mm;width:5mm;">
            10
          </div>
          <div class="styLNDesc" style="width:141mm;">
            Enter the recapture tax from property for which there was an increase in nonqualified nonrecourse
            financing (attach separate computation)
            <!-- set the push pin image -->
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form4255Data/NonqualifedFinanceRecaptureTax" />
              <xsl:with-param name="TabOrder" select="2"/>
            </xsl:call-template>
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:14px;"></span>.
              <span style="width:15px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:15px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:15px;"></span>.
              <span style="width:15px;"></span>.
              <span style="width:15px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:15px;"></span>.
              <span style="width:15px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
               <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <!--span style="width:16px;"></span>.-->
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:8mm;">
            10
          </div>
          <div class="styLNAmountBox" style="height:8mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/NonqualifedFinanceRecaptureTax" />                    </xsl:call-template>
          </div>
        </div>
        
        <!-- line 11 -->
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;width:5mm;">
            11
          </div>
          <div class="styLNDesc" style="width:141mm;height:4mm;">
            Add lines 9 and 10
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:3px;"></span>
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:15px;"></span>.
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
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
          </span>
          </div>
          <div class="styLNRightNumBox">
            11
          </div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureTaxSubtotal" />                    </xsl:call-template>
          </div>
        </div>
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;width:5mm;">
            12
          </div>
          <div class="styLNDesc" style="width:141mm;height:4mm;">
            Portion of original credit (line 3) not used to offset tax in any year, plus any carryback and carryforward<br/>
            of credits you now can apply to the original credit year because you have freed up tax liability in
            the <br/>amount of the tax recaptured. Do not enter more than line 11—see instructions        
            <!--Dotted Line-->
            <span class="styBoldText">
             <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;">
            12
          </div>
          <div class="styLNAmountBox" style="height:10.5mm;padding-top:6.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/NonOffsetTaxOfOriginalCredit" />                      </xsl:call-template>
          </div>
        </div>
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;width:5mm;">
            13
          </div>
          <div class="styLNDesc" style="width:141mm;height:4mm;">
            Total increase in tax. Subtract line 12 from line 11. Enter here and on the appropriate line of your
            tax return. See section 45K(b)(4) if you claim the nonconventional source fuel credit. Electing large
            partnerships, see instructions
            <span class="styBoldText">
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
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
          </span>
          </div>
          <div class="styLNRightNumBoxNBB" style="height:10.5mm;padding-top:6.5mm;">
            13
          </div>
          <div class="styLNAmountBoxNBB" style="height:10.5mm;padding-top:6.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/TotalIncreaseInTax" />                    </xsl:call-template>
          </div>
        </div>
      </div>
      <!-- End the amount boxes -->
    
      <!-- capturing the page bottom info -->
      <div style="width:187mm; font-size:7pt;  border-top:1 solid black; padding-top:0.5mm">    
        <div style="float:left; font-size:8pt">
          <b>For Paperwork Reduction Act Notice, see back of form.</b>
        </div>    
        <div style="float:right">
        Cat. No. 41488C
        <span style="width:15mm"></span>
        Form <b style="font-size:9pt">4255</b> (Rev. 2-2006)
        </div>      
      </div> 
   
  
      
  <!-- Add page end -->
  <p class="pageend"></p>
  
<!-- Begininning of write-in data -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$Form4255Data" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Line 9 - Note</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form4255Data/TentativeRecaptureTaxTotal/@note"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
    <!-- Begin SRD for Properties table -->
    <xsl:if test="($Print = $Separated) and (count($Form4255Data/Properties) &gt; 4)">
      <span class="styRepeatingDataTitle">Form 4255 - Type of Property </span>
             <table class="styDepTbl" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt;">
            <thead class="styTableThead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" style="width:25mm;font-size:7pt;"  scope="col"><span class="styBoldText">Properties</span></th>
                <th class="styDepTblCell" style="width:162mm;text-align:left;" scope="col">
                  Type of property-State whether rehabilitation, energy, reforestation, or transition property. (See the Instructions for Form 3468 for the year the investment credit property was placed in service for definitions.) If rehabilitation property, also show type of building. If energy property, show type.
                </th>
              </tr>
            </thead>
            <tfoot></tfoot>
            <tbody>
                  <xsl:for-each select="$Form4255Data/Properties">
                    <tr>
                      <xsl:attribute name="class">
                        <xsl:choose>
                           <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                           <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <td class="styDepTblCell" style="text-align:center;width:25mm;font-weight:bold;">
                        <xsl:number value="position()" format="A" />
                        <span class="styTableCellPad"></span>
                      </td>
                      <td class="styDepTblCell" style="text-align:left;width:162mm;">
                        <span class="styTableCellPad"></span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfProperty" />
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>
                    </tr>
                </xsl:for-each>
          </tbody>            
          </table>
              </xsl:if>
              <br />
              
        <!-- Second Table -->
  
      <xsl:if test="$Print = $Separated and count($Form4255Data/Properties) &gt; 4">
      <span class="styRepeatingDataTitle">Form 4255 - Original Investment Credit:</span>
      <xsl:for-each select="$Form4255Data/Properties">
        <xsl:variable name="pos" select="position()"/>
        <xsl:if test="position() mod 4 = 1">
            <table class ="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <tr class="styDepTblHdr">
                <th class="styDepTblcell" style="width:65mm;text-align:left;padding-left:6mm;"                       scope="col">
                  Computation Steps:
                </th>
                <th class="styDepTblcell" style="width:8mm;;height:5mm;">                     <span  class="styTableCellPad"></span>
                </th>
                <th class="styDepTblcell" style="width:100mm;font-size:7pt;border-top-width: 1px;" colspan="4" scope="col">
                  Properties
                </th>
              </tr>
              <tr class="styDepTblHdr">
                <th style="width:70mm;text-align:left;padding-left:6mm;height:5mm;border-right-width:0px;" class="styDepTblcell">
                  (see Specific Instructions)
                </th>
                <th class="styDepTblcell" style="width:5mm;height:5mm;">
                  <span class="styTableCellPad"></span>
                </th>
                    <td class="styDepTblcell" style="text-align:center;font-weight:bold;">
                      <xsl:number value="position()" format="A" /><span class="styTableCellPad"></span>
                    </td>
                    <td class="styDepTblcell" style="text-align:center;font-weight:bold;border-left-width:0px;">
                      <xsl:number value="position()+1" format="A" /><span class="styTableCellPad"></span>
                    </td>
                    <td class="styDepTblcell" style="text-align:center;font-weight:bold;border-left-width:0px;">
                      <xsl:number value="position()+2" format="A" /><span class="styTableCellPad"></span>
                    </td>
                    <td class="styDepTblcell" style="text-align:center;font-weight:bold;border-left-width:0px;">
                      <xsl:number value="position()+3" format="A" /><span class="styTableCellPad"></span>
                    </td>
              </tr>
              <tr class="styDepTblRow1">
                <td scope="row" class ="styDepTblcell">
                  <div>
                    <div class ="styGenericdiv" style="width:5mm;font-weight:bold;text-align:left;">1</div>
                    <div  class ="styGenericdiv" style="width:68mm;border-left-width:0px;">
                       Original rate of credit
                      <span class="styBoldText">
                        <span style="width:12px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
            
                
                <td class="styDepTblcell" style="width:5mm;font-size:7pt;font-weight:bold;">1<span class="styTableCellPad"></span></td>
                <td class="styDepTblcell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="OriginalRateOfCredit" />
                  </xsl:call-template>
                  <!--span class="styTableCellPad"></span-->
               
                </td>
                <td class="styDepTblcell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                                   1]/OriginalRateOfCredit" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblcell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/OriginalRateOfCredit" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblcell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/OriginalRateOfCredit" />
                  </xsl:call-template>
                </td>
              </tr>
              <tr class ="styDepTblRow2">
                <td scope="row" class="styDepTblCell">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">2</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">  Cost or other basis
                      <span class="styBoldText">
                        <span style="width:6px;"></span>
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
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;font-weight:bold;">2<span class="styTableCellPad"></span></td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell"  style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>  
                </td>
                <td class="styDepTblCell"  style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell"  style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/CostOrOtherBasis" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
              </tr>
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">3</div>
                    <div  class ="styGenericDiv" style="width:68mm;font-size:7pt;">
                       Original credit.  Multiply line 2 by the percentage on line 1
                      <span class="styBoldText">
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;font-weight:bold;">3<span class="styTableCellPad"></span></td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>  
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>  
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/OriginalCredit" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">4</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Date property was placed in service
                      <span class="styBoldText">
                        <span style="width:5px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;font-weight:bold;">4<span class="styTableCellPad"></span></td>
                <td class="styDepTblCell" style="font-size:6pt;width:25mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;width:25mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;width:25mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;width:25mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/DatePropertyPlacedInService" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
              </tr>
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">5</div>
                    <div  class ="styGenericDiv" style="width:68mm;text-align:left;">
                    Date property ceased to be qualified
investment credit property
                    <span class="styBoldText">
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:17px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:17px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;font-weight:bold;">5<span class="styTableCellPad"></span></td>
                <td class="styDepTblCell" style="font-size:6pt;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/DatePropertyCeasedToQualify" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>              
              </tr>              
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">6</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Number of full years between the date on line 4 and the date on line 5                              <span class="styBoldText">
                        <span style="width:10px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:15px;"></span>.
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;">6<span class="styTableCellPad"></span></td>
                <td class="styDepTblCell" style="font-size:6pt;;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2" />
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/YearsPropertyQualified" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>              
              </tr>
              <tr style="height:2mm;" class="styDepTblRow1">
                <td style="text-align:center;" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
                    <div style="height:1mm;font-size:8pt;font-weight:bold;">
                      Recapture Tax
                    </div>
                  </div>
                </td>
              </tr>            
              <tr  class="styDepTblRow2">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">7</div>
                    <div  class ="styGenericDiv" style="width:68mm;"> 
                      Recapture percentage (see instructions)
                      <span class="styBoldText">
                        <span style="width:10px;"></span>
                        <span style="width:16px;"></span>.
                        <span style="width:16px;"></span>.
                      </span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;">7</td>
                <td class="styDepTblCell" style = "text-align:right;font-size:6pt;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="RecapturePercentage" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style = "text-align:right;font-size:6pt;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/RecapturePercentage" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style = "text-align:right;font-size:6pt;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/RecapturePercentage" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style = "font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"></span>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/RecapturePercentage" />
                  </xsl:call-template>
                </td>              
              </tr>
              <tr class="styDepTblRow1">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class ="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">8</div>
                    <div  class ="styGenericDiv" style="width:68mm;text-align:left;"> 
                       Tentative recapture tax.  Multiply line 3 by the percentage on line 7                              
                       <span class="styBoldText">
                        <span style="width:15px;"></span>.
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
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;">8</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         1]/TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         2]/TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/Properties[$pos +                         3]/TentativeRecaptureTax" />
                  </xsl:call-template>
                  <span class="styTableCellPad"></span>
             
            
              </td>
              </tr>
            </table>  
            <br />      
        </xsl:if>
      </xsl:for-each>  
  </xsl:if>
    </form>
  </body>
  </html>
</xsl:template>

<xsl:template name="AddPositionNumber">
  <xsl:if test="position()=1">
    A
  </xsl:if>
  <xsl:if test="position()=2">
    B
  </xsl:if>
  <xsl:if test="position()=3">
    C
  </xsl:if>
  <xsl:if test="position()=4">
    D
  </xsl:if>
</xsl:template>

</xsl:stylesheet>

           
