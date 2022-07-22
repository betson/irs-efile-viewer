<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5713Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

 
<xsl:param name="Form5713Data" select="$RtnDoc/IRS5713" />
<!-- populateEINFieldTemplate -->
<xsl:template name="populateEINFieldTemplate">
  <xsl:param name="TargetNode"/>                  
	<xsl:choose> 
		<xsl:when test="$TargetNode/IdNumberOfRelatedForeignCorp">   
       		<xsl:call-template name="PopulateEIN">
         			<xsl:with-param name="TargetNode" select="$TargetNode/IdNumberOfRelatedForeignCorp" />
       		</xsl:call-template>    
      </xsl:when> 
	<xsl:otherwise>   
	        	<xsl:call-template name="PopulateText">
	                 <xsl:with-param name="TargetNode" select="$TargetNode/MissingIdNumOfRelatedFrgnCorp" />
	              </xsl:call-template>  
	 </xsl:otherwise>
	 </xsl:choose>
</xsl:template>

<!-- This template is used to display a row in additional data tables (dependency style table). -->
<!-- Data element type is BoycottDetailsType -->
<xsl:template name="BoycottDetailsTypeDepTblRow">
  <!--Define background colors to the rows -->
  <xsl:attribute name="class">
    <xsl:choose>
      <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
    <td class="styDepTblCell" style="text-align:center;">
      <span style="float:left;">
        <span style="font-weight:bold;">
          <xsl:number value="position()" format="a" />
        </span>
        <span style="width:3mm;"></span>
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="NameOfCountry"/>
        </xsl:call-template>
      </span>
    </td>
    <td class="styDepTblCell" style="text-align:left">
      <xsl:choose>
        <xsl:when test="SSNOfPersonInvolved!=''">            
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="SSNOfPersonInvolved"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="EINOfPersonInvolved"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="NameOfForeignCorpHavingOpr!=''">
        <br/>
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine1"/>
        </xsl:call-template>
        <xsl:if test="NameOfForeignCorpHavingOpr/BusinessNameLine2!=''">
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine2"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:if>
      <br/>
      <xsl:call-template name="populateEINFieldTemplate">
        <xsl:with-param name="TargetNode" select="."/>
      </xsl:call-template>
    </td>
    <td class="styDepTblCell" style="text-align:center;">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCode"/>
      </xsl:call-template>
    </td>
    <td class="styDepTblCell" style="text-align:left;">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
      </xsl:call-template>
    </td>
    <td class="styDepTblCell" >
      <span style="width:1px;"></span>
    </td>
</xsl:template>

<xsl:template match="/">

<html xmlns="http://www.irs.gov/efile" xmlns:efile="http://www.irs.gov/efile">

<head>
<title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form5713Data)"></xsl:with-param></xsl:call-template></title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="private"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Form 5713"/>
<META name="GENERATOR" content="IBM WebSphere Studio"/>
<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
<xsl:call-template name="InitJS"></xsl:call-template>
<style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="IRS5713Style"></xsl:call-template>    
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
 <xsl:call-template name="GlobalStylesForm"/>

</head>
<body class="styBodyClass">

<!-- Placed table header, footer and body tags in Part II table; Jan. 30, 2004  -->

<form name="Form5713">
<xsl:call-template name="DocumentHeader"></xsl:call-template>
<!-- Form Number  -->
<div style="width:187mm;">
  <div class="styFNBox" style="width:34mm;height:22mm;">
    <div>
      <span style="padding-top:1mm;">Form<span style="width:6px;"></span></span>
      <span class="styFormNumber" >5713</span>
      <span style="width:20px;"></span>
    </div>
    <div class="styAgency" style="width:25mm;">(Rev. December 2004)
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$Form5713Data" />
      </xsl:call-template>
    </div>
  <div>
    <div style="width:30mm;"/>
    <span class="styAgency">Department of the Treasury</span><br/>
    <span class="styAgency">Internal Revenue Service</span>
  </div>
</div>

<!-- Form Title -->  
  <div class="styFTBox" style="width:118mm;">
    <div class="styMainTitle" style="padding-top:1mm">International Boycott Report</div>
      <div class="styFBT" style="font-size: 7pt;">
        For the tax year beginning 
          <span class="styFixedUnderline" style="width:50mm;font-weight:normal;float:none;padding-bottom:0;">
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="$Form5713Data/TaxYearBeginning" />
              </xsl:call-template>
          </span>, <br/>and ending
          <span class="styFixedUnderline" style="width:50mm;float:none;font-weight:normal;padding-bottom:0;">
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="$Form5713Data/TaxYearEnding" />
              </xsl:call-template>
          </span> .
      </div>
    <div class="styFBT"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/> Controlled groups, see page 3 of instructions.</div>
  </div>

<!-- Form Header RHS -->  
  <div class="styTYBox" style="width:33mm;height:22mm;">
    <span class="styBB" style="width:30mm;height:3mm;font-size:7pt;">
      <span style="width:6px;"></span>OMB No.1545-0216
    </span>
      <span class="styBB" style="width:33mm;font-size:7pt;font-weight:bold;text-align:left;padding-top:1mm;padding-bottom:1mm;">
        <span style="width:6px;"></span>Attachment<span style="width:6px;"></span>
        <span style="width:110px;padding-left:1.5mm;">Sequence No. 123</span>
      </span>
      <span style="width:33mm;font-size:7pt;text-align:left;padding-left:1mm;padding-top:1mm;padding-bottom:1mm;">
          <b>File in Duplicate</b><span style="width:6px;">
      </span>
      <span style="width:100px;padding-left:1mm;text-align:left;padding-bottom:1mm;">(See Instructions)</span>
    </span>
  </div>
</div>

<!-- Name and Address -->
<div class="styBB" style="width:187mm;border-top-width:1px">
  <div class="styNameBox" style="font-family:verdana;font-size:7pt;width:136mm;height:8mm;">Name<br/>
    <xsl:choose>
      <xsl:when test="$Form5713Data/Name/BusinessNameLine1">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form5713Data/Name/BusinessNameLine1" />
        </xsl:call-template><br/>
      </xsl:when>
      <xsl:otherwise>
          <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="$Form5713Data/Name/BusinessNameLine2">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form5713Data/Name/BusinessNameLine2" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
   </div>
  <div class="styEINBox" style="font-family:verdana;font-size:7pt;width:47mm;height:4mm;
                                                  font-weight:bold;padding-left:2mm;">Identifying number<br/>
    <xsl:choose>
      <xsl:when test="$Form5713Data/IdentifyingNumber">
        <span style="width:47mm;text-align:left;font-weight:normal;padding-top:3mm">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$Form5713Data/IdentifyingNumber" />
          </xsl:call-template>
        </span>  
      </xsl:when>
      
       <xsl:when test="$Form5713Data/MissingEINReason">
        <span style="width:47mm;text-align:left;font-weight:normal;padding-top:3mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form5713Data/MissingEINReason" />
          </xsl:call-template>
        </span>  
      </xsl:when>

      
      <xsl:otherwise>
        <span style="width:47mm;text-align:left;font-weight:normal;">
          <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
        </span>  
      </xsl:otherwise>
    </xsl:choose>
  </div>
</div>
<div class="styBB" style="width:187mm;">
  <div style="font-family:verdana;font-size:7pt;width:140mm;height:8mm;">Number, street, and room or suite no. (If a P.O. box, see page 2 of instructions.)<br/>
    <xsl:if test="$Form5713Data/Address/AddressLine1">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form5713Data/Address/AddressLine1"/>
      </xsl:call-template>
    </xsl:if>    
    <xsl:if test="$Form5713Data/Address/AddressLine2"><br />
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form5713Data/Address/AddressLine2"/>
      </xsl:call-template>  
    </xsl:if>
  </div>
</div>
<div class="styBB" style="width:187mm;">
  <div style="font-family:verdana;font-size:7pt;width:140mm;height:8mm;">City or town, state, and ZIP code<br/>
    <xsl:if test="$Form5713Data/Address/City">
      <xsl:call-template name="PopulateText">    
        <xsl:with-param name="TargetNode" select="$Form5713Data/Address/City"/>
      </xsl:call-template>,
    </xsl:if>  
    <xsl:if test="$Form5713Data/Address/State">
      <xsl:call-template name="PopulateText">    
        <xsl:with-param name="TargetNode" select="$Form5713Data/Address/State"/>
      </xsl:call-template>  
    </xsl:if>
    <span style="width:4px;"></span>
    <xsl:call-template name="PopulateText">    
      <xsl:with-param name="TargetNode" select="$Form5713Data/Address/ZIPCode"/>
    </xsl:call-template>
  </div>
</div>

<!-- Service center where Return is filed -->
<div class="styBB" style="width:187mm;">
  <div style="font-family:verdana;font-size:7pt;width:140mm;height:8mm;">Address of service center where your tax return is filed<br/>
    <xsl:if test="$Form5713Data/IRSServiceCenterWhereFiled">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form5713Data/IRSServiceCenterWhereFiled"/>
      </xsl:call-template>
    </xsl:if>
  </div>
</div>

<!-- Filer type -->
<div class="styBB" style="width:187mm;height:8mm;">
  <div style="font-family:verdana;font-size:7pt;width:140mm;">Type of filer (check one):
    <span style="width:6px;"></span>
  </div>
  <div style="font-family:verdana;font-size:7pt;width:187mm;padding-left:3mm">
<!-- Individual checkbox -->
      <input type="checkbox" name="Checkbox" class="styckbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form5713Data/IndividualFileType"/>
        </xsl:call-template>
      </input>
    <span style="width:1mm;"></span>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713Data/IndividualFileType" />
        </xsl:call-template>
        <span style="width:3mm;text-align:right;">Individual</span>
      </label>  
    <span style="width:15mm;"></span>
    
<!--Partnership  checkbox -->
      <input type="checkbox" name="Checkbox" class="styckbox" >
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipFileType"/>
          </xsl:call-template>
      </input>
    <span style="width:1mm;"></span>      
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipFileType" />
        </xsl:call-template>
        <span style="width:3mm;text-align:right;">Partnership</span>        
      </label>
    <span style="width:15mm;"></span>
<!--Corporation  checkbox -->
      <input type="checkbox" name="Checkbox" class="styckbox" >
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form5713Data/CorporateFileType"/>
          </xsl:call-template>
      </input>
    <span style="width:1mm;"></span>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713Data/CorporateFileType" />
        </xsl:call-template>
        <span style="width:3mm;text-align:right;">Corporation</span>        
      </label>
    <span style="width:15mm;"></span>
    
<!--Trust  checkbox -->

      <input type="checkbox" name="Checkbox" class="styckbox" >
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form5713Data/TrustFileType"/>
          </xsl:call-template>
      </input>
    <span style="width:1mm;"></span>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713Data/TrustFileType" />
        </xsl:call-template>
        <span style="width:3mm;text-align:right;">Trust</span>
      </label>
    <span style="width:15mm;"></span>
    
    
<!--Estate  checkbox -->
      <input type="checkbox" name="Checkbox"  class="styckbox" >
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form5713Data/EstateFileType"/>
          </xsl:call-template>
      </input>
    <span style="width:1mm;"></span>      
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713Data/EstateFileType" />
        </xsl:call-template>
        <span style="width:3mm;text-align:right;">Estate</span>
      </label>  
    <span style="width:13mm;"></span>
    
    
<!-- Other  checkbox -->    
      <input type="checkbox" name="Checkbox"  class="styckbox">
          <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form5713Data/OtherFileType"/>
        </xsl:call-template>
      </input>
    <span style="width:1mm;"></span>        
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form5713Data/OtherFileType" />
        </xsl:call-template>
        <span style="width:3mm;text-align:right;">Other</span>
      </label>
  </div>
</div>

<!-- Line 1 -->
<div class="styBB" style="width:187mm;bottom-border:1px;">
  <span class="styNameBox" style="padding-left:1mm;padding-top:2mm;padding-bottom:0mm;width:145mm;font-size:7pt;">
    <span style="width:6mm;font-weight:bold;">1</span>
    <span style="padding-left:.5mm;font-weight:bold;font-size:7pt;">Individuals-</span>
    Enter adjusted gross income from your tax return (see page 2 of instructions)</span>
    <!--xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5713Data/IndividualsAdjustedGrossIncome"/>
          </xsl:call-template -->
          
           <div class="styEINBox" style="width:42mm;padding-left:2mm;text-align:right;padding-top:2mm">
                                                  
   <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form5713Data/IndividualsAdjustedGrossIncome"/>
          </xsl:call-template >
          
                                                

</div></div>


<!-- Line 2 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">2</div>
  <div class="styLNDesc" style="width:147mm;height:4mm;font-weight:bold;">Partnerships and corporations:</div>
    <div style="width:187mm;">
      <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
      <div class="styLNDesc" style="width:179mm;height:4mm;">Partnerships - Enter each partner's name and identifying number.</div>
    </div>
  <div style="width:187mm;">
  <div class="styLNLeftLtrBox">b</div>
    <div style="float:right;clear:all;width:179mm;">Corporations - Enter the name and employer identification number of each member of the controlled group (as defined in section 993(a)(3)). Do not list members included in the consolidated return; instead, attach a copy of Form 851. List all other members of the controlled group not included in the consolidated return.<br/>
      <b>If you list any corporations below or if you attach Form 851, you must designate a common tax year. Enter on line 4b the name and employer identification number of the corporation whose tax year is designated.</b>
        <!--Table expand/collapse toggle button-->
          <span class="styGenericDiv" style="float:right;clear:none;width:2mm;text-align:left;">
             <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form5713Data/ParntershipAndCorporation"/>
                <xsl:with-param name="containerHeight" select="7"/>          
                <xsl:with-param name="headerHeight" select="2"/>
              <xsl:with-param name="containerID" select=" 'TPctn1' "/>
             </xsl:call-template>
          </span>
        <!--Table expand/collapse toggle button end-->
    </div>
  </div>
</div>
<!-- Line 2b Table -->
<div class="styTableContainerNBB" id="TPctn1" style="border-bottom-width:0px;">
  <!-- Show table in expanded form -->
  <xsl:call-template name="SetInitialState"/>
  <!-- end -->
<!-- Used <b></b> tags for bold font since local style overwriting ( "font-weight:bold;" ) did not work with cells in this table-->  
  <table cellspacing="0" summary="Employer name and identification number display table for Line 2 - partnerships and corporations"  style="width:180mm;height:30mm;clear:both;float:right;border-style:solid;border-color:black;border-bottom:none;border-left:none;border-right:none;border-top:none;" >
  <thead class="styTableThead">
    <tr>
      <th class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:bold;width:140mm;text-align:center;border-style:solid;border-right-width:1px;border-bottom:none;border-left:none;border-top:none;border-color:black;"><b>Name</b></th>
      <th class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:bold;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom:none;border-left:none;border-top:none;border-color:black;"><b>Identifying number</b></th>
    </tr>
  </thead>
  <tfoot></tfoot>
  <tbody>
  <xsl:if test="($Print != $Separated) or (count($Form5713Data/ParntershipAndCorporation) &lt;= 6)">
  <xsl:for-each select="$Form5713Data/PartnershipAndCorporation">
    <tr>
      <td class="styTableCell" scope="col" style="float:right;font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
        </xsl:call-template>
      
        <xsl:if test="Name/BusinessNameLine2">
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
          </xsl:call-template>
        </xsl:if>

<!-- For reguler puch pen -->

  

    <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipAndCorporation"/>
      </xsl:call-template>




      </td>
      <td class="styTableCell" scope="col" style="padding-top:1mm;font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;">
        <!--xsl:call-template name="PopulateEIN">
          <xsl:with-param name="TargetNode" select="IdentifyingNumber"/>
        </xsl:call-template-->  
        
         <xsl:choose>
               <xsl:when test="normalize-space(IdentifyingNumber)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="IdentifyingNumber"/>
                       </xsl:call-template>  
                       <span style="width: 2px"></span>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReason"/>
		            </xsl:call-template>    
		           <span style="width: 2px"></span>
	          </xsl:otherwise>   
          </xsl:choose>
        
      </td>
    </tr>
  </xsl:for-each>
  </xsl:if>
  
  <xsl:if test="count($Form5713Data/ParntershipAndCorporation) &lt; 1 or 
    (($Print = $Separated) and (count($Form5713Data/ParntershipAndCorporation) &gt; 6))">
  <tr>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:left;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;">
      <xsl:call-template name="PopulateAdditionalDataTableMessage">
        <xsl:with-param name="TargetNode" select="$Form5713Data/ParntershipAndCorporation" />
      </xsl:call-template>
      <span class="styTableCellPad"></span></td>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>  
  </tr>
  </xsl:if>  
  <xsl:if test="count($Form5713Data/ParntershipAndCorporation) &lt; 2 or
    (($Print = $Separated) and (count($Form5713Data/ParntershipAndCorporation) &gt; 6))">
  <tr>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:center;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>  
  </tr>
  </xsl:if>  
  <xsl:if test="count($Form5713Data/ParntershipAndCorporation) &lt; 3 or
    (($Print = $Separated) and (count($Form5713Data/ParntershipAndCorporation) &gt; 6))">
  <tr>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:center;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>
    <td class="styTableCell" scope="col" style="font-family:Arial;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>  
  </tr>
  </xsl:if>  
  <xsl:if test="count($Form5713Data/ParntershipAndCorporation) &lt; 4 or
     (($Print = $Separated) and (count($Form5713Data/ParntershipAndCorporation) &gt; 6))">
  <tr>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:center;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>  
  </tr>
  </xsl:if>  
  <xsl:if test="count($Form5713Data/ParntershipAndCorporation) &lt; 5 or
     (($Print = $Separated) and (count($Form5713Data/ParntershipAndCorporation) &gt; 6))">
  <tr>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:center;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>  
  </tr>
  </xsl:if>  
  <xsl:if test="count($Form5713Data/ParntershipAndCorporation) &lt; 6 or
    (($Print = $Separated) and (count($Form5713Data/ParntershipAndCorporation) &gt; 6))">
  <tr>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:140mm;text-align:center;border-style:solid;border-right-width:1px;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>
    <td class="styTableCell" scope="col" style="font-family:verdana;font-size:7pt;font-weight:normal;width:40mm;text-align:center;border-style:solid;border-right:none;border-bottom-width:1px;border-left:none;border-top:none;border-color:black;"><span class="styTableCellPad"></span></td>  
  </tr>
  </xsl:if>    
  </tbody>  
</table>
</div>
<xsl:call-template name="SetInitialDynamicTableHeight">
  <xsl:with-param name="TargetNode" select="$Form5713Data/ParntershipAndCorporation"/>
    <xsl:with-param name="containerHeight" select="7"/>
    <xsl:with-param name="headerHeight" select="2"/>
  <xsl:with-param name="containerID" select=" 'TPctn1' "/>
</xsl:call-template>

<div style="font-family:verdana;font-size:7pt;width:187mm;float:left;clear:none;">
  <div class="styGenericDiv" style="width:176mm;">
  <span style="width:100mm;text-align:left;margin-left:7mm;">If more space is needed, attach additional sheets and check this box</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=19px;">.</span>
  <span class="styBoldText" style="width=10px;">.</span>
  </div>
  
  <div class="styGenericDiv" style="width:10mm;float:right;clear:none;text-align:right;">
  <span style="width:1mm;"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="bullet image pointing to right" width="4"/></span>
  <label>
    <xsl:call-template name="PopulateLabel">
      <xsl:with-param name="TargetNode" select="$Form5713Data/AdditionalCorpInfoIncluded" />
    </xsl:call-template>
    <span style="width:2mm;text-align:right;"></span>
  </label>  
  <input type="checkbox" class="styckbox" name="Checkbox">
    <xsl:call-template name="PopulateCheckbox">
      <xsl:with-param name="TargetNode" select="$Form5713Data/AdditionalCorpInfoIncluded"/>
    </xsl:call-template>
  </input>
  </div>
</div>

<div style="width:187mm;">
  <div style="width:122mm;float:left;"></div>
    <div class="styLNCtrNumBox" style="width:15mm;border-top-width:1px;border-right-width:0px;">Code</div>
  <div class="styLNCtrNumBox" style="width:48mm;border-top-width:1px;border-right-width:0px;">Description</div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
    <div class="styLNDesc" style="width:114mm;height:4mm;">Enter principal business activity code and description (see instructions)</div>
    <div class="styLNCtrNumBox" style="width:15mm;border-top-width:0px;border-right-width:0px;font-weight:normal;">
    <xsl:call-template name="PopulateText">
      <xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalBusinessActivityCode"/>
    </xsl:call-template> 
    
    <xsl:if test="$Form5713Data/InactivePrincipalBusActyCode !=' '">            
            <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$Form5713Data/InactivePrincipalBusActyCode"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
       
    </div>
    <div class="styLNCtrNumBox" style="width:48mm;border-top-width:0px;border-right-width:0px;font-weight:normal;text-align:left;padding-left:1mm;">
          <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalBusinessActivityDesc"/>
      </xsl:call-template>
    </div>
</div>
<div class="styBB" style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
    <div class="styLNDesc" style="width:114mm;height:4mm;">IC-DISCs-Enter principal product or service code and description (see instructions)</div>
    <div class="styLNCtrNumBox" style="width:15mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;font-weight:normal">
        
        <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalProductCode"/>
      </xsl:call-template>
    </div>
  <div class="styLNCtrNumBox" style="width:49mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;font-weight:normal;text-align:left;padding-left:1mm">
      
        <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form5713Data/PrincipalProductCodeDesc"/>
      </xsl:call-template>
  
  </div>
</div>
<!-- *********************************************************************************************************** -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox">3</div>
  <div class="styLNDesc" style="width:141mm;"><span style="font-weight:bold;">Partnerships</span>-Each partnership filing Form 5713 must give the following information:</div>
</div>
    <div style="width:187mm;">
      <div class="styLNLeftLtrBox">a</div>
        <div class="styLNDesc" style="width:141mm;">Partnership's total assets (see instructions)
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span>
          <span class="styBoldText" style="width=19px;">.</span> 
           <span class="styBoldText" style="width:19px;">.</span>
           <span class="styBoldText" style="width:19px;">.</span>
 
   
        </div>
            
     <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-left-width:1px;border-bottom-width:1px;text-align:right;font-weight:normal;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipsTotalAsset"/>
      </xsl:call-template>
    </div>

    </div>
  <div class="styBB" style="width:187mm;">
  <div class="styLNLeftLtrBox">b</div>
    <div class="styLNDesc" style="width:141mm;">Partnership's ordinary income (see instructions)
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width:19px;">.</span>
        <span class="styBoldText" style="width:19px;">.</span>
    </div>
           
     <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-left-width:1px;border-bottom-width:0px;text-align:right;font-weight:normal;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipsOrdinaryIncome"/>
      </xsl:call-template>
    </div>

  </div>

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">4</div>
  <div class="styLNDesc" style="width:147mm;height:4mm;"><span style="font-weight:bold;">Corporations</span>-Each corporation filing Form 5713 must give the following information:</div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox">a</div>
  <div class="styLNDesc" style="width:141mm;">Type of form filed (Form 1120, 1120-F, 1120-FSC, 1120-IC-DISC, 1120-L, 1120-PC, etc.) </div>
  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;font-weight:normal;">
    <xsl:call-template name="PopulateText">
      <xsl:with-param name="TargetNode" select="$Form5713Data/TypeOfFormFiled"/>
    </xsl:call-template>
  </div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox">b</div>
  <div class="styLNDesc" style="width:142mm;">Common tax year election (see page 2 of instructions)</div>
</div>
  <div style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:5mm;font-weight:bold;">(1)</div>
    <div class="styLNDesc" style="width:173mm;font-weight:normal;">Name of corporation <img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing arrowhead image" width="4"/>
    <span class="styFixedUnderline" style="width:140mm;float:none;padding-bottom:0;"> <span style="width:2mm;"/> 
      <xsl:call-template name="PopulateText">  
        <xsl:with-param name="TargetNode" select="$Form5713Data/NameOfCorporation/BusinessNameLine1"/>
      </xsl:call-template>
  <span style="width:3mm;"></span>
    <xsl:call-template name="PopulateText">    
        <xsl:with-param name="TargetNode" select="$Form5713Data/NameOfCorporation/BusinessNameLine2"/>
      </xsl:call-template>  </span>
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$Form5713Data/NameOfCorporation"/>
      </xsl:call-template>
    </div>
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:5mm;font-weight:bold;">(2)</div>
    <div class="styLNDesc" style="width:136mm;font-weight:normal;">Employer identification number
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>  
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span> 
         <span class="styBoldText" style="width:19px;">.</span>
        <span class="styBoldText" style="width:19px;">.</span>
    </div>
    <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;
    font-weight:normal;">
      <xsl:call-template name="PopulateEIN">
        <xsl:with-param name="TargetNode" select="$Form5713Data/EmployerIdentificationNumber"/>
      </xsl:call-template>
      
      <xsl:if test="$Form5713Data/EINMissingReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$Form5713Data/EINMissingReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
      
    </div>
    <div style="width:187mm;">

    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:5mm;font-weight:bold;">(3)</div>
    <div class="styLNDesc" style="font-weight:normal;">Common tax year beginning 
    <span class="styFixedUnderline" style="width:50mm;float:none;padding-bottom:0;text-align:center">
       <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$Form5713Data/CommonTaxYearBeginning"/>
      </xsl:call-template>
    </span>
    , and ending 
    <span class="styFixedUnderline" style="width:30mm;float:none;padding-bottom:0;text-align:center">
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$Form5713Data/CommonTaxYearEnding"/>
      </xsl:call-template>
    </span>
    </div> </div>


  <div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
    <div class="styLNDesc" style="width:141mm;height:4mm;">Corporations filing this form enter:</div>
    <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;"></div>
  </div>
  <div class="styBB" style="width:187mm;">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:5mm;font-weight:bold;">(1)</div>
    <div class="styLNDesc" style="width:136mm;font-weight:normal;">Total assets (see instructions)
        <span class="styBoldText" style="width=20px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width:19px;">.</span>
        <span class="styBoldText" style="width:19px;">.</span>
    </div>
    <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;text-align:right;font-weight:normal;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713Data/TotalAssets"/>
      </xsl:call-template>
    </div>
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width:5mm;font-weight:bold;">(2)</div>
    <div class="styLNDesc" style="width:136mm;font-weight:normal;">Taxable income before net operating loss and special deductions (see instructions)
        <span class="styBoldText" style="width=5px;"></span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
  
    </div>
    <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;text-align:right;font-weight:normal;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713Data/TxblIncomeBeforeNetLossAndDed"/>
      </xsl:call-template>
    </div>
  </div>
<!--</div>-->
<div class="styBB" style="width:187mm;bottom-border:1px;">
  <span class="styNameBox" style="padding-top:1mm;padding-bottom:0mm;padding-left:0mm;width:149.25mm;font-size:8pt;">
    <span style="width:6mm;font-weight:bold;font-size:7pt;">5</span>
    <span style="font-weight:bold;">Estates or trusts</span>-Enter total income (Form 1041, page 1)
    
      <span class="styBoldText" style="width=5px;"></span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span>
        <span class="styBoldText" style="width=19px;">.</span></span> 
        
     <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-left-width:0px;border-bottom-width:0px;text-align:right;font-weight:normal;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form5713Data/TotalIncomeOfEstatesOrTrusts"/>
      </xsl:call-template>
    </div>

    
</div>

<div style="width:187mm;bottom-border:1px;">
    <div class="styLNLeftNumBox" style="padding-left:1mm;height:3mm;">6</div>
    <div class="styLNDesc" style="width:177mm;height:4mm;">Enter the total amount (before reduction for boycott participation or cooperation) of the following tax benefits (see instructions):</div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox">a</div>
  <div class="styLNDesc" style="width:141mm;">Foreign tax credit
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>  
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
     <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>

  </div>
  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;text-align:right;font-weight:normal;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form5713Data/ForeignTaxCredit"/>
    </xsl:call-template>  
  </div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox">b</div>
  <div class="styLNDesc" style="width:141mm;">Deferral of earnings of controlled foreign corporations
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=20px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>  
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
     <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>

  </div>
  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;text-align:right;font-weight:normal;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form5713Data/DfrlOfEarningsOfCtrlFrgnCorp"/>
    </xsl:call-template>
  </div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox">c</div>
  <div class="styLNDesc" style="width:141mm;">Deferral of IC-DISC income
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=20px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
     <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>

  </div>
  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;
  border-right-width:0px;text-align:right;font-weight:normal;">
   <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form5713Data/DeferralOfICDISCIncome"/>
    </xsl:call-template>

  </div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox">d</div>
  <div class="styLNDesc" style="width:141mm;">FSC exempt foreign trade income
    <span class="styBoldText" style="width=16px;">.</span>
    <span class="styBoldText" style="width=17px;">.</span>
    <span class="styBoldText" style="width=17px;">.</span>
    <span class="styBoldText" style="width=17px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=20px;">.</span>
    <span class="styBoldText" style="width=20px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
     <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
        
  </div>
  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;
  text-align:right;font-weight:normal;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form5713Data/ExemptFSCIncome"/>
    </xsl:call-template>

  </div>
</div>
<div class="styBB" style="width:187mm;">
  <div class="styLNLeftLtrBox">e</div>
  <div class="styLNDesc" style="width:141mm;">Foreign trade income qualifying for the extraterritorial income exclusion
    <span class="styBoldText" style="width=17px;">.</span>
    <span class="styBoldText" style="width=17px;">.</span>
    <span class="styBoldText" style="width=18px;">.</span>
    <span class="styBoldText" style="width=19px;">.</span>
    <span class="styBoldText" style="width=17px;">.</span>
    <span class="styBoldText" style="width=21px;">.</span>
    <span class="styBoldText" style="width=21px;">.</span>
    <span class="styBoldText" style="width=21px;">.</span>
     <span class="styBoldText" style="width:19px;">.</span>
 
  </div>
  <div class="styLNCtrNumBox" style="width:37mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;text-align:right;font-weight:normal;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form5713Data/ExtraterritorialExclIncome"/>
    </xsl:call-template>
  </div>
</div>
<!--</div>-->


<!-- Implementing the signature section in table -->
<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
	<tr>
		<td rowspan="3" style="width:15mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Please Sign Here</td>
		<td colspan="5" style="padding-left:1mm;padding-bottom:1mm;padding-left:2mm">Under penalties of perjury, I declare that I have examined this report, including accompanying schedules and statements, and to the best of my
knowledge and belief, it is true, correct, and complete. </td>
	</tr>
	<tr>
		<td rowspan="2" style="border-bottom:1 solid black;padding-left:2mm;"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Big Right Arrow"/>
    </td>
		<td style="width:60mm;border-bottom:1 solid black;vertical-align:bottom;border-right:1 solid black;">
        <xsl:call-template name="PopulateReturnHeaderOfficer">
          <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param> 
        </xsl:call-template>
        <span style="width:1px;"></span>
     </td>
		<td style="width:20mm;border-bottom:1 solid black;vertical-align:bottom;padding-left:1mm;">
      <xsl:call-template name="PopulateReturnHeaderOfficer">
        <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
      </xsl:call-template>
     </td>
		<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Big Right Arrow"/>
    </td>
		<td style="width:50mm;border-bottom:1 solid black;vertical-align:bottom;">
      <xsl:call-template name="PopulateReturnHeaderOfficer">
        <xsl:with-param name="TargetNode">Title</xsl:with-param>
      </xsl:call-template>
		</td>
	</tr>
	<tr>
		<td style="border-bottom:1 solid black;vertical-align:top;font-weight:bold;">Signature</td>
		<td style="border-bottom:1 solid black;vertical-align:top;padding-left:1mm;font-weight:bold;">Date</td>
	   <td style="border-bottom:1 solid black;vertical-align:top;font-weight:bold;">Title</td>
	</tr>
</table>
   <!-- End Signature Section -->













<div class="pageEnd" style="width:187mm;">
  <div style="float:left">
        <span class="styBoldText">For Paperwork Reduction Act Notice,
         see page 4 of the separate instructions.</span>
      </div>    
      <div style="float:right">
      Cat. No. 12030E
      <span style="width:15mm"></span>
      Form <span class="styBoldText" style="font-size:8pt">5713</span> (Rev. 12-2004)
      </div>      


</div>

<!--Page 2 start-->
<div  class="styBB"  style="width:187mm;">
    Form 5713 (Rev. 12-2004)<span style="width:140mm;"></span>
    Page <span style="font-weight:bold;font-size:8pt;">2</span>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"></div>
      <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
  <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">No</div>
</div>
<!-- Line 7 -->

<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4.5mm;">7a</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Are you a U.S. shareholder (as defined in section 951(b)) of any foreign corporation (including a FSC that does not
use the administrative pricing rules) that had operations reportable under section 999(a)?      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>                                
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ShrOfCorpWithReportableOpr" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ShrOfCorpWithReportableOpr" /></xsl:call-template></div>
  </div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;">b</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">If the answer to question 7a is “Yes,” is any foreign corporation a controlled foreign corporation (as defined in
section <br />957(a))?      <span class="styBoldText" style="width:9px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsControlledForeignCorp" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsControlledForeignCorp" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;">c</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Do you own any stock of an IC-DISC?
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/OwnAnyICDISCStock" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/OwnAnyICDISCStock" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;">d</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Do you claim any foreign tax credit?
      <span class="styBoldText" style="width:6px;"></span>    
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>                
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/DoYouClaimAnyForeignTaxCredit" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/DoYouClaimAnyForeignTaxCredit" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Do you control (within the meaning of section 304(c)) any corporation (other than a corporation included in this report) that has operations reportable under section 999(a)?
      <span class="styBoldText" style="width:10px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>          
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/CtrlOfCorpWithReportableOpr" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/CtrlOfCorpWithReportableOpr" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4.5mm;"></div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">If "Yes," did that corporation participate in or cooperate with an international boycott at any time during its tax year that ends with or within your tax year?
      <span class="styBoldText" style="width:5px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>        
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/CorpParticipateInBoycott" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/CorpParticipateInBoycott" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4.5mm;">f</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Are you controlled (within the meaning of section 304(c)) by any person (other than a person included in this report) who has operations reportable under section 999(a)?
      <span class="styBoldText" style="width:11px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>      
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/CtrlByPersonWithReportableOpr" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/CtrlByPersonWithReportableOpr" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4.5mm;"></div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">If "Yes," did that person participate in or cooperate with an international boycott at any time during its tax year that ends with or within your tax year?
      <span class="styBoldText" style="width:9px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>      
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/PersonParticipateInBoycott" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/PersonParticipateInBoycott" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;">g</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Are you treated under section 671 as the owner of a trust that has reportable operations under section 999(a)?
      <span class="styBoldText" style="width:14px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/OwnTrustWithReportableOpr" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/OwnTrustWithReportableOpr" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;">h</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Are you a partner in a partnership that has reportable operations under section 999(a)?
      <span class="styBoldText" style="width:3px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipWithReportableOpr" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/PartnershipWithReportableOpr" /></xsl:call-template></div>
</div>

<div style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;">i</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Are you a foreign sales corporation (FSC) (as defined in section 922(a), as in effect before its repeal)?
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:17px;">.</span>
      <span class="styBoldText" style="width:17px;">.</span>
      <span class="styBoldText" style="width:17px;">.</span>
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ForeignSalesCorporation" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ForeignSalesCorporation" /></xsl:call-template></div>    
</div>

<div class="styBB" style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;">j</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Are you excluding extraterritorial income (defined in section 114(e)) from gross income?
      <span class="styBoldText" style="width:16px;"></span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>
      <span class="styBoldText" style="width:19px;">.</span>    
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ExcldExtraterritorialFromGross" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:4.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ExcldExtraterritorialFromGross" /></xsl:call-template></div>      
</div>
<!-- Part I -->
<div class="styBB" style="width:187mm;border-top-width:0px;padding-top:2mm;padding-bottom:2mm;">
  <span class="styPartName">Part I</span>
  <span style="font-family:verdana;font-size:8pt;font-weight:bold;"> Operations in or Related to a Boycotting Country</span><span style="font-family:verdana;font-size:8pt;font-weight:normal;"> (See instructions beginning on page 3.)</span>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"></div>
      <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
  <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">No</div>
</div>
<!-- Line 8 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">8</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"><b>Boycott of Israel-</b>Did you have any operations in or related to any country (or with the government, a company, or a national of that country) associated in carrying out the boycott of Israel which is on the list maintained by the Secretary of the Treasury under section 999(a)(3)? (See <b>Boycotting Countries</b> on page 2 of the instructions.)
<span class="styBoldText" style="width:13px;"></span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
        <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>

</div>
    <div class="styLNAmountBox" style="width:5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsOprInCtryBoycottingIsrael" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsOprInCtryBoycottingIsrael" /></xsl:call-template></div>    
</div>
<div style="width:187mm;" class="styBB">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
  <div class="styLNDesc" style="width:168mm;height:4mm;">
  If “Yes,” complete the following table. If more space is needed, attach additional sheets using the exact format and check<br />
this box    <span class="styBoldText" style="width:13px;"></span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:18px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>   
  </div>
  <div class="styGenericDiv" style="width:10mm;padding-top:3mm;float:right;text-align:right;">
    <span style="margin-right:2mm;"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/></span>
    <label>
      <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistedByctIsrael" />
      </xsl:call-template>
    </label>
    <input type="checkbox" class="styckbox" name="Checkbox">
      <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistedByctIsrael"/>
      </xsl:call-template>
    </input>
  </div>
  <!--Part I Table expand/collapse toggle button-->
    <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15">
    <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
       <xsl:call-template name="SetDynamicTableToggleButton">
        <xsl:with-param name="TargetNode" select="$Form5713Data/OprInCtryBoycottingIsrael"/>
        <xsl:with-param name="containerHeight" select="15"/>
        <xsl:with-param name="headerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'TPctn2' "/>
       </xsl:call-template>     
    </span>
    </xsl:if>
  <!--Table expand/collapse toggle button end-->
</div>
  <!-- Line 8 Table -->
  <div class="styTableContainer" id="TPctn2">
    <!-- Show table in expanded form -->
    <xsl:call-template name="SetInitialState"/>
    <!-- end -->
    <table cellspacing="0" summary="Nonlisted countries boycotting Israel" style="width:180mm;clear:both;float:none">
      <thead class="styTableThead">
        <tr>
          <th class="styTableCell" scope="col" rowspan="2" style="width:26mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;left-margin:3mm;">Name of country</th>
          <th class="styTableCell" scope="col" rowspan="2" style="width:60mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Identifying number of person having operations</th>
          <th class="styTableCell" scope="col" colspan="2"  style="width:60mm;text-align:center;font-size:7pt;border-color:black;">Principal business activity</th>
          <th class="styTableCell" scope="col" rowspan="2" style="width:41mm;text-align:center;font-size:7pt;border-color:black;border-right:none;border-bottom:none;">IC-DISCs only-Enter product code</th>
        </tr>

        <tr>
          <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Code</th>
          <th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Description</th>
        </tr>

        <tr>
          <th class="styTableCell" scope="col" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">(1)</th>
          <th class="styTableCell" scope="col" style="width:60mm;text-align:center;font-size:7pt;border-color:black;">(2)</th>
          <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;">(3)</th>
          <th class="styTableCell" scope="col" style="left-margin:0mm;width:40mm;text-align:center;font-size:7pt;border-color:black;">(4)</th>
          <th class="styTableCell" scope="col" style="width:41mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">(5)</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:if test="($Print != $Separated) or (count($Form5713Data/OprInCtryBoycottingIsrael) &lt;= 15) ">
          <xsl:for-each select="$Form5713Data/OprInCtryBoycottingIsrael">  
            <tr>
              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:26mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <span style="float:left;">
                  <xsl:if  test="position()&lt;= 15">
                    <span style="font-weight:bold;">
                      <xsl:number value="position()" format="a" />
                    </span>
                  </xsl:if>
                  <span style="width:3mm;"></span>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfCountry"/>
                  </xsl:call-template>
                </span>
              </td> 

              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:60mm;text-align:left;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:choose>
                  <xsl:when test="SSNOfPersonInvolved!=''">            
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="SSNOfPersonInvolved"/>
                    </xsl:call-template>
                  </xsl:when>
                 
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="EINOfPersonInvolved"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
             
                <xsl:if test="MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
                
                <xsl:if test="NameOfForeignCorpHavingOpr!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine1"/>
                  </xsl:call-template>
                  <xsl:if test="NameOfForeignCorpHavingOpr/BusinessNameLine2!=''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:if>
                <br/>
                <xsl:call-template name="populateEINFieldTemplate">
                  <xsl:with-param name="TargetNode" select="."/>
                </xsl:call-template>
              </td>
                
              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:20mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCode"/>
                </xsl:call-template>
                
                   <xsl:if test="InactivePrincipalBusActyCode !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCode"/>
                       </xsl:call-template>
                 </span> 
              </xsl:if>
              </td>
        
              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:44mm;text-align:left;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:44mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
                </xsl:call-template>
             </td>
        
              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:30mm;text-align:left;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:30mm;text-align:left;font-size:7pt;border-color:black;border-right:none;
                  </xsl:otherwise>
              
                  </xsl:choose> 
                </xsl:attribute>        
                <span style="width:1px;"></span>
                     <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ICDISCSProductCode"/>
                </xsl:call-template>

              </td>
            </tr>
          </xsl:for-each>
        </xsl:if>

      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 1 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
            <span style="float:left;font-weight:bold;">a</span>
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form5713Data/OprInCtryBoycottingIsrael" />
              <xsl:with-param name="ShortMessage" select="'true'" />
            </xsl:call-template>
            <span class="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 2 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">b</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 3 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>    
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">c</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 4 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">d</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 5 or
        (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">e</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 6 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">f</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 7 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">g</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 8 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">h</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 9 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">i</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 10 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">j</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 11 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">k</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 12 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">l</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 13 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">m</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 14 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">n</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInCtryBoycottingIsrael) &lt; 15 or
         (($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span style="float:left;font-weight:bold">o</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      </tbody>                          
    </table>
  </div>

  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$Form5713Data/OprInCtryBoycottingIsrael"/>
    <xsl:with-param name="containerHeight" select="15"/>
    <xsl:with-param name="headerHeight" select="2"/>    
    <xsl:with-param name="containerID" select=" 'TPctn2' "/>
   </xsl:call-template>

<!--Page Footer-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"></span>  
    Form <span class="styBoldText"> 5713</span> (Rev. 12-2004)
  </div>  
</div>  
<!--END Page Footer-->


<!--Page 3 start-->
<div class="styTBB" style="width:187mm;">
    Form 5713 (Rev. 12-2004)<span style="width:140mm;"></span>
    Page <span style="font-weight:bold;font-size:8pt;">3</span>
</div>

<!--div class="styTBB" style="width:187mm;"></div>-->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"></div>
      <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
  <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">No</div>
</div>
<!-- Line 9 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">9</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"><b>Nonlisted countries boycotting Israel-</b>Did you have operations in any nonlisted country which you know or have reason to know requires participation in or cooperation with an international boycott directed against Israel?</div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsOprInNonlistedCtryByctIsrael" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsOprInNonlistedCtryByctIsrael" /></xsl:call-template></div>
</div>
<div style="width:187mm;" class="styBB">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
  <div class="styLNDesc" style="width:171mm;height:4mm;">
  If “Yes,” complete the following table. If more space is needed, attach additional sheets using the exact format and check<br />
this box    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
     <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>            
    <span class="styBoldText" style="width:19px;">.</span>   
    <span class="styBoldText" style="width:19px;">.</span>   
    <span class="styBoldText" style="width:19px;">.</span>           
 </div>
  <div class="styGenericDiv" style="width:7mm;padding-top:4mm;float:right;text-align:right;">           
    <span style="margin-right:2mm;"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/></span>
    <label>
      <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistedByctIsrael" />
      </xsl:call-template>
    </label>    
    <input type="checkbox" class="styckbox" name="Checkbox">
      <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoNonlistedByctIsrael"/>
      </xsl:call-template>
    </input>
  </div>
  <!--Table expand/collapse toggle button-->
  <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8">
  <div style="width:187mm;">
    <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
     <xsl:call-template name="SetDynamicTableToggleButton">
      <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonlistedCtryByctIsrael"/>
      <xsl:with-param name="containerHeight" select="8"/>
      <xsl:with-param name="headerHeight" select="2"/>      
      <xsl:with-param name="containerID" select=" 'TPctn3' "/>
     </xsl:call-template>
    </div>
  </div>
  </xsl:if>
  <!--Table expand/collapse toggle button end-->
</div>

<!--Line 9 Table -->
<div class="styTableContainer" id="TPctn3">
<!-- Show table in expanded form -->
  <xsl:call-template name="SetInitialState"/>
  <table cellspacing="0" summary="Nonlisted countries boycotting Israel" style="width:185mm;clear:both;float:none;" >
  <thead class="styTableThead">
    <tr>
      <th class="styTableCell" scope="col" rowspan="2" style="width:26mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;left-margin:3mm;">Name of country</th>
      <th class="styTableCell" scope="col" rowspan="2" style="width:60mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Identifying number of person having operations</th>
      <th class="styTableCell" scope="col" colspan="2"  style="width:60mm;text-align:center;font-size:7pt;border-color:black;">Principal business activity</th>
      <th class="styTableCell" scope="col" rowspan="2" style="width:41mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;border-right:none;">IC-DISCs only-Enter product code</th>
    </tr>

    <tr>
      <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Code</th>
      <th class="styTableCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Description</th>
    </tr>

    <tr>
      <th class="styTableCell" scope="col" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">(1)</th>
      <th class="styTableCell" scope="col" style="width:60mm;text-align:center;font-size:7pt;border-color:black;">(2)</th>
      <th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;">(3)</th>
      <th class="styTableCell" scope="col" style="left-margin:0mm;width:40mm;text-align:center;font-size:7pt;border-color:black;">(4)</th>
      <th class="styTableCell" scope="col" style="width:41mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">(5)</th>
    </tr>
  </thead>
  <tfoot></tfoot>
  <tbody>
    <xsl:if test="($Print != $Separated) or (count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt;= 8) ">
      <xsl:for-each select="$Form5713Data/OprInNonlistedCtryByctIsrael">
        <tr>
          <td class="styTableCell">
            <xsl:attribute name="style">
              <xsl:choose>
                <xsl:when test="position()=last()">width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                <xsl:otherwise>width:26mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
              </xsl:choose> 
            </xsl:attribute>
            <span style="float:left;">
              <xsl:if  test="position()&lt;=8">
                <span style="font-weight:bold;">
                  <xsl:number value="position()" format="a" />
                </span>
              </xsl:if>
              <span style="width:3mm;"></span>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfCountry"/>
              </xsl:call-template>          
            </span>
          </td>
        
          <td class="styTableCell">
            <xsl:attribute name="style">
              <xsl:choose>
                <xsl:when test="position()=last()">width:60mm;text-align:left;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
              </xsl:choose> 
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="SSNOfPersonInvolved!=''">            
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="SSNOfPersonInvolved"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="EINOfPersonInvolved!=''">            
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EINOfPersonInvolved"/>
                </xsl:call-template>
              </xsl:when>
                  
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="NameOfForeignCorpHavingOpr!=''">
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="NameOfForeignCorpHavingOpr/BusinessNameLine2!=''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:if>
            <br/>
            <xsl:call-template name="populateEINFieldTemplate">
              <xsl:with-param name="TargetNode" select="."/>
            </xsl:call-template>     
          </td>
      
          <td class="styTableCell">
            <xsl:attribute name="style">
              <xsl:choose>
                <xsl:when test="position()=last()">width:20mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
              </xsl:choose> 
            </xsl:attribute>
            
            <xsl:if test="InactivePrincipalBusActyCode!=''">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="InactivePrincipalBusActyCode"/>
            </xsl:call-template>
            </xsl:if>
                        
            <xsl:if test="PrincipalBusinessActivityCode!=''">
                      <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCode"/>
            </xsl:call-template>
            </xsl:if>
                  
          </td>
      
          <td class="styTableCell">
            <xsl:attribute name="style">
              <xsl:choose>
                <xsl:when test="position()=last()">width:44mm;text-align:left;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                <xsl:otherwise>width:44mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
              </xsl:choose> 
            </xsl:attribute>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
            </xsl:call-template>
          </td>
   
          <td class="styTableCell">
            <xsl:attribute name="style">
              <xsl:choose>
                <xsl:when test="position()=last()">width:20mm;text-align:center;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                <xsl:otherwise>width:20mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
              </xsl:choose> 
            </xsl:attribute>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ICDISCSProductCode"/>
            </xsl:call-template>
          </td>

        </tr>
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 1 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
          <span style="float:left;font-weight:bold;">a</span>
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonlistedCtryByctIsrael" />
            <xsl:with-param name="ShortMessage" select="'true'" />
          </xsl:call-template>
          <span class="styTableCellPad"></span>
        </td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 2 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">b</span><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 3 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>      
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">c</span><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 4 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">d</span><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 5 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">e</span><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 6 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">f</span><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 7 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">g</span><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    <xsl:if test="count($Form5713Data/OprInNonlistedCtryByctIsrael) &lt; 8 or
       (($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8)) ">
      <tr>
        <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span style="float:left;font-weight:bold;">h</span><span class="styTableCellPad"></span></td>      
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
        <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>      
      </tr>
    </xsl:if>
    </tbody>
  </table>
</div>
<xsl:call-template name="SetInitialDynamicTableHeight">
  <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonlistedCtryByctIsrael"/>
    <xsl:with-param name="containerHeight" select="8"/>
      <xsl:with-param name="headerHeight" select="2"/>    
  <xsl:with-param name="containerID" select=" 'TPctn3' "/>
 </xsl:call-template>
 
<!-- Line 10 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"></div>
      <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
  <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">No</div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">10</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"><b>Boycotts other than the boycott of Israel-</b>Did you have operations in any other country which you know or have reason to know requires participation in or cooperation with an international boycott other than the boycott of Israel?</div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsOprInNonIsraelBoycottingCtry" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/IsOprInNonIsraelBoycottingCtry" /></xsl:call-template></div>
</div>
<div style="width:187mm;" class="styBB">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
  <div class="styLNDesc" style="width:171mm;height:4mm;">
  If “Yes,” complete the following table. If more space is needed, attach additional sheets using the exact format and check<br />
this box    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
  </div>
  <div class="styGenericDiv" style="width:7mm;padding-top:4mm;float:right;text-align:right;">
    <span style="margin-right:2mm;"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/></span>
    <label>
      <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoOprNonIsraelByctCtry" />
      </xsl:call-template>
    </label>    
    <input type="checkbox" class="styckbox" name="Checkbox">
      <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlInfoOprNonIsraelByctCtry"/>
      </xsl:call-template>
    </input>
  </div>
  <!--Table expand/collapse toggle button-->
  <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8">
  <div style="width:187mm;">
    <div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
     <xsl:call-template name="SetDynamicTableToggleButton">
      <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonIsraelBoycottingCtry"/>
      <xsl:with-param name="containerHeight" select="8"/>
      <xsl:with-param name="headerHeight" select="2"/>
      <xsl:with-param name="containerID" select=" 'TPctn6' "/>
     </xsl:call-template>   
    </div>
  </div>
  </xsl:if>
  <!--Table expand/collapse toggle button end-->
</div>
<!--Line 10 Table -->
<div class="styTableContainer" id="TPctn6">
  <!-- Show table in expanded form -->
  <xsl:call-template name="SetInitialState"/>
  <!-- end -->  
    <table cellspacing="0" summary="Boycotts other than the boycott of Israel" style="width:185mm;clear:both;float:none;" >
    <thead class="styTableThead">
      <tr>
        <th class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;left-margin:3mm;" rowspan="2">Name of country<br/><b>(1)</b></th>
        <th class="styTableCell" style="width:60mm;text-align:center;font-size:7pt;border-color:black;" rowspan="2">Identifying number of person having operations<br/><b>(2)</b></th>
        <th class="styTableCell" style="left-margin:0mm;width:60mm;text-align:center;font-size:7pt;border-color:black;" colspan="2"><b>Principal business activity</b></th>
        <th class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;" rowspan="2">IC-DISCs only-Enter product code<br/><b>(5)</b></th>
      </tr>
      <tr>
        <th class="styTableCell" style="font-size:7pt;border-color:black;width:16.25mm;text-align:center;height:5mm;">Code<br/><b>(3)</b></th>
        <th class="styTableCell" style="width:43.25mm;font-size:7pt;border-color:black;text-align:center;height:5mm;">Description<br/><b>(4)</b></th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:if test="($Print != $Separated) or (count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt;= 8) ">
          <xsl:for-each select="$Form5713Data/OprInNonIsraelBoycottingCtry">
            <tr>
              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:26mm;text-align:left;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:26mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose> 
                </xsl:attribute>
                <span style="float:left;">
                  <xsl:if test="position()&lt;9">
                    <span style="font-weight:bold;">
                      <xsl:number value="position()" format="a" />
                    </span>
                  </xsl:if>
                <span style="width:3mm;"></span>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfCountry"/>
                  </xsl:call-template>
                </span>
              </td>       

              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:60mm;text-align:left;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:60mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose> 
                </xsl:attribute>        
                <xsl:choose>
                  <xsl:when test="SSNOfPersonInvolved!=''">
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="SSNOfPersonInvolved"/>
                    </xsl:call-template>
                  </xsl:when>
                  
                  <xsl:when test="EINOfPersonInvolved!=''">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="EINOfPersonInvolved"/>
                    </xsl:call-template>
                  </xsl:when>

                  
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="NameOfForeignCorpHavingOpr!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine1"/>
                  </xsl:call-template>
                  <xsl:if test="NameOfForeignCorpHavingOpr/BusinessNameLine2!=''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:if>
                <br/>
                <xsl:call-template name="populateEINFieldTemplate">
                  <xsl:with-param name="TargetNode" select="."/>
                </xsl:call-template>
              </td>
        
              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:16.25mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:16.25mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose> 
                </xsl:attribute>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCode"/>
                </xsl:call-template>  
              </td>
        
              <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:43.25mm;text-align:left;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:43.25mm;text-align:left;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose> 
                </xsl:attribute>
                <xsl:call-template name="PopulateText">        
                  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
                </xsl:call-template>            
              </td>
        
          <td class="styTableCell">
                <xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="position()=last()">width:16.25mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px</xsl:when>
                    <xsl:otherwise>width:16.25mm;text-align:center;font-size:7pt;border-color:black;</xsl:otherwise>
                  </xsl:choose> 
                </xsl:attribute>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ICDISCSProductCode"/>
                </xsl:call-template>  
              </td>

            </tr>
          </xsl:for-each>
        </xsl:if>
      
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 1 or
         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;">
            <span style="float:left;font-weight:bold;">a</span>
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonIsraelBoycottingCtry" />
              <xsl:with-param name="ShortMessage" select="'true'" />
            </xsl:call-template>
            <span class="styTableCellPad"></span>
          </td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 2 or
         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">b</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 3 or
         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>      
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">c</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 4 or
         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">d</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 5 or
         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">e</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 6 or
        (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">f</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 7 or
         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;"><span style="float:left;font-weight:bold;">g</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/OprInNonIsraelBoycottingCtry) &lt; 8 or
         (($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8)) ">
        <tr>
          <td class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span style="float:left;font-weight:bold;;">h</span><span class="styTableCellPad"></span></td>      
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:14mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:44mm;text-align:center;font-size:7pt;border-color:black; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none; border-bottom-width: 0px"><span class="styTableCellPad"></span></td>      
        </tr>
      </xsl:if>
      </tbody>    
    </table>
</div>
<xsl:call-template name="SetInitialDynamicTableHeight">
  <xsl:with-param name="TargetNode" select="$Form5713Data/OprInNonIsraelBoycottingCtry"/>
    <xsl:with-param name="containerHeight" select="8"/>
      <xsl:with-param name="headerHeight" select="2"/>    
  <xsl:with-param name="containerID" select=" 'TPctn6' "/>
 </xsl:call-template>

<!-- Line 11 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
    <div class="styLNDesc" style="width:168mm;height:4mm;"></div>
      <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">Yes</div>
  <div class="styIRS5713LNYesNoBox" style="width:5.25mm;height:2mm;font-weight:bold;border-bottom-width:1px;">No</div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">11</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Were you requested to participate in or cooperate with an international boycott?
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AskedToJoinBoycott" />
      </xsl:call-template>    
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AskedToJoinBoycott" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AskedToJoinBoycott" /></xsl:call-template></div>    
</div>

<div class="styBB" style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
  <div class="styLNDesc" style="width:168mm;height:4mm;">  
  If “Yes,” attach a copy (in English) of any and all such requests received during your tax year. If the request was in a form <br />other than a written request, attach a separate sheet explaining the nature and form of any and all such requests. (See <br />page 4 of instructions.)
  </div>
  <div class="styShadingCell" style="width:5.25mm;height:10.5mm;">
  </div>
  <div class="styShadingCell" style="width:5.25mm;height:10.5mm;">
  </div>
</div>

<!-- Line 12 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">12</div>
    <div class="styLNDesc" style="width:168mm;height:4mm;">Did you participate in or cooperate with an international boycott?
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <span class="styBoldText" style="width:5mm;">.</span>
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$Form5713Data/DidParticipateInBoycott" />
      </xsl:call-template>        
    </div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/DidParticipateInBoycott" /></xsl:call-template></div>
    <div class="styLNAmountBox" style="width:5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/DidParticipateInBoycott" /></xsl:call-template></div>    
</div>

<div class="styBB" style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;"></div>
  <div class="styLNDesc" style="width:168mm;height:4mm;">
  If "Yes," attach a copy (in English) of any and all boycott clauses agreed to, and attach a general statement of the agreement. If the agreement was in a form other than a written agreement, attach a separate sheet explaining the nature and form of any and all such agreements. (See page 4 of instructions.)
  </div>
</div>

<div class="styBB" style="width:187mm;clear:none; float:none;">
  <div class="styLNLeftNumBox" style="height:4mm;">Note: </div>
  <div class="styLNDesc" style="width:168mm;height:4mm;"><i>If the answer to either question 11 or 12 is "Yes," you must complete the rest of Form 5713. If you answered "Yes" to question 12, you must complete Schedules A and C or B and C (Form 5713).</i></div>
</div>

<!--Page Footer-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"></span>  
    Form <span class="styBoldText"> 5713</span> (Rev. 12-2004)
  </div>  
</div>  
<!--END Page Footer-->


<!--Page 4 start-->
<div class="styBB" style="width:187mm;">
    Form 5713 (Rev. 12-2004)<span style="width:140mm;"></span>
    Page <span style="font-weight:bold;font-size:8pt;">4</span>
</div>
<div class="styBB" style="width:187mm;border-top-width:0px">
  <div class="styLNDesc" style="width:155mm;height:4mm;">
    <span class="styPartName">Part II</span>
    <span style="font-family:verdana;font-size:8pt;font-weight:bold;"> Requests for and Acts of Participation in or Cooperation With an International Boycott</span>
  </div>
  <div class="styIRS5713LNYesNoBox" style="width:14.75mm;height:2mm;font-weight:bold;border-bottom-width:1px;">Requests</div>
  <div class="styIRS5713LNYesNoBox" style="width:15mm;height:2mm;font-weight:bold;border-bottom-width:1px;">Agreements</div>
  <div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:2mm;font-weight:bold;border-bottom-width:0px;">Yes</div>
  <div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:2mm;font-weight:bold;border-bottom-width:0px;">No</div>
  <div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:2mm;font-weight:bold;border-bottom-width:0px;">Yes</div>
  <div class="styIRS5713LNYesNoBox" style="width:7.5mm;height:2mm;font-weight:bold;border-bottom-width:0px;">No</div>
</div>
<!-- Line 13a -->
<div class="styBB" style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:4mm;">13a</div>
  <div class="styLNDesc" style="width:147mm;height:4mm;">Did you receive requests to enter into, or did you enter into, any agreement (see page 4 of instructions):</div>
  <div class="styShadingCell" style="width:7.5mm;height:4.5mm;"></div>
  <div class="styShadingCell" style="width:7.5mm;height:4.5mm;"></div>
  <div class="styShadingCell" style="width:7.5mm;height:4.5mm;"></div>
  <div class="styShadingCell" style="width:9.5mm;height:4.5mm;"></div>
</div>

<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"></div>
<div class="styLNLeftLtrBox" style="height:4.5mm;">(1)</div>
<div class="styLNDesc" style="width:142mm;height:4mm;">
  As a condition of doing business directly or indirectly within a country or with the government, a company, or a national of a country to-
</div>
<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;"></div>
<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;"></div>
<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;"></div>
<div class="styLNAmountBox" style="height:8mm;border-top-width:0px;width:7.5mm;"></div>
  <br/></div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox"><div class="styLNLeftLtrBox" style="height:4.5mm;"></div>
  </div><div class="styLNDesc" style="width:5mm;font-weight:bold;">(a)</div><div class="styLNDesc" style="width:139mm;font-weight:normal;">Refrain from doing business with or in a country which is the object of an international boycott or with the government, companies, or nationals of that country?
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>  
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
</div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ReqToRefrainDoingBusWithCtry" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ReqToRefrainDoingBusWithCtry" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainDoingBusWithCtry" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainDoingBusWithCtry" /></xsl:call-template></div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox"><div class="styLNLeftLtrBox" style="height:4.5mm;"></div>
  </div><div class="styLNDesc" style="width:5mm;font-weight:bold;">(b)</div><div style="width:139mm;font-weight:normal;" class="styLNDesc">Refrain from doing business with any U.S. person engaged in trade in a country which is the object of an international boycott or with the government, companies, or nationals of that country?
    <span class="styBoldText" style="width:19px;">.</span>
    <span class="styBoldText" style="width:19px;">.</span>
	  <span class="styBoldText" style="width:19px;">.</span>
	  <span class="styBoldText" style="width:19px;">.</span>
  </div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ReqToRefrainDoingBusWithPrsn" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/ReqToRefrainDoingBusWithPrsn" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainDoingBusWithPrsn" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainDoingBusWithPrsn" /></xsl:call-template></div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox"><div class="styLNLeftLtrBox" style="height:4.5mm;"></div>
</div>
<div class="styLNDesc" style="width:5mm;font-weight:bold;">(c)</div>
<div  class="styLNDesc" style="width:139mm;font-weight:normal;">Refrain from doing business with any company whose ownership or management is made up, in whole or in part, of individuals of a particular nationality, race, or religion, or to remove (or refrain from selecting) corporate directors who are individuals of a particular nationality, race, or religion?
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:13px;">.</span>
</div>
<div class="styLNAmountBox" style="width:7.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/RequestToRefrainDoingBusWithCo" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/RequestToRefrainDoingBusWithCo" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainDoingBusWithCo" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:11mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainDoingBusWithCo" /></xsl:call-template></div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftLtrBox"><div class="styLNLeftLtrBox" style="height:4.5mm;"></div>
  </div><div class="styLNDesc" style="width:5mm;font-weight:bold;">(d)</div><div style="width:139mm;font-weight:normal;" class="styLNDesc">Refrain from employing individuals of a particular nationality, race, or religion?
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
</div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/RequestToRefrainEmplgIndiv" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/RequestToRefrainEmplgIndiv" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainEmployingIndiv" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:7.5mm;padding-top:0mm;padding-bottom:0mm;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainEmployingIndiv" /></xsl:call-template></div>
</div>
<div class="styBB" style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;width:5mm;"></div>
<div class="styLNLeftLtrBox" style="height:4.5mm;">(2)</div>
<div class="styLNDesc" style="width:142mm;height:4mm;">
  As a condition of the sale of a product to the government, a company, or a national of a country, to refrain from shipping or insuring products on a carrier owned, leased, or operated by a person who does not participate in or cooperate with an international boycott?
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>  
</div>
<div class="styLNAmountBox" style="width:7.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/RequestToRefrainShippingProd" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/RequestToRefrainShippingProd" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;clear:none;text-align:center;"><xsl:call-template name="PopulateYesBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainShippingProd" /></xsl:call-template></div>
<div class="styLNAmountBox" style="width:7.5mm;height:10.5mm;padding-top:0mm;padding-bottom:0mm;border-bottom:none;float:left;text-align:center;"><xsl:call-template name="PopulateNoBoxText"><xsl:with-param name="TargetNode" select="$Form5713Data/AgreeToRefrainShippingProd" /></xsl:call-template></div>
</div>

<!-- Line 13b -->
<div class="styBB" style="width:187mm;">
  <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;float:left;clear:none;">b</div>
  <div class="styLNDesc" style="width:171mm;height:4mm;padding-bottom:1mm;"><b>Requests and agreements-</b>If the answer to any part of 13a is "Yes," complete the following table.  If more space is needed, attach additional sheets using the exact format and check this box
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  <span class="styBoldText" style="width:19px;">.</span>
  </div>
  
  <div class="styGenericDiv" style="height:4mm;width:8mm;padding-top:4mm;float:right;text-align:right;">
    <span style="margin-left:1mm;margin-right:2mm;"><img src="{$ImagePath}/5713_Bullet_Lg.gif" alt="Right pointing large arrowhead image" width="4"/></span>
    <label>
      <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlByctRequestAndAgrmtIncld" />
      </xsl:call-template>
    </label>      
    <input type="checkbox" class="styckbox" name="Checkbox">
      <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$Form5713Data/AddnlByctRequestAndAgrmtIncld"/>
      </xsl:call-template>
    </input>
  </div>
  <!--Table expand/collapse toggle button -->
  <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16">
  <div style="width:187mm;">
    <span class="styGenericDiv" style="float:right;clear:none;vertical-align:top;width:2mm;text-align:right;">
     <xsl:call-template name="SetDynamicTableToggleButton">
      <xsl:with-param name="TargetNode" select="$Form5713Data/BoycottRequestsAndAgreements"/>
      <xsl:with-param name="containerHeight" select="16"/>
      <xsl:with-param name="headerHeight" select="3"/>
      <xsl:with-param name="containerID" select=" 'TPctn7' "/>
     </xsl:call-template>
    </span>
  </div>
  </xsl:if>
  <!--Table expand/collapse toggle button end-->
</div>

  <!-- Line 13b Table -->
  <div class="styTableContainerNBB" id="TPctn7">
  <!-- Show table in expanded form -->
  <xsl:call-template name="SetInitialState"/>
  <!-- end -->  
    <table cellspacing="0" summary="Requests and Agreements" style="width:187mm;height:87mm;clear:both;float:none;" >
    <thead class="styTableThead">
      <tr>
        <th rowspan="3" class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;left-margin:3mm;">Name of country</th>
        <th rowspan="3" class="styTableCell" style="width:50mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Identifying number of person receiving the request or having the agreement</th>
        <th rowspan="2" colspan="2"  class="styTableCell" style="width:41mm;padding-bottom:0mm;padding-top:0mm;left-margin:0mm;text-align:center;font-size:7pt;border-color:black;">Principal business activity</th>      
        <th rowspan="3" class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">IC-DISCs only-Enter product code</th>
        <th colspan="4" class="styTableCell" style="width:64mm;padding-left:13mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">Type of cooperation or participation</th>
      </tr>      
      <tr>
        <th colspan="2" class="styTableCell" style="width:32mm;text-align:center;padding-left:5mm;font-size:7pt;border-color:black;border-right-width:1px;">Number of requests</th>
        <th colspan="2" class="styTableCell" style="width:32mm;text-align:center;padding-left:5mm;font-size:7pt;border-color:black;border-bottom-width:1px;border-right:none;">Number of agreements</th>
      </tr>
      <tr>
        <th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Code</th>
        <th class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Description</th>
        <th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Total</th>
        <th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Code</th>
        <th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Total</th>
        <th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-right:none;border-color:black;border-bottom:none;">Code</th>        
      </tr>
      <tr>      
        <th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(1)</th>
        <th class="styTableCell" style="width:50mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(2)</th>
        <th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(3)</th>
        <th class="styTableCell" style="width:26mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(4)</th>
        <th class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(5)</th>
        <th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(6)</th>
        <th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(7)</th>
        <th class="styTableCell" style="width:24mm;text-align:center;font-size:7pt;font-weight:bold;border-color:black;">(8)</th>
        <th class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;font-weight:bold;border-right:none;border-color:black;">(9)</th>
      </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:if test="($Print != $Separated) or (count($Form5713Data/BoycottRequestsAndAgreements) &lt;= 16) ">
          <xsl:for-each select="$Form5713Data/BoycottRequestsAndAgreements">
            <tr>
              <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;">
                <xsl:if  test="position()&lt;=16">
                  <span style="font-weight:bold;">
                    <xsl:number value="position()" format="a" />
                  </span>
                </xsl:if>  
                <span style="width:2mm;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfCountry"/>
                </xsl:call-template>              
              </td>
          
              <td class="styTableCell" style="width:50mm;text-align:left;font-size:7pt;border-color:black;">
                <xsl:choose>
                  <xsl:when test="SSNOfPersonInvolved!=''">            
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="SSNOfPersonInvolved"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="EINOfPersonInvolved"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="NameOfForeignCorpHavingOpr!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine1"/>
                  </xsl:call-template>
                  <xsl:if test="NameOfForeignCorpHavingOpr/BusinessNameLine2!=''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="NameOfForeignCorpHavingOpr/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:if>
                <br/>
                <xsl:call-template name="populateEINFieldTemplate">
                  <xsl:with-param name="TargetNode" select="."/>
                </xsl:call-template>
              </td>
        
              <td class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-style:solid;border-width:1px;border-top:none;border-left:none;border-color:black;border-width-right:1px;" >
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCode"/>
                </xsl:call-template>
              </td>
        
              <td class="styTableCell" style="width:26mm;text-align:left;font-size:7pt;border-style:solid;border-width:1px;border-top:none;border-left:none;border-color:black;border-width-right:1px;" >
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PrincipalBusinessActivityDesc"/>
                </xsl:call-template>
              </td>  
        
              <td class="styTableCell" style="width:15mm;text-align:center;font-size:7pt;border-style:solid;border-width:1px;border-top:none;border-left:none;border-color:black;border-width-right:1px;" >
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ICDISCSProductCode"/>
                </xsl:call-template>
              </td>

        
              <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"  nowrap="nowrap">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="12" />
                  <xsl:with-param name="TargetNode" select="TotalNumberOfBoycottRequests"/>
                </xsl:call-template>
              </td>
        
              <td class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-color:black;"  nowrap="nowrap">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NumberOfBoycottRequestsCode"/>
                </xsl:call-template>
              </td>
        
              <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;border-width-right:1px;" nowrap="nowrap">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="12" />          
                  <xsl:with-param name="TargetNode" select="TotalNumberOfBoycottAgreements"/>
                </xsl:call-template>
              </td>
        
              <td class="styTableCell" style="width:8mm;text-align:center;font-size:7pt;border-color:black;border-bottom-width:1px;border-right:none;"  nowrap="nowrap">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NumberOfBoycottAgreementsCode"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </xsl:if>
      
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 1 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">a</span></td>
          <td class="styTableCell" style="width:60mm;text-align:left;font-size:7pt;border-color:black;">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form5713Data/BoycottRequestsAndAgreements" />
            </xsl:call-template>
            <span class="styTableCellPad"></span>
          </td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 2 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">b</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 3 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">c</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 4 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">d</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 5 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">e</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 6 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">f</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 7 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">g</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 8 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">h</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 9 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">i</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 10 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">j</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 11 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">k</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 12 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">l</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>  
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 13 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">m</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt; 14 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">n</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt;15 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">o</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>  
      <xsl:if test="count($Form5713Data/BoycottRequestsAndAgreements) &lt;16 or
         (($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16)) ">
        <tr>
          <td class="styTableCell" style="width:15mm;text-align:left;font-size:7pt;border-color:black;"><span class="styTableCellPad" style="float:left;font-weight:bold;">p</span></td>
          <td class="styTableCell" style="width:50mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:26mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:15mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:24mm;text-align:right;font-size:7pt;border-color:black;"><span class="styTableCellPad"></span></td>
          <td class="styTableCell" style="width:8mm;text-align:right;font-size:7pt;border-color:black;border-right:none;"><span class="styTableCellPad"></span></td>
        </tr>
      </xsl:if>
      </tbody>                    
    </table>
  </div>

<xsl:call-template name="SetInitialDynamicTableHeight">
  <xsl:with-param name="TargetNode" select="$Form5713Data/BoycottRequestsAndAgreements"/>
    <xsl:with-param name="containerHeight" select="16"/>
      <xsl:with-param name="headerHeight" select="3"/>    
  <xsl:with-param name="containerID" select=" 'TPctn7' "/>
 </xsl:call-template>  


<!--Page Footer-->
<div class="pageEnd" style="width:187mm">
  <div style="float:right;">
    <span style="width:80px;"></span>  
    Form <span class="styBoldText"> 5713</span> (Rev. 12-2004)
  </div>  
</div>  
<!--END Page Footer-->
<br/>
    
  <!-- BEGIN Left Over Table -->  
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
        <xsl:with-param name="TargetNode" select="$Form5713Data" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>

  <!-- END Left Over Table -->  
  
    <!-- Additonal Data Table for separated data from Line 2b -->
    <xsl:if test="($Print = $Separated) and (count($Form5713Data/ParntershipAndCorporation) &gt; 6) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 5713, Line 2b - Corporations:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell">Name</th>
            <th class="styDepTblCell">Identifying Number</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$Form5713Data/ParntershipAndCorporation">
            <tr>
              <!--Define background colors to the rows -->
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styDepTblCell" style="width:140mm;text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                </xsl:call-template>
                <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" style="width:40mm;text-align:center">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="IdentifyingNumber"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Line 2b separated data -->
    
    <!-- Additonal Data Table for separated data from Part I Line 8 -->
    <xsl:if test="($Print = $Separated) and (count($Form5713Data/OprInCtryBoycottingIsrael) &gt; 15) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 5713, Part I, Line 8 - Boycott of Israel:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:26mm;text-align:center;border-bottom:none;left-margin:3mm;">Name of country</th>
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:60mm;text-align:center;border-bottom:none;">Identifying number of person having operations</th>
            <th class="styDepTblCell" scope="col" colspan="2"  style="width:60mm;text-align:center;border-color:black;">Principal business activity</th>
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:41mm;text-align:center;border-bottom:none;">IC-DISCs only-Enter product code</th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-bottom:none;">Code</th>
            <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-bottom:none;">Description</th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(1)</th>
            <th class="styDepTblCell" scope="col" style="width:60mm;text-align:center;border-top:none">(2)</th>
            <th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-top:none">(3)</th>
            <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-top:none">(4)</th>
            <th class="styDepTblCell" scope="col" style="width:41mm;text-align:center;border-top:none;">(5)</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$Form5713Data/OprInCtryBoycottingIsrael">
            <tr>
              <xsl:call-template name="BoycottDetailsTypeDepTblRow" />
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part I Line 8 separated data -->
    
    <!-- Additonal Data Table for separated data from Part I Line 9 -->
    <xsl:if test="($Print = $Separated) and (count($Form5713Data/OprInNonlistedCtryByctIsrael) &gt; 8) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 5713, Part I, Line 9 - Nonlisted countries boycotting Israel:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:26mm;text-align:center;border-bottom:none;left-margin:3mm;">Name of country</th>
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:60mm;text-align:center;border-bottom:none;">Identifying number of person having operations</th>
            <th class="styDepTblCell" scope="col" colspan="2"  style="width:60mm;text-align:center;border-color:black;">Principal business activity</th>
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:41mm;text-align:center;border-bottom:none;">IC-DISCs only-Enter product code</th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-bottom:none;">Code</th>
            <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-bottom:none;">Description</th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(1)</th>
            <th class="styDepTblCell" scope="col" style="width:60mm;text-align:center;border-top:none">(2)</th>
            <th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-top:none">(3)</th>
            <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-top:none">(4)</th>
            <th class="styDepTblCell" scope="col" style="width:41mm;text-align:center;border-top:none;">(5)</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$Form5713Data/OprInNonlistedCtryByctIsrael">
            <tr>
              <xsl:call-template name="BoycottDetailsTypeDepTblRow" />
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part I Line 9 separated data -->
    
    <!-- Additonal Data Table for separated data from Part I Line 10 -->
    <xsl:if test="($Print = $Separated) and (count($Form5713Data/OprInNonIsraelBoycottingCtry) &gt; 8) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 5713, Part I, Line 10 - Boycotts other than the boycott of Israel:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:26mm;text-align:center;border-bottom:none;left-margin:3mm;">
              Name of country
            </th>
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:60mm;text-align:center;border-bottom:none;">
              Identifying number of person having operations
            </th>
            <th class="styDepTblCell" scope="col" colspan="2"  style="width:60mm;text-align:center;border-color:black;">
              Principal business activity
            </th>
            <th class="styDepTblCell" scope="col" rowspan="2" style="width:41mm;text-align:center;border-bottom:none;">
              IC-DISCs only-Enter product code
            </th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-bottom:none;">Code</th>
            <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-bottom:none;">Description</th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(1)</th>
            <th class="styDepTblCell" scope="col" style="width:60mm;text-align:center;border-top:none">(2)</th>
            <th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-top:none">(3)</th>
            <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;border-top:none">(4)</th>
            <th class="styDepTblCell" scope="col" style="width:41mm;text-align:center;border-top:none;">(5)</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$Form5713Data/OprInNonIsraelBoycottingCtry">
            <tr>
              <xsl:call-template name="BoycottDetailsTypeDepTblRow" />
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part I Line 10 separated data -->
    
    <!-- Additonal Data Table for separated data from Part II Line 13b -->
    <xsl:if test="($Print = $Separated) and (count($Form5713Data/BoycottRequestsAndAgreements) &gt; 16) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 5713, Part II, Line 13b - Requests and agreements:
      </span>
      <table class="styDepTbl" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" rowspan="3" style="width:15mm;text-align:center;border-bottom:none;left-margin:3mm;">
              Name of country
            </th>
            <th class="styDepTblCell" scope="col" rowspan="3" style="width:50mm;text-align:center;border-bottom:none;">
              Identifying number of person having operations
            </th>
            <th class="styDepTblCell" scope="col" rowspan="2" colspan="2"  style="width:41mm;text-align:center;border-color:black;">
              Principal business activity
            </th>
            <th class="styDepTblCell" scope="col" rowspan="3" style="width:15mm;text-align:center;border-bottom:none;">
              IC-DISCs only-Enter product code
            </th>
            <th class="styDepTblCell" scope="col" colspan="4" style="width:64mm;text-align:center;border-bottom:none;">
              Type of cooperation or participation
            </th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" colspan="2" style="width:32mm;text-align:center;">Number of requests</th>
            <th class="styDepTblCell" colspan="2" style="width:32mm;text-align:center;">Number of agreements</th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-bottom:none;">Code</th>
            <th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-bottom:none;">Description</th>
            <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-bottom:none;">Total</th>
            <th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-bottom:none;">Code</th>
            <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-bottom:none;">Total</th>
            <th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-bottom:none;">Code</th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-top:none">(1)</th>
            <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center;border-top:none">(2)</th>
            <th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-top:none">(3)</th>
            <th class="styDepTblCell" scope="col" style="width:26mm;text-align:center;border-top:none">(4)</th>
            <th class="styDepTblCell" scope="col" style="width:15mm;text-align:center;border-top:none;">(5)</th>
            <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-top:none">(6)</th>
            <th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-top:none">(7)</th>
            <th class="styDepTblCell" scope="col" style="width:24mm;text-align:center;border-top:none;">(8)</th>
            <th class="styDepTblCell" scope="col" style="width:8mm;text-align:center;border-top:none;">(9)</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$Form5713Data/BoycottRequestsAndAgreements">
            <tr>
              <xsl:call-template name="BoycottDetailsTypeDepTblRow" />
              
              <td class="styDepTblCell" style="text-align:right"  nowrap="nowrap">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="12" />
                  <xsl:with-param name="TargetNode" select="TotalNumberOfBoycottRequests"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" style="text-align:center;"  nowrap="nowrap">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NumberOfBoycottRequestsCode"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" style="text-align:center," nowrap="nowrap">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="12" />          
                  <xsl:with-param name="TargetNode" select="TotalNumberOfBoycottAgreements"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" style="text-align:center;"  nowrap="nowrap">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NumberOfBoycottAgreementsCode"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part II Line 13b separated data -->

</form>
</body>
</html>
  </xsl:template>
</xsl:stylesheet>