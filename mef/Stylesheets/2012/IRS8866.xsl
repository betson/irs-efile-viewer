<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8866Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="Form8866Data" select="$RtnDoc/IRS8866" />
<xsl:template match="/">
<html xmlns="http://www.irs.gov/efile" xmlns:efile="http://www.irs.gov/efile">
<head>
  <title>
    <xsl:call-template name="FormTitle">
    <xsl:with-param name="RootElement" select="local-name($Form8866Data)">
    </xsl:with-param></xsl:call-template>
  </title>
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <meta http-equiv="Cache-Control" content="private"/>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Description" content="IRS Form 8866"/>
  <META name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>
  <style type="text/css">
<xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8866Style"></xsl:call-template>    
      <xsl:call-template name="AddOnStyle"></xsl:call-template>    
</xsl:if>
  </style>
</head>
<body class="styBodyClass" style="width:187mm">
  <form name="Form8866">
    <xsl:call-template name="DocumentHeader"></xsl:call-template>
    <!-- Set !Header box width -->
    <div style="width:187mm;">
      <!-- Form No., etc.-->
      <div class="styFNBox" style="float:left;width:30mm;height:22.5mm;">
        <div style="padding-top:1mm;">
          Form<span style="width=2mm;"></span>
          <span class="styFormNumber">8866</span>
          </div>
        <div style="padding-top:1.5mm; font-size:6pt;">(Rev. August 2012)
           <span style="padding-right:3mm">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8866Data"/>
          </xsl:call-template>  
          </span>  
        </div>
        <div style="padding-top:1mm;">
          <span class="styAgency">Department of the Treasury</span><br/>
          <span class="styAgency">Internal Revenue Service</span>
        </div>
      </div>
      <!-- Form title in header -->    
      <div class="styFTBox" style="width:126mm;">
        <div class="styMainTitle">Interest Computation Under the Look-Back Method for
             Property Depreciated Under the Income Forecast Method
        </div>
        <div class="styFBT" style="padding-top:3mm;text-align:left;">
         

         <div ><span style="width:14mm"/>
         <img src="{$ImagePath}/8866_Bullet_Md.gif" alt="bullet image pointing to right" />
								 Information about Form 8866 and its separate instructions is available at 
    </div>
    <span style="width:45mm"/>
   <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8866" title="Link to IRS.gov">
										<i>www.irs.gov/form8866.</i>
									</a>	
        </div>
      </div>
      <!-- OMB etc; set OMB width to 6 pt since 7pt will increase width to over 187mm-->  
      <div class="styTYBox" style="width:30mm;height:22.5mm;">
        <div class="styOMB" style="height:auto;"><br/>OMB No. 1545-1622</div>
        <div class="stySequence" style="height:auto;padding-top:3mm; padding-left: 2mm;">
          Attachment
          <div>
          Sequence No. <span class="styBoldText" style="font-size:8pt;">108</span>
        </div></div>
      </div>
    </div>
    <!-- End Header coding -->
    <!-- Tax year begining and ending -->
     <div class="styBB" style="width:187mm;border-top-width:1px;font-size:7pt;">
        For the recomputation year beginning
    <span style="width:1mm;"></span>
        <span style="width:35mm;text-align:center;">
	   <xsl:if test="normalize-space($Form8866Data/FilingYearBeginning) != ''">
	     <xsl:call-template name="PopulateText">
	     <xsl:with-param name="TargetNode" select="$Form8866Data/FilingYearBeginning"/>
	     </xsl:call-template>
	     </xsl:if>     
	    </span>  
	    , and ending
	    <span style="width:1mm;"></span>
	       <span style="width:35mm;text-align:center;">
	        <xsl:if test="normalize-space($Form8866Data/FilingYearEnding) != ''">
	        <xsl:call-template name="PopulateText">
	          <xsl:with-param name="TargetNode" select="$Form8866Data/FilingYearEnding"/>
	        </xsl:call-template>  
	        </xsl:if>  
      </span>
      . See instructions.
    </div>
  <!-- End Tax Year Beginning and Ending -->     
    <!-- Name and identifying number -->
    <div  style="width:187mm;">
     <div class="styNameBox" style="border-right-width:0px;width:27.1mm;text-align:center;font-size:7pt;font-weight:bold;padding-top:.5mm;">
      </div>
      <div class="styNameBox" style="font-size:7pt;width:104.5mm;height:11mm;border-left-width:1px;border-bottom-width:1px;padding-left:1mm">Name<br/>
       <span style="font-size: 7pt; font-weight: normal">
			 <xsl:choose>
			 <xsl:when test="$RtnHdrData/ReturnType='1040'">
			    <xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">Name</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
			 </xsl:call-template><br/>
		 <xsl:call-template name="PopulateReturnHeaderFiler">
			 <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
			 </xsl:call-template>						
		     </xsl:otherwise>
			 </xsl:choose>
			</span>
      </div>
    <div class="styBB" style="float:right;clear:none;padding-left:2mm;font-size:7pt;width:55mm;height:auto;border-bottom-width:1px;border-color:black;">
          <b>A  Identifying number</b><br/>
      <xsl:choose>
		  <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
		  <xsl:call-template name="PopulateReturnHeaderFiler">
			 <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
			 </xsl:call-template>
		     </xsl:when>
			 <xsl:otherwise>
			 <xsl:call-template name="PopulateReturnHeaderFiler">
			 <xsl:with-param name="TargetNode">EIN</xsl:with-param>
			 </xsl:call-template>
			 </xsl:otherwise>
			</xsl:choose>
      </div>  
    </div>

    <!-- Number, Street, City, State and Zip Code -->
    <div class="styBB" style="width:187mm;">
      <div class="styNameBox" style="border-right-width:0px;width:27mm;text-align:center;font-size:9pt;font-weight:bold;padding-top:.5mm;">
 Print or <br/>Type
      </div>
      <div style="width:104mm;float:left;">
        <div class="styNameBox" style="border-left-width:1px;font-size:7pt;width:104.5mm;height:11mm;border-bottom-width:1px;">
          <span style="width:1mm;"/>
          Number, street, and apt., room, or suite no. If a P.O. box, see instructions.
          <div style="float:left;font-size:7pt;width:104mm;">
            <span style="width:1mm;"/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1</xsl:with-param></xsl:call-template>
                <span style="padding-left:1mm"/><br/> 
                 <span style="width:1mm;"/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2</xsl:with-param></xsl:call-template>           
          </div>  
        </div>
        <div class="styNameBox" style="border-left-width:1px;float:left;font-size:7pt;width:104.5mm;height:11mm">
          <span style="width:1mm;"/>
          City or town, state, and ZIP code. If a foreign address, see instructions.
          
          <div style="float:left;font-size:7pt;width:104mm;">
          <xsl:if test="$RtnHdrData/Filer/USAddress">
            <span style="width:1mm;"/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">City</xsl:with-param></xsl:call-template>
           <span style="width:1mm;"/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">State</xsl:with-param></xsl:call-template>  
         <span style="width:1mm;"/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">ZIPCode</xsl:with-param></xsl:call-template>
            </xsl:if>   
            <xsl:if test="$RtnHdrData/Filer/ForeignAddress">
             <span style="width:1mm;"/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">City</xsl:with-param></xsl:call-template>
               
            <span style="width:1mm"/>
    <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param></xsl:call-template>
     <br/><span style="width:1mm"/>
    <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PostalCode</xsl:with-param></xsl:call-template> 
      <span style="width:1mm"/>
    <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Country</xsl:with-param></xsl:call-template>
    
    </xsl:if>   
          </div>
          
          <!--<div style="float:left;font-size:7pt;width:104mm;">
            <span style="width:3px;"/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param></xsl:call-template>
            <span style="width:3px;"/>
    <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Country</xsl:with-param></xsl:call-template>
          </div>
-->        </div>
      </div>
     <!-- Taxpayer type is choice element -->
      <div class="styEINBox" style="float:right;text-align:center;font-face:Arial;font-size:7pt;font-weight:normal;width:55mm;
      border-top-width:1px;">
      <span style="padding-left:.1mm;font-weight:bold;">B</span>
        <span style="width:.5mm;"></span> 
        <span style="font-size:6pt;">Check applicable box to show type of taxpayer:</span>
        <span style="width:55mm;height:6mm;font-weight:normal;text-align:left;padding-top:3mm;">
          <span style="width:3mm;"></span>
          <!--Corporation Check Box -->
          <input type="checkbox" class="styCkbox" alt="Corporation" style="width:5mm;">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerCorporation" />
             <xsl:with-param name="BackupName">Type Of Taxpayer Corporation</xsl:with-param>  
            </xsl:call-template>
          </input>
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerCorporation" />
                <xsl:with-param name="BackupName">Type Of Taxpayer Corporation</xsl:with-param>  
            </xsl:call-template>
            <span style="vertical-align:bottom;">Corporation</span>
          </label>
          <span style="width:3mm;"></span>
          <!--S Corporation Check Box -->
          <input type="checkbox" class="styCkbox" alt="S Corporation" style="width:5mm;">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerSCorporation" />
              <xsl:with-param name="BackupName">Type Of Taxpayer S Corporation</xsl:with-param>    
            </xsl:call-template>
          </input>  
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerSCorporation" />
            <xsl:with-param name="BackupName">Type Of Taxpayer S Corporation</xsl:with-param>      
            </xsl:call-template><span style="vertical-align:bottom;">S corporation</span>
          </label>
        </span>
        <div style="width:55mm;font-weight:normal;text-align:left;padding-top:0.5mm;">
          <span style="width:3mm;"></span>
          <!--Individual Check Box -->
          <input type="checkbox" class="styCkbox" alt="Individual" style="width:5mm;">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerIndividual" />
   <xsl:with-param name="BackupName">Type Of Taxpayer Individual</xsl:with-param>  
            </xsl:call-template>
          </input>
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerIndividual" />
              <xsl:with-param name="BackupName">Type Of Taxpayer Individual</xsl:with-param>  
          </xsl:call-template>
            <span style="vertical-align:bottom;">Individual</span>
          </label>
          <span style="width:5.25mm;"></span>
          <!--Partnership Check Box -->
          <input type="checkbox" class="styCkbox" alt="Partnership" style="width:5mm;">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerPartnership" />
         <xsl:with-param name="BackupName">Type Of Taxpayer Partnership</xsl:with-param>       
            </xsl:call-template>
          </input>  
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerPartnership" />
              <xsl:with-param name="BackupName">Type Of Taxpayer Partnership</xsl:with-param>      
            </xsl:call-template>
            <span style="vertical-align:bottom;">Partnership</span><span style="width:1mm;"></span>
          </label>          
        </div>
        <div style="width:55mm;font-weight:normal;text-align:left;padding-top:0.5mm;">
          <span style="width:3mm;"></span>
           <!--Estate Or Trust Check Box -->
          <input type="checkbox" class="styCkbox"  alt="Estate or trust" style="width:5mm;margin-left:none;">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerEstateOrTrust" />
            <xsl:with-param name="BackupName">Type Of Taxpayer Estate Or Trust</xsl:with-param>        
            </xsl:call-template>
          </input>  
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TypeOfTaxpayerEstateOrTrust" />
                <xsl:with-param name="BackupName">Type Of Taxpayer Estate Or Trust</xsl:with-param>  
            </xsl:call-template><span style="vertical-align:bottom;">Estate or trust</span>
          </label>        
        </div>  
      </div>
    </div>
    <!-- Line C -->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="width:4mm;padding-top:none;">C</div>
      <div style="height:8mm;width:183mm;" class="styGenericDiv">
      <xsl:choose>
          <xsl:when test="count($Form8866Data/PassThroughEntityInfo) = 1">            
          <span style="width:182mm;">If you were an owner of an interest in a pass-through entity (such as a partnership or an S corporation) that depreciated one or more properties to which this interest computation relates, enter the name and employer identification number of the entity. Attach a schedule if there is more than one such entity.</span>   
          </xsl:when>
          <xsl:otherwise>
            <span style="width:178mm;padding-top:.5mm;" class="styGenericDiv">If you were an owner of an interest in a pass-through entity (such as a partnership or an S corporation) that depreciated one or more properties to which this interest computation relates, enter the name and employer identification number of the entity. Attach a schedule if there is more than one such entity.</span>
            <!-- Table expand/collapse toggle button -->
            <span style="width:4mm;vertical-align:top;float:right;">
                <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form8866Data/PassThroughEntityInfo"/>
                <xsl:with-param name="containerHeight" select="1"/>
                <xsl:with-param name="headerHeight" select="1"/>
                <xsl:with-param name="containerID" select=" 'TPctn' "/>
                </xsl:call-template>
            </span> 
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
    <xsl:variable name="part4Count" select="count($Form8866Data/PassThroughEntityInfo)"/>
    <div style="width:187mm;height:14mm;"  id="TPctn" class="styTableContainer">
      <xsl:call-template name="SetInitialState"/>
    <table cellspacing="0" summary="Table displaying entity name or names and corresponding employer identification numbers" style="font-size:7pt;" name="TYTable" id="TYTable"  class="styTable">
    <thead class="styTableThead" >
      <tr>
        <th class="styTableCell" rowspan="1"  scope="col"  style="width:139mm;text-align:left;border-color:black;border-right-width:1px;border-bottom:none;font-weight:normal;padding-left:4mm;"><br/>Name of entity:<br/><br/></th>
        <th class="styTableCell" rowspan="1"  scope="col" style="width:48mm;text-align:center;border-color:black;border-bottom:none;border-right:none;"><span style="font-weight:bold;">Employer identification number<br/><br/></span></th>
      </tr>
    </thead>
    <tfoot></tfoot>    
    <tbody>
    <!-- If the Seperated Repeating Data is flag is not set -->
    <xsl:if test="not((count($Form8866Data/PassThroughEntityInfo) &gt; 1) and ($Print = $Separated))">
      <xsl:for-each select="$Form8866Data/PassThroughEntityInfo">
        <tr>
            <xsl:choose>
              <xsl:when test="$part4Count &gt; 1 and position() &lt; $part4Count">
                <td class="styTableCell" style="margin-left:2mm;width:139mm;border-color:black;border-left:none;border-right-width:1px;text-align:left;padding-left:4mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine1" />
                  </xsl:call-template><br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine2" />
                  </xsl:call-template><span style="width:1px;"></span>
                </td>
                <td class="styTableCell" style="width:48mm;border-color:black;text-align:left;padding-left:5mm;border-left:none;border-right:none;padding-top:6mm">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="EINOfPassThroughEntity" />
                  </xsl:call-template>
                  <xsl:if test="MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
                  <span style="width:1px;"></span><span style="width:1px;"></span>
                </td>
              </xsl:when>            
              <xsl:when test="position() = $part4Count">
                <td class="styTableCell" style="margin-left:2mm;width:139mm;border-color:black;border-left:none;border-right-width:1px;text-align:left;border-bottom:none;padding-left:4mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine1" />
                  </xsl:call-template><br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine2" />
                  </xsl:call-template><span style="width:1px;"></span>
                </td>
                <td class="styTableCell" style="width:48mm;border-color:black;text-align:left;padding-left:5mm;border-left:none;border-right:none;border-bottom:none;padding-top:6mm">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="EINOfPassThroughEntity" />
                  </xsl:call-template>
                   <xsl:if test="MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
                  <span style="width:1px;"></span>
                </td>
              </xsl:when>            
            </xsl:choose>
        </tr>
      </xsl:for-each>
      </xsl:if>
      <xsl:if test="((count($Form8866Data/PassThroughEntityInfo) &gt; 1) and ($Print = $Separated))">      
        <tr>
                 <td class="styTableCell" style="margin-left:2mm;width:139mm;border-color:black;border-left:none;border-right-width:1px;text-align:left;border-bottom:none;padding-left:4mm;">
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode">$Form8866Data/PassThroughEntityInfo</xsl:with-param>
                    </xsl:call-template>
                 </td>
                <td class="styTableCell" style="width:48mm;border-color:black;text-align:left;padding-left:5mm;border-left:none;border-right:none;border-bottom:none;"></td>
        </tr>
      </xsl:if>
    </tbody>
    </table>
 <xsl:if test="not((count($Form8866Data/PassThroughEntityInfo) &gt; 1) and ($Print = $Separated))">
    <xsl:if test="count($Form8866Data/PassThroughEntityInfo) &gt; 1">
        <xsl:call-template name="SetInitialDynamicTableHeight">
         <xsl:with-param name="TargetNode" select="$Form8866Data/PassThroughEntityInfo"/>
            <xsl:with-param name="containerHeight" select="1"/>
              <xsl:with-param name="headerHeight" select="1"/>    
          <xsl:with-param name="containerID" select=" 'TPctn' "/>
        </xsl:call-template>
    </xsl:if>
  </xsl:if>
</div>
<!--Determine how many time to repeat the entire table-->
<xsl:variable name="ESCount" select="count($Form8866Data/IncomeForcastMethodPriorYrGrp)" />
<xsl:variable name="preMax">
  <xsl:choose>
        <xsl:when test="$ESCount mod 4 = 0">     
      <xsl:value-of select="$ESCount div 4" />
       </xsl:when>
        <xsl:otherwise>
           <xsl:value-of select="ceiling($ESCount div 4)" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
<xsl:call-template name="part5Loop">
  <xsl:with-param name="part4Count" select="$part4Count" />
  <xsl:with-param name="max">
    <xsl:choose>
         <xsl:when test="$preMax = 0">     
        <xsl:value-of select="1" />
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$preMax" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:with-param>
</xsl:call-template>  
  
  <!--  ********************************************************************* -->
  <!-- line 9-1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="width:5mm" >9</div>
<div class="styLNDesc">
 <span style="float: left; clear: none;">
Net amount of 
      <span style="font-weight:bold;">interest to be refunded to you.</span> If line 8, column (c), exceeds line 7, column (c), enter the</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;border-right-width:0px"></div>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;border-left-width:0px;">
</div>
</div>
<!--  line 9-2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;width:5mm"></div>
<div class="styLNDesc" style="height:4mm;">
<span style="float: left; clear: none;">excess. File Form 8866 separately; <span style="font-weight:bold;">do not </span> attach it to your tax return (see instructions)</span>
<!--Dotted Line-->
<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;width:12mm"></div>
<div class="styLNAmountBox" style="height:4mm;border-left-width:0px;">

</div>
</div>
<!--   ********************************************************************* -->
 <!-- line 10-1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="width:5mm" >10</div>
<div class="styLNDesc">
 <span style="float: left; clear: none;">
Net amount of 
      <span style="font-weight:bold;">interest you owe.</span> If line 7, column (c), exceeds line 8, column (c), enter the excess. </span>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;border-right-width:0px"></div>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;border-left-width:0px;">
</div>
</div>
<!-- line 10-2 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="width:5mm" ></div>
<div class="styLNDesc">
 <span style="float: left; clear: none;">
Attach Form 8866 to your tax return. See instructions for where to include this amount on your return </span>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;border-right-width:0px;padding-left:11mm;"></div>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;border-left-width:0px;">
 <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form8866Data/NetAmountOfInterestYouOwe"/>
      </xsl:call-template>
</div>
</div>

<!--   ********************************************************************* -->
  
  
<!-- BEGIN Signature Section -->
<div class="styBB" style="width:187mm;font-size:9pt;clear:both;float:none;"><span style="font-weight:bold;">Signatures.</span>  Complete this section <span style="font-weight:bold;">only</span> if this form is being filed separately and not with the tax return.</div>  
<!-- Implementing the signature section in table -->
     <div class="styBB">
<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;clear:both;">
	<tr>
		<td rowspan="5" style="width:18mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:0 solid black;">Sign Here</td>
		<td colspan="4" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this form, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer
has any knowledge. </td>
	</tr>
	<tr>
	    <td style="width:6mm"></td>
		<td >Your signature</td>
	<td style="border-left:1 solid black;padding-left:1mm">Date</td>
	</tr>
	<tr>
<td rowspan="2" style="padding-left:1mm;border-bottom-width:1px;">
		<img src="{$ImagePath}/8866_Bullet_Lg.gif" alt="Big Right Arrow"/>
</td>
		<td style="width:130mm;border-bottom:1 solid black;border-right-width:1px">
        <xsl:call-template name="PopulateReturnHeaderOfficer">
          <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param> 
        </xsl:call-template>
        <span style="width:1px;"></span>
     </td>
		<td style="width:53mm;border-bottom:1 solid black;vertical-align:bottom;border-left:1 solid black;padding-left:1mm">
      <xsl:call-template name="PopulateReturnHeaderOfficer">
        <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
      </xsl:call-template>
		</td>
	</tr>
<tr>
		<td style="vertical-align:top;">Spouse's signature. If a joint return, both spouses must sign.</td>
		<td style="border-left:1 solid black;padding-left:1mm">Date</td>
	</tr>
	<tr>
	<td  border="1" style="border-color:black">
</td>
		<td style="width:103mm;">
        <xsl:call-template name="PopulateReturnHeaderOfficer">
          <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param> 
        </xsl:call-template>
        <span style="width:1px;"></span>
     </td>

		<td style="width:53mm;border-bottom:0 solid black;border-left:1 solid black;padding-left:1mm">
      <xsl:call-template name="PopulateReturnHeaderOfficer">
        <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
      </xsl:call-template>
		</td>
	</tr>	
</table></div>
    <!-- End Signature Section -->
    <!-- BEGIN PREPARER SIGNATURE SECTION   -->
	 <!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;float:none;clear:both;height:25mm"> 
						<div style="width:18mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:169mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;border-left:1px;">
								<div class="styLNDesc" style="height:8mm;width:49mm;padding-top:0mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/Name"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:50mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:8mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerDatePrepared</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:18mm;
								border-right:1 solid  black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" alt="self-employed" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:8mm;width:32mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <span style="width:6mm;"/>
									<xsl:if test="$RtnHdrData/Preparer/SSN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Preparer/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!--<xsl:if test="$RtnHdrData/Preparer/STIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>-->
								</div>
							</div>
							<div style="width:169mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:auto;width:126.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
									<span class="styGenericDiv" >Firm's name 
									<span style="width:2.2mm;"/>
 <img src="{$ImagePath}/8866_Bullet_Md.gif" alt="bullet image pointing to right"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmPreparerFirmBusinessNameBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmPreparerFirmBusinessNameBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:34mm;padding-left:1mm;">Firm's EIN
							<img src="{$ImagePath}/8866_Bullet_Md.gif" alt="bullet image pointing to right"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PreparerFirm/EIN">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmEIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerFirm/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;height:7mm">
								<div class="styLNDesc" style="width:126.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;height:9mm">Firm's address 
  <img src="{$ImagePath}/8866_Bullet_Md.gif" alt="bullet image pointing to right"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
	<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. <br/>
						
							<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPhone</xsl:with-param>
									</xsl:call-template>
																			
										
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
		  <!-- END PREPARER SIGNATURE SECTION -->


<!-- footer line -->
  <!-- Footer line -->
      <div style="width:187mm;clear:both;padding-top:1mm;" >
        <div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</div>
        <div style="width:50mm;text-align:center;" class="styGenericDiv">Cat. No. 26036C</div>
        <div style = "float:right;" class="styGenericDiv">Form <span class="styBoldText">8866</span> (Rev. 8-2012)</div>
      </div>
  <!-- End Footer Line -->
  
   <br class="pageEnd"/>
        
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
        <xsl:with-param name="TargetNode" select="$Form8866Data" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>

    <!-- Separated Repeating Data Tables -->

      <!-- Optional Print Solution for repeating data table - C -->
    <xsl:if test="(count($Form8866Data/PassThroughEntityInfo) &gt; 1) and ($Print = $Separated)">
      <span class="styRepeatingDataTitle">Form 8866, Line C:</span>
    <table class="styDepTbl" cellspacing="0" summary="Table displaying entity name or names and corresponding employer identification numbers" style="font-size:7pt;" name="TYTable" id="TYTable">
    <thead class="styTableThead">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" rowspan="1"  scope="col"  style="width:139mm;text-align:left;border-color:black;border-right-width:1px;padding-left:4mm;">Name of entity</th>
        <th class="styDepTblCell" rowspan="1"  scope="col"  style="width:48mm;text-align:center;border-color:black;border-right:none;"><span style="font-weight:bold;">Employer identification number</span></th>
      </tr>
    </thead>
    <tfoot></tfoot>    
    <tbody>
    <!-- If the Seperated Repeating Data is flag is not set -->
      <xsl:for-each select="$Form8866Data/PassThroughEntityInfo">
        <tr>
          <!-- Define background colors to the rows -->
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        
            <xsl:choose>
              <xsl:when test="$part4Count &gt; 1 and position() &lt; $part4Count">
                <td class="styTableCell" style="margin-left:2mm;width:139mm;border-color:black;border-left:none;border-right-width:1px;text-align:left;padding-left:4mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine1" />
                  </xsl:call-template><br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine2" />
                  </xsl:call-template><span style="width:1px;"></span>
                </td>
                <td class="styTableCell" style="width:48mm;border-color:black;text-align:left;padding-left:5mm;border-left:none;border-right:none;">
                   <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="EINOfPassThroughEntity" />
                  </xsl:call-template>
                  <xsl:if test="MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
                </td>
              </xsl:when>            
              <xsl:when test="position() = $part4Count">
                <td class="styTableCell" style="margin-left:2mm;width:139mm;border-color:black;border-left:none;border-right-width:1px;text-align:left;border-bottom:none;padding-left:4mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine1" />
                  </xsl:call-template><br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NameOfPassThroughEntity/BusinessNameLine2" />
                  </xsl:call-template><span style="width:1px;"></span>
                </td>
                <td class="styTableCell" style="width:48mm;border-color:black;text-align:left;padding-left:5mm;border-left:none;border-right:none;border-bottom:none;">
 <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="EINOfPassThroughEntity" />
                  </xsl:call-template>
                  <xsl:if test="MissingEINReason !=' '">            
                  <span style="font-weight:normal;">  
                      <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                       </xsl:call-template>
                  </span> 
              </xsl:if>
                </td>
              </xsl:when>            
            </xsl:choose>
        </tr>
      </xsl:for-each>
    </tbody>
    </table>
 
 </xsl:if>
   
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    
      <!-- Optional Print Solution for repeating data table Lines 1-8 -->
<!--    <xsl:if test="(count($Form8866Data/IncomeForcastMethodPriorYrGrp) &gt; 3) and ($Print = $Separated)">-->
 <xsl:if test="(count($Form8866Data/IncomeForcastMethodPriorYrGrp) &gt; 2)">
      <br />
      <span class="styRepeatingDataTitle">Form 8866, Lines 1-8:</span>
<xsl:call-template name="SRDLoop">
  <xsl:with-param name="part4Count" select="$part4Count" />
  <xsl:with-param name="max">
    <xsl:choose>
         <xsl:when test="$preMax = 0">     
        <xsl:value-of select="1" />
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$preMax" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:with-param>
</xsl:call-template>  
    </xsl:if>
 </form>
</body>  
</html>
</xsl:template>

<!--VRB -->
<xsl:template name="part5Loop">
<xsl:param name="part4Count" />
<xsl:param name="index" select="1"/>
<xsl:param name="max" />  

<xsl:if test="$index &lt;= $max">

<xsl:if test="$index &gt; 1">
  <br/>
</xsl:if>
<!-- Tanuja - 07-07 Commented the div and thead tags as the table is always shown on the next page when there is not enought space to display the whole table -->
  <!--div style="width:187mm;"  id="TP1ctn" -->
    <table cellspacing="0" summary="Table located under line C, having four columns and eight rows" style="width:187mm;border-top-width:1px;font-size:7pt;border-style: solid; border-color: black;border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;overflow-y: auto;display:table-header-group;"  name="TYTable" id="TYTable"  class="styTable">
    <!--thead class="styTableThead"-->
    <xsl:if test="$index = 1">
      <xsl:attribute name="style">width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;overflow-y: auto;display:table-header-group;</xsl:attribute>
    </xsl:if>
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->    
      <tr>
        <th class="styTableCell" rowspan="1"  scope="col"  style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
          <span style="width:1px;"></span>
        </th>
        <th class="styTableCell" rowspan="1"  scope="col"  style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
          <span style="font-weight:bold;">Pass-through entities:</span>
          <span style="width:1mm;"></span>
          <span style="font-weight:normal;font-style:italic">Skip lines 1, 3, 4, and 5.</span>
        </th>
           <th class="styTableCell" colspan="1"  scope="col"  style="width:80mm;text-align:center;font-weight:normal;border-color:black;">
          <span style="width:12mm;"></span><b>Recomputation<br/>Year </b>
          </th>
        <th class="styTableCell" colspan="2"  scope="col"  style="width:80mm;text-align:center;font-weight:normal;border-color:black;">
         <b>Prior Years</b>
          
        </th>
        <th class="styTableCell" rowspan="1"   scope="col"  style="width:25mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
          <span style="float:left;width:1px;"></span>
        </th>
      </tr> 
<!-- Line 1 -->
      <tr>
        <td class="styTableCell" rowspan="2" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1mm;">1</td>
        <td class="styTableCell" rowspan="2" style="width:81mm;text-align:justify;font-weight:normal;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;vertical-align:top;">
          Taxable income (or loss) for the prior years shown on tax 
          return (or as previously adjusted) before net operating loss 
          or capital loss carrybacks (other than carrybacks that must 
          be taken into account to properly compute interest under 
          section 167(g)) (see instructions). If you were required to 
          file Form 8866 for an earlier year, enter adjusted taxable 
          income for the prior years from Form 8866, line 3, for the 
          most recent recomputation year that affects the prior years
      <!--<span class="styDotLn" style="float:none;">.....</span>-->
        </td>
          <td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
           
            <span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
              <span style="float:left;clear:all;width:29mm;font-weight:normal">mo.
              <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
                  <xsl:choose>
                  <xsl:when test="substring($Form8866Data/IncomeForcastMethodRcmptYrGrp[$index*3-2]/YearEndedDate,6,7)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodRcmptYrGrp[$index*3-2]/YearEndedDate,6,7)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                <!--</xsl:if>-->
              </span>
              <span style="width:1mm;"/>yr.
              <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
                  <xsl:choose>
                  <xsl:when test="substring($Form8866Data/IncomeForcastMethodRcmptYrGrp[$index*3-2]/YearEndedDate,1,4)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodRcmptYrGrp[$index*3-2]/YearEndedDate,1,4)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                <!--</xsl:if>-->
</span>
              </span>
          </td>
          <td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
              (<xsl:number value="$index*3-2" format="a"/>)
            <span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
              <span style="float:left;clear:all;width:29mm;font-weight:normal">mo.
                <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
                <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/YearEndedDate,6,7)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/YearEndedDate,6,7)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  </xsl:if>
                </span>
                <span style="width:1mm;"/>yr.
                <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
                <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/YearEndedDate,1,4)=''">
                      <xsl:value-of select="''"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/YearEndedDate,1,4)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
                </span>
              </span>
          </td>
          <td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
              (<xsl:number value="$index*3-1" format="a"/>)
            <span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
              <span style="float:left;clear:all;width:29mm;font-weight:normal">mo.
                <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
                <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/YearEndedDate,6,7)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/YearEndedDate,6,7)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
                </span>
                <span style="width:1mm;"/>yr.
                <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
                <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/YearEndedDate,1,4)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/YearEndedDate,1,4)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
                </span>
              </span>
          </td>
          <td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;border-right:none">
              (<xsl:number value="$index*3" format="a"/>)
            <span style="text-align:center;font-weight:bold;width:29mm;">Totals</span>
            <span style="float:left;clear:all;width:29mm;font-weight:normal">
            (Add columns (a)</span>
            <span style="float:left;clear:all;width:29mm;font-weight:normal">
            and (b).)</span>
          </td>
      </tr>
      <tr>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;" nowrap="nowrap;">
          <!-- If the seperated repeating data flag is not set -->
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
         <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodRcmptYrGrp[$index*3-2]/TaxableIncomeOrLoss"/>
            </xsl:call-template> 
          <!--</xsl:if>-->
      
          <span style="width:1px;"></span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;" >
            <xsl:if test="(count($Form8866Data/IncomeForcastMethodPriorYrGrp) &gt; 2)">
<!--                      <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &gt; 3) and ($Print = $Separated))">-->See Additional Data 
<!--            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="ShortMessage">true</xsl:with-param>
              <xsl:with-param name="TargetNode">$Form8866Data/IncomeForcastMethodPriorYrGrp</xsl:with-param>
             </xsl:call-template>-->
</xsl:if>
     
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
                      <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/TaxableIncomeOrLoss"/>
            </xsl:call-template>
          </xsl:if>
          <span style="width:1px;"></span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;" nowrap="nowrap">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/TaxableIncomeOrLoss"/>
            </xsl:call-template>
          </xsl:if>
            <span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom-width:1px"><span style="width:1mm;"></span></td>              
      </tr>
<!-- Line 2 -->
      <tr>
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1mm;">2</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;">
          Adjustment to taxable income for the difference between:
          <span style="font-weight:bold;">(a)</span> the depreciation deducted under the income forecast
          method based on <span style="font-weight:bold;">estimated</span> future income and
          <span style="font-weight:bold;">(b)</span> depreciation allowable under the income forecast
          method based on <span style="font-weight:bold;">actual</span> income earned for periods before
          the end of the recomputation year and estimated future
          income to be earned after the recomputation year.
          See instructions and attach a schedule listing each
          separate property, unless you were an owner of an interest
          in a pass-through entity.<span style="width:3px;"/>
            <span class="styDotLn" style="float:none;">...</span>     
        </td>
                
       <!-- <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          --><!-- If the seperated repeating data flag is not set --><!--
--><!--                 <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">--><!--
          <div class="styGenericDiv" style="text-align:left;">
           <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodRcmptYrGrp/AdjustmentToIncome" />
            </xsl:call-template>
          </div>
          <br/><br/>
          <div style="float-right;text-align:right;">                  
     <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodRcmptYrGrp/AdjustmentToIncome"/>
            </xsl:call-template>
          </div>
          --><!--</xsl:if> --><!--
          <span style="width:1px;"></span>
        </td>-->        
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
          <div class="styGenericDiv" style="text-align:left;">
           <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodRcmptYrGrp/AdjustmentToIncome" />
            </xsl:call-template>
          </div><br/>              
          <span style="float-right;text-align:right;">                  
     <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodRcmptYrGrp/AdjustmentToIncome"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </span>
          </xsl:if>
          <span style="width:1px;"></span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/AdjustmentToIncome" />
            </xsl:call-template>
         </div><br/> 
              
          <span style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/AdjustmentToIncome"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </span>
          </xsl:if>
          <span style="width:1px;"></span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <div class="styGenericDiv" style="text-align:left;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/AdjustmentToIncome" />
              </xsl:call-template>
            </div><br/>
            
            <span style="float-right;text-align:right;">                  
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/AdjustmentToIncome"/>
              </xsl:call-template><!-- <span style="width:1px;"></span> --> 
              </span>
          </xsl:if>
          <span style="width:1px;"></span>
        </td>
 <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;border-right:none;">
          <!-- If the seperated repeating data flag is not set -->
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TotalAdjustmentToIncomeAmt"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          <!--</xsl:if>--><span style="width:1px;"></span> 
        </td>
      </tr>
<!-- Line 3 -->
      <tr>
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1mm;">3</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;">
          Adjusted taxable income for look-back purposes. Combine lines 1 and 2. If line 3 is a negative amount, see instructions.<span style="width:1px;"/>
          <span class="styDotLn" style="float:none;">......</span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black">
          <!-- If the seperated repeating data flag is not set -->
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
<xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodRcmptYrGrp/AdjustedTaxableIncomeForLkbck"/>
            </xsl:call-template>
          <!--</xsl:if>--><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/AdjustedTaxableIncomeForLkbck"/>
            </xsl:call-template>
          </xsl:if><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/AdjustedTaxableIncomeForLkbck"/>
            </xsl:call-template>
          </xsl:if><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
          <!-- <span style="width:1px;"></span> --> 
        </td>
      </tr>
<!-- Line 4 -->
      <tr>
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1mm;">4</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;">
          Income tax liability on line 3 amount using tax rates in effect
          for the prior years (see instructions)
        <!--  <span class="styDotLn" style="float:none;">...........</span>-->
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodRcmptYrGrp/TaxLiabilityAmt"/>
            </xsl:call-template> 
          <!--</xsl:if>--><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/TaxLiabilityAmt"/>
            </xsl:call-template> 
          </xsl:if><span style="width:1px;"></span> 
          </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/TaxLiabilityAmt"/>
            </xsl:call-template>
          </xsl:if><span style="width:1px;"></span> 
        </td>
         <td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
          <!-- <span style="width:1px;"></span> --> 
        </td>
      </tr>
  <!-- Line 5 -->      
      <tr>
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1mm;">5</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;">
          Income tax liability shown on return (or as previously
          adjusted) for the prior years (see instructions). If you were
          required to file Form 8866 for an earlier year, enter the amount
          required to be reported on Form 8866, line 4, for the most
          recent recomputation year that affects the prior years
          <span style="width:1px;"/>
          <span class="styDotLn" style="float:none;letter-spacing:3mm;">.......</span>
        </td>
        <td class="styTableCell" rowspan="1" 
        style="width:29mm;background-color:lightgrey;border-bottom-width:0mm">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
<!--            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/IncomeTaxLiabilityOnReturn"/>
            </xsl:call-template>--><!-- <span style="width:1px;"></span> --> 
          </xsl:if><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/IncomeTaxLiabilityOnReturn"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </xsl:if><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/IncomeTaxLiabilityOnReturn"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </xsl:if><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
          <!-- <span style="width:1px;"></span> --> 
        </td>
      </tr>
 <!-- Line 6 -->
      <tr>
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1mm;">6</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;">
          Increase (or decrease) in tax for the prior years on which
          interest is due (or is to be refunded). Subtract line 5 from line 4.
          (<span style="font-weight:bold;">Pass-through</span><span style="font-weight:bold;"> entities:</span><span style="width:1mm;"/><span style="font-style:italic;">See instructions.</span>)
          <span class="styDotLn" style="float:none;">.</span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;
        background-color:lightgrey;border-bottom-width:0mm">
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
<!--            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/IncreaseOrDecreaseInTaxForPY"/>
            </xsl:call-template>--><!-- <span style="width:1px;"></span> --> 
          </xsl:if><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/IncreaseOrDecreaseInTaxForPY"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </xsl:if><span style="width:1px;"></span> 
          </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/IncreaseOrDecreaseInTaxForPY"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </xsl:if><span style="width:1px;"></span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
          <!-- <span style="width:1px;"></span> --> 
        </td>
      </tr>
   <!-- Line 7 -->
      <tr>
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none; padding-top: 1.75mm;padding-left:1mm;">7</td>
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;padding-bottom:4mm;; padding-top: 1.75mm">
          Interest due on increase, if any, shown on line 6 (see
          instructions)
     <!--     <span class="styDotLn" style="float:none;">.........</span>-->
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;
        background-color:lightgrey;border-bottom-width:0mm">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <div class="styGenericDiv" style="text-align:left;">
            </div>
            <br /><br />
            <div style="float-right;text-align:right;">                  
            </div>
          </xsl:if><span style="width:1px;"></span> 
        </td>
     <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
          <div class="styGenericDiv" style="text-align:left;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/InterestDueOnIncrease" />
              </xsl:call-template>
          </div><br/>
              
          <span style="float-right;text-align:right;">                  
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/InterestDueOnIncrease"/>
              </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </span>
          </xsl:if>
          <span style="width:1px;"></span>
        </td>
<td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
          <div class="styGenericDiv" style="text-align:left;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/InterestDueOnIncrease" />
              </xsl:call-template>
          </div><br/>
              
          <span style="float-right;text-align:right;">                  
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/InterestDueOnIncrease"/>
              </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </span>
          </xsl:if>
          <span style="width:1px;"></span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;border-right:none;">
          <!-- If the seperated repeating data flag is not set -->
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TotalInterestDueOnIncrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          <!--</xsl:if>--><span style="width:1px;"></span> 
        </td>
      </tr>
<!-- Line 8 -->      
      <tr>
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;font-weight:bold;border-color:black;border-right:none;border-bottom:none; padding-left:1mm;padding-bottom:6mm">8</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;border-bottom:none;padding-right:1mm;padding-left:2mm;padding-bottom:4mm">
          Interest to be refunded on decrease, if any, shown on
          line 6 (see instructions)
          <span class="styDotLn" style="float:none;">....</span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;
        background-color:lightgrey">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
            <div class="styGenericDiv" style="text-align:left;">
<!--              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/InterestToBeRefundedOnDecrease" />
              </xsl:call-template>-->
            </div>
            <br /><br />
            <div style="float-right;text-align:right;">
<!--              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/InterestToBeRefundedOnDecrease"/>
              </xsl:call-template>--><!-- <span style="width:1px;"></span> --> 
              </div>
          </xsl:if><span style="width:1px;"></span> 
        </td>
           <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
          <div class="styGenericDiv" style="text-align:left;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/InterestToBeRefundedOnDecrease" />
              </xsl:call-template>
          </div><br/>
              
          <span style="float-right;text-align:right;">                  
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-2]/InterestToBeRefundedOnDecrease"/>
              </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </span>
          </xsl:if>
          <span style="width:1px;"></span>
        </td>   
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <!-- If the seperated repeating data flag is not set -->
          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
          <div class="styGenericDiv" style="text-align:left;">
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/InterestToBeRefundedOnDecrease" />
              </xsl:call-template>
          </div><br></br>
              
          <span style="float-right;text-align:right;">                  
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*3-1]/InterestToBeRefundedOnDecrease"/>
              </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </span>
          </xsl:if>
          <span style="width:1px;"></span>
        </td> 
              <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;border-right:none;">
          <!-- If the seperated repeating data flag is not set -->
<!--          <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">-->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/TotalInterestToBeRefunded"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> -->
          <!--</xsl:if>--><span style="width:1px;"></span> 
        </td>
      </tr>
<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->      
    <!--/thead>
    <tfoot></tfoot>
    <tbody>
    </tbody-->
    </table>
<!--/div-->
  <!-- If the seperated repeating data flag is not set -->
  <xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &lt; 3) and ($Print != $Separated))">
  <xsl:if test="$index != $max">
    <xsl:choose>  
      <xsl:when test="$part4Count &gt; 1">
        <br />
      </xsl:when>  
      <xsl:otherwise>
        <xsl:choose>  
          <xsl:when test="$index = 1">
            <div style="page-break-after:always" />
          </xsl:when>  
          <xsl:otherwise>
            <br />
          </xsl:otherwise>  
        </xsl:choose>    
      </xsl:otherwise>  
    </xsl:choose>  
  </xsl:if>           
    
    <xsl:call-template name="part5Loop">
      <xsl:with-param name="index" select="$index+1" />
      <xsl:with-param name="part4Count" select="$part4Count" />      
      <xsl:with-param name="max" select="$max" />
    </xsl:call-template>  
  </xsl:if>

</xsl:if>
  
</xsl:template>


<!--This loop is just like the loop above but with the separated repeating data table classes used -->
<xsl:template name="SRDLoop">
<xsl:param name="part4Count" />
<xsl:param name="index" select="1"/>
<xsl:param name="max" />  

<xsl:if test="$index &lt;= $max">

  <xsl:if test="$index &gt; 1">  <br/></xsl:if>
  <table  class="styDepTbl" cellspacing="0" summary="Table located under line C, having four columns and eight rows" style="width:187mm;font-size:7pt;"  name="TYTable" id="TYTable">
    <!--thead class="styTableThead"-->
         <tr >
    <!-- Define background colors to the rows -->
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        <th class="styDepTblHdr" rowspan="1"  scope="col"  style="width:7mm;text-align:center;border-right-width:1px;border-bottom:none;border-color:black">
          <span style="width:1px;"></span>
        </th>
        <th  class="styDepTblHdr" rowspan="1"  scope="col"  style="width:80mm;text-align:left;border-color:black;border-bottom:none;" >
          <span style="font-weight:bold;">Pass-through entities:</span>
          <span style="width:1mm;"></span>
          <span style="font-weight:normal;font-style:italic;">Skip lines 1, 3, 4, and 5.</span>
        </th>
           <th class="styDepTblHdr" colspan="1"   scope="col"  style="width:32mm;text-align:center;font-weight:normal;border-color:black;border-left-width:1px;">
          
          </th>
        <th class="styDepTblHdr" colspan="2"   scope="col"  style="width:80mm;text-align:center;font-weight:normal;border-color:black;">
         Prior Years
          
        </th>
        <th class="styDepTblHdr" rowspan="1"   scope="col"  style="width:25mm;text-align:center;border-color:black;border-right:1px;border-bottom:none;">
          <span style="float:left;width:1px;"></span>
        </th>
      </tr>

      <!-- Line 1 -->
      <tr class="styDepTblHdr">
        <td class="styDepTblRow1Cell" rowspan="2" style="color:black;width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;padding-left:1mm;">1</td>
        <td class="styDepTblRow1Cell" rowspan="2" style="color:black;width:81mm;text-align:justify;font-weight:normal;border-color:black;padding-right:1mm;padding-left:2mm;vertical-align:top;">
          Taxable income (or loss) for the prior years shown on tax 
          return (or as previously adjusted) before net operating loss 
          or capital loss carrybacks (other than carrybacks that must 
          be taken into account to properly compute interest under 
          section 167(g)) (see instructions). If you were required to 
          file Form 8866 for an earlier year, enter adjusted taxable 
          income for the prior years from Form 8866, line 3, for the 
          most recent recomputation year that affects the prior years
          </td>
          <td class="styDepTblCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
        (<xsl:number value="$index*4-3" format="a"/>)
            <span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
              <span style="float:left;clear:all;width:29mm;font-weight:normal">mo.
              <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                  <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/YearEndedDate,6,7)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/YearEndedDate,6,7)"/>
                    </xsl:otherwise>
                  </xsl:choose>
              </span>
              <span style="width:1mm;"/>yr.
              <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                  <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/YearEndedDate,1,4)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/YearEndedDate,1,4)"/>
                    </xsl:otherwise>
                  </xsl:choose>
              </span>
              </span>
          </td>
          <td class="styDepTblCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
            (<xsl:number value="$index*4-2" format="a"/>)
            <span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
              <span style="float:left;clear:all;width:29mm;font-weight:normal">mo.
                <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/YearEndedDate,6,7)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/YearEndedDate,6,7)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
                <span style="width:1mm;"/>yr.
                <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/YearEndedDate,1,4)=''">
                      <xsl:value-of select="''"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/YearEndedDate,1,4)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </span>
          </td>
          <td class="styDepTblCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
            (<xsl:number value="$index*4-1" format="a"/>)
            <span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
              <span style="float:left;clear:all;width:29mm;font-weight:normal">mo.
                <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/YearEndedDate,6,7)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/YearEndedDate,6,7)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
                <span style="width:1mm;"/>yr.
                <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/YearEndedDate,1,4)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/YearEndedDate,1,4)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </span>
          </td>
      <td class="styDepTblCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
            (<xsl:number value="$index*4" format="a"/>)
            <span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
              <span style="float:left;clear:all;width:29mm;font-weight:normal">mo.
                <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/YearEndedDate,6,7)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/YearEndedDate,6,7)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
                <span style="width:1mm;"/>yr.
                <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
                  <xsl:choose>
                    <xsl:when test="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/YearEndedDate,1,4)=''"/>
                    <xsl:otherwise>
                      <xsl:value-of select="substring($Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/YearEndedDate,1,4)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
              </span>
          </td>
      </tr>
      <tr>
        <td class="styDepTblRow1Cell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;" nowrap="nowrap">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/TaxableIncomeOrLoss"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styDepTblRow1Cell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;" nowrap="nowrap">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/TaxableIncomeOrLoss"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styDepTblRow1Cell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;" nowrap="nowrap">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/TaxableIncomeOrLoss"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> -->     
        </td>
<td class="styDepTblRow1Cell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;" nowrap="nowrap">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/TaxableIncomeOrLoss"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> -->     
        </td>              
      </tr>

<!-- Line 2 -->
      <tr class="styDepTblRow2">
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;padding-left:1mm;">2</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;padding-right:1mm;padding-left:2mm;">
          Adjustment to taxable income for the difference between:
          <span style="font-weight:bold;">(a)</span> the depreciation deducted under the income forecast
          method based on <span style="font-weight:bold;">estimated</span> future income and
          <span style="font-weight:bold;">(b)</span> depreciation allowable under the income forecast
          method based on <span style="font-weight:bold;">actual</span> income earned for periods before
          the end of the recomputation year and estimated future
          income to be earned after the recomputation year.
          See instructions and attach a schedule listing each
          separate property, unless you were an owner of an interest
          in a pass-through entity.
         <span class="styDotLn" style="float:none;">........</span>
               
        </td>
                
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/AdjustmentToIncome" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/AdjustmentToIncome"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </div>
        </td>        
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/AdjustmentToIncome" />
            </xsl:call-template>
          </div>
          <br /><br />        
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/AdjustmentToIncome"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </div>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/AdjustmentToIncome" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/AdjustmentToIncome"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
            </div>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/AdjustmentToIncome" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/AdjustmentToIncome"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
            </div>
        </td>
      </tr>
<!-- Line 3 -->
      <tr class="styDepTblRow1">
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;padding-left:1mm;">3</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;padding-right:1mm;padding-left:2mm;">
          Adjusted taxable income for look-back purposes. Combine lines 1 and 2, if line 3 is a  negative amount, see instructions.<span style="width:1px;"/>
         <span class="styDotLn" style="float:none;">....</span> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/AdjustedTaxableIncomeForLkbck"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/AdjustedTaxableIncomeForLkbck"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/AdjustedTaxableIncomeForLkbck"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
       <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/AdjustedTaxableIncomeForLkbck"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
      </tr>

<!-- Line 4 -->
      <tr class="styDepTblRow2">
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;padding-left:1mm;">4</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;padding-right:1mm;padding-left:2mm;font-size:6pt;">
          Income tax liability on line 3 amount using tax rates in effect
          for the prior years (see instructions)
          <span class="styDotLn" style="float:none;">.......</span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/TaxLiabilityAmt"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/TaxLiabilityAmt"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/TaxLiabilityAmt"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
     <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/TaxLiabilityAmt"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
      </tr>
      
<!-- Line 5 -->      
      <tr class="styDepTblRow1">
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;padding-left:1mm;">5</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;padding-right:1mm;padding-left:2mm;">
          Income tax liability shown on return (or as previously
          adjusted) for the prior years (see instructions). If you were
          required to file Form 8866 for an earlier year, enter the amount
          required to be reported on Form 8866, line 4, for the most
          recent recomputation year that affects the prior years
          <span class="styDotLn" style="float:none;">........</span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/IncomeTaxLiabilityOnReturn"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/IncomeTaxLiabilityOnReturn"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/IncomeTaxLiabilityOnReturn"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
      <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/IncomeTaxLiabilityOnReturn"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>

      </tr>
      
<!-- Line 6 -->
      <tr class="styDepTblRow2">
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;padding-left:1mm;">6</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:left;border-color:black;padding-right:1mm;padding-left:2mm;">
          Increase (or decrease) in tax for the prior years on which
          interest is due (or is to be refunded). Subtract line 5 from line 4.
          (<span style="font-weight:bold;">Pass-through</span><span style="font-weight:bold;"> entities:</span><span style="width:1mm;"/><span style="font-style:italic;">See instructions.</span>)
       <span class="styDotLn" style="float:none;">...</span>   
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/IncreaseOrDecreaseInTaxForPY"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/IncreaseOrDecreaseInTaxForPY"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/IncreaseOrDecreaseInTaxForPY"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>
  <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/IncreaseOrDecreaseInTaxForPY"/>
          </xsl:call-template><!-- <span style="width:1px;"></span> --> 
        </td>

      </tr>
      
<!-- Line 7 -->
      <tr class="styDepTblRow1">
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;padding-top: 1.75mm;padding-left:1mm;">7</td>
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;padding-right:1mm;padding-left:2mm;">
          Interest due on increase, if any, shown on line 6 (see
          instructions)
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/InterestDueOnIncrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/InterestDueOnIncrease"/>
            </xsl:call-template>
                    <!-- <span style="width:1px;"></span> --> 
          </div>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/InterestDueOnIncrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/InterestDueOnIncrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
          </div>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/InterestDueOnIncrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/InterestDueOnIncrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
            </div>
        </td>
       <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/InterestDueOnIncrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">                  
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/InterestDueOnIncrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
            </div>
        </td>
      </tr>
<!-- Line 8 -->      
      <tr class="styDepTblRow2">
        <td class="styTableCell" rowspan="1" style="width:6mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;padding-top: 1.75mm;padding-left:1mm;">8</td>    
        <td class="styTableCell" rowspan="1" style="width:81mm;text-align:justify;border-color:black;padding-right:1mm;padding-left:2mm;">
          Interest to be refunded on decrease, if any, shown on
          line 6 (see instructions)
          <span class="styDotLn" style="float:none;">......</span>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/InterestToBeRefundedOnDecrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-3]/InterestToBeRefundedOnDecrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> --> 
            </div>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/InterestToBeRefundedOnDecrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-2]/InterestToBeRefundedOnDecrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> -->
          </div>
        </td>
        <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/InterestToBeRefundedOnDecrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4-1]/InterestToBeRefundedOnDecrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> -->
          </div>
        </td>
          <td class="styTableCell" rowspan="1" style="width:29mm;text-align:right;vertical-align:bottom;border-color:black;">
          <div class="styGenericDiv" style="text-align:left;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/InterestToBeRefundedOnDecrease" />
            </xsl:call-template>
          </div>
          <br /><br />
          <div style="float-right;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form8866Data/IncomeForcastMethodPriorYrGrp[$index*4]/InterestToBeRefundedOnDecrease"/>
            </xsl:call-template><!-- <span style="width:1px;"></span> -->
          </div>
        </td>

      </tr>
    <!--/thead>
    <tfoot></tfoot>
    <tbody>
    </tbody-->
    </table>
<!--/div-->
  <xsl:if test="$index != $max">
    <xsl:choose>  
      <xsl:when test="$part4Count &gt; 1">
        <br />
      </xsl:when>  
      <xsl:otherwise>
        <xsl:choose>  
          <xsl:when test="$index = 1">
            <div style="page-break-after:always" />
          </xsl:when>  
          <xsl:otherwise>
            <br />
          </xsl:otherwise>  
        </xsl:choose>    
      </xsl:otherwise>  
    </xsl:choose>  
  </xsl:if>  
           
<xsl:if test="((count($Form8866Data/IncomeForcastMethodPriorYrGrp) &gt; 4))">
    <xsl:call-template name="SRDLoop">
      <xsl:with-param name="index" select="$index+1" />
      <xsl:with-param name="part4Count" select="$part4Count" />      
      <xsl:with-param name="max" select="$max" />
    </xsl:call-template>  
</xsl:if>
</xsl:if>
  
</xsl:template>



</xsl:stylesheet>
