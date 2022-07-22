<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8082Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="Form8082Data" select="$RtnDoc/IRS8082" />
<xsl:template match="/">
<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8082Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="Form IRS8082" />        
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">
  
    <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS8082Style"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
        
    </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
  <form name="Form8082">
      <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"  />  
      <!-- END WARNING LINE -->
      
<div style="width:187mm;" class="styTBB">
  <div style="width:32mm;height:24.5mm;" class="styFNBox">
  <div style="height:12mm;">Form<span class="styFormNumber">  8082</span>
    <br />(Rev. December 2005)
  </div>
  <div style="height:11mm;padding-top:5mm;">
    <span class="styAgency">Department of the Treasury</span>
    <br />
    <span class="styAgency">Internal Revenue Service</span>
  </div>
</div>
<div style="width:123mm;height:23.5mm;" class="styFTBox">
  <div  class="styMainTitle" style="height:10mm;padding-top:1mm;">
    Notice of Inconsistent Treatment or Administrative Adjustment Request (AAR)
  </div>
  <div style="height:9mm;font-size:7pt;padding-top:.5mm;font-weight: bold;" >
    (For use by partners, S corporation shareholders, estate and domestic trust beneficiaries,
    foreign trust owners and beneficiaries, REMIC residual interest holders, and TMPs)
  </div>
  <div style="height:3.5mm;font-size:7pt;padding-top:.5mm;border:0 solid pink;" class="styFST">
    <img src="{$ImagePath}/8082_Bullet.gif" alt="Bullet Image" />
    See separate instructions.
  </div>
</div>
<div style="width:31mm;height:24.5mm;" class="styTYBox">
  <div style="height:8mm;padding-top:2mm;" class="styOMB">
    OMB No. 1545-0790
  </div>
  <div style="height:8mm;text-align:left;padding-left:1mm;border-bottom-width:0px;padding-top:4mm"  class="styOMB">
    Attachment <br />Sequence No. <span class="styBoldText">84</span>
  </div>
</div>
</div>

<div style="width:187mm;" class="styBB">
  <div style="width:138mm;height:8mm;font-weight:normal;font-size:7pt;" class="styNameBox">
    Name(s) shown on return<br />
    <span>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
    </span>            
  </div>
  <div style="width:49mm;height:4mm;padding-left:2mm;font-weight:normal;font-size:7pt;" class="styEINBox">
    Identifying number<br /><br />
    <span style="font-weight:normal;text-align:center;" >
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>          
    </span>      
  </div>
</div>
<!-- Begin Part I -->
<div style="width:187mm;" class="styBB">
  <div class="styPartName" style="width:15mm;">Part I</div>
  <div class="styPartDesc" style="padding-left:3mm;">
    General Information  
  </div>
</div>

<div style="width:187mm;" class="styBB">
  <div style="width:187mm;height:6mm;">        
    <div class="styLNLeftNumBox" style="padding-top:1.5mm;padding-bottom:1.5mm;">1</div>
    <div style="float:left;padding-top:1.5mm;padding-bottom:1.5mm;">
      Check boxes that apply:  
      <span style="width:5mm;"></span><span class="styBoldText">(a)</span><span style="width:2mm;"></span>  
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/NoticeOfInconsistentTreatment" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/NoticeOfInconsistentTreatment" />
        </xsl:call-template>            
        Notice of inconsistent treatment
      </label>  
      <span style="width:5mm;"></span><span class="styBoldText">(b)</span><span style="width:2mm;"></span> 
       <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/AdminAdjustmentRequest" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/AdminAdjustmentRequest" />
        </xsl:call-template>            
        Administrative adjustment request (AAR)
      </label>
       
    </div>
  </div>  
</div>
<div style="width:187mm;" class="styBB">
  <div style="width:187mm">        
    <div class="styLNLeftNumBox">2</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      If you are a tax matters partner (TMP) filing an AAR on behalf of the pass-through entity, are you <br />
    </div>
  </div>
  <div style="width:187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
      requesting substituted return treatment? (see instructions)  
    </div>
    <div style="float:right;">
      <span class="styIRS8082DotLn">...................
      </span>
       <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8082Data/SubstitutedReturnTreatment" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/SubstitutedReturnTreatment" />
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$Form8082Data/SubstitutedReturnTreatment" />
        </xsl:call-template>            
        Yes
      </label><span style="width:4mm;"></span>
      <span>
          <xsl:call-template name="PopulateSpan">
            <xsl:with-param name="TargetNode" select="$Form8082Data/SubstitutedReturnTreatment" />
          </xsl:call-template>
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/SubstitutedReturnTreatment" />
        </xsl:call-template>
      </input>
      </span>
      <label style="font-weight:bold">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$Form8082Data/SubstitutedReturnTreatment" />
        </xsl:call-template>            
        No
      </label>
    </div>
  </div>  
</div>
<div style="width:187mm;height:7mm;padding-bottom:1mm;" class="styBB">
  <div style="width:187mm">        
    <div class="styLNLeftNumBox">3</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
     Identify type of pass-through entity:
    </div>
  </div>
  <div style="width:187mm">  
    <div class="styLNLeftNumBox"></div>
    <div style="float:left;width:179mm;">
      <span class="styBoldText">(a)</span><span style="width:1.5mm;"></span>  
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/PartnershipEntity" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/PartnershipEntity" />
        </xsl:call-template>            
        Partnership
      </label>  
      <span style="width:4mm;"></span><span class="styBoldText">(b)</span><span style="width:1.5mm;"></span>  
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/ElectingLargePartnershipEntity" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/ElectingLargePartnershipEntity" />
        </xsl:call-template>            
        Electing large partnership
      </label>  
      <span style="width:4mm;"></span><span class="styBoldText">(c)</span><span style="width:1.5mm;"></span>  
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/SCorporationEntity" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/SCorporationEntity" />
        </xsl:call-template>            
        S corporation
      </label>  
      <span style="width:5mm;"></span><span class="styBoldText">(d)</span><span style="width:2mm;"></span>  
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/EstateEntity" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/EstateEntity" />
        </xsl:call-template>            
        Estate
      </label>  
      <span style="width:5mm;"></span><span class="styBoldText">(e)</span><span style="width:2mm;"></span>  
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/TrustEntity" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/TrustEntity" />
        </xsl:call-template>            
        Trust
      </label>  
      <span style="width:5mm;"></span><span class="styBoldText">(f)</span><span style="width:2mm;"></span>  
      <input type="checkbox" class="styCkbox" onclick="return false;" >
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form8082Data/REMICEntity" />
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form8082Data/REMICEntity" /></xsl:call-template>            
        REMIC
      </label>  
    </div>
  </div>  
</div>

<div style="width:187mm;height:10mm;" class="styBB">
  <div style="width:87mm;height:10mm;" class="styIRS8082AddRightLine">        
    <div class="styLNLeftNumBox">4</div>
    <div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;width:">
      Employer identification number of pass-through entity <br /><span style="text-align:center;width:60mm;padding-top:1mm;" valign="bottom;">
      <xsl:call-template name="PopulateEIN">
        <xsl:with-param name="TargetNode" select="$Form8082Data/IdentifyingNumOfPassThruEntity"/>
      </xsl:call-template>
      </span>
      <xsl:if test="$Form8082Data/MissingEINReason !=' '">            
      	<span style="font-weight:normal;text-align:center;width:60mm;padding-top:1mm;" valign="bottom;">  
          	<xsl:call-template name="PopulateText">
               	<xsl:with-param name="TargetNode" select="$Form8082Data/MissingEINReason"/>
               </xsl:call-template>
          </span> 
      </xsl:if>
    </div>
  </div>
  <div style="width:100mm;height:10mm;" class="styGenericDiv">        
    <div class="styLNLeftNumBox" style="width:6mm;">6</div>
    <div style="float:right;padding-top:0.5mm;padding-bottom:.5mm;">
      Tax shelter registration number (if applicable) of pass-through entity <br /><span style="text-align:center;width:60mm;padding-top:3mm;" valign="bottom;">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form8082Data/ TaxShelterRegistrationNumber"/>
      </xsl:call-template></span>
    </div>
  </div>  
</div>

<div class="styBB" style="width:187mm;float:none;">
  <div class="styIRS8082AddRightLine" style="width:87mm;height:26mm;">
    <div class="styLNLeftNumBox">5</div>
    <div class="styGenericDiv">
      Name, address, and ZIP code of pass-through entity <br />
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form8082Data/NameOfPassThruEntity/BusinessNameLine1" />
      </xsl:call-template>
      <xsl:if test="$Form8082Data/NameOfPassThruEntity/BusinessNameLine2 != ''">
        <br /><xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form8082Data/NameOfPassThruEntity/BusinessNameLine2" />
        </xsl:call-template>
      </xsl:if>
       <xsl:if test="$Form8082Data/NameOfPassThruEntity/InCareOfName != ''">
        <br /><xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form8082Data/NameOfPassThruEntity/InCareOfName" />
        </xsl:call-template>
      </xsl:if>
  
      	<xsl:if test="$Form8082Data/USAddressOfPassThruEntity">
       		<br/>
               <xsl:call-template name="PopulateUSAddressTemplate">
               	<xsl:with-param name="TargetNode" select="$Form8082Data/USAddressOfPassThruEntity"/>
               </xsl:call-template>
          </xsl:if>
          <xsl:if test="$Form8082Data/ForeignAddressOfPassThruEntity">
          	<br/>
               <xsl:call-template name="PopulateForeignAddressTemplate">
               	<xsl:with-param name="TargetNode" select="$Form8082Data/ForeignAddressOfPassThruEntity"/>
               </xsl:call-template>
          </xsl:if>
    </div>
  </div>
  <div class="styGenericDiv" style="width:100mm;height:26mm;border-right-width:0px;">
    <div style="width:100mm;height:8mm;" class="styBB">
      <div class="styLNLeftNumBox" style="width:6mm;">7</div>
      <div style="padding-top:0.5mm;padding-bottom:.5mm;">
        <span style="font-size:6pt;">Internal Revenue Service Center where pass-through entity filed its return</span> <br />
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form8082Data/ServiceCenterWhereReturnFiled" />
        </xsl:call-template>
      </div>
    </div>
    <div style="width:100mm;height:8mm;" class="styBB">
      <div class="styLNLeftNumBox" style="width:6mm;">8</div>
      <div style="padding-top:0.5mm;padding-bottom:.5mm;width:94mm;" class="styLnDesc">
        Tax year of pass-through entity
        <span style="width:8px;"></span>
        <span style="width:18mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8082Data/TaxYearOfPassThruEntityFrom" />
          </xsl:call-template>
        </span>
        <span style="width:8px;"></span>to
        <span style="width:8px;"></span>
        <span style="width:18mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8082Data/TaxYearOfPassThruEntityTo" />
          </xsl:call-template>
        </span>
      </div>
    </div>
    <div style="width:100mm;height:8mm;border-bottom-width:0px;" class="styBB">
      <div class="styLNLeftNumBox" style="width:6mm;">9</div>
      <div style="padding-top:0.5mm;padding-bottom:.5mm;width:94mm;" class="styLnDesc">
        Your tax year<span style="width:12px;"></span>
        <span style="width:18mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8082Data/YourTaxYearFrom" />
          </xsl:call-template>
        </span>
        <span style="width:12px;"></span>to<span style="width:12px;"></span>
        <span style="width:18mm;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8082Data/YourTaxYearTo" />
          </xsl:call-template>
        </span>
      </div>
    </div>
  </div>
</div>

<!-- Begin Part I -->
<div style="width:187mm;" class="styBB">
  <div class="styPartName" style="width:15mm;">Part II</div>
  <div class="styPartDesc" style="padding-left:3mm;">
    Inconsistent or Administrative Adjustment Request (AAR) Items
  </div>
  <div class="styGenericDiv" style="float:right;">
      <xsl:call-template name="SetDynamicTableToggleButton">
        <xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems"/>
      <xsl:with-param name="containerHeight" select="4"/>
      <xsl:with-param name="headerHeight" select="2"/>
        <xsl:with-param name="containerID" select=" 'TPctn' "/>
      </xsl:call-template>  
  </div>
</div>
<!-- Beginning table -->
<div style="height:48mm;" id="TPctn" class="styTableContainer">
  <xsl:call-template name="SetInitialState"/>
  <table id="TYTable" name="TYTable" cellspacing="0" class="styTable">
    <thead class="styTableThead" style="border-color:black;">
      <tr>
        
        <th scope="col" style="width:66mm;font-weight:normal;text-align:center" class="styTableCellHeader" rowspan="2">
          <span class="styBoldText">(a)</span> Description of inconsistent or <br />administrative adjustment request (AAR) items<br />
                    (see instructions)
        </th>
        <th scope="col" style="width:28mm;font-weight:normal;" class="styTableCellHeader" colspan="2">
          <span class="styBoldText">(b)</span> Inconsistency is in, or AAR is to correct (check boxes that apply)
        </th>
        <th scope="col" style="width:32mm;border-right-width:1px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
          <span class="styBoldText">(c)</span> Amount as shown on Schedule K-1, Schedule Q,<br /> or similar statement, a foreign trust statement, or
          your return, whichever applies (see instructions)
        </th>
        <th scope="col" style="width:34mm;border-left-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
          <span class="styBoldText">(d)</span> Amount you are reporting
        </th>
        <th scope="col" style="width:27mm;border-right-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
          <span class="styBoldText">(e)</span> Difference between (c) and (d)
        </th>
      </tr>
      <tr>
        <th scope="col" style="width:13mm;font-weight:normal;" class="styTableCellHeader">
          Amount of item
        </th>
        <th scope="col" style="width:13mm;font-weight:normal;" class="styTableCellHeader">
          Treatment of item
        </th>
      </tr>
    </thead>
    <tfoot></tfoot>
    <xsl:choose>
      <xsl:when test="$Form8082Data/InconOrAdminAdjRequestItems">
        <tbody style="border-color:black;">
        <xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &lt; 5))">
          <xsl:for-each select="$Form8082Data/InconOrAdminAdjRequestItems">
            <tr style="height:8mm;vertical-align:bottom;">
               <td style="width:66mm;text-align:left;" class="styTableCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:66mm;text-align:left;border-bottom-width:0px;
                  </xsl:attribute>
                </xsl:if>
                <div style="width:5mm;" class="styGenericDiv">
                <xsl:if test="position() = 1"><span style="font-weight:bold;">10</span></xsl:if>
                <xsl:if test="position() = 2"><span style="font-weight:bold;">11</span></xsl:if>
                <xsl:if test="position() = 3"><span style="font-weight:bold;">12</span></xsl:if>
                <xsl:if test="position() = 4"><span style="font-weight:bold;">13</span></xsl:if>
                </div>
                <div class="styGenericDiv" style="vertical-align:bottom">
               <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ReferenceLineNumber" />
                </xsl:call-template><br />
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="LineNumDescOfInconsistentItem" /></xsl:call-template>
                <span style="width:1px;"></span>
                </div>
              </td>
              <td style="width:13mm;text-align:center;vertical-align:bottom;padding-top:3mm;" valign="bottom" class="styTableCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:13mm;text-align:center;border-bottom-width:0px;vertical-align:bottom;padding-top:2mm;
                  </xsl:attribute>
                </xsl:if>
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="AmountOfItem" /></xsl:call-template>
                <span style="width:1px;"></span>
              </td>
              <td style="width:13mm;text-align:center;vertical-align:bottom;padding-top:2mm;" valign="bottom" class="styTableCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:13mm;text-align:center;border-bottom-width:0px;
                  </xsl:attribute>
                </xsl:if>
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="TreatmentOfItem" /></xsl:call-template>
                <span style="width:1px;"></span>
              </td>
              <td style="width:32mm;border-right-width:1px;" class="styTableCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:32mm;border-right-width:1px;border-bottom-width:0px;text-align:right;vertical-align:bottom;
                  </xsl:attribute>
                </xsl:if>
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AdjustmentRequestAmount" /> </xsl:call-template>
                <span style="width:1px;"></span>
              </td>
              <td style="width:34mm;border-left-width:0px;" class="styTableCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:34mm;border-right-width:1px;border-bottom-width:0px;text-align:right;vertical-align:bottom;
                  </xsl:attribute>
                </xsl:if>
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AmountYouAreReporting" /></xsl:call-template>
                <span style="width:1px;"></span>
              </td>
              <td style="width:27mm;border-right-width:0px;" class="styTableCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:27mm;border-right-width:0px;border-bottom-width:0px;text-align:right;vertical-align:bottom;
                  </xsl:attribute>
                </xsl:if>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AdjustmentAndReportedAmtDiff" /></xsl:call-template>
                <span style="width:1px;"></span>
              </td>
            </tr>
          </xsl:for-each>
          </xsl:if>
          <xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 1) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
            <xsl:call-template name="populateirs8082partiiemptycells">
              <xsl:with-param name="index" >10</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 2) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
            <xsl:call-template name="populateirs8082partiiemptycells">
              <xsl:with-param name="index">11</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 3) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
            <xsl:call-template name="populateirs8082partiiemptycells">
              <xsl:with-param name="index" >12</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 4) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
            <xsl:call-template name="populateirs8082partiiemptycells">
              <xsl:with-param name="index" >13</xsl:with-param>
              <xsl:with-param name="end" >true</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </tbody>
      </xsl:when>
      <xsl:otherwise>
        <tbody style="border-color:black;">
          <xsl:call-template name="populateirs8082partiiemptycells">
            <xsl:with-param name="index" >10</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="populateirs8082partiiemptycells">
            <xsl:with-param name="index" >11</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="populateirs8082partiiemptycells">
            <xsl:with-param name="index" >12</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="populateirs8082partiiemptycells">
            <xsl:with-param name="index" >13</xsl:with-param>
            <xsl:with-param name="end" >true</xsl:with-param>
          </xsl:call-template>
        </tbody>
      </xsl:otherwise>
    </xsl:choose>
  </table>
</div>

 <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems"/>
  <xsl:with-param name="containerHeight" select="4"/>
  <xsl:with-param name="headerHeight" select="2"/>
    <xsl:with-param name="containerID" select=" 'TPctn' "/>
  </xsl:call-template>  

<!-- Begin Part III -->
<div style="width:187mm;" class="styBB">
  <div class="styPartName" style="width:15mm;">Part III</div>
  <div class="styPartDesc" style="padding-left:3mm;">
    Explanations—Enter the Part II item number before each explanation. If more space is needed, continue your explanations on the back.
  </div>
</div>
 <!-- Start part III table -->
 
<table id="TYTable" name="TYTable" cellspacing="0" class="styTable" style="width:187mm;border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;clear:both;">
  <thead class="styTableThead">
  </thead>
  <tfoot></tfoot>
  <tbody>
     <xsl:choose>
      <xsl:when test="$Form8082Data/InconOrAdminAdjRequestItems">
      <xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &lt;8))">
        <xsl:call-template name="populateirs8082partiiidatarows" />
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="populateirs8082partiiiemptyrows" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="$Form8082Data/InconOrAdminAdjRequestItems">
      <xsl:if test="($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
        <xsl:call-template name="populateirs8082partiiiemptyrows" />
        </xsl:if>
      </xsl:if>

  </tbody>
</table>
  
<div style="width:187mm;clear:both;">
  <div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
  <div style="width:45mm;text-align:center;" class="styGenericDiv">Cat. No. 49975G</div>
  <div style = "float:right;" class="styGenericDiv">Form <span class="styBoldText">8082</span> (Rev. 12-2005)</div>
</div>

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
    <xsl:with-param name="TargetNode" select="$Form8082Data" />
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
</table>
 
   <xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4)">
<br/>
<span class="styRepeatingDataTitle">Form 8082 - Inconsistent or Administrative Adjustment Request (AAR) Items  </span>			
<table class="styDepTbl" style="font-size: 7pt">
	<thead class="styDepTableThead">
		<tr class="styDepTblHdr">
        <th scope="col" style="width:63mm;font-weight:normal;text-align:center" class="styDepTblCell" rowspan="2">
          <span class="styBoldText">(a)</span> Description of inconsistent or <br />administrative adjustment request (AAR) items<br />
                    (see instructions)
        </th>
        <th scope="col" style="width:28mm;font-weight:normal;" class="styDepTblCell" colspan="2">
          <span class="styBoldText">(b)</span> Inconsistency is in, or AAR is to correct (check boxes that apply)
        </th>
        <th scope="col" style="width:32mm;border-right-width:1px;font-weight:normal;" class="styDepTblCell" rowspan="2">
          <span class="styBoldText">(c)</span> Amount as shown on Schedule K-1, Schedule Q,<br /> or similar statement, a foreign trust statement, or
          your return, whichever applies (see instructions)
        </th>
        <th scope="col" style="width:32mm;font-weight:normal;" class="styDepTblCell" rowspan="2">
          <span class="styBoldText">(d)</span> Amount you are reporting
        </th>
        <th scope="col" style="width:32mm;font-weight:normal;" class="styDepTblCell" rowspan="2">
          <span class="styBoldText">(e)</span> Difference between (c) and (d)
        </th>
      </tr>
      <tr class="styDepTblHdr">
        <th scope="col" style="width:14mm;font-weight:normal;" class="styDepTblCell">
          Amount of item
        </th>
        <th scope="col" style="width:14mm;font-weight:normal;" class="styDepTblCell">
          Treatment of item
        </th>
      </tr>
    </thead>
    <tfoot></tfoot>
        <tbody style="border-color:black;">
          <xsl:for-each select="$Form8082Data/InconOrAdminAdjRequestItems">
            <tr style="height:8mm;vertical-align:bottom;padding-top:2mm;" valign="bottom">
             <xsl:attribute name="class">
		         <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
             </xsl:attribute>
                    
              <td style="width:63mm;text-align:left;" class="styDepTblCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:66mm;text-align:left;border-bottom-width:0px;
                  </xsl:attribute>
                </xsl:if>
                    <div style="width:5mm;font-weight:bold;" class="styGenericDiv">
                       <xsl:value-of select="position()+9"/>
                    </div>
                
                    <div class="styGenericDiv">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="ReferenceLineNumber" />
                        </xsl:call-template><br />
                        <xsl:call-template name="PopulateText">
                             <xsl:with-param name="TargetNode" select="LineNumDescOfInconsistentItem" />
                         </xsl:call-template>
                         <span style="width:1px;"></span>
                     </div>
              </td>
              
              <td style="width:14mm;text-align:center;vertical-align:bottom;padding-top:3mm" valign="bottom" class="styDepTblCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:14mm;text-align:center;border-bottom-width:0px;vertical-align:bottom;padding-top:2mm;
                  </xsl:attribute>
                 </xsl:if>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="AmountOfItem" />
                </xsl:call-template>
                 <span style="width:1px;"></span> 
              </td>
              <td style="width:14mm;text-align:center;vertical-align:bottom;padding-top:3mm" valign="bottom" class="styDepTblCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:14mm;text-align:center;border-bottom-width:0px;vertical-align:bottom;padding-top:2mm
                  </xsl:attribute>
                </xsl:if>
                  
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="TreatmentOfItem" /></xsl:call-template>
				<span style="width:1px;"></span>
               </td>
              <td style="width:32mm;border-right-width:1px;vertical-align:bottom;padding-top:3mm" valign="bottom" class="styDepTblCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:32mm;border-right-width:1px;border-bottom-width:0px;vertical-align:bottom;padding-top:2mm;
                  </xsl:attribute>
                </xsl:if>
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AdjustmentRequestAmount" /> </xsl:call-template>
					<span style="width:1px;"></span> 
               </td>
              <td style="width:32mm;border-left-width:0px;vertical-align:bottom;padding-top:3mm" valign="bottom" class="styDepTblCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:32mm;border-right-width:1px;border-bottom-width:0px;vertical-align:bottom;padding-top:2mm;
                  </xsl:attribute>
                </xsl:if>
                
                <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AmountYouAreReporting" /></xsl:call-template>
                <span style="width:1px;"></span> 
              </td>
              
              <td style="width:32mm;border-right-width:0px;vertical-align:bottom;padding-top:3mm" valign="bottom" class="styDepTblCell">
                <xsl:if test="position() = last() and position() &gt;= 4">
                  <xsl:attribute name="style">
                    width:32mm;border-right-width:0px;border-bottom-width:0px;vertical-align:bottom;padding-top:2mm;
                  </xsl:attribute>
                </xsl:if>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AdjustmentAndReportedAmtDiff" />
               </xsl:call-template>
              <span style="width:1px;"></span> 
              </td>
            </tr>
          </xsl:for-each>
          </tbody>
  </table>
  </xsl:if>
  
    <xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
<br/>
<span class="styRepeatingDataTitle">Form 8082 - Explanations—Enter the Part II item number before each explanation. If more space is needed, continue
your explanations on the back.</span>			
<table class="styDepTbl" style="font-size: 7pt">
	<thead class="styTableThead"/>
  <tfoot></tfoot>
  <tbody>
        <xsl:call-template name="populateirs8082partiiidatarows" />
  </tbody>
  </table>
  </xsl:if>
         
</form>
</body>  </html>
</xsl:template>

<xsl:template name="populateirs8082partiiiemptyrows">
  <tr style="height:8mm;vertical-align:bottom;">
    <td style="width:187mm;border-style:solid;border-right-width:0px;text-align: left; font-size: 7pt" class="styTableCell">
    <xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems/Explanations"/>
              </xsl:call-template>
    </xsl:if> <span style="width:1px;"></span></td>
  </tr>
  <tr style="height:8mm;vertical-align:bottom;">
    <td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td>
  </tr>
  <tr style="height:8mm;vertical-align:bottom;">
    <td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td>
  </tr>
  <tr style="height:8mm;vertical-align:bottom;">
    <td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td>
  </tr>
  <tr style="height:8mm;vertical-align:bottom;">
    <td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td>
  </tr>
  <tr style="height:8mm;vertical-align:bottom;">
    <td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td>
  </tr>
  <tr style="height:8mm;vertical-align:bottom;">
    <td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td>
  </tr>
</xsl:template>  

<xsl:template name="populateirs8082partiiidatarows">
  <xsl:for-each select="$Form8082Data/InconOrAdminAdjRequestItems">
    <tr style="height:8mm;vertical-align:bottom;">
    <xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
            <xsl:attribute name="class">
		         <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
      <td style="width:187mm;text-align:left;border-style:solid;border-right-width:0px;" class="styTableCell">
        <xsl:if test="position() = last()">
          <xsl:attribute name="style">
            width:187mm;text-align:left;border-style:solid;border-right-width:0px;border-bottom-width:0px;
          </xsl:attribute>
        </xsl:if>
        <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ReferenceLineNumber" />
            </xsl:call-template>
            <span style="width:4mm;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Explanations" />
        </xsl:call-template>
        <span style="width:1px;"></span>
      </td>
    </tr>
  </xsl:for-each>
</xsl:template>  

<xsl:template name="populateirs8082partiiemptycells">
  <xsl:param name="index"></xsl:param>
  <xsl:param name="end">false</xsl:param>
  <tr style="height:8mm;vertical-align:bottom;">
    <xsl:if test="($end = 'false')">
      <td class="styTableCell" style="width:66mm;text-align:left;font-weight:bold;font-size: 7pt"><xsl:value-of select="$index" /><span style="width:1mm;"></span>
      <span style="font-weight: normal">
      <xsl:if test="($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4) and ($index = 10)">
      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems/LineNumDescOfInconsistentItem"/>
              </xsl:call-template>
      </xsl:if>
      </span>
      </td>
      <!--td style="width:57mm;" class="styTableCell"> <span style="width:1px;"></span></td-->
      <td style="width:13mm;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:13mm;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:32mm;border-right-width:1px;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:34mm;border-left-width:0px;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:27mm;border-right-width:0px;" class="styTableCell"><span style="width:1px;"></span></td>
    </xsl:if>
    <xsl:if test="($end != 'false')">
      <td class="styTableCell" style="width:66mm;text-align:left;font-weight:bold;border-bottom-width:0px;"><xsl:value-of select="$index" /></td>
      <!--td style="width:57mm;border-bottom-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td-->
      <td style="width:13mm;border-bottom-width:0px;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:13mm;border-bottom-width:0px;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:32mm;border-right-width:1px;border-bottom-width:0px;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:34mm;border-left-width:0px;border-bottom-width:0px;" class="styTableCell"><span style="width:1px;"></span></td>
      <td style="width:27mm;border-right-width:0px;border-bottom-width:0px;" class="styTableCell"><span style="width:1px;"></span></td>
    </xsl:if>
  </tr>
</xsl:template>

</xsl:stylesheet>
