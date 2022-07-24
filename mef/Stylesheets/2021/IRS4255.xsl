<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS4255Style.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="Form4255Data" select="$RtnDoc/IRS4255"/>
<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form4255Data)"/></xsl:call-template>
    </title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="Description" content="IRS Form 4255"/>
 
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
    <style type="text/css">

      <xsl:if test="not($Print) or $Print=''">

        <xsl:call-template name="IRS4255Style"/>
        <xsl:call-template name="AddOnStyle"/>

      </xsl:if>

    </style>        
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  <body class="styBodyClass">

    <form name="Form4255">
    <!--xsl:value-of select='$PageWatermark'/-->
      <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"/>  
      <!-- END WARNING LINE -->
      <!-- Begin Form Number and Name -->
      <div class="styBB" style="width:187mm;">
        <div class="styFNBox" style="width:30mm;height:18mm;">
            Form<span class="styFormNumber"> 4255</span>
            (Rev. December 2016)
            <br/>
            <span class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br/>Internal Revenue Service</span>
        </div>    
        <div class="styFTBox" style="width:125mm;height:12mm;">
          <div class="styMainTitle" style="height:8mm;padding-top:2mm;">
            Recapture of Investment Credit          
        </div>
              <br/>
               <img src="{$ImagePath}/4255_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
	       <b>Attach to your income tax return.</b>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:.5mm;">
                <img src="{$ImagePath}/4255_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
          Information about Form 4255 and its separate instructions is at <a href="http://www.irs.gov/form4255" title="Link to IRS.gov">
          <i>www.irs.gov/form4255</i></a>.
        </div>
        </div>
        <div class="styTYBox" style="width:30mm;height:18mm;">
          <!--<div style="height:2mm;"/>-->
          <div class="styOMB" style="height:8mm;padding-top:2mm;">
            OMB No. 1545-0166
          </div>
                  
          <div class="stySequence" style="height:6mm;border-bottom-width:0px;padding-left:4mm;padding-top:3mm;border-left-width:0px">
          Attachment
          <br/>
            Sequence No. <span class="styBoldText">172</span>
          </div>
        </div>
      </div>
      <!-- End Form Number and Name section -->
      <!-- Begin Names and Identifying number section -->
      <div class="styBB" style="width:187mm;float:none;clear:none;">
        <div class="styNameBox" style="width:155.3mm;height:9mm;font-size:7pt;">
          Name(s) as shown on return<br/>
 		  <xsl:choose>
			  <!-- This process changed 170509 by gdy per UWR 194393 -->
            <!--Business Name from F1120 Return Header-->
		    <xsl:when test="$RtnHdrData/Filer/BusinessName">
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
              </xsl:call-template>
		      <br/>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <!--Individual Name from F1040/NR Return Header-->
		    <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
				<br/>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
		              </xsl:call-template>
            </xsl:when>
            <!--Business Name from F1041 Return Header-->
		    <xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
              </xsl:call-template>
		      <br/>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
              </xsl:call-template>            
            </xsl:when>
            <!--National Morgage Association Code from F1041 Return Header-->
		    <xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
		    <br/>
		      <xsl:call-template name="PopulateReturnHeaderFiler">
		            <xsl:with-param name="TargetNode">NationalMortgageAssocCd</xsl:with-param>
              </xsl:call-template>
            </xsl:when>
          </xsl:choose>
         </div>
        <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Identifying number<br/><br/>
          <span style="width:27mm;text-align:center;font-weight:normal;">
			<xsl:choose>
			  <!-- This process changed 170509 by gdy per UWR 194393 -->
			  <xsl:when test="$RtnHdrData/Filer/PrimarySSN">
				 <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
				 </xsl:call-template>
			  </xsl:when>
			  <xsl:when test="$RtnHdrData/Filer/SSN">
				 <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">SSN</xsl:with-param>
				 </xsl:call-template>
			  </xsl:when>
			  <xsl:when test="$RtnHdrData/Filer/EIN">
				 <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">EIN</xsl:with-param>
				 </xsl:call-template>
			  </xsl:when>
			  <xsl:otherwise>
			  </xsl:otherwise>
			</xsl:choose>
           </span>
        </div>
      </div>
      <!-- End Names and Identifying number section -->      
      <div class="styBB" style="width:187mm;float:none;clear:both">
        <div class="styTitleDesc" style="width:179mm;text-align:center;">
        </div>
        <div class="styGenericDiv" style="float:none;clear:none;width:7mm;text-align:right;border-color:black;">
           <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties/PropertyDesc"/>
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
          <table class="styTable" cellspacing="0" name="TYTable" id="TYTable" style="border-color:black;">
            <thead class="styTableThead">
              <tr style="height:6mm;border-color:black;">
                <th class="styTableCellHeader" style="width:25mm;font-size:7pt;" scope="col"><span class="styBoldText">Properties</span></th>
                <th class="styTableCellHeader" style="width:162mm;font-weight:normal;font-size:7pt;text-align:left;" scope="col">
                  Type of property—State whether rehabilitation, energy, qualifying advanced coal project, qualifying gasification project, qualifying 
                  advanced energy 
                  project, or qualifying therapeutic discovery project property. (See the Instructions for Form 3468 for the year the investment
				  credit property was placed in service for definitions.) If rehabilitation property, also show type of building. If energy property, show type.
                </th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
              <xsl:if test="($Print != $Separated) or (count($Form4255Data/RecaptureOfInvstCrProperties) &lt;= 4) "> 
                  <xsl:for-each select="$Form4255Data/RecaptureOfInvstCrProperties">
                    <tr style="height:6mm;font-size:7pt;">
                      <td class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;border-color:black;">
                       <xsl:if test="position() = last() and (count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 3)">
                            <xsl:attribute name="style">text-align:center;width:25mm;font-weight:bold;border-color:black;border-bottom:0px;</xsl:attribute>
                      </xsl:if>
                      <xsl:number value="position()" format="A"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="text-align:left;width:162mm;border-color:black;">
                      <xsl:if test="position() = last() and (count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 3)">
                            <xsl:attribute name="style">text-align:left;width:162mm;border-color:black;border-bottom:0px;</xsl:attribute>
                      </xsl:if>
                        <span class="styTableCellPad"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                </xsl:for-each>
              </xsl:if>
            <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties) &lt; 1 or 
            ((count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
                <td class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;">A<span class="styTableCellPad"/></td>
                <td class="styTableCell" style="text-align:left;width:162mm;">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties"/>                      
                  </xsl:call-template>
                <span class="styTableCellPad"/></td>
              </tr>
            </xsl:if>
            <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties) &lt; 2 or
            ((count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
                <td class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;">B<span class="styTableCellPad"/></td>
                <td class="styTableCell" style="text-align:left;width:162mm;"><span class="styTableCellPad"/></td>
              </tr>
            </xsl:if>
            <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties) &lt; 3 or 
            ((count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
                <td class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;">C<span class="styTableCellPad"/></td>
                <td class="styTableCell" style="text-align:left;width:162mm;"><span class="styTableCellPad"/></td>
              </tr>
            </xsl:if>          
            <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties) &lt; 4 or 
            ((count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4) and ($Print = $Separated))">
              <tr style="height:6mm;font-size:7pt;">
              <td class="styTableCell" style="text-align:center;width:25mm;font-weight:bold;bottom-border:0px;">D<span class="styTableCellPad"/>
              </td>
                <td class="styTableCell" style="text-align:left;width:162mm;"><span class="styTableCellPad"/></td>
              </tr>
            </xsl:if>          
          </tbody>            
          </table>
        </div>
      <!--</div>-->  
      
      <div class="styBB" style="width:187mm">
        <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4">
          <div class="styBoldText" style="text-align:left;font-size:7pt;">
          <!--  Note : The following table could repeat if it has more data. -->
          </div>
        </xsl:if>
      </div>
      <xsl:if test="$Form4255Data/RecaptureOfInvstCrProperties">
      <xsl:if test="$Print != $Separated or count($Form4255Data/RecaptureOfInvstCrProperties) &lt;= 4">
      <xsl:for-each select="$Form4255Data/RecaptureOfInvstCrProperties">
        <xsl:variable name="pos" select="position()"/>
        <xsl:if test="position() mod 4 = 1">
          <div class="styTableContainerBB" style="height:150mm">
				<div class="styPartName" style="width:13mm;height:5mm;padding-top:.5mm;font-size:8pt;">Part I</div>
					<div class="styPartDesc" style="text-align:center;width:169mm;height:5mm;padding-top:1mm">
						  Original Investment Credit
				</div>
            <table class="styTable" cellspacing="0" style="border-color:black;">
              <tr>
                <th class="styTableCellHeader" style="width:65mm;border-top-width:1px;border-bottom-width:0px;border-right:0px;
					font-size:7pt;text-align:left;padding-left:6mm;height:5mm;border-color:black;" scope="col">
                </th>
                <th class="styIRS4255TableCellSmallRB" style="width:8mm;background-color:lightgrey;height:5mm;border-color:black;border-bottom-width:0px;
					border-top-width:1px">
                 <xsl:if test="position()  &gt; 4">
                  <xsl:attribute name="style">border-top-width:1px;width:8mm;color:lightgrey;background-color:lightgrey;height:5mm;
                  border-color:black;border-bottom-width:0px;
                  </xsl:attribute>
                  </xsl:if>
                     <span class="styTableCellPad"/>
                </th>
                  
                <th class="styTableCellHeader" style="width:120mm;font-size:8pt;border-top-width:1px;
                border-bottom-width: 1px;border-color:black;" colspan="4" scope="col">
                  <xsl:if test="position()  &gt; 4">
                  <xsl:attribute name="style">border-top-width:1px;width:120mm;font-size:8pt;border-bottom-width:1px;border-color:black;
                  </xsl:attribute>
                  </xsl:if>
                Properties
                </th>
              </tr>
              <tr>
                <th style="width:70mm;border:none;font-size:7pt;text-align:left;padding-left:4mm;font-weight:bold;height:5mm">
                  These columns relate to the properties A through D described above:
					<!-- Dotted Line and right arrow-->
					<span class="styDotLn" style="float:none;padding-left:2mm">...</span>							
					<img src="{$ImagePath}/4255_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
					<!-- End Dotted Line and right arrow-->
                </th>
                <th class="styIRS4255TableCellSmallRB " style="width:5mm;background-color:lightgrey;height:5mm;border-color:black;">
                 <xsl:if test="position()  &gt; 4">
                  <xsl:attribute name="style">
                  border-top-width:0px;width:5mm;color:lightgrey;background-color:lightgrey;height:5mm;border-color:black;
                  </xsl:attribute>
                  </xsl:if>

                  <span class="styTableCellPad"/>
                </th>
                <xsl:for-each select="$Form4255Data/RecaptureOfInvstCrProperties">  
                  <xsl:if test="(position() &gt;= $pos and position() &lt; $pos+4)">
                    <td class="styTableCellSmall" style="text-align:center;font-weight:bold;border-color:black;">
                   <xsl:number value="position()" format="A"/><span class="styTableCellPad"/>
                    </td>
                  </xsl:if>
                </xsl:for-each>
                  <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties[position() &gt;= $pos  and position() &lt; $pos+4]) = 1">
                    <xsl:choose>
                      <xsl:when test="count($Form4255Data/RecaptureOfInvstCrProperties) &lt; 2">
                        <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">B<span class="styTableCellPad"/></td>
                        <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"/></td>
                        <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"/></td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall" style="border-color:black;"><span class="styTableCellPad"/></td>
                        <td class="styTableCellSmall" style="border-color:black;"><span class="styTableCellPad"/></td>
                        <td class="styTableCellSmall" style="border-color:black;"><span class="styTableCellPad"/></td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                  <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties[position() &gt;= $pos  and position() &lt; $pos+4]) = 2">
                    <xsl:choose>
                      <xsl:when test="count($Form4255Data/RecaptureOfInvstCrProperties) &lt; 3">
                        <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"/></td>
                        <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"/></td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall"><span class="styTableCellPad"/></td>
                        <td class="styTableCellSmall"><span class="styTableCellPad"/></td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                  <xsl:if test="count($Form4255Data/RecaptureOfInvstCrProperties[position() &gt;= $pos  and position() &lt; $pos+4]) = 3">
                    <xsl:choose>
                      <xsl:when test="count($Form4255Data/RecaptureOfInvstCrProperties) &lt; 4">
                        <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"/></td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall"><span class="styTableCellPad"/></td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>          
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">1</div>
                    <div class="styGenericDiv" style="width:63mm;font-size:7pt;">
                       <span style="float:left">Original rate of credit</span>
                       <span class="styDotLn" style="float:right;"> .........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;border-color:black;">1
                <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="CreditRt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/CreditRt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/CreditRt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-color:black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/CreditRt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">2</div>
                    <div class="styGenericDiv" style="width:63mm;font-size:7pt;">  
                    <span style="float:left">Credit base as of the end of the previous tax year</span>
                    <span style="float:left">(see instructions).</span>
                    <span class="styDotLn" style="float:right;"> .........</span>                      
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;padding-top:3mm;font-size:7pt;padding-right:.5mm;font-weight:bold;
					border-color: black;">2
						<span class="styTableCellPad"/>
				</td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>  
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">3</div>
                    <div class="styGenericDiv" style="width:63mm;font-size:7pt">
                       <span style="float:left">Net change in nonqualified nonrecourse</span>
                       <span style="float:left">financing during the tax year. If a net decrease,</span>
                       <span style="float:left">enter as a negative number.</span>
                    <span class="styDotLn" style="float:right;">......</span>                       
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;padding-top:6mm;padding-right:1mm;font-weight:bold;
                border-color: black;">3<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>  
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>  
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-left:.5mm">4</div>
                    <div class="styGenericDiv" style="width:63mm;"> 
                      <span style="float:left">Credit base as of the end of the current tax year.</span> 
                      <span style="float:left">Subtract line 3 from line 2.</span>
                      <span class="styDotLn" style="float:right;"> .......</span> 
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-top:4mm;padding-right:1mm;font-weight:bold;
                 border-color: black;">4<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:4mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:4mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:4mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:4mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-left:.5mm;">5</div>
                    <div class="styGenericDiv" style="width:63mm;">
                    <span style="float:left">Refigured credit (see instructions).</span>
                      <span class="styDotLn" style="float:right;">....</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-right:1mm;font-weight:bold;border-style: solid; 
                border-color: black;padding-top:3mm;">5<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>              
              </tr>       
              <tr>
                <td class="styIRS4255TableCellSmallBB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-left:.5mm;">6</div>
                    <div class="styGenericDiv" style="width:63mm;"> 
                     <span style="float:left">Credit taken for this property on Form 3800</span>
                     <span style="float:left">in prior years. See instructions.</span>
                      <span class="styDotLn" style="float:right;"> .....</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-right:1mm;font-weight:bold;
                border-style:solid; border-color:black;padding-top:3mm;">6<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color:black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style:solid;border-color:black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style:solid;border-color:black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr style="height:2mm;">
                <td style="text-align:left;" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
					<div class="styPartName" style="width:13mm;height:5mm;padding-top:1mm;font-size:8pt;">Part II</div>
					<div class="styPartDesc" style="text-align:left;width:160mm;height:5mm;padding-top:1mm">
					    Recapture from Increase in Nonqualified Nonrecourse Financing (see instructions)
					</div>
                  </div>
                </td>
              </tr>            
              <tr>
                <td class="styIRS4255TableCellSmallTB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-left:.5mm;">7</div>
                    <div class="styGenericDiv" style="width:63mm;"> 
                      <span style="float:left">Credit subject to recapture due to a net increase</span>
                      <span style="float:left">in nonqualified nonrecourse financing.  Subtract</span>
                      <span style="float:left">line 5 from line 6.  If zero or less, enter -0-.</span>
                      <span class="styDotLn" style="float:right;"> ..</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;border-top-width: 1px;font-size:7pt;padding-right:1mm;padding-top:6mm;
                font-weight:bold;border-style: solid; border-color: black;">7<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" 
                style="border-top-width: 1px;font-size:6pt;padding-top:6mm;padding-right:1mm;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" 
                style="border-top-width: 1px;font-size:6pt;padding-top:6mm;padding-right:1mm;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" 
                style="border-top-width: 1px;font-size:6pt;padding-top:6mm;padding-right:1mm;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCellSmall" 
                style="border-top-width: 1px;font-size:6pt;padding-right:1mm;padding-top:6mm;border-style: solid; border-color: black;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>              
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-left:.5mm;">8</div>
                    <div class="styGenericDiv" style="width:63mm;">
                      <span style="float:left">Unused general business credits that would</span>
                      <span style="float:left">have been allowed if original credit had been</span>
                      <span style="float:left">figured with current-year credit base</span>
                      <span style="float:left">(see instructions).</span>
                      <span class="styDotLn" style="float:right;"> .........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-top:9mm;padding-right:1mm;font-weight:bold;
                border-style: solid; border-color: black;">8<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:9mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:9mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:9mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:9mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- BEGINING NEW UNSEPARATED PROCESSING FROM UWR 183352 -->
              <tr>
                <td class="styIRS4255TableCellSmallBB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-left:.5mm;">9</div>
                    <div class="styGenericDiv" style="width:63mm;">
                      <span style="float:left">Subtract line 8 from line 7. This is the </span>
                      <span style="float:left">recapture tax as a result of a net</span>
                      <span style="float:left">increase in nonqualified nonrecourse financing.</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-right:1mm;font-weight:bold;
                border-style: solid; border-color: black;padding-top:6mm;">9<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:6mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:6mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:6mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:6mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr style="height:2mm;">
                <td style="text-align:left;" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
					<div class="styPartName" style="width:13mm;height:5mm;padding-top:1mm;font-size:8pt;">Part III</div>
					<div class="styPartDesc" style="text-align:left;width:160mm;height:5mm;padding-top:1mm">
					    Recapture from Disposition of Property or Cessation of Use as Investment Credit Property
					</div>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="styIRS4255TableCellSmallTB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">10</div>
                    <div class="styGenericDiv" style="width:62mm">
                       <span style="float:left">Date property was placed in service</span>
                      <span class="styDotLn" style="float:right;">...</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;
                border-style: solid; border-color: black;padding-top:3mm;border-top-width:1px;">10<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid;border-top-width:1px; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid;border-top-width:1px; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid;border-top-width:1px; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid;border-top-width:1px; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">11</div>
                    <div class="styGenericDiv" style="width:62mm;">
                       <span style="float:left">Date property ceased to be qualified investment</span>
                       <span style="float:left">credit property</span>
                      <span class="styDotLn" style="float:right;"> ..........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;
                border-style: solid; border-color: black;padding-top:3mm;">11<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">12</div>
                    <div class="styGenericDiv" style="width:62mm;">
                       <span style="float:left">Number of full years between the</span>
                       <span style="float:left">date on line 10 and the date on line 11</span>
                      <span class="styDotLn" style="float:right;"> ...</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;
                border-style: solid; border-color: black;padding-top:3mm;">12<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;border-style: solid; border-color: black;padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">13</div>
                    <div class="styGenericDiv" style="width:62mm;">
                       <span style="float:left">Unused general business credits that would have</span>
                       <span style="float:left">been allowed had there been no credit</span>
                       <span style="float:left">from this property (see instructions)</span>
                      <span class="styDotLn" style="float:right;">....</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-top:6mm;font-weight:bold;
                border-style: solid; border-color: black;">13<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:6mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">14</div>
                    <div class="styGenericDiv" style="width:62mm;">
                       <!--<span style="float:left">Aggregate decrease in general business credits </span>
                       <span style="float:left">that would have been allowed under section 38</span>
                       <span style="float:left">had there been no credit from this property.</span>-->
                       <span style="float:left">Subtract line 13 from line 6.</span>
                       <span class="styDotLn" style="float:right;"> ......</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-top:3mm;font-weight:bold;
                border-style: solid; border-color: black;">14<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">15</div>
                    <div class="styGenericDiv" style="width:62mm;">
                      <span style="float:left">Recapture percentage (see instructions)</span>
                      <span class="styDotLn" style="float:right;">...</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-top:3mm;font-weight:bold;
                border-style: solid; border-color: black;">15<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td class="styIRS4255TableCellSmallBB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">16</div>
                    <div class="styGenericDiv" style="width:62mm;">
                       <!--<span style="float:left">Recapture tax due to disposition or cessation </span>
                       <span style="float:left">of use as investment credit property.  Multiply</span>-->
                       <span style="float:left">Multiply line 14 by the percentage on line 15.</span>
                      <span class="styDotLn" style="float:right;">.</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;padding-top:3mm;font-size:7pt;font-weight:bold;
                border-style: solid; border-color: black;">16<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCellSmall" style="font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
            </table>  
          </div>
          <!--xsl:value-of select="$Form4255Data/Properties[$pos + 4]" /-->
            <xsl:if test="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 4]">
              <br/>
            </xsl:if>
        </xsl:if>
      </xsl:for-each>  
    </xsl:if>
  </xsl:if>
  <!--Separated table LINES 1-16 BELOW-->
    <xsl:if test="not($Form4255Data/RecaptureOfInvstCrProperties) or ((count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4) 
    and ($Print = $Separated))">
          <div class="styIRS4255TableContainerNBB" style="height:130.5mm">
				<div class="styPartName" style="width:13mm;height:5mm;padding-top:.5mm;font-size:8pt;">Part I</div>
					<div class="styPartDesc" style="text-align:center;width:169mm;height:5mm;padding-top:1mm">
						  Original Investment Credit
				</div>
            <table class="styTable" cellspacing="0">
              <tr>
                <th class="styTableCellHeader" style="width:65mm;border-top-width:1px;border-bottom-width:0px;border-right:0px;
                font-size:7pt;text-align:left;padding-left:6mm;" scope="col">
                  These columns relate to the properties A Properties through D described above:
                </th>
                <th class="styIRS4255TableCellSmallRB" style="width:8mm;border-top-width:1px;
                border-bottom-width:0mm;background-color:lightgrey;height:5mm;">                      
                <span class="styTableCellPad"/>
                </th>
                <th class="styTableCellHeader" style="width:120mm;font-size:7pt;border-top-width: 1px;" colspan="4" scope="col">
                  Properties
                </th>
              </tr>
              <tr>
                <th style="width:70mm;border:none;font-size:7pt;text-align:left;padding-left:6mm;font-weight:normal;">
                  (see Specific Instructions)
                </th>
                <th class="styIRS4255TableCellSmallRB " style="width:5mm;background-color:lightgrey;height:3mm;">
                  <span class="styTableCellPad"/>
                </th>
                <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">A<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">B<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">1</div>
                    <div class="styGenericDiv" style="width:63mm;font-size:7pt">
                       Original rate of credit. 
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">1<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;text-align:left;">
                  <xsl:call-template name="PopulateAdditionalDataTableMessage">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties"/>    
                    <xsl:with-param name="ShortMessage" select="'true'"/>                  
                  </xsl:call-template>
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">2</div>
                    <div class="styGenericDiv" style="width:63mm;font-size:7pt;">  Credit base as of the end of the previous tax year (see instructions).
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">2<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;font-size:7pt;padding-left:.5mm;">3</div>
                    <div class="styGenericDiv" style="width:63mm;font-size:7pt;">
                       Net change in nonqualified nonrecourse financing during the tax year. If a net decrease, enter as a negative number.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">..........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB " style="width:5mm;font-size:7pt;font-weight:bold;">3<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">4</div>
                    <div class="styGenericDiv" style="width:63mm;"> 
                      Credit base as of the end of the current tax year. Subtract line 3 from line 2.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.......</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">4<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">5</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Refigured credit (see instructions).
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">....</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">5<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>              
              </tr>              
              <tr>
                <td class="styIRS4255TableCellSmallBB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">6</div>
                    <div class="styGenericDiv" style="width:63mm;"> 
                      Credit taken for this property on Form 3800 in prior years. See instructions.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">......</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">6<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>              
              </tr>
              <tr style="height:2mm">
                <td style="text-align:center;font-size:8pt;font-weight:bold" colspan="6" scope="col">                
					<div class="styPartName" style="width:13mm;height:5mm;padding-top:1mm;font-size:8pt;">Part II</div>
					<div class="styPartDesc" style="text-align:left;width:160mm;height:5mm;padding-top:1mm">
					    Recapture from Increase in Nonqualified Nonrecourse Financing (see instructions)
					</div>
                </td>
              </tr>            
              <tr>
                <td class="styIRS4255TableCellSmallTB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">7</div>
                    <div class="styGenericDiv" style="width:63mm;"> 
                      Credit subject to recapture due to a net increase in nonqualified nonrecourse financing. Subtract line 5 from line 6. If zero or less, enter -0-
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">..</span> 
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;border-top-width: 1px;
                font-size:7pt;font-weight:bold;">7<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="border-top-width: 1px;font-size:7pt;">  <span class="styTableCellPad"/></td>              
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">8</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Unused general business credits that would have been allowed if original credit had been figured with current-year credit base (see 
                       instructions).
                       <!--Dotted Line-->
                       <!--<span class="styDotLn" style="float:right;">........</span>-->
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">8<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td class="styIRS4255TableCellSmallBB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">9</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Subtract line 8 from line 7. This is the recapture tax as a result of a net increase in nonqualified nonrecourse financing.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;font-weight:bold;">9<span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr style="height:2mm;">
                <td style="text-align:left;" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
					<div class="styPartName" style="width:13mm;height:5mm;padding-top:1mm;font-size:8pt;">Part III</div>
					<div class="styPartDesc" style="text-align:left;width:160mm;height:5mm;padding-top:1mm">
					    Recapture from Disposition of Property or Cessation of Use as Investment Credit Property
					</div>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="styIRS4255TableCellSmallTB" style="font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">10</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Date property was placed in service
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">....</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;padding-left:1mm;font-weight:bold;border-top-width:1px;">10
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;border-top-width:1px;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;border-top-width:1px;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;border-top-width:1px;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;border-top-width:1px;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">11</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Date property ceased to be qualified investment credit property
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">...........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">11
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">12</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Number of full years between the date on line 10 and the date on line 11
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">........</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">12
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">13</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Unused general business credits that would have been allowed had there been no credit from this property (see instructions)
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.......</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">13
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">14</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Subtract line 13 from line 6.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">......</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">14
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">15</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Recapture percentage (see instructions)
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">...</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">15
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
              <tr>
                <td style="border:none;font-size:7pt;" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:0mm;">16</div>
                    <div class="styGenericDiv" style="width:63mm;">
                       Multiply line 14 by the percentage on line 15.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.</span>
                    </div>
                  </div>
                </td>
                <td class="styIRS4255TableCellSmallRB" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">16
                <span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
                <td class="styTableCellSmall" style="font-size:7pt;"><span class="styTableCellPad"/></td>
              </tr>
            </table>        
          </div>  
</xsl:if>    
      <!-- Begin the amount boxes -->
      <!-- line 17 -->
      <div class="styBB" style="width:187mm;">
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="padding-left:0mm;width:5mm;height:3.9mm">
            17
          </div>
          <div class="styLNDesc" style="width:146.3mm;height:3.5mm;vertical-align:bottom;">
            Add property columns A through D, line 9
            <!-- Adding pen image -->
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Line 9 - Note</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4255Data/SumNonqualifiedRcptrTaxAmt/@taxFromAttachedCd"/>
            </xsl:call-template>  
            <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;"> ......................</span>
          </div>
          <div class="styLNRightNumBox" style="height:4mm;vertical-align:bottom;">
          17
          </div>
          <div class="styLNAmountBox" style="width:27.5mm;vertical-align:bottom;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/SumNonqualifiedRcptrTaxAmt"/>                    
            </xsl:call-template>
          </div>
        </div>        
        <!-- line 18 -->
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="padding-left:0mm;width:5mm;">
            18
          </div>
          <div class="styLNDesc" style="width:146.3mm;vertical-align:bottom">
            Add property columns A through D, line 16
            <!-- Adding pen image -->
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Line 9 - Note</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form4255Data/SumInvestmentCrRcptrTaxAmt/@taxFromAttachedCd"/>
            </xsl:call-template>  
            <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">......................</span>
          </div>
          <div class="styLNRightNumBox" style="height:4mm;vertical-align:bottom">
            18
          </div>
          <div class="styLNAmountBox" style="width:27.5mm;height:4mm;vertical-align:bottom">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/SumInvestmentCrRcptrTaxAmt"/>                    
            </xsl:call-template>
          </div>
        </div>        
        <!-- line 19 -->
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;width:5mm;">
            19
          </div>
          <div class="styLNDesc" style="width:146.3mm;height:3mm;">
            Recapture of qualifying therapeutic discovery project grant. Attach statement (see instructions)
            <!-- set the push pin image -->
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form4255Data/TxForRcptrQlfyThrputicDiscvAmt"/>
              <xsl:with-param name="TabOrder" select="2"/>
            </xsl:call-template>
            <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.....</span>
          </div>
          <div class="styLNRightNumBox" style="height:4mm;vertical-align:bottom">
            19
          </div>
          <div class="styLNAmountBox" style="width:27.5mm;vertical-align:bottom;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/TxForRcptrQlfyThrputicDiscvAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 20 -->
        <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;width:5mm;">
            20
          </div>
          <div class="styLNDesc" style="width:146.3mm;height:4mm;vertical-align:bottom;">
            Total increase in tax.  Add lines 17, 18, and 19. See section 45K(b)(4) if you claim the nonconventional source fuel credit. Enter here and on the appropriate line 	
            of your tax return
            <!--Dotted Line-->
                       <!--<span class="styDotLn" style="float:right;">................</span>-->
          </div>
          <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;border-bottom:0px">
            20
          </div>
          <div class="styLNAmountBox" style="width:27.5mm;height:8mm;padding-top:5mm;border-bottom:0px">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form4255Data/TotalIncreaseInTaxAmt"/>
            </xsl:call-template>
          </div>
        </div> 
      </div>
      <!-- End the amount boxes -->
    
      <!-- capturing the page bottom info -->
      <div style="width:187mm; font-size:7pt;  border-top:1 solid black">    
        <div style="float:left; font-size:8pt">
          <b>For Paperwork Reduction Act Notice, see instructions.</b>
        </div>    
        <div style="float:right">
        Cat. No. 41488C
        <span style="width:15mm"/>
        Form <b style="font-size:9pt">4255</b> (Rev. 12-2016)
        </div>      
      </div> 
   
  
      
  <!-- Add page end -->
  <p class="pageEnd"/>
  
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
        <xsl:with-param name="TargetNode" select="$Form4255Data"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Line 9 - Note</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form4255Data/TotalUnusedGeneralBusCrOrigCrAmt/@taxFromAttachedCd"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
    <!-- Begin Separated Types of Property table -->
    <xsl:if test="($Print = $Separated) and (count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4)">
      <span class="styRepeatingDataTitle">Form 4255 - Type of Property </span>
             <table class="styDepTbl" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt">
            <thead class="styTableThead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" style="width:25mm;font-size:7pt;" scope="col"><span class="styBoldText">Properties</span></th>
                <th class="styDepTblCell" style="width:162mm;text-align:left;" scope="col">
                  Type of property-State whether rehabilitation, energy, reforestation, or transition property. (See the Instructions for Form 3468 for the 
                  year the 
                  investment credit property was placed in service for definitions.) If rehabilitation property, also show type of building. If energy property, 
                  show type.
                </th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
                  <xsl:for-each select="$Form4255Data/RecaptureOfInvstCrProperties">
                    <tr>
                      <xsl:attribute name="class">
                        <xsl:choose>
                           <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                           <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <td class="styDepTblCell" style="text-align:center;width:25mm;font-weight:bold;">
                        <xsl:number value="position()" format="A"/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="text-align:left;width:162mm;">
                        <span class="styTableCellPad"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                </xsl:for-each>
          </tbody>            
          </table>
              </xsl:if>
              <br/>
              
        <!-- Original Investment Credit Table -->
  
      <xsl:if test="$Print = $Separated and count($Form4255Data/RecaptureOfInvstCrProperties) &gt; 4">
      <span class="styRepeatingDataTitle">Form 4255 - Original Investment Credit:</span>
      <xsl:for-each select="$Form4255Data/RecaptureOfInvstCrProperties">
        <xsl:variable name="pos" select="position()"/>
        <xsl:if test="position() mod 4 = 1">
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" style="width:65mm;text-align:left;padding-left:6mm" scope="col">
                  These columns relate to the properties A Properties through D described above:
                </th>
                <th class="styDepTblCell" style="width:8mm;height:5mm">                     
                <span class="styTableCellPad"/>
                </th>
                <th class="styDepTblCell" style="width:100mm;font-size:7pt;border-top-width:1px;" colspan="4" scope="col">
                  Properties
                </th>
              </tr>
              <tr class="styDepTblHdr">
                <th style="width:70mm;text-align:left;padding-left:6mm;height:5mm;border-right-width:0px;" class="styDepTblCell">
                  (see Specific Instructions)
                </th>
                <th class="styDepTblCell" style="width:5mm;height:5mm;">
                  <span class="styTableCellPad"/>
                </th>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;">
                      <xsl:number value="position()" format="A"/><span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;border-left-width:0px;">
                      <xsl:number value="position()+1" format="A"/><span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;border-left-width:0px;">
                      <xsl:number value="position()+2" format="A"/><span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="text-align:center;font-weight:bold;border-left-width:0px;">
                      <xsl:number value="position()+3" format="A"/><span class="styTableCellPad"/>
                    </td>
              </tr>
              <tr style="height:2mm;" class="styDepTblRow2">
                <td style="text-align:center;font-size:8pt;font-weight:bold" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
					<div class="styPartName" style="width:13mm;height:5mm;font-size:8pt;padding-top:1mm;">Part I</div>
					<div class="styPartDesc" style="text-align:left;width:160mm;height:5mm;padding-top:1mm">
					    Original Investment Credit
					</div>
                  </div>
                </td>
              </tr>    
              <tr class="styDepTblRow1">
                <td scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericdiv" style="width:5mm;font-weight:bold;text-align:left;">1</div>
                    <div class="styGenericdiv" style="width:63mm;text-align:left;border-left-width:0px;">
                       Original rate of credit  
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">........</span>
                    </div>
                  </div>
                </td>                
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;font-weight:bold;">1<span class="styTableCellPad"/></td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="CreditRt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/CreditRt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/CreditRt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/CreditRt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr class="styDepTblRow2">
                <td scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">2</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;font-size:7pt;">  
                    Credit base as of the end of the previous tax year (see instructions).
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.........</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">2
                <span class="styTableCellPad"/></td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;vertical-align:bottom;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;vertical-align:bottom;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>  
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;vertical-align:bottom;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;vertical-align:bottom;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/CreditBasePYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">3</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;font-size:7pt;">
                       Net change in nonqualified nonrecourse financing during the tax year. If a net decrease, enter as a negative number.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.........</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;font-weight:bold;vertical-align:bottom;">3
                <span class="styTableCellPad"/></td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>  
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>  
                </td>
                <td class="styDepTblCell" style="width:25mm;font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/NonqualifiedFinanceNetChgAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">4</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                      Credit base as of the end of the current tax year. Subtract line 3 from line 2.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.......</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;vertical-align:bottom;font-weight:bold;">4
                <span class="styTableCellPad"/></td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;width:25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;width:25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;width:25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;width:25mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/CreditBaseCYAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr class="styDepTblRow1">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">5</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;">
                    Refigured credit (see instructions)
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">....</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-size:7pt;font-weight:bold;vertical-align:bottom;">5
                <span class="styTableCellPad"/></td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/RefiguredCreditAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>              
              </tr>              
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">6</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                      Credit taken for this property on Form 3800 in prior years. See instructions.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">......</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">6<span class="styTableCellPad"/></td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PriorYearsGeneralBusinessCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>              
              </tr>
              <tr style="height:2mm;" class="styDepTblRow1">
                <td style="text-align:center;font-size:8pt;font-weight:bold" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
					<div class="styPartName" style="width:13mm;height:5mm;padding-top:1mm;font-size:8pt;">Part II</div>
					<div class="styPartDesc" style="text-align:left;width:160mm;height:5mm;padding-top:1mm">
					    Recapture from Increase in Nonqualified Nonrecourse Financing (see instructions)
					</div>
                    </div>
                </td>
              </tr>            
              <tr class="styDepTblRow2">
                <td class="styDepTblCell" scope="row">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">7</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                      Credit subject to recapture due to a net increase in nonqualified nonrecourse financing. Subtract line 5 from line 6. If zero or less, 
                      enter -0-.
                       <!--Dotted Line-->
                       <!--<span class="styDotLn" style="float:right;">...</span>-->
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;vertical-align:bottom;font-weight:bold;">7</td>
                <td class="styDepTblCell" style="text-align:right;vertical-align:bottom;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;font-size:6pt;vertical-align:bottom;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;font-size:6pt;vertical-align:bottom;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/AtRiskCreditRecaptureAmt"/>
                  </xsl:call-template>
                </td>              
              </tr>
              <tr class="styDepTblRow1">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">8</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Unused general business credits that would have been allowed if original credit had been figured with current-year credit base (see 
                       instructions).
                       <!--Dotted Line-->
                       <!--<span class="styDotLn" style="float:right;">........</span>-->
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">8</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/UnusedGeneralBusCrOrigCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr class="styDepTblRow2">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">9</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Subtract line 8 from line 7. This is the recapture tax as a result of a net increase in nonqualified nonrecourse financing.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">........</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">9</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/NonqualifedFinanceRcptrTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr style="height:2mm;" class="styDepTblRow1">
                <td style="text-align:center;font-size:8pt;font-weight:bold" colspan="6" scope="col">
                  <div style="border-top-width:1px;">
					<div class="styPartName" style="width:13mm;height:5mm;padding-top:1mm;font-size:8pt;">Part III</div>
					<div class="styPartDesc" style="text-align:left;width:160mm;height:5mm;padding-top:1mm">
					    Recapture from Disposition of Property or Cessation of Use as Investment Credit Property
					</div>
                    </div>
                </td>
              </tr>            
              <tr class="styDepTblRow2">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">10</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Date property was placed in service
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">....</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">10</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PlacedInServiceDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr class="styDepTblRow1">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">11</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Date property ceased to be qualified investment credit property
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">..........</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">11</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PropertyCeasedToQualifyDt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr class="styDepTblRow2">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">12</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Number of full years between the date on line 4 and the date on line 5
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">........</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">12</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="2"/>
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/PropertyQualifiedYearCnt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr class="styDepTblRow1">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">13</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Unused general business credits that would have been allowed had there been no credit from this property (see instructions)
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">.......</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">13</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/UnusedGeneralBusCrNoCrAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr class="styDepTblRow2">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">14</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Aggregate decrease in general business credits that would have been allowed under section 38 had there been no credit from this 
                       property. Subtract line 13 from line 6.
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">......</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">14</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/AggregateCreditDecreaseAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr class="styDepTblRow1">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">15</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Recapture percentage (see instructions)
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">...</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">15</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/RecapturePct"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
              <tr class="styDepTblRow2">
                <td style="" scope="row" class="styDepTblCell">
                  <div>
                    <div class="styGenericDiv" style="width:5mm;font-weight:bold;text-align:left;">16</div>
                    <div class="styGenericDiv" style="width:63mm;text-align:left;"> 
                       Recapture tax due to disposition or cessation of use as investment credit property. Multiply line 14 by the percentage on line 15
                       <!--Dotted Line-->
                       <span class="styDotLn" style="float:right;">......</span>
                    </div>
                  </div>
                </td>
                <td class="styDepTblCell" style="width:5mm;font-weight:bold;vertical-align:bottom;">16</td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad">  </span>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 1]/InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 2]/InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styDepTblCell" style="font-size:6pt;text-align:right;vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" 
                    select="$Form4255Data/RecaptureOfInvstCrProperties[$pos + 3]/InvestmentCrRecaptureTaxAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
				</td>
              </tr>
            </table>  
            <br/>      
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